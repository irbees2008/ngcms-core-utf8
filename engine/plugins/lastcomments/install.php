<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
function plugin_lastcomments_install($action) {

	global $config, $lang;
	$ULIB = new urlLibrary();
	$ULIB->loadConfig();
	$ULIB->registerCommand('lastcomments', '',
		array(
			'vars'  =>
				array(),
			'descr' => array('russian' => 'Р РЋРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р В° РЎРѓ Р С—Р С•РЎРѓР В»Р ВµР Т‘Р Р…Р С‘Р С�Р С‘ Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘РЎРЏР С�Р С‘'),
		)
	);
	$ULIB->registerCommand('lastcomments', 'rss',
		array(
			'vars'  =>
				array(),
			'descr' => array('russian' => 'Rss Р В»Р ВµР Р…РЎвЂљР В° Р С—Р С•РЎРѓР В»Р ВµР Т‘Р Р…Р С‘РЎвЂ¦ Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р ВµР Р†'),
		)
	);
	// Apply requested action
	switch ($action) {
		case 'confirm':
			generate_install_page('lastcomments', "GO GO GO");
			break;
		case 'autoapply':
		case 'apply':
			if (fixdb_plugin_install('lastcomments', array(), 'install', ($action == 'autoapply') ? true : false)) {
				plugin_mark_installed('lastcomments');
			} else {
				return false;
			}
			$ULIB->saveConfig();
			break;
	}

	return true;
}






