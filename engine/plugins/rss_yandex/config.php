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
array_push($cfg, array('descr' => '<b>РџР»Р°РіРёРЅ СЌРєСЃРїРѕСЂС‚Р° Р»РµРЅС‚С‹ РЅРѕРІРѕСЃС‚РµР№ РґР»СЏ РїРѕРёСЃРєРѕРІРѕР№ СЃРёСЃС‚РµРјС‹ РЇndex</b><br>РџРѕР»РЅР°СЏ Р»РµРЅС‚Р° РЅРѕРІРѕСЃС‚РµР№ РґРѕСЃС‚СѓРїРЅР° РїРѕ Р°РґСЂРµСЃСѓ: <b>' . generatePluginLink('rss_yandex', '', array(), array(), true, true) . (($demoCategory != '') ? '<br/>Р›РµРЅС‚Р° РЅРѕРІРѕСЃС‚РµР№ РґР»СЏ РєР°С‚РµРіРѕСЂРёРё <i>' . $catz[$demoCategory]['name'] . '</i>: ' . generatePluginLink('rss_yandex', 'category', array('category' => $demoCategory), array(), true, true) : '')));
array_push($cfgX, array('type' => 'input', 'name' => 'feed_title', 'title' => 'РќР°Р·РІР°РЅРёРµ RSS РїРѕС‚РѕРєР° РґР»СЏ РїРѕР»РЅРѕР№ Р»РµРЅС‚С‹', 'descr' => 'Р”РѕРїСѓСЃС‚РёРјС‹Рµ РїРµСЂРµРјРµРЅРЅС‹Рµ:<br/><b>{{siteTitle}}</b> - РЅР°Р·РІР°РЅРёРµ СЃР°Р№С‚Р°<br/>Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>{{siteTitle}}</b>', 'html_flags' => 'style="width: 250px;"', 'value' => pluginGetVariable('rss_yandex', 'feed_title') ? pluginGetVariable('rss_yandex', 'feed_title') : '{{siteTitle}}'));
array_push($cfgX, array('type' => 'text', 'name' => 'news_title', 'title' => 'Р—Р°РіРѕР»РѕРІРѕРє (РЅР°Р·РІР°РЅРёРµ) РЅРѕРІРѕСЃС‚Рё', 'descr' => 'Р”РѕРїСѓСЃС‚РёРјС‹Рµ РїРµСЂРµРјРµРЅРЅС‹Рµ:<br/><b>{{siteTitle}}</b> - РЅР°Р·РІР°РЅРёРµ СЃР°Р№С‚Р°<br/><b>{{newsTitle}}</b> - Р·Р°РіРѕР»РѕРІРѕРє РЅРѕРІРѕСЃС‚Рё<br/><b>{{masterCategoryName}}</b> - РЅР°Р·РІР°РЅРёРµ <b>РіР»Р°РІРЅРѕР№</b> РєР°С‚РµРіРѕСЂРёРё РЅРѕРІРѕСЃС‚Рё<br/>Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>{% if masterCategoryName %}{{masterCategoryName}} :: {% endif %}{{newsTitle}}</b>', 'html_flags' => 'style="width: 350px;"', 'value' => pluginGetVariable('rss_yandex', 'news_title') ? pluginGetVariable('rss_yandex', 'news_title') : '{% if masterCategoryName %}{{masterCategoryName}} :: {% endif %}{{newsTitle}}'));
array_push($cfgX, array('type' => 'select', 'name' => 'full_format', 'title' => 'Р¤РѕСЂРјР°С‚ РіРµРЅРµСЂР°С†РёРё РїРѕР»РЅРѕРіРѕ С‚РµРєСЃС‚Р° РЅРѕРІРѕСЃС‚Рё РґР»СЏ Р»РµРЅС‚С‹ РЇndex', 'descr' => '<b>РџРѕР»РЅР°СЏ</b> - РІС‹РІРѕРґРёС‚СЃСЏ С‚РѕР»СЊРєРѕ РїРѕР»РЅР°СЏ С‡Р°СЃС‚СЊ РЅРѕРІРѕСЃС‚Рё<br><b>РљРѕСЂРѕС‚РєР°СЏ+РїРѕР»РЅР°СЏ</b> - РІС‹РІРѕРґРёС‚СЃСЏ РєРѕСЂРѕС‚РєР°СЏ + РїРѕР»РЅР°СЏ С‡Р°СЃС‚СЊ РЅРѕРІРѕСЃС‚Рё', 'values' => array('0' => 'РџРѕР»РЅР°СЏ', '1' => 'РџРѕР»РЅР°СЏ+РєРѕСЂРѕС‚РєР°СЏ'), value => pluginGetVariable('rss_yandex', 'full_format')));
array_push($cfgX, array('type' => 'input', 'name' => 'news_age', 'title' => 'РњР°РєСЃРёРјР°Р»СЊРЅС‹Р№ СЃСЂРѕРє РґР°РІРЅРѕСЃС‚Рё РЅРѕРІРѕСЃС‚РµР№ РґР»СЏ РїСѓР±Р»РёРєР°С†РёРё РІ Р»РµРЅС‚Рµ', 'descr' => 'РЇndex РёРЅРґРµРєСЃРёСЂСѓРµС‚ РЅРѕРІРѕСЃС‚Рё РЅРµ СЃС‚Р°СЂС€Рµ <b>8 СЃСѓС‚РѕРє</b>.<br/>Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: 10 СЃСѓС‚РѕРє', value => pluginGetVariable('rss_yandex', 'news_age')));
array_push($cfgX, array('type' => 'input', 'name' => 'delay', 'title' => 'РћС‚СЃСЂРѕС‡РєР° РІС‹РІРѕРґР° РЅРѕРІРѕСЃС‚РµР№ РІ Р»РµРЅС‚Сѓ', 'descr' => 'Р’С‹ РјРѕР¶РµС‚Рµ Р·Р°РґР°С‚СЊ РІСЂРµРјСЏ (<b>РІ РјРёРЅСѓС‚Р°С…</b>) РЅР° РєРѕС‚РѕСЂРѕРµ Р±СѓРґРµС‚ РѕС‚РєР»Р°РґС‹РІР°С‚СЊСЃСЏ РІС‹РІРѕРґ РЅРѕРІРѕСЃС‚РµР№ РІ RSS Р»РµРЅС‚Сѓ', value => pluginGetVariable('rss_yandex', 'delay')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РћР±С‰РёРµ РЅР°СЃС‚СЂРѕР№РєРё</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('type' => 'input', 'name' => 'feed_image_title', 'title' => 'Р—Р°РіРѕР»РѕРІРѕРє (title) РґР»СЏ Р»РѕРіРѕС‚РёРїР°', 'html_flags' => 'style="width: 250px;"', 'value' => pluginGetVariable('rss_yandex', 'feed_image_title')));
array_push($cfgX, array('type' => 'input', 'name' => 'feed_image_link', 'title' => 'URL СЃ РёР·РѕР±СЂР°Р¶РµРЅРёРµРј Р»РѕРіРѕС‚РёРїР°', 'descr' => 'Р–РµР»Р°С‚РµР»СЊРЅС‹Р№ СЂР°Р·РјРµСЂ Р»РѕРіРѕС‚РёРїР° - 100 РїРёРєСЃРµР»РµР№ РїРѕ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЃС‚РѕСЂРѕРЅРµ', 'html_flags' => 'style="width: 250px;"', 'value' => pluginGetVariable('rss_yandex', 'feed_image_link')));
array_push($cfgX, array('type' => 'input', 'name' => 'feed_image_url', 'title' => 'РЎСЃС‹Р»РєР° (link) РґР»СЏ РїРµСЂРµС…РѕРґР° РїРѕ РєР»РёРєСѓ РЅР° Р»РѕРіРѕС‚РёРї', 'descr' => 'РћР±С‹С‡РЅРѕ - URL РІР°С€РµРіРѕ СЃР°Р№С‚Р°', 'html_flags' => 'style="width: 250px;"', 'value' => pluginGetVariable('rss_yandex', 'feed_image_url')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РћС‚РѕР±СЂР°Р¶РµРЅРёРµ Р»РѕРіРѕС‚РёРїР°</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'xfEnclosureEnabled', 'title' => "Р“РµРЅРµСЂР°С†РёСЏ РїРѕР»СЏ 'Enclosure' РёСЃРїРѕР»СЊР·СѓСЏ РґР°РЅРЅС‹Рµ РїР»Р°РіРёРЅР° xfields", 'descr' => "<b>Р”Р°</b> - РІРєР»СЋС‡РёС‚СЊ РіРµРЅРµСЂР°С†РёСЋ<br /><b>РќРµС‚</b> - РѕС‚РєР»СЋС‡РёС‚СЊ РіРµРЅРµСЂР°С†РёСЋ</small>", 'type' => 'select', 'values' => array('1' => 'Р”Р°', '0' => 'РќРµС‚'), 'value' => intval(pluginGetVariable($plugin, 'xfEnclosureEnabled'))));
array_push($cfgX, array('name' => 'xfEnclosure', 'title' => "ID РїРѕР»СЏ РїР»Р°РіРёРЅР° <b>xfields</b>, РєРѕС‚РѕСЂРѕРµ Р±СѓРґРµС‚ РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊСЃСЏ РґР»СЏ РіРµРЅРµСЂР°С†РёРё РїРѕР»СЏ <b>Enclosure</b>", 'type' => 'select', 'values' => $xfEnclosureValues, 'value' => pluginGetVariable($plugin, 'xfEnclosure')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р“РµРЅРµСЂР°С†РёСЏ РїРѕР»СЏ <b>enclosure</b> РёР· РїРѕР»СЏ xfields</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'textEnclosureEnabled', 'title' => "Р’С‹РІРѕРґ РІ РїРѕР»Рµ 'Enclosure' РІСЃРµС… РёР·РѕР±СЂР°Р¶РµРЅРёР№ РёР· С‚РµРєСЃС‚Р° РЅРѕРІРѕСЃС‚Рё (РёСЃРїРѕР»СЊР·СѓСЏ HTML С‚РµРі &lt;img&gt;)", 'descr' => "<b>Р”Р°</b> - РІС‹РІРѕРґРёС‚СЊ РІСЃРµ РёР·РѕР±СЂР°Р¶РµРЅРёСЏ<br /><b>РќРµС‚</b> - РЅРµ РІС‹РІРѕРґРёС‚СЊ</small>", 'type' => 'select', 'values' => array('1' => 'Р”Р°', '0' => 'РќРµС‚'), 'value' => intval(pluginGetVariable($plugin, 'textEnclosureEnabled'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р“РµРЅРµСЂР°С†РёСЏ РїРѕР»СЏ <b>enclosure</b> РёР· С‚РµРєСЃС‚Р° РЅРѕРІРѕСЃС‚Рё</b>', 'entries' => $cfgX));
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