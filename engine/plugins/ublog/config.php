<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
// Preload config file
plugins_load_config();
$personalCount = intval(pluginGetVariable($plugin, 'personalCount'));
if (($personalCount < 2) || ($personalCount > 100))
	$personalCount = 10;
// Fill configuration parameters
$cfg = array();
$cfgX = array();
array_push($cfg, array('descr' => 'Р СџР В»Р В°Р С–Р С‘Р Р… Р С—Р С•Р С”Р В°Р В·РЎвЂ№Р Р†Р В°Р ВµРЎвЂљ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р С”Р С•Р Р…Р С”РЎР‚Р ВµРЎвЂљР Р…Р С•Р С–Р С• Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЏ'));
$cfgX = array();
array_push($cfgX, array('name' => 'replaceCount', 'title' => "Р вЂ”Р В°Р С�Р ВµР Р…РЎРЏРЎвЂљРЎРЉ Р В·Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…Р С•Р в„– {news} Р Р…Р В° Р В°Р С”РЎвЂљР С‘Р Р†Р Р…РЎС“РЎР‹ РЎРѓРЎРѓРЎвЂ№Р В»Р С”РЎС“ Р Р…Р В° Р В±Р В»Р С•Р С– Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЏ?<br /><small><b>Р вЂќР В°</b> - Р вЂ�РЎС“Р Т‘Р ВµРЎвЂљ Р В·Р В°Р С�Р ВµР Р…РЎРЏРЎвЂљРЎРЉРЎРѓРЎРЏ Р В·Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…Р С•Р в„–<br /><b>Р СњР ВµРЎвЂљ</b> - Р В·Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…Р С•Р в„– Р В·Р В°Р С�Р ВµР Р…РЎРЏРЎвЂљРЎРЉРЎРѓРЎРЏ Р Р…Р Вµ Р В±РЎС“Р Т‘Р ВµРЎвЂљ</small>", 'type' => 'select', 'values' => array('0' => $lang['noa'], '1' => $lang['yesa']), 'value' => intval(pluginGetVariable($plugin, 'replaceCount'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р РЋРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р В° Р С—РЎР‚Р С•РЎРѓР С�Р С•РЎвЂљРЎР‚Р В° Р С—РЎР‚Р С•РЎвЂћР С‘Р В»РЎРЏ Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЏ</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'personalPages', 'title' => "Р вЂ™Р С”Р В»РЎР‹РЎвЂЎР С‘РЎвЂљРЎРЉ Р С—Р ВµРЎР‚РЎРѓР С•Р Р…Р В°Р В»РЎРЉР Р…РЎС“РЎР‹ Р В»Р ВµР Р…РЎвЂљРЎС“ Р Т‘Р В»РЎРЏ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р ВµР в„–<br /><small><b>Р вЂќР В°</b> - Р СџР С• Р В°Р Т‘РЎР‚Р ВµРЎРѓРЎС“ /plugin/ublog/?id=<b>ID_Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЏ</b> Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р Т‘Р С•РЎРѓРЎвЂљРЎС“Р С—Р ВµР Р… РЎРѓР С—Р С‘РЎРѓР С•Р С” Р ВµР С–Р С• Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–<br /><b>Р СњР ВµРЎвЂљ</b> - РЎРѓР С—Р С‘РЎРѓР С•Р С” Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЏ Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРЉРЎРѓРЎРЏ Р Р…Р Вµ Р В±РЎС“Р Т‘Р ВµРЎвЂљ</small>", 'type' => 'select', 'values' => array('0' => $lang['noa'], '1' => $lang['yesa']), 'value' => intval(pluginGetVariable($plugin, 'personalPages'))));
array_push($cfgX, array('name' => 'personalCount', 'title' => "Р С™Р С•Р В»-Р Р†Р С• Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–, Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°Р ВµР С�РЎвЂ№РЎвЂ¦ Р Р…Р В° РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р Вµ<br/><small>Р вЂ”Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹: <b>10</b></small>", 'type' => 'input', 'value' => $personalCount));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р РЋР С•Р В±РЎРѓРЎвЂљР Р†Р ВµР Р…Р Р…Р В°РЎРЏ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р В° РЎРѓ Р В»Р ВµР Р…РЎвЂљР С•Р в„– Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЏ</b>', 'entries' => $cfgX));
// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}

