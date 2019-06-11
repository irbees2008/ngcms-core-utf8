<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
// Preload config file
plugins_load_config();
$xfEnclosureValues = array('' => '');
//
// IF plugin 'XFIELDS' is enabled - load it to prepare `enclosure` integration
if (getPluginStatusActive('xfields')) {
	include_once(root . "/plugins/xfields/xfields.php");
	// Load XFields config
	if (is_array($xfc = xf_configLoad())) {
		foreach ($xfc['news'] as $fid => $fdata) {
			$xfEnclosureValues[$fid] = $fid . ' (' . $fdata['title'] . ')';
		}
	}
}
// For example - find 1st category with news for demo URL
$demoCategory = '';
foreach ($catz as $scanCat) {
	if ($scanCat['posts'] > 0) {
		$demoCategory = $scanCat['alt'];
		break;
	}
}
// Fill configuration parameters
$cfg = array();
$cfgX = array();
array_push($cfg, array('descr' => '<b>РџР»Р°РіРёРЅ СЌРєСЃРїРѕСЂС‚Р° РЅРѕРІРѕСЃС‚РµР№ РІ С„РѕСЂРјР°С‚Рµ RSS</b><br>РџРѕР»РЅР°СЏ Р»РµРЅС‚Р° РЅРѕРІРѕСЃС‚РµР№ РґРѕСЃС‚СѓРїРЅР° РїРѕ Р°РґСЂРµСЃСѓ: <b>' . generatePluginLink('rss_export', '', array(), array(), true, true) . (($demoCategory != '') ? '<br/>Р›РµРЅС‚Р° РЅРѕРІРѕСЃС‚РµР№ РґР»СЏ РєР°С‚РµРіРѕСЂРёРё <i>' . $catz[$demoCategory]['name'] . '</i>: ' . generatePluginLink('rss_export', 'category', array('category' => $demoCategory), array(), true, true) : '')));
array_push($cfgX, array('type' => 'select', 'name' => 'feed_title_format', 'title' => 'Р¤РѕСЂРјР°С‚ Р·Р°РіРѕР»РѕРІРєР° Р»РµРЅС‚С‹ РЅРѕРІРѕСЃС‚РµР№', 'descr' => '<b>РЎР°Р№С‚</b> - РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊ Р·Р°РіРѕР»РѕРІРѕРє СЃР°Р№С‚Р°<br><b>РЎР°Р№С‚+РљР°С‚РµРіРѕСЂРёСЏ</b> - РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊ Р·Р°РіРѕР»РѕРІРѕРє СЃР°Р№С‚Р°+РЅР°Р·РІР°РЅРёРµ РєР°С‚РµРіРѕСЂРёРё (РїСЂРё РІС‹РІРѕРґРµ РЅРѕРІРѕСЃС‚РµР№ РёР· РєРѕРЅРєСЂРµС‚РЅРѕР№ РєР°С‚РµРіРѕСЂРёРё)<br><b>Р СѓС‡РЅРѕР№</b> - Р·Р°РіРѕР»РѕРІРѕРє РѕРїСЂРµРґРµР»СЏРµС‚СЃСЏ Р’Р°РјРё', 'values' => array('site' => 'РЎР°Р№С‚', 'site_title' => 'РЎР°Р№С‚+РљР°С‚РµРіРѕСЂРёСЏ', 'handy' => 'Р СѓС‡РЅРѕР№'), value => pluginGetVariable('rss_export', 'feed_title_format')));
array_push($cfgX, array('type' => 'input', 'name' => 'feed_title_value', 'title' => 'Р’Р°С€ Р·Р°РіРѕР»РѕРІРѕРє Р»РµРЅС‚С‹ РЅРѕРІРѕСЃС‚РµР№', 'descr' => 'Р—Р°РіРѕР»РѕРІРѕРє РёСЃРїРѕР»СЊР·СѓРµС‚СЃСЏ РІ СЃР»СѓС‡Р°Рµ РІС‹Р±РѕСЂР° С„РѕСЂРјР°С‚Р° <b>"СЂСѓС‡РЅРѕР№"</b> РІ РєР°С‡РµСЃС‚РІРµ Р·Р°РіРѕР»РѕРІРєР° Р»РµРЅС‚С‹', 'html_flags' => 'style="width: 250px;"', 'value' => pluginGetVariable('rss_export', 'feed_title_value')));
array_push($cfgX, array('type' => 'select', 'name' => 'news_title', 'title' => 'Р¤РѕСЂРјР°С‚ Р·Р°РіРѕР»РѕРІРєР° РЅРѕРІРѕСЃС‚Рё', 'descr' => '<b>РќР°Р·РІР°РЅРёРµ</b> - РІ Р·Р°РіРѕР»РѕРІРєРµ СѓРєР°Р·С‹РІР°РµС‚СЃСЏ С‚РѕР»СЊРєРѕ РЅР°Р·РІР°РЅРёРµ РЅРѕРІРѕСЃС‚Рё<br><b>РљР°С‚РµРіРѕСЂРёСЏ :: РќР°Р·РІР°РЅРёРµ</b> - Р’ Р·Р°РіРѕР»РѕРІРєРµ СѓРєР°Р·С‹РІР°РµС‚СЃСЏ РєР°Рє РєР°С‚РµРіРѕСЂРёСЏ С‚Р°Рє Рё РЅР°Р·РІР°РЅРёРµ РЅРѕРІРѕСЃС‚Рё', 'values' => array('0' => 'РќР°Р·РІР°РЅРёРµ', '1' => 'РљР°С‚РµРіРѕСЂРёСЏ :: РќР°Р·РІР°РЅРёРµ'), value => pluginGetVariable('rss_export', 'news_title')));
array_push($cfgX, array('type' => 'input', 'name' => 'news_count', 'title' => 'РљРѕР»-РІРѕ РЅРѕРІРѕСЃС‚РµР№ РґР»СЏ РїСѓР±Р»РёРєР°С†РёРё РІ Р»РµРЅС‚Рµ', value => pluginGetVariable('rss_export', 'news_count')));
array_push($cfgX, array('type' => 'select', 'name' => 'use_hide', 'title' => 'РћР±СЂР°Р±Р°С‚С‹РІР°С‚СЊ С‚РµРі <b>[hide] ... [/hide]</b>', 'descr' => '<b>Р”Р°</b> - С‚РµРєСЃС‚ РѕС‚РјРµС‡РµРЅРЅС‹Р№ С‚РµРіРѕРј <b>hide</b> РЅРµ РѕС‚РѕР±СЂР°Р¶Р°РµС‚СЃСЏ<br><b>РќРµС‚</b> - С‚РµРєСЃС‚ РѕС‚РјРµС‡РµРЅРЅС‹Р№ С‚РµРіРѕРј <b>hide</b> РѕС‚РѕР±СЂР°Р¶Р°РµС‚СЃСЏ', 'values' => array('0' => 'РќРµС‚', '1' => 'Р”Р°'), value => pluginGetVariable('rss_export', 'use_hide')));
array_push($cfgX, array('type' => 'select', 'name' => 'content_show', 'title' => 'Р’РёРґ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ РЅРѕРІРѕСЃС‚Рё', 'descr' => 'Р’Р°Рј РЅРµРѕР±С…РѕРґРёРјРѕ СѓРєР°Р·Р°С‚СЊ РєР°РєР°СЏ РёРјРµРЅРЅРѕ РёРЅС„РѕСЂРјР°С†РёСЏ Р±СѓРґРµС‚ РѕС‚РѕР±СЂР°Р¶Р°С‚СЊСЃСЏ РІРЅСѓС‚СЂРё РЅРѕРІРѕСЃС‚Рё, СЌРєСЃРїРѕСЂС‚РёСЂСѓРµРјРѕР№ С‡РµСЂРµР· RSS', 'values' => array('0' => 'РєРѕСЂРѕС‚РєР°СЏ+РґР»РёРЅРЅР°СЏ', '1' => 'С‚РѕР»СЊРєРѕ РєРѕСЂРѕС‚РєР°СЏ', '2' => 'С‚РѕР»СЊРєРѕ РґР»РёРЅРЅР°СЏ'), value => pluginGetVariable('rss_export', 'content_show')));
array_push($cfgX, array('type' => 'input', 'name' => 'truncate', 'title' => 'РћР±СЂРµР·Р°С‚СЊ РІС‹РІРѕРґРёРјСѓСЋ РёРЅС„РѕСЂРјР°С†РёСЋ', 'descr' => 'РљРѕР»-РІРѕ СЃРёРјРІРѕР»РѕРІ РґРѕ РєРѕС‚РѕСЂС‹С… Р±СѓРґРµС‚ РѕР±СЂРµР·Р°С‚СЊСЃСЏ РІС‹РІРѕРґРёРјР°СЏ РІ Р»РµРЅС‚Рµ РёРЅС„РѕСЂРјР°С†РёСЏ.<br/>Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>0</b> - РЅРµ РѕР±СЂРµР·Р°С‚СЊ', value => intval(pluginGetVariable('rss_export', 'truncate'))));
array_push($cfgX, array('type' => 'input', 'name' => 'delay', 'title' => 'РћС‚СЃСЂРѕС‡РєР° РІС‹РІРѕРґР° РЅРѕРІРѕСЃС‚РµР№ РІ Р»РµРЅС‚Сѓ', 'descr' => 'Р’С‹ РјРѕР¶РµС‚Рµ Р·Р°РґР°С‚СЊ РІСЂРµРјСЏ (<b>РІ РјРёРЅСѓС‚Р°С…</b>) РЅР° РєРѕС‚РѕСЂРѕРµ Р±СѓРґРµС‚ РѕС‚РєР»Р°РґС‹РІР°С‚СЊСЃСЏ РІС‹РІРѕРґ РЅРѕРІРѕСЃС‚РµР№ РІ RSS Р»РµРЅС‚Сѓ', value => pluginGetVariable('rss_export', 'delay')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РћР±С‰РёРµ РЅР°СЃС‚СЂРѕР№РєРё</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'xfEnclosureEnabled', 'title' => "Р“РµРЅРµСЂР°С†РёСЏ РїРѕР»СЏ 'Enclosure' РёСЃРїРѕР»СЊР·СѓСЏ РґР°РЅРЅС‹Рµ РїР»Р°РіРёРЅР° xfields", 'descr' => "<b>Р”Р°</b> - РІРєР»СЋС‡РёС‚СЊ РіРµРЅРµСЂР°С†РёСЋ<br /><b>РќРµС‚</b> - РѕС‚РєР»СЋС‡РёС‚СЊ РіРµРЅРµСЂР°С†РёСЋ</small>", 'type' => 'select', 'values' => array('1' => 'Р”Р°', '0' => 'РќРµС‚'), 'value' => intval(pluginGetVariable($plugin, 'xfEnclosureEnabled'))));
array_push($cfgX, array('name' => 'xfEnclosure', 'title' => "ID РїРѕР»СЏ РїР»Р°РіРёРЅР° <b>xfields</b>, РєРѕС‚РѕСЂРѕРµ Р±СѓРґРµС‚ РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊСЃСЏ РґР»СЏ РіРµРЅРµСЂР°С†РёРё РїРѕР»СЏ <b>Enclosure</b>", 'type' => 'select', 'values' => $xfEnclosureValues, 'value' => pluginGetVariable($plugin, 'xfEnclosure')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р“РµРЅРµСЂР°С†РёСЏ РїРѕР»СЏ <b>enclosure</b></b>', 'entries' => $cfgX));
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