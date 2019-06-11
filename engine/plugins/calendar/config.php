<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
// Preload config file
plugins_load_config();
// Fill configuration parameters
$cfg = array();
$cfgX = array();
array_push($cfg, array('descr' => 'РџР»Р°РіРёРЅ РѕС‚РѕР±СЂР°Р¶Р°РµС‚ "РєР°Р»РµРЅРґР°СЂСЊ" - РѕС‚РѕР±СЂР°Р¶Р°РµС‚ РґР°РЅРЅС‹Рµ Рѕ РЅРѕРІРѕСЃС‚СЏС… РїРѕ РІС‹Р±СЂР°РЅРЅРѕРјСѓ РјРµСЃСЏС†Сѓ РїРѕРґСЃРІРµС‡РёРІР°СЏ РґРЅРё РєРѕРіРґР° Р±С‹Р»Рё СЂР°Р·РјРµС‰РµРЅС‹ РЅРѕРІРѕСЃС‚РёРџСЂРё РєР»РёРєРµ РЅР° РґРµРЅСЊ Р±СѓРґСѓС‚ РѕС‚РѕР±СЂР°Р¶Р°С‚СЊСЃСЏ РЅРѕРІРѕСЃС‚Рё Р·Р° СЌС‚РѕС‚ РґРµРЅСЊ'));
$cfgX = array();
array_push($cfgX, array('name' => 'mode', 'title' => "Р’ РєР°РєРѕРј СЂРµР¶РёРјРµ РіРµРЅРµСЂРёСЂСѓРµС‚СЃСЏ РІС‹РІРѕРґ РїР»Р°РіРёРЅР°<br /><small><b>РђРІС‚РѕРјР°С‚РёС‡РµСЃРєРё</b> - РїСЂРё РІРєР»СЋС‡РµРЅРёРё РїР»Р°РіРёРЅР° Р°РІС‚РѕРјР°С‚РёС‡РµСЃРєРё РіРµРЅРµСЂРёСЂСѓРµС‚СЃСЏ Р±Р»РѕРє {plugin_comments}<br /><b>TWIG</b> - РІС‹РІРѕРґ РїР»Р°РіРёРЅР° РіРµРЅРµСЂРёСЂСѓРµС‚СЃСЏ С‚РѕР»СЊРєРѕ С‡РµСЂРµР· TWIG С„СѓРЅРєС†РёСЋ <b>callPlugin()</b></small>", 'type' => 'select', 'values' => array('0' => 'РђРІС‚РѕРјР°С‚РёС‡РµСЃРєРё', '1' => 'TWIG'), 'value' => intval(pluginGetVariable($plugin, 'mode'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р РµР¶РёРј Р·Р°РїСѓСЃРєР°</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'localsource', 'title' => "Р’С‹Р±РµСЂРёС‚Рµ РєР°С‚Р°Р»РѕРі РёР· РєРѕС‚РѕСЂРѕРіРѕ РїР»Р°РіРёРЅ Р±СѓРґРµС‚ Р±СЂР°С‚СЊ С€Р°Р±Р»РѕРЅС‹ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br /><small><b>РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°</b> - РїР»Р°РіРёРЅ Р±СѓРґРµС‚ РїС‹С‚Р°С‚СЊСЃСЏ РІР·СЏС‚СЊ С€Р°Р±Р»РѕРЅС‹ РёР· РѕР±С‰РµРіРѕ С€Р°Р±Р»РѕРЅР° СЃР°Р№С‚Р°; РІ СЃР»СѓС‡Р°Рµ РЅРµРґРѕСЃС‚СѓРїРЅРѕСЃС‚Рё - С€Р°Р±Р»РѕРЅС‹ Р±СѓРґСѓС‚ РІР·СЏС‚С‹ РёР· СЃРѕР±СЃС‚РІРµРЅРЅРѕРіРѕ РєР°С‚Р°Р»РѕРіР° РїР»Р°РіРёРЅР°<br /><b>РџР»Р°РіРёРЅ</b> - С€Р°Р±Р»РѕРЅС‹ Р±СѓРґСѓС‚ Р±СЂР°С‚СЊСЃСЏ РёР· СЃРѕР±СЃС‚РІРµРЅРЅРѕРіРѕ РєР°С‚Р°Р»РѕРіР° РїР»Р°РіРёРЅР°</small>", 'type' => 'select', 'values' => array('0' => 'РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°', '1' => 'РџР»Р°РіРёРЅ'), 'value' => intval(pluginGetVariable($plugin, 'localsource'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'cache', 'title' => "Р�СЃРїРѕР»СЊР·РѕРІР°С‚СЊ РєРµС€РёСЂРѕРІР°РЅРёРµ РґР°РЅРЅС‹С…<br /><small><b>Р”Р°</b> - РєРµС€РёСЂРѕРІР°РЅРёРµ РёСЃРїРѕР»СЊР·СѓРµС‚СЃСЏ<br /><b>РќРµС‚</b> - РєРµС€РёСЂРѕРІР°РЅРёРµ РЅРµ РёСЃРїРѕР»СЊР·СѓРµС‚СЃСЏ</small>", 'type' => 'select', 'values' => array('1' => 'Р”Р°', '0' => 'РќРµС‚'), 'value' => intval(pluginGetVariable($plugin, 'cache'))));
array_push($cfgX, array('name' => 'cacheExpire', 'title' => "РџРµСЂРёРѕРґ РѕР±РЅРѕРІР»РµРЅРёСЏ РєРµС€Р°<br /><small>(С‡РµСЂРµР· СЃРєРѕР»СЊРєРѕ СЃРµРєСѓРЅРґ РїСЂРѕРёСЃС…РѕРґРёС‚ РѕР±РЅРѕРІР»РµРЅРёРµ РєРµС€Р°. Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>60</b>)</small>", 'type' => 'input', 'value' => intval(pluginGetVariable($plugin, 'cacheExpire')) ? pluginGetVariable($plugin, 'cacheExpire') : '60'));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РєРµС€РёСЂРѕРІР°РЅРёСЏ</b>', 'entries' => $cfgX));
// RUN 
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
?>