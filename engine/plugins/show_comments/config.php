<style type="text/css">
	@import url("../engine/plugins/show_comments/styles.css");
</style>

<script type="text/javascript">
	$(document).ready(function () {
		$("#maincb").click(function () { // Р С—РЎР‚Р С‘ Р С”Р В»Р С‘Р С”Р Вµ Р С—Р С• Р С–Р В»Р В°Р Р†Р Р…Р С•Р С�РЎС“ РЎвЂЎР ВµР С”Р В±Р С•Р С”РЎРѓРЎС“
			if ($('#maincb').attr('checked')) { // Р С—РЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С� Р ВµР С–Р С• Р В·Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ
				$('.check:enabled').attr('checked', true); // Р ВµРЎРѓР В»Р С‘ РЎвЂЎР ВµР С”Р В±Р С•Р С”РЎРѓ Р С•РЎвЂљР С�Р ВµРЎвЂЎР ВµР Р…, Р С•РЎвЂљР С�Р ВµРЎвЂЎР В°Р ВµР С� Р Р†РЎРѓР Вµ РЎвЂЎР ВµР С”Р В±Р С•Р С”РЎРѓРЎвЂ№
			} else {
				$('.check:enabled').attr('checked', false); // Р ВµРЎРѓР В»Р С‘ РЎвЂЎР ВµР С”Р В±Р С•Р С”РЎРѓ Р Р…Р Вµ Р С•РЎвЂљР С�Р ВµРЎвЂЎР ВµР Р…, РЎРѓР Р…Р С‘Р С�Р В°Р ВµР С� Р С•РЎвЂљР С�Р ВµРЎвЂљР С”РЎС“ РЎРѓР С• Р Р†РЎРѓР ВµРЎвЂ¦ РЎвЂЎР ВµР С”Р В±Р С•Р С”РЎРѓР С•Р Р†
			}
		});
	});

</script>


<?php
function show_comments() {

	global $mysql, $config, $parse;
	$perpage = extra_get_param('show_comments', 'perpage');
	if ($perpage == '') {
		$perpage = "5";
	}
	$order = extra_get_param('show_comments', 'order');
	if ($order == 'desc') {
		$order = "DESC";
	} elseif ($order == 'asc') {
		$order = "ASC";
	} else {
		$order = "ASC";
	}
	$comm_length = extra_get_param('show_comments', 'comm_length');
	if (($comm_length < 10) || ($comm_length > 5000)) {
		$comm_length = 50;
	}
	// Р вЂ™РЎвЂ№Р В±Р С‘РЎР‚Р В°Р ВµР С� Р С‘Р В· Р вЂ�Р вЂќ Р С•Р В±РЎвЂ°Р ВµР Вµ Р С”Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С• Р В·Р В°Р С—Р С‘РЎРѓР ВµР в„–
	$query = "SELECT COUNT(*) as cnt FROM " . prefix . "_comments";
	$res = $mysql->record($query, 1);
	$total = $res['cnt'];
	// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С� Р С—Р ВµРЎР‚Р ВµР Т‘Р В°Р Р… Р В»Р С‘ Р Р…Р С•Р С�Р ВµРЎР‚ РЎвЂљР ВµР С”РЎС“РЎвЂ°Р ВµР в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№
	if (isset($_GET['page'])) {
		$page = (int)$_GET['page'];
		if ($page < 1) $page = 1;
	} else {
		$page = 1;
	}
	// Р РЋР С”Р С•Р В»РЎРЉР С”Р С• Р Р†РЎРѓР ВµР С–Р С• Р С—Р С•Р В»РЎС“РЎвЂЎР С‘РЎвЂљРЎРѓРЎРЏ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ 
	$cnt_pages = ceil($total / $perpage);
	if ($page > $cnt_pages) $page = $cnt_pages;
	// Р СњР В°РЎвЂЎР В°Р В»РЎРЉР Р…Р В°РЎРЏ Р С—Р С•Р В·Р С‘РЎвЂ Р С‘РЎРЏ
	$start = ($page - 1) * $perpage;
	if ($start < 0) {
		$start = 0;
	}
	$query = "select c.id, c.postdate, c.author, c.author_id, c.mail, c.text, c.ip, n.id as nid, n.title, n.alt_name, n.catid, n.postdate as npostdate from " . prefix . "_comments c left join " . prefix . "_news n on c.post=n.id where n.approve=1 order by c.id " . $order . " limit " . $start . ", " . $perpage;
	$result = $mysql->select($query);
	// Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� "РЎв‚¬Р В°Р С—Р С”РЎС“" РЎвЂљР В°Р В±Р В»Р С‘РЎвЂ РЎвЂ№
	echo '<form action="" method="post" name="select_comments"><div id=ttr>';
	echo '<table><tbody>';
	echo '<tr>';
	echo '<th>Р вЂќР В°РЎвЂљР В°</th>';
	echo '<th>Р С™Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р в„–</th>';
	echo '<th>Р СњР С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ</th>';
	echo '<th style="width:14%;">Р С’Р Р†РЎвЂљР С•РЎР‚</th>';
	echo '<th style="width:13%;">IP</th>';
	echo '<th><input type="checkbox" name="master_box" title="Р вЂ™РЎвЂ№Р В±РЎР‚Р В°РЎвЂљРЎРЉ Р Р†РЎРѓР Вµ" onclick="javascript:check_uncheck_all(select_comments)" ></th>';
	echo '</tr>';
	foreach ($result as $prd) {
		// Parse comments
		$text = $prd['text'];
		if ($config['blocks_for_reg']) {
			$text = $parse->userblocks($text);
		}
		if ($config['use_bbcodes']) {
			$text = $parse->bbcodes($text);
		}
		if ($config['use_htmlformatter']) {
			$text = $parse->htmlformatter($text);
		}
		if ($config['use_smilies']) {
			$text = $parse->smilies($text);
		}
		if (strlen($text) > $comm_length) {
			$text = $parse->truncateHTML($text, $comm_length);
		}
		if ($prd['author_id'] && getPluginStatusActive('uprofile')) {
			$author_link = checkLinkAvailable('uprofile', 'show') ?
				generateLink('uprofile', 'show', array('name' => $prd['author'], 'id' => $prd['author_id'])) :
				generateLink('core', 'plugin', array('plugin' => 'uprofile', 'handler' => 'show'), array('id' => $prd['author_id']));
			$tvars['regx']["'\[profile\](.*?)\[/profile\]'si"] = '$1';
		} else {
			$author_link = '';
		}
		echo '<tr>';
		echo '<th>' . langdate('d.m.Y H:i:s', $prd['postdate']) . ' [<a href="/engine/admin.php?mod=editcomments&newsid=' . $prd['nid'] . '&comid=' . $prd['id'] . '" target="_blank">#</a>] [<a href="/engine/admin.php?mod=editcomments&subaction=deletecomment&newsid=' . $prd['nid'] . '&comid=' . $prd['id'] . '&poster=' . $prd['author'] . '" target="_blank">X</a>]</th>';
		echo '<th>' . $text . '</th>';
		echo '<th><a href="' . newsGenerateLink(array('id' => $prd['nid'], 'alt_name' => $prd['alt_name'], 'catid' => $prd['catid'], 'postdate' => $prd['npostdate'])) . '" target="_blank">' . str_replace('<', '&lt;', $prd['title']) . '</a> [<a href="/engine/admin.php?mod=news&action=edit&id=' . $prd['nid'] . '" target="_blank">E</a>]</th>';
		if ($prd['author_id']) {
			echo '<th><a href="/engine/admin.php?mod=users&action=editForm&id=' . $prd['author_id'] . '" target="_blank">' . str_replace('<', '&lt;', $prd['author']) . '</a><br/><small><a href="mailto:' . $prd['mail'] . '">' . $prd['mail'] . '</a></small></th>';
		} else {
			echo '<th>' . str_replace('<', '&lt;', $prd['author']) . '<br/><small><a href="mailto:' . $prd['mail'] . '">' . $prd['mail'] . '</a></small></th>';
		}
		echo '<th>[<a href="/engine/admin.php?mod=ipban&iplock=' . $prd['ip'] . '" target="_blank">' . $prd['ip'] . '</a>] [<a href="http://www.nic.ru/whois/?ip=' . $prd['ip'] . '" target="_blank">W</a>]</th>';
		echo '<th><input type="checkbox" name="type[]" value="' . $prd['id'] . '"></th>';
		echo '</tr>';
	}
	echo '</tbody></table></div>';
	echo '<script>$("tr:odd").css("background-color", "#f7fbff");</script>';
	$type = $_POST['type'];
	if (!empty($type)) {
		// Р СњР В°РЎвЂЎР С‘Р Р…Р В°Р ВµР С� РЎвЂћР С•РЎР‚Р С�Р С‘РЎР‚Р С•Р Р†Р В°РЎвЂљРЎРЉ Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎС“РЎР‹, РЎРѓР С•Р Т‘Р ВµРЎР‚Р В¶Р В°РЎвЂ°РЎС“РЎР‹ РЎРѓР С—Р С‘РЎРѓР С•Р С”
		// Р Р† РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљР Вµ "(3,5,6,7)"
		$query = "(";
		foreach ($type as $val) $query .= "$val,";
		// Р Р€Р Т‘Р В°Р В»РЎРЏР ВµР С� Р С—Р С•РЎРѓР В»Р ВµР Т‘Р Р…РЎР‹РЎР‹ Р В·Р В°Р С—РЎРЏРЎвЂљРЎС“РЎР‹, Р В·Р В°Р С�Р ВµР Р…РЎРЏРЎРЏ Р ВµРЎвЂ� Р В·Р В°Р С”РЎР‚РЎвЂ№Р Р†Р В°РЎР‹РЎвЂ°Р ВµР в„– РЎРѓР С”Р С•Р В±Р С”Р С•Р в„– )
		$query = substr($query, 0, strlen($query) - 1) . ")";
		// Р вЂ”Р В°Р Р†Р ВµРЎР‚РЎв‚¬Р В°Р ВµР С� РЎвЂћР С•РЎР‚Р С�Р С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р Вµ SQL-Р В·Р В°Р С—РЎР‚Р С•РЎРѓР В° Р Р…Р В° РЎС“Р Т‘Р В°Р В»Р ВµР Р…Р С‘Р Вµ
		$query = "DELETE FROM " . prefix . "_comments WHERE id IN " . $query;
		// Р вЂ™РЎвЂ№Р С—Р С•Р В»Р Р…РЎРЏР ВµР С� Р В·Р В°Р С—РЎР‚Р С•РЎРѓ
		if (!$mysql->query($query)) {
			echo "<br>" . $mysql->db_error() . "<br>";
			echo $query . "<br>";
		} else {
			foreach ($mysql->select("select n.id, count(c.id) as cid from " . prefix . "_news n left join " . prefix . "_comments c on c.post=n.id group by n.id") as $row) {
				$mysql->query("update " . prefix . "_news set com=" . $row['cid'] . " where id = " . $row['id']);
			}
			// Р С›Р В±Р Р…Р С•Р Р†Р В»РЎРЏР ВµР С� РЎРѓРЎвЂЎР ВµРЎвЂљРЎвЂЎР С‘Р С” Р С—Р С•РЎРѓРЎвЂљР С•Р Р† РЎС“ РЎР‹Р В·Р ВµРЎР‚Р С•Р Р†
			foreach ($mysql->select("select author_id, count(*) as cnt from " . prefix . "_news group by author_id") as $row) {
				$mysql->query("update " . uprefix . "_users set news=" . $row['cnt'] . " where id = " . $row['author_id']);
			}
			foreach ($mysql->select("select n.id, count(c.id) as cid from " . prefix . "_news n left join " . prefix . "_comments c on c.post=n.id group by n.id") as $row) {
				$mysql->query("update " . prefix . "_news set com=" . $row['cid'] . " where id = " . $row['id']);
			}
			// Р С›Р В±Р Р…Р С•Р Р†Р В»РЎРЏР ВµР С� РЎРѓРЎвЂЎР ВµРЎвЂљРЎвЂЎР С‘Р С” Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р ВµР Р† РЎС“ РЎР‹Р В·Р ВµРЎР‚Р С•Р Р†
			foreach ($mysql->select("select author_id, count(*) as cnt from " . prefix . "_comments group by author_id") as $row) {
				$mysql->query("update " . uprefix . "_users set com=" . $row['cnt'] . " where id = " . $row['author_id']);
			}
			echo "<META HTTP-EQUIV='Refresh' Content='0'>";
		}
	}
	$uri = strtok($_SERVER['REQUEST_URI'], "?") . "?";
	if (count($_GET)) {
		foreach ($_GET as $k => $v) {
			if ($k != "page") $uri .= urlencode($k) . "=" . urlencode($v) . "&";
		}
	}
	// Р РЋРЎвЂљРЎР‚Р С•Р С‘Р С� Р С—Р С•РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂЎР Р…РЎС“РЎР‹ Р Р…Р В°Р Р†Р С‘Р С–Р В°РЎвЂ Р С‘РЎР‹
	if ($cnt_pages > 1) {
		//   echo '<div style="margin:1em 0">&nbsp;Р РЋРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№:';
		// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С� Р Р…РЎС“Р В¶Р Р…Р В° Р В»Р С‘ РЎРѓРЎвЂљРЎР‚Р ВµР В»Р С”Р В° "Р вЂ™ Р Р…Р В°РЎвЂЎР В°Р В»Р С•"
		if ($page > 3)
			$startpage = '<a href="' . $uri . 'page=1"><</a> .. ';
		else
			$startpage = '';
		// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С� Р Р…РЎС“Р В¶Р Р…Р В° Р В»Р С‘ РЎРѓРЎвЂљРЎР‚Р ВµР В»Р С”Р В° "Р вЂ™ Р С”Р С•Р Р…Р ВµРЎвЂ "
		if ($page < ($cnt_pages - 2))
			$endpage = ' .. <a href="' . $uri . 'page=' . $cnt_pages . '">></a>';
		else
			$endpage = '';
		// Р СњР В°РЎвЂ¦Р С•Р Т‘Р С‘Р С� Р Т‘Р Р†Р Вµ Р В±Р В»Р С‘Р В¶Р В°Р в„–РЎв‚¬Р С‘Р Вµ РЎРѓРЎвЂљР В°Р Р…Р С‘РЎвЂ РЎвЂ№ РЎРѓ Р С•Р В±Р С•Р С‘РЎвЂ¦ Р С”РЎР‚Р В°Р ВµР Р†, Р ВµРЎРѓР В»Р С‘ Р С•Р Р…Р С‘ Р ВµРЎРѓРЎвЂљРЎРЉ
		if ($page - 2 > 0)
			$page2left = ' <a href="' . $uri . 'page=' . ($page - 2) . '">' . ($page - 2) . '</a> | ';
		else
			$page2left = '';
		if ($page - 1 > 0)
			$page1left = ' <a href="' . $uri . 'page=' . ($page - 1) . '">' . ($page - 1) . '</a> | ';
		else
			$page1left = '';
		if ($page + 2 <= $cnt_pages)
			$page2right = ' | <a href="' . $uri . 'page=' . ($page + 2) . '">' . ($page + 2) . '</a>';
		else
			$page2right = '';
		if ($page + 1 <= $cnt_pages)
			$page1right = ' | <a href="' . $uri . 'page=' . ($page + 1) . '">' . ($page + 1) . '</a>';
		else
			$page1right = '';
		// Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� Р С�Р ВµР Р…РЎР‹
		// echo $startpage.$page2left.$page1left.'<strong>'.$page.'</strong>'.$page1right.$page2right.$endpage;
		echo '</div>';
	}
	echo '<table><tr><td>' . $startpage . $page2left . $page1left . '<strong>' . $page . '</strong>' . $page1right . $page2right . $endpage . '&nbsp;&nbsp;&nbsp;&nbsp;</td><td style="align:right"><input class="button" type="submit" value="Р Р€Р Т‘Р В°Р В»Р С‘РЎвЂљРЎРЉ"></td></tr></table></form>';
}

if (!getPluginStatusInstalled('comments')) {
	echo 'Р СџР В»Р В°Р С–Р С‘Р Р… comments Р Р…Р Вµ РЎС“РЎРѓРЎвЂљР В°Р Р…Р С•Р Р†Р В»Р ВµР Р…!';

	return false;
}
plugins_load_config();
$cfg = array();
array_push($cfg, array('descr' => 'Р СџР В»Р В°Р С–Р С‘Р Р… Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљ РЎРѓР С—Р С‘РЎРѓР С•Р С” Р Р†РЎРѓР ВµРЎвЂ¦ Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р ВµР Р† Р Р…Р В° РЎРѓР В°Р в„–РЎвЂљР Вµ.'));
array_push($cfg, array('name' => 'perpage', 'title' => 'Р С™Р С•Р В»-Р Р†Р С• Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р ВµР Р† Р Т‘Р В»РЎРЏ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ Р Р…Р В° Р С•Р Т‘Р Р…Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р Вµ', 'type' => 'input', 'value' => extra_get_param($plugin, 'perpage')));
array_push($cfg, array('name' => 'comm_length', 'title' => 'Р Р€РЎРѓР ВµРЎвЂЎР ВµР Р…Р С‘Р Вµ Р Т‘Р В»Р С‘Р Р…РЎвЂ№ Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘РЎРЏ', 'descr' => 'Р С™Р С•Р В»-Р Р†Р С• РЎРѓР С‘Р С�Р Р†Р С•Р В»Р С•Р Р† Р С‘Р В· Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘РЎРЏ Р Т‘Р В»РЎРЏ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ<br/>Р вЂ”Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹: <b>50</b>', 'type' => 'input', 'html_flags' => 'size=5', 'value' => extra_get_param($plugin, 'comm_length')));
array_push($cfg, array('name' => 'order', 'title' => 'Р Р€Р С—Р С•РЎР‚РЎРЏР Т‘Р С•РЎвЂЎР С‘РЎвЂљРЎРЉ Р С—Р С•:', 'descr' => 'Р вЂ™РЎвЂ№Р В±Р ВµРЎР‚Р С‘РЎвЂљР Вµ Р С—Р С•РЎР‚РЎРЏР Т‘Р С•Р С” Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р ВµР Р†.', 'type' => 'select', 'values' => array('asc' => 'Р вЂ™Р С•Р В·РЎР‚Р В°РЎРѓРЎвЂљР В°Р Р…Р С‘РЎР‹', 'desc' => 'Р Р€Р В±РЎвЂ№Р Р†Р В°Р Р…Р С‘РЎР‹'), 'value' => extra_get_param($plugin, 'order')));
if ($_REQUEST['action'] == 'commit') {
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete('show_comments');
} else {
	show_comments();
	generate_config_page('show_comments', $cfg);
}

	


