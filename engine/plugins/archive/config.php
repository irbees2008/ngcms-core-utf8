<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
// Preload config file
plugins_load_config();
LoadPluginLang('archive', 'config', '', '', ':');
// Fill configuration parameters
$cfg = array();
$cfgX = array();
array_push($cfg, array('descr' => $lang['archive:description']));
array_push($cfgX, array('name' => 'maxnum', 'title' => $lang['archive:maxnum'], 'descr' => $lang['archive:maxnum#desc'], 'type' => 'input', 'value' => intval(pluginGetVariable($plugin, 'maxnum')) ? pluginGetVariable($plugin, 'maxnum') : '12'));
array_push($cfgX, array('name' => 'counter', 'title' => $lang['archive:counter'], 'descr' => $lang['archive:counter#desc'], 'type' => 'select', 'values' => array('0' => 'Р СњР ВµРЎвЂљ', '1' => 'Р вЂќР В°'), 'value' => intval(pluginGetVariable($plugin, 'counter'))));
array_push($cfgX, array('name' => 'tcounter', 'title' => $lang['archive:tcounter'], 'descr' => $lang['archive:tcounter#desc'], 'type' => 'select', 'values' => array('0' => 'Р СњР ВµРЎвЂљ', '1' => 'Р вЂќР В°'), 'value' => intval(pluginGetVariable($plugin, 'tcounter'))));
array_push($cfg, array('mode' => 'group', 'title' => $lang['archive:group.config'], 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'mode', 'title' => "Р вЂ™ Р С”Р В°Р С”Р С•Р С� РЎР‚Р ВµР В¶Р С‘Р С�Р Вµ Р С–Р ВµР Р…Р ВµРЎР‚Р С‘РЎР‚РЎС“Р ВµРЎвЂљРЎРѓРЎРЏ Р Р†РЎвЂ№Р Р†Р С•Р Т‘ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°<br /><small><b>Р С’Р Р†РЎвЂљР С•Р С�Р В°РЎвЂљР С‘РЎвЂЎР ВµРЎРѓР С”Р С‘</b> - Р С—РЎР‚Р С‘ Р Р†Р С”Р В»РЎР‹РЎвЂЎР ВµР Р…Р С‘Р С‘ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В° Р В°Р Р†РЎвЂљР С•Р С�Р В°РЎвЂљР С‘РЎвЂЎР ВµРЎРѓР С”Р С‘ Р С–Р ВµР Р…Р ВµРЎР‚Р С‘РЎР‚РЎС“Р ВµРЎвЂљРЎРѓРЎРЏ Р В±Р В»Р С•Р С” {plugin_comments}<br /><b>TWIG</b> - Р Р†РЎвЂ№Р Р†Р С•Р Т‘ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В° Р С–Р ВµР Р…Р ВµРЎР‚Р С‘РЎР‚РЎС“Р ВµРЎвЂљРЎРѓРЎРЏ РЎвЂљР С•Р В»РЎРЉР С”Р С• РЎвЂЎР ВµРЎР‚Р ВµР В· TWIG РЎвЂћРЎС“Р Р…Р С”РЎвЂ Р С‘РЎР‹ <b>callPlugin()</b></small>", 'type' => 'select', 'values' => array('0' => 'Р С’Р Р†РЎвЂљР С•Р С�Р В°РЎвЂљР С‘РЎвЂЎР ВµРЎРѓР С”Р С‘', '1' => 'TWIG'), 'value' => intval(pluginGetVariable($plugin, 'mode'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р В Р ВµР В¶Р С‘Р С� Р В·Р В°Р С—РЎС“РЎРѓР С”Р В°</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'localsource', 'title' => $lang['archive:localsource'], 'descr' => $lang['archive:localsource#desc'], 'type' => 'select', 'values' => array('0' => 'Р РЃР В°Р В±Р В»Р С•Р Р… РЎРѓР В°Р в„–РЎвЂљР В°', '1' => 'Р СџР В»Р В°Р С–Р С‘Р Р…'), 'value' => intval(pluginGetVariable($plugin, 'localsource'))));
array_push($cfg, array('mode' => 'group', 'title' => $lang['archive:group.source'], 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'cache', 'title' => $lang['archive:cache'], $lang['archive:cache#desc'], 'type' => 'select', 'values' => array('1' => 'Р вЂќР В°', '0' => 'Р СњР ВµРЎвЂљ'), 'value' => intval(pluginGetVariable($plugin, 'cache'))));
array_push($cfgX, array('name' => 'cacheExpire', 'title' => $lang['archive:cacheExpire'], 'descr' => $lang['archive:cacheExpire#desc'], 'type' => 'input', 'value' => intval(pluginGetVariable($plugin, 'cacheExpire')) ? pluginGetVariable($plugin, 'cacheExpire') : '60'));
array_push($cfg, array('mode' => 'group', 'title' => $lang['archive:group.cache'], 'entries' => $cfgX));
// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
?>