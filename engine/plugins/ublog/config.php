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
array_push($cfg, array('descr' => 'РџР»Р°РіРёРЅ РїРѕРєР°Р·С‹РІР°РµС‚ РЅРѕРІРѕСЃС‚Рё РєРѕРЅРєСЂРµС‚РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ'));
$cfgX = array();
array_push($cfgX, array('name' => 'replaceCount', 'title' => "Р—Р°РјРµРЅСЏС‚СЊ Р·РЅР°С‡РµРЅРёРµ РїРµСЂРµРјРµРЅРЅРѕР№ {news} РЅР° Р°РєС‚РёРІРЅСѓСЋ СЃСЃС‹Р»РєСѓ РЅР° Р±Р»РѕРі РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ?<br /><small><b>Р”Р°</b> - Р‘СѓРґРµС‚ Р·Р°РјРµРЅСЏС‚СЊСЃСЏ Р·РЅР°С‡РµРЅРёРµ РїРµСЂРµРјРµРЅРЅРѕР№<br /><b>РќРµС‚</b> - Р·РЅР°С‡РµРЅРёРµ РїРµСЂРµРјРµРЅРЅРѕР№ Р·Р°РјРµРЅСЏС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚</small>", 'type' => 'select', 'values' => array('0' => $lang['noa'], '1' => $lang['yesa']), 'value' => intval(pluginGetVariable($plugin, 'replaceCount'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РЎС‚СЂР°РЅРёС†Р° РїСЂРѕСЃРјРѕС‚СЂР° РїСЂРѕС„РёР»СЏ РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'personalPages', 'title' => "Р’РєР»СЋС‡РёС‚СЊ РїРµСЂСЃРѕРЅР°Р»СЊРЅСѓСЋ Р»РµРЅС‚Сѓ РґР»СЏ РЅРѕРІРѕСЃС‚РµР№ РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№<br /><small><b>Р”Р°</b> - РџРѕ Р°РґСЂРµСЃСѓ /plugin/ublog/?id=<b>ID_РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ</b> Р±СѓРґРµС‚ РґРѕСЃС‚СѓРїРµРЅ СЃРїРёСЃРѕРє РµРіРѕ РЅРѕРІРѕСЃС‚РµР№<br /><b>РќРµС‚</b> - СЃРїРёСЃРѕРє РЅРѕРІРѕСЃС‚РµР№ РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ РІС‹РІРѕРґРёС‚СЊСЃСЏ РЅРµ Р±СѓРґРµС‚</small>", 'type' => 'select', 'values' => array('0' => $lang['noa'], '1' => $lang['yesa']), 'value' => intval(pluginGetVariable($plugin, 'personalPages'))));
array_push($cfgX, array('name' => 'personalCount', 'title' => "РљРѕР»-РІРѕ РЅРѕРІРѕСЃС‚РµР№, РѕС‚РѕР±СЂР°Р¶Р°РµРјС‹С… РЅР° СЃС‚СЂР°РЅРёС†Рµ<br/><small>Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>10</b></small>", 'type' => 'input', 'value' => $personalCount));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РЎРѕР±СЃС‚РІРµРЅРЅР°СЏ СЃС‚СЂР°РЅРёС†Р° СЃ Р»РµРЅС‚РѕР№ РЅРѕРІРѕСЃС‚РµР№ РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ</b>', 'entries' => $cfgX));
// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}

