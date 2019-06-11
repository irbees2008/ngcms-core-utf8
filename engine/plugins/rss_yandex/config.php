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
array_push($cfg, array('descr' => '<b>Р СџР В»Р В°Р С–Р С‘Р Р… РЎРЊР С”РЎРѓР С—Р С•РЎР‚РЎвЂљР В° Р В»Р ВµР Р…РЎвЂљРЎвЂ№ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р Т‘Р В»РЎРЏ Р С—Р С•Р С‘РЎРѓР С”Р С•Р Р†Р С•Р в„– РЎРѓР С‘РЎРѓРЎвЂљР ВµР С�РЎвЂ№ Р Р‡ndex</b><br>Р СџР С•Р В»Р Р…Р В°РЎРЏ Р В»Р ВµР Р…РЎвЂљР В° Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р Т‘Р С•РЎРѓРЎвЂљРЎС“Р С—Р Р…Р В° Р С—Р С• Р В°Р Т‘РЎР‚Р ВµРЎРѓРЎС“: <b>' . generatePluginLink('rss_yandex', '', array(), array(), true, true) . (($demoCategory != '') ? '<br/>Р вЂєР ВµР Р…РЎвЂљР В° Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р Т‘Р В»РЎРЏ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘ <i>' . $catz[$demoCategory]['name'] . '</i>: ' . generatePluginLink('rss_yandex', 'category', array('category' => $demoCategory), array(), true, true) : '')));
array_push($cfgX, array('type' => 'input', 'name' => 'feed_title', 'title' => 'Р СњР В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ RSS Р С—Р С•РЎвЂљР С•Р С”Р В° Р Т‘Р В»РЎРЏ Р С—Р С•Р В»Р Р…Р С•Р в„– Р В»Р ВµР Р…РЎвЂљРЎвЂ№', 'descr' => 'Р вЂќР С•Р С—РЎС“РЎРѓРЎвЂљР С‘Р С�РЎвЂ№Р Вµ Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎвЂ№Р Вµ:<br/><b>{{siteTitle}}</b> - Р Р…Р В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ РЎРѓР В°Р в„–РЎвЂљР В°<br/>Р вЂ”Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹: <b>{{siteTitle}}</b>', 'html_flags' => 'style="width: 250px;"', 'value' => pluginGetVariable('rss_yandex', 'feed_title') ? pluginGetVariable('rss_yandex', 'feed_title') : '{{siteTitle}}'));
array_push($cfgX, array('type' => 'text', 'name' => 'news_title', 'title' => 'Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” (Р Р…Р В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ) Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘', 'descr' => 'Р вЂќР С•Р С—РЎС“РЎРѓРЎвЂљР С‘Р С�РЎвЂ№Р Вµ Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎвЂ№Р Вµ:<br/><b>{{siteTitle}}</b> - Р Р…Р В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ РЎРѓР В°Р в„–РЎвЂљР В°<br/><b>{{newsTitle}}</b> - Р В·Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘<br/><b>{{masterCategoryName}}</b> - Р Р…Р В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ <b>Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„–</b> Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘<br/>Р вЂ”Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹: <b>{% if masterCategoryName %}{{masterCategoryName}} :: {% endif %}{{newsTitle}}</b>', 'html_flags' => 'style="width: 350px;"', 'value' => pluginGetVariable('rss_yandex', 'news_title') ? pluginGetVariable('rss_yandex', 'news_title') : '{% if masterCategoryName %}{{masterCategoryName}} :: {% endif %}{{newsTitle}}'));
array_push($cfgX, array('type' => 'select', 'name' => 'full_format', 'title' => 'Р В¤Р С•РЎР‚Р С�Р В°РЎвЂљ Р С–Р ВµР Р…Р ВµРЎР‚Р В°РЎвЂ Р С‘Р С‘ Р С—Р С•Р В»Р Р…Р С•Р С–Р С• РЎвЂљР ВµР С”РЎРѓРЎвЂљР В° Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р Т‘Р В»РЎРЏ Р В»Р ВµР Р…РЎвЂљРЎвЂ№ Р Р‡ndex', 'descr' => '<b>Р СџР С•Р В»Р Р…Р В°РЎРЏ</b> - Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРѓРЎРЏ РЎвЂљР С•Р В»РЎРЉР С”Р С• Р С—Р С•Р В»Р Р…Р В°РЎРЏ РЎвЂЎР В°РЎРѓРЎвЂљРЎРЉ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘<br><b>Р С™Р С•РЎР‚Р С•РЎвЂљР С”Р В°РЎРЏ+Р С—Р С•Р В»Р Р…Р В°РЎРЏ</b> - Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРѓРЎРЏ Р С”Р С•РЎР‚Р С•РЎвЂљР С”Р В°РЎРЏ + Р С—Р С•Р В»Р Р…Р В°РЎРЏ РЎвЂЎР В°РЎРѓРЎвЂљРЎРЉ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘', 'values' => array('0' => 'Р СџР С•Р В»Р Р…Р В°РЎРЏ', '1' => 'Р СџР С•Р В»Р Р…Р В°РЎРЏ+Р С”Р С•РЎР‚Р С•РЎвЂљР С”Р В°РЎРЏ'), value => pluginGetVariable('rss_yandex', 'full_format')));
array_push($cfgX, array('type' => 'input', 'name' => 'news_age', 'title' => 'Р СљР В°Р С”РЎРѓР С‘Р С�Р В°Р В»РЎРЉР Р…РЎвЂ№Р в„– РЎРѓРЎР‚Р С•Р С” Р Т‘Р В°Р Р†Р Р…Р С•РЎРѓРЎвЂљР С‘ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р Т‘Р В»РЎРЏ Р С—РЎС“Р В±Р В»Р С‘Р С”Р В°РЎвЂ Р С‘Р С‘ Р Р† Р В»Р ВµР Р…РЎвЂљР Вµ', 'descr' => 'Р Р‡ndex Р С‘Р Р…Р Т‘Р ВµР С”РЎРѓР С‘РЎР‚РЎС“Р ВµРЎвЂљ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р Р…Р Вµ РЎРѓРЎвЂљР В°РЎР‚РЎв‚¬Р Вµ <b>8 РЎРѓРЎС“РЎвЂљР С•Р С”</b>.<br/>Р вЂ”Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹: 10 РЎРѓРЎС“РЎвЂљР С•Р С”', value => pluginGetVariable('rss_yandex', 'news_age')));
array_push($cfgX, array('type' => 'input', 'name' => 'delay', 'title' => 'Р С›РЎвЂљРЎРѓРЎР‚Р С•РЎвЂЎР С”Р В° Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р В° Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р Р† Р В»Р ВµР Р…РЎвЂљРЎС“', 'descr' => 'Р вЂ™РЎвЂ№ Р С�Р С•Р В¶Р ВµРЎвЂљР Вµ Р В·Р В°Р Т‘Р В°РЎвЂљРЎРЉ Р Р†РЎР‚Р ВµР С�РЎРЏ (<b>Р Р† Р С�Р С‘Р Р…РЎС“РЎвЂљР В°РЎвЂ¦</b>) Р Р…Р В° Р С”Р С•РЎвЂљР С•РЎР‚Р С•Р Вµ Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р С•РЎвЂљР С”Р В»Р В°Р Т‘РЎвЂ№Р Р†Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Р†РЎвЂ№Р Р†Р С•Р Т‘ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р Р† RSS Р В»Р ВµР Р…РЎвЂљРЎС“', value => pluginGetVariable('rss_yandex', 'delay')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р С›Р В±РЎвЂ°Р С‘Р Вµ Р Р…Р В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('type' => 'input', 'name' => 'feed_image_title', 'title' => 'Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” (title) Р Т‘Р В»РЎРЏ Р В»Р С•Р С–Р С•РЎвЂљР С‘Р С—Р В°', 'html_flags' => 'style="width: 250px;"', 'value' => pluginGetVariable('rss_yandex', 'feed_image_title')));
array_push($cfgX, array('type' => 'input', 'name' => 'feed_image_link', 'title' => 'URL РЎРѓ Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘Р ВµР С� Р В»Р С•Р С–Р С•РЎвЂљР С‘Р С—Р В°', 'descr' => 'Р вЂ“Р ВµР В»Р В°РЎвЂљР ВµР В»РЎРЉР Р…РЎвЂ№Р в„– РЎР‚Р В°Р В·Р С�Р ВµРЎР‚ Р В»Р С•Р С–Р С•РЎвЂљР С‘Р С—Р В° - 100 Р С—Р С‘Р С”РЎРѓР ВµР В»Р ВµР в„– Р С—Р С• Р С�Р В°Р С”РЎРѓР С‘Р С�Р В°Р В»РЎРЉР Р…Р С•Р в„– РЎРѓРЎвЂљР С•РЎР‚Р С•Р Р…Р Вµ', 'html_flags' => 'style="width: 250px;"', 'value' => pluginGetVariable('rss_yandex', 'feed_image_link')));
array_push($cfgX, array('type' => 'input', 'name' => 'feed_image_url', 'title' => 'Р РЋРЎРѓРЎвЂ№Р В»Р С”Р В° (link) Р Т‘Р В»РЎРЏ Р С—Р ВµРЎР‚Р ВµРЎвЂ¦Р С•Р Т‘Р В° Р С—Р С• Р С”Р В»Р С‘Р С”РЎС“ Р Р…Р В° Р В»Р С•Р С–Р С•РЎвЂљР С‘Р С—', 'descr' => 'Р С›Р В±РЎвЂ№РЎвЂЎР Р…Р С• - URL Р Р†Р В°РЎв‚¬Р ВµР С–Р С• РЎРѓР В°Р в„–РЎвЂљР В°', 'html_flags' => 'style="width: 250px;"', 'value' => pluginGetVariable('rss_yandex', 'feed_image_url')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р С›РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘Р Вµ Р В»Р С•Р С–Р С•РЎвЂљР С‘Р С—Р В°</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'xfEnclosureEnabled', 'title' => "Р вЂњР ВµР Р…Р ВµРЎР‚Р В°РЎвЂ Р С‘РЎРЏ Р С—Р С•Р В»РЎРЏ 'Enclosure' Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·РЎС“РЎРЏ Р Т‘Р В°Р Р…Р Р…РЎвЂ№Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В° xfields", 'descr' => "<b>Р вЂќР В°</b> - Р Р†Р С”Р В»РЎР‹РЎвЂЎР С‘РЎвЂљРЎРЉ Р С–Р ВµР Р…Р ВµРЎР‚Р В°РЎвЂ Р С‘РЎР‹<br /><b>Р СњР ВµРЎвЂљ</b> - Р С•РЎвЂљР С”Р В»РЎР‹РЎвЂЎР С‘РЎвЂљРЎРЉ Р С–Р ВµР Р…Р ВµРЎР‚Р В°РЎвЂ Р С‘РЎР‹</small>", 'type' => 'select', 'values' => array('1' => 'Р вЂќР В°', '0' => 'Р СњР ВµРЎвЂљ'), 'value' => intval(pluginGetVariable($plugin, 'xfEnclosureEnabled'))));
array_push($cfgX, array('name' => 'xfEnclosure', 'title' => "ID Р С—Р С•Р В»РЎРЏ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В° <b>xfields</b>, Р С”Р С•РЎвЂљР С•РЎР‚Р С•Р Вµ Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Т‘Р В»РЎРЏ Р С–Р ВµР Р…Р ВµРЎР‚Р В°РЎвЂ Р С‘Р С‘ Р С—Р С•Р В»РЎРЏ <b>Enclosure</b>", 'type' => 'select', 'values' => $xfEnclosureValues, 'value' => pluginGetVariable($plugin, 'xfEnclosure')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р вЂњР ВµР Р…Р ВµРЎР‚Р В°РЎвЂ Р С‘РЎРЏ Р С—Р С•Р В»РЎРЏ <b>enclosure</b> Р С‘Р В· Р С—Р С•Р В»РЎРЏ xfields</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'textEnclosureEnabled', 'title' => "Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘ Р Р† Р С—Р С•Р В»Р Вµ 'Enclosure' Р Р†РЎРѓР ВµРЎвЂ¦ Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘Р в„– Р С‘Р В· РЎвЂљР ВµР С”РЎРѓРЎвЂљР В° Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ (Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·РЎС“РЎРЏ HTML РЎвЂљР ВµР С– &lt;img&gt;)", 'descr' => "<b>Р вЂќР В°</b> - Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРЉ Р Р†РЎРѓР Вµ Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ<br /><b>Р СњР ВµРЎвЂљ</b> - Р Р…Р Вµ Р Р†РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРЉ</small>", 'type' => 'select', 'values' => array('1' => 'Р вЂќР В°', '0' => 'Р СњР ВµРЎвЂљ'), 'value' => intval(pluginGetVariable($plugin, 'textEnclosureEnabled'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р вЂњР ВµР Р…Р ВµРЎР‚Р В°РЎвЂ Р С‘РЎРЏ Р С—Р С•Р В»РЎРЏ <b>enclosure</b> Р С‘Р В· РЎвЂљР ВµР С”РЎРѓРЎвЂљР В° Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'cache', 'title' => "Р пїЅРЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљРЎРЉ Р С”Р ВµРЎв‚¬Р С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р Т‘Р В°Р Р…Р Р…РЎвЂ№РЎвЂ¦<br /><small><b>Р вЂќР В°</b> - Р С”Р ВµРЎв‚¬Р С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·РЎС“Р ВµРЎвЂљРЎРѓРЎРЏ<br /><b>Р СњР ВµРЎвЂљ</b> - Р С”Р ВµРЎв‚¬Р С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р Р…Р Вµ Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·РЎС“Р ВµРЎвЂљРЎРѓРЎРЏ</small>", 'type' => 'select', 'values' => array('1' => 'Р вЂќР В°', '0' => 'Р СњР ВµРЎвЂљ'), 'value' => intval(pluginGetVariable($plugin, 'cache'))));
array_push($cfgX, array('name' => 'cacheExpire', 'title' => "Р СџР ВµРЎР‚Р С‘Р С•Р Т‘ Р С•Р В±Р Р…Р С•Р Р†Р В»Р ВµР Р…Р С‘РЎРЏ Р С”Р ВµРЎв‚¬Р В°<br /><small>(РЎвЂЎР ВµРЎР‚Р ВµР В· РЎРѓР С”Р С•Р В»РЎРЉР С”Р С• РЎРѓР ВµР С”РЎС“Р Р…Р Т‘ Р С—РЎР‚Р С•Р С‘РЎРѓРЎвЂ¦Р С•Р Т‘Р С‘РЎвЂљ Р С•Р В±Р Р…Р С•Р Р†Р В»Р ВµР Р…Р С‘Р Вµ Р С”Р ВµРЎв‚¬Р В°. Р вЂ”Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹: <b>60</b>)</small>", 'type' => 'input', 'value' => intval(pluginGetVariable($plugin, 'cacheExpire')) ? pluginGetVariable($plugin, 'cacheExpire') : '60'));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘ Р С”Р ВµРЎв‚¬Р С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘РЎРЏ</b>', 'entries' => $cfgX));
// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
?>