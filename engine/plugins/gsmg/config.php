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
array_push($cfg, array('descr' => 'РџР»Р°РіРёРЅ РіРµРЅРµСЂР°С†РёРё XML РєР°СЂС‚С‹ СЃР°Р№С‚Р° РґР»СЏ РїРѕРёСЃРєРѕРІРѕР№ СЃРёСЃС‚РµРјС‹ Google'));
array_push($cfgX, array('name' => 'main', 'title' => "Р”РѕР±Р°РІР»СЏС‚СЊ РіРѕР»РѕРІРЅСѓСЋ СЃС‚СЂР°РЅРёС†Сѓ РІ РєР°СЂС‚Сѓ СЃР°Р№С‚Р°", 'descr' => "<b>Р”Р°</b> - СЃС‚СЂР°РЅРёС†Р° Р±СѓРґРµС‚ РґРѕР±Р°РІР»СЏС‚СЊСЃСЏ РІ РєР°СЂС‚Сѓ СЃР°Р№С‚Р°<br /><b>РќРµС‚</b> - СЃС‚СЂР°РЅРёС†Р° РЅРµ Р±СѓРґРµС‚ РґРѕР±Р°РІР»СЏС‚СЊСЃСЏ РІ РєР°СЂС‚Сѓ СЃР°Р№С‚Р°", 'type' => 'select', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), 'value' => intval(extra_get_param($plugin, 'main'))));
array_push($cfgX, array('name' => 'main_pr', 'title' => "РџСЂРёРѕСЂРёС‚РµС‚ РіРѕР»РѕРІРЅРѕР№ СЃС‚СЂР°РЅРёС†С‹", 'descr' => 'Р·РЅР°С‡РµРЅРёРµ РѕС‚ <b>0.0</b> РґРѕ <b>1.0</b>', 'type' => 'input', 'value' => (extra_get_param($plugin, 'main_pr') == '') ? '1.0' : extra_get_param($plugin, 'main_pr')));
array_push($cfgX, array('name' => 'mainp', 'title' => "Р”РѕР±Р°РІР»СЏС‚СЊ РїРѕСЃС‚СЂР°РЅРёС‡РєСѓ РіРѕР»РѕРІРЅРѕР№ СЃС‚СЂР°РЅРёС†С‹ РІ РєР°СЂС‚Сѓ СЃР°Р№С‚Р°", 'descr' => "<b>Р”Р°</b> - СЃС‚СЂР°РЅРёС†Р° Р±СѓРґРµС‚ РґРѕР±Р°РІР»СЏС‚СЊСЃСЏ РІ РєР°СЂС‚Сѓ СЃР°Р№С‚Р°<br /><b>РќРµС‚</b> - СЃС‚СЂР°РЅРёС†Р° РЅРµ Р±СѓРґРµС‚ РґРѕР±Р°РІР»СЏС‚СЊСЃСЏ РІ РєР°СЂС‚Сѓ СЃР°Р№С‚Р°", 'type' => 'select', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), 'value' => intval(extra_get_param($plugin, 'mainp'))));
array_push($cfgX, array('name' => 'mainp_pr', 'title' => "РџСЂРёРѕСЂРёС‚РµС‚ РїРѕСЃС‚СЂР°РЅРёС‡РєРё РіРѕР»РѕРІРЅРѕР№ СЃС‚СЂР°РЅРёС†С‹", 'descr' => 'Р·РЅР°С‡РµРЅРёРµ РѕС‚ <b>0.0</b> РґРѕ <b>1.0</b>', 'type' => 'input', 'value' => (extra_get_param($plugin, 'mainp_pr') == '') ? '0.5' : extra_get_param($plugin, 'mainp_pr')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РґР»СЏ РіРѕР»РѕРІРЅРѕР№ СЃС‚СЂР°РЅРёС†С‹ СЃР°Р№С‚Р°</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'cat', 'title' => "Р”РѕР±Р°РІР»СЏС‚СЊ СЃС‚СЂР°РЅРёС†С‹ РєР°С‚РµРіРѕСЂРёР№ РІ РєР°СЂС‚Сѓ СЃР°Р№С‚Р°", 'type' => 'select', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), 'value' => intval(extra_get_param($plugin, 'cat'))));
array_push($cfgX, array('name' => 'cat_pr', 'title' => "РџСЂРёРѕСЂРёС‚РµС‚ СЃС‚СЂР°РЅРёС† РєР°С‚РµРіРѕСЂРёР№", 'type' => 'input', 'value' => (extra_get_param($plugin, 'cat_pr') == '') ? '0.5' : extra_get_param($plugin, 'cat_pr')));
array_push($cfgX, array('name' => 'catp', 'title' => "Р”РѕР±Р°РІР»СЏС‚СЊ РїРѕСЃС‚СЂР°РЅРёС‡РєСѓ СЃС‚СЂР°РЅРёС† РєР°С‚РµРіРѕСЂРёР№ РІ РєР°СЂС‚Сѓ СЃР°Р№С‚Р°", 'type' => 'select', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), 'value' => intval(extra_get_param($plugin, 'catp'))));
array_push($cfgX, array('name' => 'catp_pr', 'title' => "РџСЂРёРѕСЂРёС‚РµС‚ РїРѕСЃС‚СЂР°РЅРёС‡РєРё РєР°С‚РµРіРѕСЂРёР№", 'type' => 'input', 'value' => (extra_get_param($plugin, 'catp_pr') == '') ? '0.5' : extra_get_param($plugin, 'catp_pr')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РґР»СЏ СЃС‚СЂР°РЅРёС† РєР°С‚РµРіРѕСЂРёР№</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'news', 'title' => "Р”РѕР±Р°РІР»СЏС‚СЊ СЃС‚СЂР°РЅРёС†С‹ РЅРѕРІРѕСЃС‚РµР№ РІ РєР°СЂС‚Сѓ СЃР°Р№С‚Р°", 'type' => 'select', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), 'value' => intval(extra_get_param($plugin, 'news'))));
array_push($cfgX, array('name' => 'news_pr', 'title' => "РџСЂРёРѕСЂРёС‚РµС‚ СЃС‚СЂР°РЅРёС† РЅРѕРІРѕСЃС‚РµР№", 'type' => 'input', 'value' => (extra_get_param($plugin, 'news_pr') == '') ? '0.3' : extra_get_param($plugin, 'news_pr')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РґР»СЏ СЃС‚СЂР°РЅРёС† РЅРѕРІРѕСЃС‚РµР№</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'static', 'title' => "Р”РѕР±Р°РІР»СЏС‚СЊ СЃС‚Р°С‚РёС‡РµСЃРєРёРµ СЃС‚СЂР°РЅРёС†С‹ РІ РєР°СЂС‚Сѓ СЃР°Р№С‚Р°", 'type' => 'select', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), 'value' => intval(extra_get_param($plugin, 'static'))));
array_push($cfgX, array('name' => 'static_pr', 'title' => "РџСЂРёРѕСЂРёС‚РµС‚ СЃС‚Р°С‚РёС‡РµСЃРєРёС… СЃС‚СЂР°РЅРёС†", 'type' => 'input', 'value' => (extra_get_param($plugin, 'static_pr') == '') ? '0.3' : extra_get_param($plugin, 'static_pr')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РґР»СЏ СЃС‚Р°С‚РёС‡РµСЃРєРёС… СЃС‚СЂР°РЅРёС†</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'cache', 'title' => "Р�СЃРїРѕР»СЊР·РѕРІР°С‚СЊ РєРµС€РёСЂРѕРІР°РЅРёРµ РєР°СЂС‚С‹ СЃР°Р№С‚Р°<br /><small><b>Р”Р°</b> - РєРµС€РёСЂРѕРІР°РЅРёРµ РёСЃРїРѕР»СЊР·СѓРµС‚СЃСЏ<br /><b>РќРµС‚</b> - РєРµС€РёСЂРѕРІР°РЅРёРµ РЅРµ РёСЃРїРѕР»СЊР·СѓРµС‚СЃСЏ</small>", 'type' => 'select', 'values' => array('1' => 'Р”Р°', '0' => 'РќРµС‚'), 'value' => intval(extra_get_param($plugin, 'cache'))));
array_push($cfgX, array('name' => 'cacheExpire', 'title' => 'РџРµСЂРёРѕРґ РѕР±РЅРѕРІР»РµРЅРёСЏ РєРµС€Р° (РІ СЃРµРєСѓРЅРґР°С…)<br /><small>(С‡РµСЂРµР· СЃРєРѕР»СЊРєРѕ СЃРµРєСѓРЅРґ РїСЂРѕРёСЃС…РѕРґРёС‚ РѕР±РЅРѕРІР»РµРЅРёРµ РєРµС€Р°. Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>10800</b>, С‚.Рµ. 3 С‡Р°СЃР°)', 'type' => 'input', 'value' => intval(extra_get_param($plugin, 'cacheExpire')) ? extra_get_param($plugin, 'cacheExpire') : '10800'));
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