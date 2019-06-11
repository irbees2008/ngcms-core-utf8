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
				generate_install_page('simple_title_pro', 'Р СћРЎвЂ№Р С”Р В°Р в„– РЎС“РЎРѓРЎвЂљР В°Р Р…Р С•Р Р†Р С‘РЎвЂљРЎРЉ');
			else
				msg(array("type" => "error", "info" => "Р вЂ™Р ВµРЎР‚РЎРѓР С‘РЎРЏ CMS Р Р…Р Вµ РЎРѓР С•Р С•РЎвЂљР Р†Р ВµРЎвЂљРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ Р Т‘Р С•Р С—РЎС“РЎРѓРЎвЂљР С‘Р С�Р С•Р в„–<br />Р Р€ Р Р†Р В°РЎРѓ РЎС“РЎРѓРЎвЂљР В°Р Р…Р С•Р Р†Р В»Р ВµР Р…Р В° " . $checkVer['0'] . "." . $checkVer['1'] . ".<b>" . $checkVer['2'] . "</b>. Р СћРЎР‚Р ВµР В±РЎС“Р ВµРЎвЂљРЎРѓРЎРЏ 0.9.3!"));
			break;
		case 'autoapply':
		case 'apply':
			if (fixdb_plugin_install('simple_title_pro', $db_update, 'install', ($action == 'autoapply') ? true : false)) {
				plugin_mark_installed('simple_title_pro');
				$_SESSION['simple_title_pro']['info'] = 'Р вЂ™РЎвЂ№ Р В·Р В°РЎв‚¬Р В»Р С‘ Р Р† Р Р…Р В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘ Р Р† Р С—Р ВµРЎР‚Р Р†РЎвЂ№Р в„– РЎР‚Р В°Р В·.<br/>
				Р пїЅР Р…РЎРѓРЎвЂљРЎР‚РЎС“Р С”РЎвЂ Р С‘Р С‘ Р С” РЎРЊРЎвЂљР С•Р С�РЎС“ Р С—Р В»Р В°Р С–Р С‘Р Р…РЎС“ Р Р…Р Вµ Р С—РЎР‚Р ВµР Т‘РЎС“РЎРѓР С�Р С•РЎвЂљРЎР‚Р ВµР Р…Р С•, Р Р†РЎРѓР Вµ Р Р…Р В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘ РЎР‚Р В°РЎРѓР С”Р С‘Р Т‘Р В°Р Р…РЎвЂ№ Р С—Р С• РЎР‚Р В°Р В·Р Т‘Р ВµР В»Р В°Р С� Р С‘ Р Р…Р Вµ РЎРѓР В»Р С•Р В¶Р Р…Р С• Р С—Р С•Р Р…РЎРЏРЎвЂљРЎРЉ РЎвЂЎРЎвЂљР С• Р С” РЎвЂЎР ВµР С�РЎС“<br />
				Р В Р В°Р В±Р С•РЎвЂљР В°Р ВµРЎвЂљ Р Р…Р В° Р В±Р В°Р В·Р Вµ Р Т‘Р В°Р Р…Р Р…РЎвЂ№РЎвЂ¦ Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·РЎС“Р ВµРЎвЂљ Р С”Р ВµРЎв‚¬Р С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р Вµ. Р С™РЎРЊРЎв‚¬ Р С•РЎвЂљР С”Р В»РЎР‹РЎвЂЎР С‘РЎвЂљРЎРЉ Р Р…Р ВµР В»РЎРЉР В·РЎРЏ, Р С”Р ВµРЎв‚¬ РЎР‚Р В°РЎРѓРЎвЂЎР С‘РЎвЂљР В°Р Р… Р Р…Р В° РЎРѓРЎС“РЎвЂљР С”Р С‘, Р Р…Р С• Р С�Р С•Р В¶Р Р…Р С• РЎС“РЎРѓРЎвЂљР В°Р Р†Р С‘РЎвЂљРЎРЉ Р С‘ Р Р…Р В° Р В±Р С•Р В»РЎРЉРЎв‚¬Р ВµР Вµ Р Р†РЎР‚Р ВµР С�РЎРЏ. Р вЂќР В»РЎРЏ РЎС“Р Т‘Р С•Р В±РЎРѓРЎвЂљР Р†Р В°: Р С—РЎР‚Р С‘ РЎР‚Р ВµР Т‘Р В°Р С”РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р С‘ Р С”РЎРЊРЎв‚¬ Р С” РЎРЊРЎвЂљР С•Р в„– Р В·Р В°Р С—Р С‘РЎРѓР С‘ Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р В°Р Р†РЎвЂљР С•Р С�Р В°РЎвЂљР С‘РЎвЂЎР ВµРЎРѓР С”Р С‘ Р С•Р В±Р Р…Р С•Р Р†Р В»Р ВµР Р…!<br/>
				Р СџР С• Р С•РЎв‚¬Р С‘Р В±Р С”Р В°, Р Р…Р ВµРЎвЂљР С•РЎвЂЎР Р…Р С•РЎРѓРЎвЂљРЎРЏР С� Р С•Р В±РЎР‚Р В°РЎвЂ°Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Р…Р В° РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎС“ Р Р…Р В° РЎвЂћР С•РЎР‚РЎС“Р С�Р Вµ Р С‘Р В»Р С‘ Р С�Р Р…Р Вµ Р Р…Р В° ICQ: 209388634 Р С‘Р В»Р С‘ jabber: rozard@ngcms.ru
				';
			} else {
				return false;
			}
			$params = array(
				'c_title'      => '%home% / %cat% [/ %num%]',
				'n_title'      => '%home% / %cat% / %title%  [/ %num%]',
				'm_title'      => '%home% %num%',
				'static_title' => '%home% / %static%',
				'num_title'    => 'Р РЋРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р В° %count%',
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