<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
//
// Install script for plugin.
// $action: possible action modes
//  confirm     - screen for installation confirmation
//  apply       - apply installation, with handy confirmation
//  autoapply       - apply installation in automatic mode [INSTALL script]
//
function plugin_nsm_install($action) {

	global $lang;
	// Apply requested action
	switch ($action) {
		case 'confirm':
			generate_install_page('nsm', "Р Р€РЎРѓРЎвЂљР В°Р Р…Р С•Р Р†Р С”Р В° NSM");
			break;
		case 'autoapply':
		case 'apply':
			$ULIB = new urlLibrary();
			$ULIB->loadConfig();
			$ULIB->registerCommand('nsm', '',
				array('descr' => array('russian' => 'Р РЋР С—Р С‘РЎРѓР С•Р С”'))
			);
			$ULIB->registerCommand('nsm', 'add',
				array('descr' => array('russian' => 'Р вЂќР С•Р В±Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ'))
			);
			$ULIB->registerCommand('nsm', 'edit',
				array('descr' => array('russian' => 'Р В Р ВµР Т‘Р В°Р С”РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р Вµ'))
			);
			$ULIB->registerCommand('nsm', 'del',
				array('descr' => array('russian' => 'Р Р€Р Т‘Р В°Р В»Р ВµР Р…Р С‘Р Вµ'))
			);
			$ULIB->saveConfig();
			plugin_mark_installed('nsm');
			break;
	}

	return true;
}
