<?php
if (!defined('NGCMS')) {
	die ('HAL');
}
function plugin_simple_title_pro_install($action) {

	$checkVer = explode('.', substr(engineVersion, 0, 5));
	if ($checkVer['0'] == 0 && $checkVer['1'] == 9 && $checkVer['2'] = 3)
		$check = true;
	else
		$check = false;
	$db_update = array(
		array(
			'table'  => 'simple_title_pro',
			'action' => 'cmodify',
			'key'    => 'primary key(id), KEY `cat_id` (`cat_id`), KEY `news_id` (`news_id`), KEY `static_id` (`static_id`)',
			'fields' => array(
				array('action' => 'cmodify', 'name' => 'id', 'type' => 'int(10)', 'params' => 'NOT NULL AUTO_INCREMENT'),
				array('action' => 'cmodify', 'name' => 'title', 'type' => 'varchar(100)', 'params' => 'NOT NULL DEFAULT \'\''),
				array('action' => 'cmodify', 'name' => 'cat_id', 'type' => 'int(10)', 'params' => 'NOT NULL default \'0\''),
				array('action' => 'cmodify', 'name' => 'news_id', 'type' => 'int(10)', 'params' => 'NOT NULL default \'0\''),
				array('action' => 'cmodify', 'name' => 'static_id', 'type' => 'int(10)', 'params' => 'NOT NULL default \'0\''),
			)
		)
	);
	switch ($action) {
		case 'confirm':
			if ($check)
				generate_install_page('simple_title_pro', 'РўС‹РєР°Р№ СѓСЃС‚Р°РЅРѕРІРёС‚СЊ');
			else
				msg(array("type" => "error", "info" => "Р’РµСЂСЃРёСЏ CMS РЅРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓРµС‚ РґРѕРїСѓСЃС‚РёРјРѕР№<br />РЈ РІР°СЃ СѓСЃС‚Р°РЅРѕРІР»РµРЅР° " . $checkVer['0'] . "." . $checkVer['1'] . ".<b>" . $checkVer['2'] . "</b>. РўСЂРµР±СѓРµС‚СЃСЏ 0.9.3!"));
			break;
		case 'autoapply':
		case 'apply':
			if (fixdb_plugin_install('simple_title_pro', $db_update, 'install', ($action == 'autoapply') ? true : false)) {
				plugin_mark_installed('simple_title_pro');
				$_SESSION['simple_title_pro']['info'] = 'Р’С‹ Р·Р°С€Р»Рё РІ РЅР°СЃС‚СЂРѕР№РєРё РІ РїРµСЂРІС‹Р№ СЂР°Р·.<br/>
				Р�РЅСЃС‚СЂСѓРєС†РёРё Рє СЌС‚РѕРјСѓ РїР»Р°РіРёРЅСѓ РЅРµ РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРѕ, РІСЃРµ РЅР°СЃС‚СЂРѕР№РєРё СЂР°СЃРєРёРґР°РЅС‹ РїРѕ СЂР°Р·РґРµР»Р°Рј Рё РЅРµ СЃР»РѕР¶РЅРѕ РїРѕРЅСЏС‚СЊ С‡С‚Рѕ Рє С‡РµРјСѓ<br />
				Р Р°Р±РѕС‚Р°РµС‚ РЅР° Р±Р°Р·Рµ РґР°РЅРЅС‹С… РёСЃРїРѕР»СЊР·СѓРµС‚ РєРµС€РёСЂРѕРІР°РЅРёРµ. РљСЌС€ РѕС‚РєР»СЋС‡РёС‚СЊ РЅРµР»СЊР·СЏ, РєРµС€ СЂР°СЃС‡РёС‚Р°РЅ РЅР° СЃСѓС‚РєРё, РЅРѕ РјРѕР¶РЅРѕ СѓСЃС‚Р°РІРёС‚СЊ Рё РЅР° Р±РѕР»СЊС€РµРµ РІСЂРµРјСЏ. Р”Р»СЏ СѓРґРѕР±СЃС‚РІР°: РїСЂРё СЂРµРґР°РєС‚РёСЂРѕРІР°РЅРёРё РєСЌС€ Рє СЌС‚РѕР№ Р·Р°РїРёСЃРё Р±СѓРґРµС‚ Р°РІС‚РѕРјР°С‚РёС‡РµСЃРєРё РѕР±РЅРѕРІР»РµРЅ!<br/>
				РџРѕ РѕС€РёР±РєР°, РЅРµС‚РѕС‡РЅРѕСЃС‚СЏРј РѕР±СЂР°С‰Р°С‚СЊСЃСЏ РЅР° СЃС‚СЂР°РЅРёС†Сѓ РЅР° С„РѕСЂСѓРјРµ РёР»Рё РјРЅРµ РЅР° ICQ: 209388634 РёР»Рё jabber: rozard@ngcms.ru
				';
			} else {
				return false;
			}
			$params = array(
				'c_title'      => '%home% / %cat% [/ %num%]',
				'n_title'      => '%home% / %cat% / %title%  [/ %num%]',
				'm_title'      => '%home% %num%',
				'static_title' => '%home% / %static%',
				'num_title'    => 'РЎС‚СЂР°РЅРёС†Р° %count%',
				'o_title'      => '%home% / %other% %html% [/ %num%]',
				'e_title'      => '%home% / %other%',
				'html_secure'  => '/ %html%',
				'cache'        => '1',
				'num_cat'      => 20,
				'num_news'     => 20,
				'num_static'   => 20,
			);
			foreach ($params as $k => $v) {
				extra_set_param('simple_title_pro', $k, $v);
			}
			extra_commit_changes();
			break;
	}

	return true;
}