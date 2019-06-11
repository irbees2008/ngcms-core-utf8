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
array_push($cfgX, array('name' => 'counter', 'title' => $lang['archive:counter'], 'descr' => $lang['archive:counter#desc'], 'type' => 'select', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), 'value' => intval(pluginGetVariable($plugin, 'counter'))));
array_push($cfgX, array('name' => 'tcounter', 'title' => $lang['archive:tcounter'], 'descr' => $lang['archive:tcounter#desc'], 'type' => 'select', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), 'value' => intval(pluginGetVariable($plugin, 'tcounter'))));
array_push($cfg, array('mode' => 'group', 'title' => $lang['archive:group.config'], 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'mode', 'title' => "Р’ РєР°РєРѕРј СЂРµР¶РёРјРµ РіРµРЅРµСЂРёСЂСѓРµС‚СЃСЏ РІС‹РІРѕРґ РїР»Р°РіРёРЅР°<br /><small><b>РђРІС‚РѕРјР°С‚РёС‡РµСЃРєРё</b> - РїСЂРё РІРєР»СЋС‡РµРЅРёРё РїР»Р°РіРёРЅР° Р°РІС‚РѕРјР°С‚РёС‡РµСЃРєРё РіРµРЅРµСЂРёСЂСѓРµС‚СЃСЏ Р±Р»РѕРє {plugin_comments}<br /><b>TWIG</b> - РІС‹РІРѕРґ РїР»Р°РіРёРЅР° РіРµРЅРµСЂРёСЂСѓРµС‚СЃСЏ С‚РѕР»СЊРєРѕ С‡РµСЂРµР· TWIG С„СѓРЅРєС†РёСЋ <b>callPlugin()</b></small>", 'type' => 'select', 'values' => array('0' => 'РђРІС‚РѕРјР°С‚РёС‡РµСЃРєРё', '1' => 'TWIG'), 'value' => intval(pluginGetVariable($plugin, 'mode'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р РµР¶РёРј Р·Р°РїСѓСЃРєР°</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'localsource', 'title' => $lang['archive:localsource'], 'descr' => $lang['archive:localsource#desc'], 'type' => 'select', 'values' => array('0' => 'РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°', '1' => 'РџР»Р°РіРёРЅ'), 'value' => intval(pluginGetVariable($plugin, 'localsource'))));
array_push($cfg, array('mode' => 'group', 'title' => $lang['archive:group.source'], 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'cache', 'title' => $lang['archive:cache'], $lang['archive:cache#desc'], 'type' => 'select', 'values' => array('1' => 'Р”Р°', '0' => 'РќРµС‚'), 'value' => intval(pluginGetVariable($plugin, 'cache'))));
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