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
array_push($cfg, array('descr' => 'РџР»Р°РіРёРЅ РѕС‚РѕР±СЂР°Р¶Р°РµС‚ РїРѕСЃР»РµРґРЅРёРµ РєРѕРјРјРµРЅС‚Р°СЂРёРё, РѕСЃС‚Р°РІР»РµРЅРЅС‹Рµ РЅР° РЅРѕРІРѕСЃС‚Рё СЃР°Р№С‚Р°.'));
array_push($cfgX, array('name' => 'sidepanel', 'title' => 'Р’РєР»СЋС‡РёС‚СЊ РіРµРЅРµСЂР°С†РёСЋ Р±РѕРєРѕРІРѕР№ РїР°РЅРµР»Рё', 'descr' => '<b>Р”Р°</b> - РїР°РЅРµР»СЊ Р±СѓРґРµС‚ РіРµРЅРµСЂРёСЂРѕРІР°С‚СЊСЃСЏ<br/><b>РќРµС‚</b> - РїР°РЅРµР»СЊ РЅРµ Р±СѓРґРµС‚ РіРµРЅРµСЂРёСЂРѕРІР°С‚СЊСЃСЏ', 'type' => 'select', 'values' => array('0' => $lang['noa'], '1' => $lang['yesa']), 'value' => pluginGetVariable('lastcomments', 'sidepanel')));
array_push($cfgX, array('name' => 'number', 'title' => 'РљРѕР»РёС‡РµСЃС‚РІРѕ РІС‹РІРѕРґРёРјС‹С… РєРѕРјРјРµРЅС‚Р°СЂРёРµРІ', 'descr' => 'Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>10</b>', 'type' => 'input', 'html_flags' => 'size=5', 'value' => pluginGetVariable('lastcomments', 'number')));
array_push($cfgX, array('name' => 'comm_length', 'title' => 'РЈСЃРµС‡РµРЅРёРµ РґР»РёРЅС‹ РєРѕРјРјРµРЅС‚Р°СЂРёСЏ', 'descr' => 'РљРѕР»-РІРѕ СЃРёРјРІРѕР»РѕРІ РёР· РєРѕРјРјРµРЅС‚Р°СЂРёСЏ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br/>Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>50</b>', 'type' => 'input', 'html_flags' => 'size=5', 'value' => pluginGetVariable('lastcomments', 'comm_length')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё Р±РѕРєРѕРІРѕР№ РїР°РЅРµР»Рё</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'ppage', 'title' => 'Р Р°Р·СЂРµС€РёС‚СЊ СЃРѕР±СЃС‚РІРµРЅРЅСѓСЋ СЃС‚СЂР°РЅРёС†Сѓ РїР»Р°РіРёРЅР°', 'descr' => '<b>Р”Р°</b> - СЃРѕР±СЃС‚РІРµРЅРЅР°СЏ СЃС‚СЂР°РЅРёС†Р° СЂР°Р·СЂРµС€РµРЅР°<br/><b>РќРµС‚</b> - СЃРѕР±СЃС‚РІРµРЅРЅР°СЏ СЃС‚СЂР°РЅРёС†Р° Р·Р°РїСЂРµС‰РµРЅР°', 'type' => 'select', 'values' => array('0' => $lang['noa'], '1' => $lang['yesa']), 'value' => pluginGetVariable('lastcomments', 'ppage')));
array_push($cfgX, array('name' => 'pp_number', 'title' => 'РљРѕР»РёС‡РµСЃС‚РІРѕ РІС‹РІРѕРґРёРјС‹С… РєРѕРјРјРµРЅС‚Р°СЂРёРµРІ', 'descr' => 'Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>30</b>', 'type' => 'input', 'html_flags' => 'size=5', 'value' => pluginGetVariable('lastcomments', 'pp_number')));
array_push($cfgX, array('name' => 'pp_comm_length', 'title' => 'РЈСЃРµС‡РµРЅРёРµ РґР»РёРЅС‹ РєРѕРјРјРµРЅС‚Р°СЂРёСЏ', 'descr' => 'РљРѕР»-РІРѕ СЃРёРјРІРѕР»РѕРІ РёР· РєРѕРјРјРµРЅС‚Р°СЂРёСЏ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br/>Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>500</b>', 'type' => 'input', 'html_flags' => 'size=5', 'value' => pluginGetVariable('lastcomments', 'pp_comm_length')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё СЃРѕР±СЃС‚РІРµРЅРЅРѕР№ СЃС‚СЂР°РЅРёС†С‹ РїР»Р°РіРёРЅР°</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'rssfeed', 'title' => 'Р Р°Р·СЂРµС€РёС‚СЊ rss-Р»РµРЅС‚Сѓ РїР»Р°РіРёРЅР°', 'descr' => '<b>Р”Р°</b> - rss-Р»РµРЅС‚Р° СЂР°Р·СЂРµС€РµРЅР°<br/><b>РќРµС‚</b> - rss-Р»РµРЅС‚Р° Р·Р°РїСЂРµС‰РµРЅР°', 'type' => 'select', 'values' => array('0' => $lang['noa'], '1' => $lang['yesa']), 'value' => pluginGetVariable('lastcomments', 'rssfeed')));
array_push($cfgX, array('name' => 'rss_number', 'title' => 'РљРѕР»РёС‡РµСЃС‚РІРѕ РІС‹РІРѕРґРёРјС‹С… РєРѕРјРјРµРЅС‚Р°СЂРёРµРІ', 'descr' => 'Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>30</b>', 'type' => 'input', 'html_flags' => 'size=5', 'value' => pluginGetVariable('lastcomments', 'rss_number')));
array_push($cfgX, array('name' => 'rss_comm_length', 'title' => 'РЈСЃРµС‡РµРЅРёРµ РґР»РёРЅС‹ РєРѕРјРјРµРЅС‚Р°СЂРёСЏ', 'descr' => 'РљРѕР»-РІРѕ СЃРёРјРІРѕР»РѕРІ РёР· РєРѕРјРјРµРЅС‚Р°СЂРёСЏ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br/>Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>500</b>', 'type' => 'input', 'html_flags' => 'size=5', 'value' => pluginGetVariable('lastcomments', 'rss_comm_length')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё СЃРѕР±СЃС‚РІРµРЅРЅРѕР№ СЃС‚СЂР°РЅРёС†С‹ РїР»Р°РіРёРЅР°</b>', 'entries' => $cfgX));
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
	commit_plugin_config_changes('lastcomments', $cfg);
	print_commit_complete('lastcomments');
} else {
	generate_config_page('lastcomments', $cfg);
}
