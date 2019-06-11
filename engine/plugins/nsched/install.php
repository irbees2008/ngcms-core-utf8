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
LoadPluginLang('nsched', 'install');
$db_update = array(
	array(
		'table'  => 'news',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'cmodify', 'name' => 'nsched_activate', 'type' => 'datetime'),
			array('action' => 'cmodify', 'name' => 'nsched_deactivate', 'type' => 'datetime'),
		)
	),
);
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	if (fixdb_plugin_install('nsched', $db_update)) {
		plugin_mark_installed('nsched');
	}
} else {
	$text = 'Р СџР В»Р В°Р С–Р С‘Р Р… <b>nsched</b> Р С—Р С•Р В·Р Р†Р С•Р В»РЎРЏР ВµРЎвЂљ Р С—РЎС“Р В±Р В»Р С‘Р С”Р С•Р Р†Р В°РЎвЂљРЎРЉ/РЎРѓР Р…Р С‘Р С�Р В°РЎвЂљРЎРЉ РЎРѓ Р С—РЎС“Р В±Р В»Р С‘Р С”Р В°РЎвЂ Р С‘Р С‘ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р С—Р С• РЎР‚Р В°РЎРѓР С—Р С‘РЎРѓР В°Р Р…Р С‘РЎР‹.<br><br>';
	generate_install_page('nsched', $text);
}
?>