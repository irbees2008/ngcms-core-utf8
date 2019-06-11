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
			generate_install_page('nsm', "РЈСЃС‚Р°РЅРѕРІРєР° NSM");
			break;
		case 'autoapply':
		case 'apply':
			$ULIB = new urlLibrary();
			$ULIB->loadConfig();
			$ULIB->registerCommand('nsm', '',
				array('descr' => array('russian' => 'РЎРїРёСЃРѕРє'))
			);
			$ULIB->registerCommand('nsm', 'add',
				array('descr' => array('russian' => 'Р”РѕР±Р°РІР»РµРЅРёРµ'))
			);
			$ULIB->registerCommand('nsm', 'edit',
				array('descr' => array('russian' => 'Р РµРґР°РєС‚РёСЂРѕРІР°РЅРёРµ'))
			);
			$ULIB->registerCommand('nsm', 'del',
				array('descr' => array('russian' => 'РЈРґР°Р»РµРЅРёРµ'))
			);
			$ULIB->saveConfig();
			plugin_mark_installed('nsm');
			break;
	}

	return true;
}
