<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Voting plugin deinstaller
//
plugins_load_config();
LoadPluginLang('voting', 'install');
$db_update = array(
	// array(
	//  'table'  => 'vote',
	//  'action' => 'drop',
	// ),
	// array(
	//  'table'  => 'voteline',
	//  'action' => 'drop',
	// ),
);
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	if (fixdb_plugin_install('voting', $db_update, 'deinstall')) {
		plugin_mark_deinstalled('voting');
	}
} else {
	$text = 'Р вЂ™Р Р…Р С‘Р С�Р В°Р Р…Р С‘Р Вµ! Р Р€Р Т‘Р В°Р В»Р ВµР Р…Р С‘Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В° Р С—РЎР‚Р С‘Р Р†Р ВµР Т‘РЎвЂ�РЎвЂљ Р С” РЎС“Р Т‘Р В°Р В»Р ВµР Р…Р С‘РЎР‹ Р Р†РЎРѓР ВµРЎвЂ¦ РЎРѓР С•Р В·Р Т‘Р В°Р Р…Р Р…РЎвЂ№РЎвЂ¦ Р Р…Р В° РЎРѓР В°Р в„–РЎвЂљР Вµ Р С•Р С—РЎР‚Р С•РЎРѓР С•Р Р†!<br><br>';
	generate_install_page('voting', $text, 'deinstall');
}
?>