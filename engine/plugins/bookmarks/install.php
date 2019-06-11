<?php
if (!defined('NGCMS')) die ('Galaxy in danger');
plugins_load_config();
if ($_REQUEST['action'] == 'commit') {
	if (($mysql->query("CREATE TABLE `" . prefix . "_bookmarks` (`user_id` int(8) default NULL, `news_id` int(8) default NULL) ENGINE=MyISAM"))) {
		echo "Р пїЅР В·Р С�Р ВµР Р…Р ВµР Р…Р С‘РЎРЏ Р Р† Р вЂ�Р вЂќ Р В±РЎвЂ№Р В»Р С‘ РЎС“РЎРѓР С—Р ВµРЎв‚¬Р Р…Р С• Р Р†Р Р…Р ВµРЎРѓР ВµР Р…РЎвЂ№!";
		plugin_mark_installed('bookmarks');
	}
} else {
	$text = "Р СџР В»Р В°Р С–Р С‘Р Р… Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљ Р В·Р В°Р С”Р В»Р В°Р Т‘Р С”Р С‘ Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЏ";
	generate_install_page('bookmarks', $text);
}
