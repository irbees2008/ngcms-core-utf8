<?php
// #====================================================================================#
// # Р СњР В°Р С‘Р С�Р ВµР Р…Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°: nsched [ News SCHEDuller ]                                   #
// # Р В Р В°Р В·РЎР‚Р ВµРЎв‚¬Р ВµР Р…Р С• Р С” Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°Р Р…Р С‘РЎР‹ РЎРѓ: Next Generation CMS                                   #
// # Р С’Р Р†РЎвЂљР С•РЎР‚: Vitaly A Ponomarev, vp7@mail.ru                                             #
// #====================================================================================#
// #====================================================================================#
// # Р пїЅР Р…РЎРѓРЎвЂљР В°Р В»Р В» РЎРѓР С”РЎР‚Р С‘Р С—РЎвЂљ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°                                                             #
// #====================================================================================#
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
plugins_load_config();
LoadPluginLang('voting', 'install');
plugins_load_config();
LoadPluginLang('nsched', 'install');
$db_update = array(
	array(
		'table'  => 'news',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'drop', 'name' => 'nsched_activate'),
			array('action' => 'drop', 'name' => 'nsched_deactivate'),
		)
	),
);
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	if (fixdb_plugin_install('nsched', $db_update, 'deinstall')) {
		plugin_mark_deinstalled('nsched');
	}
} else {
	$text = 'Р СџРЎР‚Р С‘ РЎС“Р Т‘Р В°Р В»Р ВµР Р…Р С‘Р С‘ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В° <b>nsched</b> Р Р†РЎРѓРЎРЏ Р С‘Р Р…РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂ Р С‘РЎРЏ Р С• РЎР‚Р В°РЎРѓР С—Р С‘РЎРѓР В°Р Р…Р С‘Р С‘ РЎР‚Р В°Р В·Р С�Р ВµРЎвЂ°Р ВµР Р…Р С‘РЎРЏ/РЎС“Р Т‘Р В°Р В»Р ВµР Р…Р С‘РЎРЏ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р С—Р С•РЎвЂљР ВµРЎР‚РЎРЏР Р…Р В°!<br><br>';
	generate_install_page('nsched', $text, 'deinstall');
}
