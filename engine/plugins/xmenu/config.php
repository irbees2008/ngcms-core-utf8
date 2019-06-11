<?php
//
// Configuration file for plugin
//
// Preload config file
plugins_load_config();
// Preload header data
$header = file_get_contents(root . 'extras/xmenu/tpl/mhead.tpl');
// Make an activity array - to mark menu's that are activated
$activity = array();
for ($i = 1; $i <= 9; $i++) {
	if ((is_array($var = extra_get_param('xmenu', 'activate'))) && ($var[$i]))
		$activity[] = "#go_" . $i . " { color: red; }";
}
// Prepare configuration array
$cfg = array();
array_push($cfg, array('type' => 'flat', 'input' => str_replace('{activity}', join("\n", $activity), $header) . '</table>'));
// FIRST: Category list with menu mapping
$cfgX = array();
array_push($cfg, array('type' => 'flat', 'input' => '<div id="menu_0" style="display: block;">' . "\n" . '<table class="content" border="0" cellspacing="0" cellpadding="0" align="center">' . "\n"));
$outline = array('<tr><td rowspan=2><b>Р СњР В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘</b></td><td colspan=9><b>Р СљР ВµР Р…РЎР‹, Р Р† Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№РЎвЂ¦ Р Т‘Р В°Р Р…Р Р…Р В°РЎРЏ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘РЎРЏ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°Р ВµРЎвЂљРЎРѓРЎРЏ</b></td></tr><tr><td>Р СљР ВµР Р…РЎР‹ 1</td><td>Р СљР ВµР Р…РЎР‹ 2</td><td>Р СљР ВµР Р…РЎР‹ 3</td><td>Р СљР ВµР Р…РЎР‹ 4</td><td>Р СљР ВµР Р…РЎР‹ 5</td><td>Р СљР ВµР Р…РЎР‹ 6</td><td>Р СљР ВµР Р…РЎР‹ 7</td><td>Р СљР ВµР Р…РЎР‹ 8</td><td>Р СљР ВµР Р…РЎР‹ 9</td><td width="20%"></td></tr>');
foreach ($catz as $name => $val) {
	$line = '<tr><td>' . str_repeat('&#8212; ', $val['poslevel']) . $val['name'] . '</td>';
	for ($i = 1; $i <= 9; $i++) {
		$line .= '<td><input name="cmenu[' . $catz[$name]['id'] . '][' . $i . ']" value="1" type="checkbox"' . (($catz[$name]['xmenu']{$i - 1} == '#') ? ' checked ' : '') . '/></td>';
	}
	$line .= '</tr>';
	$outline [] = $line;
}
array_push($cfgX, array('type' => 'flat', 'input' => join("\n", $outline)));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р В Р В°РЎРѓР С—РЎР‚Р ВµР Т‘Р ВµР В»Р ВµР Р…Р С‘Р Вµ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р в„–</b>', 'entries' => $cfgX));
array_push($cfg, array('type' => 'flat', 'input' => "\n</table></div>\n\n"));
// SECOND: Populate config parameters for menus 1-9
for ($i = 1; $i <= 9; $i++) {
	$cfgX = array();
	array_push($cfg, array('type' => 'flat', 'input' => '<div id="menu_' . $i . '" style="display: ' . (!$i ? 'block' : 'none') . ';">' . "\n" . '<table class="content" border="0" cellspacing="0" cellpadding="0" align="center">' . "\n"));
	array_push($cfgX, array('type' => 'select', 'name' => 'activate[' . $i . ']', 'title' => 'Р С’Р С”РЎвЂљР С‘Р Р†Р В°РЎвЂ Р С‘РЎРЏ Р С�Р ВµР Р…РЎР‹', 'descr' => '<b>Р вЂќР В°</b> - Р Т‘Р В°Р Р…Р Р…Р С•Р Вµ Р С�Р ВµР Р…РЎР‹ Р В°Р С”РЎвЂљР С‘Р Р†Р Р…Р С•<br/><b>Р СњР ВµРЎвЂљ</b> - Р С�Р ВµР Р…РЎР‹ Р Р…Р ВµР В°Р С”РЎвЂљР С‘Р Р†Р Р…Р С•', 'values' => array('0' => 'Р СњР ВµРЎвЂљ', '1' => 'Р вЂќР В°'), value => (is_array($var = extra_get_param('xmenu', 'activate')) ? $var[$i] : 0)));
	array_push($cfgX, array('type' => 'select', 'name' => 'mode[' . $i . ']', 'title' => 'Р В Р ВµР В¶Р С‘Р С� Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ Р С�Р ВµР Р…РЎР‹', 'descr' => '<b>Р вЂ™РЎвЂ№Р В±РЎР‚Р В°Р Р…Р Р…РЎвЂ№Р Вµ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘</b> - Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎР‹РЎвЂљРЎРѓРЎРЏ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘, Р С—Р С• Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№Р С� Р Р†РЎвЂ№РЎРѓРЎвЂљР В°Р Р†Р В»Р ВµР Р… РЎвЂћР В»Р В°Р С– Р Т‘Р В»РЎРЏ Р Т‘Р В°Р Р…Р Р…Р С•Р С–Р С• Р С�Р ВµР Р…РЎР‹<br/><b>Р СћР ВµР С”РЎС“РЎвЂ°Р С‘Р Вµ Р С—Р С•Р Т‘Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘</b> - Р С—Р С•Р Т‘Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘ РЎвЂљР ВµР С”РЎС“РЎвЂ°Р ВµР в„– Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘. Р вЂ™ РЎРѓР В»РЎС“РЎвЂЎР В°Р Вµ Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№ - Р Р†РЎРѓР Вµ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘ 1 РЎС“РЎР‚Р С•Р Р†Р Р…РЎРЏ', 'values' => array('0' => 'Р вЂ™РЎвЂ№Р В±РЎР‚Р В°Р Р…Р Р…РЎвЂ№Р Вµ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘', '1' => 'Р СћР ВµР С”РЎС“РЎвЂ°Р С‘Р Вµ Р С—Р С•Р Т‘Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘'), value => (is_array($var = extra_get_param('xmenu', 'mode')) ? $var[$i] : 0)));
	array_push($cfgX, array('type' => 'select', 'name' => 'news[' . $i . ']', 'title' => 'Р вЂќР С•Р В±Р В°Р Р†Р С‘РЎвЂљРЎРЉ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘', 'descr' => '<b>Р вЂќР В°</b> - Р Т‘Р В»РЎРЏ Р С”Р В°Р В¶Р Т‘Р С•Р в„– Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘ Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРЉРЎРѓРЎРЏ Р С—Р С•РЎРѓР В»Р ВµР Т‘Р Р…РЎРЏРЎРЏ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ Р С‘Р В· РЎРЊРЎвЂљР С•Р в„– Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘<br/><b>Р СњР ВµРЎвЂљ</b> - Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ РЎвЂљР С•Р В»РЎРЉР С”Р С• РЎРѓР В°Р С�Р В° Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘РЎРЏ', 'values' => array('0' => 'Р СњР ВµРЎвЂљ', '1' => 'Р вЂќР В°'), value => (is_array($var = extra_get_param('xmenu', 'news')) ? $var[$i] : 0)));
	array_push($cfgX, array('type' => 'select', 'name' => 'skin[' . $i . ']', 'title' => 'Р РЃР В°Р В±Р В»Р С•Р Р… Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ Р С�Р ВµР Р…РЎР‹', 'descr' => 'Р вЂ™РЎвЂ№Р В±Р ВµРЎР‚Р С‘РЎвЂљР Вµ РЎв‚¬Р В°Р В±Р В»Р С•Р Р…, РЎРѓ Р С—Р С•Р С�Р С•РЎвЂ°РЎРЉРЎР‹ Р С”Р С•РЎвЂљР С•РЎР‚Р С•Р С–Р С• Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Т‘Р В°Р Р…Р Р…Р С•Р Вµ Р С�Р ВµР Р…РЎР‹', 'values' => array('default' => 'default'), value => (is_array($var = extra_get_param('xmenu', 'skin')) ? $var[$i] : 0)));
	array_push($cfg, array('mode' => 'group', 'title' => '<b>Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘ Р С�Р ВµР Р…РЎР‹ # ' . $i . '</b>', 'entries' => $cfgX));
	array_push($cfg, array('type' => 'flat', 'input' => "\n</table></div>\n\n"));
}
// Print footer
array_push($cfg, array('type' => 'flat', 'input' => '<table class="content" border="0" cellspacing="0" cellpadding="0" align="center">'));
// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	// 1. Menus
	extra_set_param('xmenu', 'activate', $_REQUEST['activate']);
	extra_set_param('xmenu', 'mode', $_REQUEST['mode']);
	extra_set_param('xmenu', 'news', $_REQUEST['news']);
	extra_set_param('xmenu', 'skin', $_REQUEST['skin']);
	extra_commit_changes();
	// 2. Categories menu mapping
	if (!is_array($_REQUEST['cmenu'])) {
		// No menus activated
		$mysql->query("update " . prefix . "_category set xmenu=''");
	} else {
		$cmenu = $_REQUEST['cmenu'];
		foreach ($catz as $catname => $catdata) {
			$xline = '';
			if (is_array($cmenu[$catdata['id']])) {
				for ($i = 1; $i <= 9; $i++)
					$xline .= ($cmenu[$catdata['id']][$i]) ? '#' : '_';
			} else {
				$xline = str_repeat('_', 9);
			}
			$mysql->query("update " . prefix . "_category set xmenu=" . db_squote($xline) . " where id = " . db_squote($catdata['id']));
		}
	}
	//print "<pre>"; var_dump($_REQUEST); print "</pre>";
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
