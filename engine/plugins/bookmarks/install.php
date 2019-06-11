<?php
if (!defined('NGCMS')) die ('Galaxy in danger');
plugins_load_config();
if ($_REQUEST['action'] == 'commit') {
	if (($mysql->query("CREATE TABLE `" . prefix . "_bookmarks` (`user_id` int(8) default NULL, `news_id` int(8) default NULL) ENGINE=MyISAM"))) {
		echo "Р�Р·РјРµРЅРµРЅРёСЏ РІ Р‘Р” Р±С‹Р»Рё СѓСЃРїРµС€РЅРѕ РІРЅРµСЃРµРЅС‹!";
		plugin_mark_installed('bookmarks');
	}
} else {
	$text = "РџР»Р°РіРёРЅ РІС‹РІРѕРґРёС‚ Р·Р°РєР»Р°РґРєРё РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ";
	generate_install_page('bookmarks', $text);
}
