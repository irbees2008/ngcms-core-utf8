<style type="text/css">
	@import url("../engine/plugins/show_comments/styles.css");
</style>

<script type="text/javascript">
	$(document).ready(function () {
		$("#maincb").click(function () { // РїСЂРё РєР»РёРєРµ РїРѕ РіР»Р°РІРЅРѕРјСѓ С‡РµРєР±РѕРєСЃСѓ
			if ($('#maincb').attr('checked')) { // РїСЂРѕРІРµСЂСЏРµРј РµРіРѕ Р·РЅР°С‡РµРЅРёРµ
				$('.check:enabled').attr('checked', true); // РµСЃР»Рё С‡РµРєР±РѕРєСЃ РѕС‚РјРµС‡РµРЅ, РѕС‚РјРµС‡Р°РµРј РІСЃРµ С‡РµРєР±РѕРєСЃС‹
			} else {
				$('.check:enabled').attr('checked', false); // РµСЃР»Рё С‡РµРєР±РѕРєСЃ РЅРµ РѕС‚РјРµС‡РµРЅ, СЃРЅРёРјР°РµРј РѕС‚РјРµС‚РєСѓ СЃРѕ РІСЃРµС… С‡РµРєР±РѕРєСЃРѕРІ
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
	// Р’С‹Р±РёСЂР°РµРј РёР· Р‘Р” РѕР±С‰РµРµ РєРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РїРёСЃРµР№
	$query = "SELECT COUNT(*) as cnt FROM " . prefix . "_comments";
	$res = $mysql->record($query, 1);
	$total = $res['cnt'];
	// РџСЂРѕРІРµСЂСЏРµРј РїРµСЂРµРґР°РЅ Р»Рё РЅРѕРјРµСЂ С‚РµРєСѓС‰РµР№ СЃС‚СЂР°РЅРёС†С‹
	if (isset($_GET['page'])) {
		$page = (int)$_GET['page'];
		if ($page < 1) $page = 1;
	} else {
		$page = 1;
	}
	// РЎРєРѕР»СЊРєРѕ РІСЃРµРіРѕ РїРѕР»СѓС‡РёС‚СЃСЏ СЃС‚СЂР°РЅРёС†
	$cnt_pages = ceil($total / $perpage);
	if ($page > $cnt_pages) $page = $cnt_pages;
	// РќР°С‡Р°Р»СЊРЅР°СЏ РїРѕР·РёС†РёСЏ
	$start = ($page - 1) * $perpage;
	if ($start < 0) {
		$start = 0;
	}
	$query = "select c.id, c.postdate, c.author, c.author_id, c.mail, c.text, c.ip, n.id as nid, n.title, n.alt_name, n.catid, n.postdate as npostdate from " . prefix . "_comments c left join " . prefix . "_news n on c.post=n.id where n.approve=1 order by c.id " . $order . " limit " . $start . ", " . $perpage;
	$result = $mysql->select($query);
	// Р’С‹РІРѕРґРёРј "С€Р°РїРєСѓ" С‚Р°Р±Р»РёС†С‹
	echo '<form action="" method="post" name="select_comments"><div id=ttr>';
	echo '<table><tbody>';
	echo '<tr>';
	echo '<th>Р”Р°С‚Р°</th>';
	echo '<th>РљРѕРјРјРµРЅС‚Р°СЂРёР№</th>';
	echo '<th>РќРѕРІРѕСЃС‚СЊ</th>';
	echo '<th style="width:14%;">РђРІС‚РѕСЂ</th>';
	echo '<th style="width:13%;">IP</th>';
	echo '<th><input type="checkbox" name="master_box" title="Р’С‹Р±СЂР°С‚СЊ РІСЃРµ" onclick="javascript:check_uncheck_all(select_comments)" ></th>';
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
		// РќР°С‡РёРЅР°РµРј С„РѕСЂРјРёСЂРѕРІР°С‚СЊ РїРµСЂРµРјРµРЅРЅСѓСЋ, СЃРѕРґРµСЂР¶Р°С‰СѓСЋ СЃРїРёСЃРѕРє
		// РІ С„РѕСЂРјР°С‚Рµ "(3,5,6,7)"
		$query = "(";
		foreach ($type as $val) $query .= "$val,";
		// РЈРґР°Р»СЏРµРј РїРѕСЃР»РµРґРЅСЋСЋ Р·Р°РїСЏС‚СѓСЋ, Р·Р°РјРµРЅСЏСЏ РµС‘ Р·Р°РєСЂС‹РІР°СЋС‰РµР№ СЃРєРѕР±РєРѕР№ )
		$query = substr($query, 0, strlen($query) - 1) . ")";
		// Р—Р°РІРµСЂС€Р°РµРј С„РѕСЂРјРёСЂРѕРІР°РЅРёРµ SQL-Р·Р°РїСЂРѕСЃР° РЅР° СѓРґР°Р»РµРЅРёРµ
		$query = "DELETE FROM " . prefix . "_comments WHERE id IN " . $query;
		// Р’С‹РїРѕР»РЅСЏРµРј Р·Р°РїСЂРѕСЃ
		if (!$mysql->query($query)) {
			echo "<br>" . $mysql->db_error() . "<br>";
			echo $query . "<br>";
		} else {
			foreach ($mysql->select("select n.id, count(c.id) as cid from " . prefix . "_news n left join " . prefix . "_comments c on c.post=n.id group by n.id") as $row) {
				$mysql->query("update " . prefix . "_news set com=" . $row['cid'] . " where id = " . $row['id']);
			}
			// РћР±РЅРѕРІР»СЏРµРј СЃС‡РµС‚С‡РёРє РїРѕСЃС‚РѕРІ Сѓ СЋР·РµСЂРѕРІ
			foreach ($mysql->select("select author_id, count(*) as cnt from " . prefix . "_news group by author_id") as $row) {
				$mysql->query("update " . uprefix . "_users set news=" . $row['cnt'] . " where id = " . $row['author_id']);
			}
			foreach ($mysql->select("select n.id, count(c.id) as cid from " . prefix . "_news n left join " . prefix . "_comments c on c.post=n.id group by n.id") as $row) {
				$mysql->query("update " . prefix . "_news set com=" . $row['cid'] . " where id = " . $row['id']);
			}
			// РћР±РЅРѕРІР»СЏРµРј СЃС‡РµС‚С‡РёРє РєРѕРјРјРµРЅС‚Р°СЂРёРµРІ Сѓ СЋР·РµСЂРѕРІ
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
	// РЎС‚СЂРѕРёРј РїРѕСЃС‚СЂР°РЅРёС‡РЅСѓСЋ РЅР°РІРёРіР°С†РёСЋ
	if ($cnt_pages > 1) {
		//   echo '<div style="margin:1em 0">&nbsp;РЎС‚СЂР°РЅРёС†С‹:';
		// РџСЂРѕРІРµСЂСЏРµРј РЅСѓР¶РЅР° Р»Рё СЃС‚СЂРµР»РєР° "Р’ РЅР°С‡Р°Р»Рѕ"
		if ($page > 3)
			$startpage = '<a href="' . $uri . 'page=1"><</a> .. ';
		else
			$startpage = '';
		// РџСЂРѕРІРµСЂСЏРµРј РЅСѓР¶РЅР° Р»Рё СЃС‚СЂРµР»РєР° "Р’ РєРѕРЅРµС†"
		if ($page < ($cnt_pages - 2))
			$endpage = ' .. <a href="' . $uri . 'page=' . $cnt_pages . '">></a>';
		else
			$endpage = '';
		// РќР°С…РѕРґРёРј РґРІРµ Р±Р»РёР¶Р°Р№С€РёРµ СЃС‚Р°РЅРёС†С‹ СЃ РѕР±РѕРёС… РєСЂР°РµРІ, РµСЃР»Рё РѕРЅРё РµСЃС‚СЊ
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
		// Р’С‹РІРѕРґРёРј РјРµРЅСЋ
		// echo $startpage.$page2left.$page1left.'<strong>'.$page.'</strong>'.$page1right.$page2right.$endpage;
		echo '</div>';
	}
	echo '<table><tr><td>' . $startpage . $page2left . $page1left . '<strong>' . $page . '</strong>' . $page1right . $page2right . $endpage . '&nbsp;&nbsp;&nbsp;&nbsp;</td><td style="align:right"><input class="button" type="submit" value="РЈРґР°Р»РёС‚СЊ"></td></tr></table></form>';
}

if (!getPluginStatusInstalled('comments')) {
	echo 'РџР»Р°РіРёРЅ comments РЅРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅ!';

	return false;
}
plugins_load_config();
$cfg = array();
array_push($cfg, array('descr' => 'РџР»Р°РіРёРЅ РІС‹РІРѕРґРёС‚ СЃРїРёСЃРѕРє РІСЃРµС… РєРѕРјРјРµРЅС‚Р°СЂРёРµРІ РЅР° СЃР°Р№С‚Рµ.'));
array_push($cfg, array('name' => 'perpage', 'title' => 'РљРѕР»-РІРѕ РєРѕРјРјРµРЅС‚Р°СЂРёРµРІ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ РЅР° РѕРґРЅРѕР№ СЃС‚СЂР°РЅРёС†Рµ', 'type' => 'input', 'value' => extra_get_param($plugin, 'perpage')));
array_push($cfg, array('name' => 'comm_length', 'title' => 'РЈСЃРµС‡РµРЅРёРµ РґР»РёРЅС‹ РєРѕРјРјРµРЅС‚Р°СЂРёСЏ', 'descr' => 'РљРѕР»-РІРѕ СЃРёРјРІРѕР»РѕРІ РёР· РєРѕРјРјРµРЅС‚Р°СЂРёСЏ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br/>Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>50</b>', 'type' => 'input', 'html_flags' => 'size=5', 'value' => extra_get_param($plugin, 'comm_length')));
array_push($cfg, array('name' => 'order', 'title' => 'РЈРїРѕСЂСЏРґРѕС‡РёС‚СЊ РїРѕ:', 'descr' => 'Р’С‹Р±РµСЂРёС‚Рµ РїРѕСЂСЏРґРѕРє РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ РєРѕРјРјРµРЅС‚Р°СЂРёРµРІ.', 'type' => 'select', 'values' => array('asc' => 'Р’РѕР·СЂР°СЃС‚Р°РЅРёСЋ', 'desc' => 'РЈР±С‹РІР°РЅРёСЋ'), 'value' => extra_get_param($plugin, 'order')));
if ($_REQUEST['action'] == 'commit') {
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete('show_comments');
} else {
	show_comments();
	generate_config_page('show_comments', $cfg);
}

	


