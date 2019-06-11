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
$outline = array('<tr><td rowspan=2><b>РќР°Р·РІР°РЅРёРµ РєР°С‚РµРіРѕСЂРёРё</b></td><td colspan=9><b>РњРµРЅСЋ, РІ РєРѕС‚РѕСЂС‹С… РґР°РЅРЅР°СЏ РєР°С‚РµРіРѕСЂРёСЏ РѕС‚РѕР±СЂР°Р¶Р°РµС‚СЃСЏ</b></td></tr><tr><td>РњРµРЅСЋ 1</td><td>РњРµРЅСЋ 2</td><td>РњРµРЅСЋ 3</td><td>РњРµРЅСЋ 4</td><td>РњРµРЅСЋ 5</td><td>РњРµРЅСЋ 6</td><td>РњРµРЅСЋ 7</td><td>РњРµРЅСЋ 8</td><td>РњРµРЅСЋ 9</td><td width="20%"></td></tr>');
foreach ($catz as $name => $val) {
	$line = '<tr><td>' . str_repeat('&#8212; ', $val['poslevel']) . $val['name'] . '</td>';
	for ($i = 1; $i <= 9; $i++) {
		$line .= '<td><input name="cmenu[' . $catz[$name]['id'] . '][' . $i . ']" value="1" type="checkbox"' . (($catz[$name]['xmenu']{$i - 1} == '#') ? ' checked ' : '') . '/></td>';
	}
	$line .= '</tr>';
	$outline [] = $line;
}
array_push($cfgX, array('type' => 'flat', 'input' => join("\n", $outline)));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р Р°СЃРїСЂРµРґРµР»РµРЅРёРµ РєР°С‚РµРіРѕСЂРёР№</b>', 'entries' => $cfgX));
array_push($cfg, array('type' => 'flat', 'input' => "\n</table></div>\n\n"));
// SECOND: Populate config parameters for menus 1-9
for ($i = 1; $i <= 9; $i++) {
	$cfgX = array();
	array_push($cfg, array('type' => 'flat', 'input' => '<div id="menu_' . $i . '" style="display: ' . (!$i ? 'block' : 'none') . ';">' . "\n" . '<table class="content" border="0" cellspacing="0" cellpadding="0" align="center">' . "\n"));
	array_push($cfgX, array('type' => 'select', 'name' => 'activate[' . $i . ']', 'title' => 'РђРєС‚РёРІР°С†РёСЏ РјРµРЅСЋ', 'descr' => '<b>Р”Р°</b> - РґР°РЅРЅРѕРµ РјРµРЅСЋ Р°РєС‚РёРІРЅРѕ<br/><b>РќРµС‚</b> - РјРµРЅСЋ РЅРµР°РєС‚РёРІРЅРѕ', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), value => (is_array($var = extra_get_param('xmenu', 'activate')) ? $var[$i] : 0)));
	array_push($cfgX, array('type' => 'select', 'name' => 'mode[' . $i . ']', 'title' => 'Р РµР¶РёРј РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ РјРµРЅСЋ', 'descr' => '<b>Р’С‹Р±СЂР°РЅРЅС‹Рµ РєР°С‚РµРіРѕСЂРёРё</b> - РѕС‚РѕР±СЂР°Р¶Р°СЋС‚СЃСЏ РєР°С‚РµРіРѕСЂРёРё, РїРѕ РєРѕС‚РѕСЂС‹Рј РІС‹СЃС‚Р°РІР»РµРЅ С„Р»Р°Рі РґР»СЏ РґР°РЅРЅРѕРіРѕ РјРµРЅСЋ<br/><b>РўРµРєСѓС‰РёРµ РїРѕРґРєР°С‚РµРіРѕСЂРёРё</b> - РїРѕРґРєР°С‚РµРіРѕСЂРёРё С‚РµРєСѓС‰РµР№ РєР°С‚РµРіРѕСЂРёРё. Р’ СЃР»СѓС‡Р°Рµ РіР»Р°РІРЅРѕР№ СЃС‚СЂР°РЅРёС†С‹ - РІСЃРµ РєР°С‚РµРіРѕСЂРёРё 1 СѓСЂРѕРІРЅСЏ', 'values' => array('0' => 'Р’С‹Р±СЂР°РЅРЅС‹Рµ РєР°С‚РµРіРѕСЂРёРё', '1' => 'РўРµРєСѓС‰РёРµ РїРѕРґРєР°С‚РµРіРѕСЂРёРё'), value => (is_array($var = extra_get_param('xmenu', 'mode')) ? $var[$i] : 0)));
	array_push($cfgX, array('type' => 'select', 'name' => 'news[' . $i . ']', 'title' => 'Р”РѕР±Р°РІРёС‚СЊ РЅРѕРІРѕСЃС‚СЊ РєР°С‚РµРіРѕСЂРёРё', 'descr' => '<b>Р”Р°</b> - РґР»СЏ РєР°Р¶РґРѕР№ РєР°С‚РµРіРѕСЂРёРё Р±СѓРґРµС‚ РІС‹РІРѕРґРёС‚СЊСЃСЏ РїРѕСЃР»РµРґРЅСЏСЏ РЅРѕРІРѕСЃС‚СЊ РёР· СЌС‚РѕР№ РєР°С‚РµРіРѕСЂРёРё<br/><b>РќРµС‚</b> - Р±СѓРґРµС‚ РѕС‚РѕР±СЂР°Р¶Р°С‚СЊСЃСЏ С‚РѕР»СЊРєРѕ СЃР°РјР° РєР°С‚РµРіРѕСЂРёСЏ', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), value => (is_array($var = extra_get_param('xmenu', 'news')) ? $var[$i] : 0)));
	array_push($cfgX, array('type' => 'select', 'name' => 'skin[' . $i . ']', 'title' => 'РЁР°Р±Р»РѕРЅ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ РјРµРЅСЋ', 'descr' => 'Р’С‹Р±РµСЂРёС‚Рµ С€Р°Р±Р»РѕРЅ, СЃ РїРѕРјРѕС‰СЊСЋ РєРѕС‚РѕСЂРѕРіРѕ Р±СѓРґРµС‚ РѕС‚РѕР±СЂР°Р¶Р°С‚СЊСЃСЏ РґР°РЅРЅРѕРµ РјРµРЅСЋ', 'values' => array('default' => 'default'), value => (is_array($var = extra_get_param('xmenu', 'skin')) ? $var[$i] : 0)));
	array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РјРµРЅСЋ # ' . $i . '</b>', 'entries' => $cfgX));
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
