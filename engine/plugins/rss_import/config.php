<?php
//
// Configuration file for plugin
//
// Preload config file
plugins_load_config();
$count = extra_get_param($plugin, 'count');
if ((intval($count) < 1) || (intval($count) > 20))
	$count = 1;
// Fill configuration parameters
$cfg = array();
array_push($cfg, array('descr' => 'РџР»Р°РіРёРЅ RSS РЅРѕРІРѕСЃС‚РµР№.'));
array_push($cfg, array('name' => 'count', 'title' => 'РљРѕР»РёС‡РµСЃС‚РІРѕ Р±Р»РѕРєРѕРІ СЃ RSS РЅРѕРІРѕСЃС‚СЏРјРё', 'type' => 'input', 'value' => $count));
for ($i = 1; $i <= $count; $i++) {
	$cfgX = array();
	array_push($cfgX, array('name' => 'rss' . $i . '_name', 'title' => 'Р—Р°РіРѕР»РѕРІРѕРє РЅРѕРІРѕСЃС‚РµР№ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br /><small>РќР°РїСЂРёРјРµСЂ: <b>Next Generation CMS</b></small>', 'type' => 'input', 'value' => extra_get_param($plugin, 'rss' . $i . '_name')));
	array_push($cfgX, array('name' => 'rss' . $i . '_url', 'title' => 'РђРґСЂРµСЃ РЅРѕРІРѕСЃС‚РµР№ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br /><small>РќР°РїСЂРёРјРµСЂ: <b>http://ngcms.ru</b></small>', 'type' => 'input', 'value' => extra_get_param($plugin, 'rss' . $i . '_url')));
	array_push($cfgX, array('name' => 'rss' . $i . '_number', 'title' => 'РљРѕР»РёС‡РµСЃС‚РІРѕ РЅРѕРІРѕСЃС‚РµР№ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br /><small>Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>10</b></small>', 'type' => 'input', 'value' => intval(extra_get_param($plugin, 'rss' . $i . '_number')) ? extra_get_param($plugin, 'rss' . $i . '_number') : '10'));
	array_push($cfgX, array('name' => 'rss' . $i . '_maxlength', 'title' => 'РћРіСЂР°РЅРёС‡РµРЅРёРµ РґР»РёРЅС‹ РЅР°Р·РІР°РЅРёСЏ РЅРѕРІРѕСЃС‚Рё<br /><small>Р•СЃР»Рё РЅР°Р·РІР°РЅРёРµ РїСЂРµРІС‹С€Р°РµС‚ СѓРєР°Р·Р°РЅРЅС‹Рµ РїСЂРµРґРµР»С‹, С‚Рѕ РѕРЅРѕ Р±СѓРґРµС‚ СѓСЂРµР·Р°РЅРѕ<br />Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>100</b></small>', 'type' => 'input', 'value' => intval(extra_get_param($plugin, 'rss' . $i . '_maxlength')) ? extra_get_param($plugin, 'rss' . $i . '_maxlength') : '100'));
	array_push($cfgX, array('name' => 'rss' . $i . '_newslength', 'title' => 'РћРіСЂР°РЅРёС‡РµРЅРёРµ РґР»РёРЅС‹ РєРѕСЂРѕС‚РєРѕР№ РЅРѕРІРѕСЃС‚Рё<br /><small>Р•СЃР»Рё РЅР°Р·РІР°РЅРёРµ РїСЂРµРІС‹С€Р°РµС‚ СѓРєР°Р·Р°РЅРЅС‹Рµ РїСЂРµРґРµР»С‹, С‚Рѕ РѕРЅРѕ Р±СѓРґРµС‚ СѓСЂРµР·Р°РЅРѕ<br />Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>100</b></small>', 'type' => 'input', 'value' => intval(extra_get_param($plugin, 'rss' . $i . '_newslength')) ? extra_get_param($plugin, 'rss' . $i . '_newslength') : '100'));
	array_push($cfgX, array('name' => 'rss' . $i . '_content', 'title' => "Р“РµРЅРµСЂРёСЂРѕРІР°С‚СЊ РїРµСЂРµРјРµРЅРЅСѓСЋ {short_news}", 'type' => 'checkbox', value => extra_get_param($plugin, 'rss' . $i . '_content')));
	array_push($cfgX, array('name' => 'rss' . $i . '_img', 'title' => "РЈРґР°Р»РёС‚СЊ РІСЃРµ РєР°СЂС‚РёРЅРєРё РёР· {short_news}", 'type' => 'checkbox', value => extra_get_param($plugin, 'rss' . $i . '_img')));
	array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё Р±Р»РѕРєР° в„– <b>' . $i . '</b> {rss' . $i . '}', 'entries' => $cfgX));
}
$cfgX = array();
array_push($cfgX, array('name' => 'localsource', 'title' => 'Р’С‹Р±РµСЂРёС‚Рµ РєР°С‚Р°Р»РѕРі РёР· РєРѕС‚РѕСЂРѕРіРѕ РїР»Р°РіРёРЅ Р±СѓРґРµС‚ Р±СЂР°С‚СЊ С€Р°Р±Р»РѕРЅС‹ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br /><small><b>РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°</b> - РїР»Р°РіРёРЅ Р±СѓРґРµС‚ РїС‹С‚Р°С‚СЊСЃСЏ РІР·СЏС‚СЊ С€Р°Р±Р»РѕРЅС‹ РёР· РѕР±С‰РµРіРѕ С€Р°Р±Р»РѕРЅР° СЃР°Р№С‚Р°; РІ СЃР»СѓС‡Р°Рµ РЅРµРґРѕСЃС‚СѓРїРЅРѕСЃС‚Рё - С€Р°Р±Р»РѕРЅС‹ Р±СѓРґСѓС‚ РІР·СЏС‚С‹ РёР· СЃРѕР±СЃС‚РІРµРЅРЅРѕРіРѕ РєР°С‚Р°Р»РѕРіР° РїР»Р°РіРёРЅР°<br /><b>РџР»Р°РіРёРЅ</b> - С€Р°Р±Р»РѕРЅС‹ Р±СѓРґСѓС‚ Р±СЂР°С‚СЊСЃСЏ РёР· СЃРѕР±СЃС‚РІРµРЅРЅРѕРіРѕ РєР°С‚Р°Р»РѕРіР° РїР»Р°РіРёРЅР°</small>', 'type' => 'select', 'values' => array('0' => 'РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°', '1' => 'РџР»Р°РіРёРЅ'), 'value' => intval(extra_get_param($plugin, 'localsource'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'cache', 'title' => 'Р�СЃРїРѕР»СЊР·РѕРІР°С‚СЊ РєРµС€РёСЂРѕРІР°РЅРёРµ РґР°РЅРЅС‹С…<br /><small><b>Р”Р°</b> - РєРµС€РёСЂРѕРІР°РЅРёРµ РёСЃРїРѕР»СЊР·СѓРµС‚СЃСЏ<br /><b>РќРµС‚</b> - РєРµС€РёСЂРѕРІР°РЅРёРµ РЅРµ РёСЃРїРѕР»СЊР·СѓРµС‚СЃСЏ</small>', 'type' => 'select', 'values' => array('1' => 'Р”Р°', '0' => 'РќРµС‚'), 'value' => intval(extra_get_param($plugin, 'cache'))));
array_push($cfgX, array('name' => 'cacheExpire', 'title' => 'РџРµСЂРёРѕРґ РѕР±РЅРѕРІР»РµРЅРёСЏ РєРµС€Р°<br /><small>(С‡РµСЂРµР· СЃРєРѕР»СЊРєРѕ СЃРµРєСѓРЅРґ РїСЂРѕРёСЃС…РѕРґРёС‚ РѕР±РЅРѕРІР»РµРЅРёРµ РєРµС€Р°. Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>60</b>)</small>', 'type' => 'input', 'value' => intval(extra_get_param($plugin, 'cacheExpire')) ? extra_get_param($plugin, 'cacheExpire') : '60'));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РєРµС€РёСЂРѕРІР°РЅРёСЏ</b>', 'entries' => $cfgX));
// RUN 
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}