<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
// Preload config file
plugins_load_config();
// Load XFields config
if (!function_exists('xf_configLoad')) {
	print "XFields plugin is not loaded now!";
} else {
	$XFc = xf_configLoad();
	$xfCatList = array('' => ' // РЅРµ РІС‹Р±СЂР°РЅРѕ //');
	foreach ($XFc['news'] as $k => $v) {
		if ($v['type'] == 'images')
			continue;
		$xfCatList[$k] = $k . ' - ' . $v['title'];
	}
	$xfNTableList = array('' => ' // РЅРµ РІС‹Р±СЂР°РЅРѕ //');
	foreach ($XFc['tdata'] as $k => $v) {
		if ($v['type'] == 'images')
			continue;
		$xfNTableList[$k] = $k . ' - ' . $v['title'];
	}
}
// Check if `feedback` plugin is installed
$feedbackFormList = array();
if (getPluginStatusInstalled('feedback')) {
	foreach ($mysql->select("select * from " . prefix . "_feedback order by id", 1) as $frow) {
		$feedbackFormList [$frow['id']] = $frow['id'] . ' - ' . $frow['title'];
	}
	if (!count($feedbackFormList)) {
		$feedbackFormList [0] = '// С„РѕСЂРјС‹ РЅРµ РЅР°Р№РґРµРЅС‹ //';
	}
} else {
	$feedbackFormList [0] = '// РїР»Р°РіРёРЅ РЅРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅ //';
}
// Fill configuration parameters
$cfg = array();
array_push($cfg, array('descr' => 'РџР»Р°РіРёРЅ СЂРµР°Р»РёР·СѓРµС‚ С„СѓРЅРєС†РёРѕРЅР°Р» "РєРѕСЂР·РёРЅС‹ С‚РѕРІР°СЂРѕРІ"<br/><b>Р’РЅРёРјР°РЅРёРµ!</b><br/>Р”Р»СЏ СЂР°Р±РѕС‚С‹ РїР»Р°РіРёРЅР° <i>basket</i> РІС‹ РґРѕР»Р¶РЅС‹ РІРєР»СЋС‡РёС‚СЊ Рё РЅР°СЃС‚СЂРѕРёС‚СЊ РїР»Р°РіРёРЅС‹: <b>feedback</b> Рё <b>xfields</b>.'));
/*
$cfgX = array();
array_push($cfgX, array('name' => 'catalog_flag', 'type' => 'select', 'title' => 'Р’РєР»СЋС‡РёС‚СЊ РєРѕСЂР·РёРЅСѓ РґР»СЏ СЌР»РµРјРµРЅС‚РѕРІ РєР°С‚Р°Р»РѕРіР°', 'descr' => '<b>Р”Р°</b> - РєРѕСЂР·РёРЅР° Р±СѓРґРµС‚ Р°РєС‚РёРІРЅР° РґР»СЏ СЌР»РµРјРµРЅС‚РѕРІ РєР°С‚Р°Р»РѕРіР°<br/><b>РќРµС‚</b> - РєРѕСЂР·РёРЅР° РЅРµ Р±СѓРґРµС‚ Р°РєС‚РёРІРЅР° РґР»СЏ СЌР»РµРјРµРЅС‚РѕРІ РєР°С‚Р°Р»РѕРіР°', 'values' => array ( 0 => 'РќРµС‚', 1 => 'Р”Р°'), value => pluginGetVariable('basket','catalog_flag')));
array_push($cfgX, array('name' => 'catalog_activated', 'title' => "РђРєС‚РёРІР°С†РёСЏ РєРѕСЂР·РёРЅС‹ РІ РєР°С‚Р°Р»РѕРіРµ РїРѕ..", 'type' => 'select', 'descr' => '<b>Р’СЃРµРј Р·Р°РїРёСЃСЏРј</b> - "РїРѕР»РѕР¶РёС‚СЊ РІ РєРѕСЂР·РёРЅСѓ" Р±СѓРґРµС‚ РґРѕСЃС‚СѓРїРЅРѕ РґР»СЏ РІСЃРµС… СЌР»РµРјРµРЅС‚РѕРІ<br/><b>РџРѕР»СЋ <i>xfields</i></b> - "РїРѕР»РѕР¶РёС‚СЊ РІ РєРѕСЂР·РёРЅСѓ" РјРѕР¶РЅРѕ Р±СѓРґРµС‚ С‚РѕР»СЊРєРѕ С‚Рµ Р·Р°РїРёСЃРё, РІ РєРѕС‚РѕСЂС‹С… Р·РЅР°С‡РµРЅРёРµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РїРѕР»СЏ <b>> 0</b> (Р±РѕР»СЊС€Рµ РЅСѓР»СЏ)', 'values' => array(0 => 'Р’СЃРµРј Р·Р°РїРёСЃСЏРј', 1 => 'РџРѕР»СЋ xfields'), 'value' => pluginGetVariable('basket','catalog_activated')));
array_push($cfgX, array('name' => 'catalog_xfield', 'title' => "РџРѕР»Рµ xfields", 'type' => 'select', 'descr' => 'РџРѕР»Рµ РґР»СЏ РїР°СЂР°РјРµС‚СЂР° "Р°РєС‚РёРІР°С†РёСЏ РєРѕСЂР·РёРЅС‹ РїРѕ.."', 'values' => $xfCatList, 'value' => pluginGetVariable('basket','catalog_xfield')));
array_push($cfgX, array('name' => 'catalog_price', 'title' => "РџРѕР»Рµ СЃ С†РµРЅРѕР№", 'type' => 'select', 'descr' => 'РџРѕР»Рµ xfields СЃ С†РµРЅРѕР№ С‚РѕРІР°СЂР°', 'values' => $xfCatList, 'value' => pluginGetVariable('basket','catalog_price')));
array_push($cfgX, array('name' => 'catalog_itemname', 'type' => 'input', 'title' => 'Р¤РѕСЂРјР°С‚ Р·Р°РіРѕР»РѕРІРєР° РЅР°РёРјРµРЅРѕРІР°РЅРёСЏ С‚РѕРІР°СЂР°:', 'descr' => 'Р”РѕСЃС‚СѓРїРЅС‹Рµ РїРµСЂРµРјРµРЅРЅС‹Рµ:<br/><b>{title}</b> - РЅР°РёРјРµРЅРѕРІР°РЅРёРµ СЌР»РµРјРµРЅС‚Р° РєР°С‚Р°Р»РѕРіР°<br/><b>{x:NAME}</b> (РіРґРµ <b>NAME</b> - РЅР°Р·РІР°РЅРёРµ РїРѕР»СЏ XFIELDS) - РІС‹РІРµСЃС‚Рё РґРѕРї. РїРѕР»Рµ', 'html_flags' => 'style="width: 300px;"', 'value' => pluginGetVariable('basket','catalog_itemname')?pluginGetVariable('basket','catalog_itemname'):'{title}'));
array_push($cfg,  array('mode' => 'group', 'title' => '<b>Р Р°Р±РѕС‚Р° СЃ РєР°С‚Р°Р»РѕРіРѕРј</b>', 'entries' => $cfgX));
*/
$cfgX = array();
array_push($cfgX, array('name' => 'ntable_flag', 'type' => 'select', 'title' => 'Р’РєР»СЋС‡РёС‚СЊ РєРѕСЂР·РёРЅСѓ РґР»СЏ С‚Р°Р±Р»РёС† РґРѕРї. РїРѕР»РµР№ РІРЅСѓС‚СЂРё РЅРѕРІРѕСЃС‚РµР№', 'descr' => '<b>Р”Р°</b> - РєРѕСЂР·РёРЅР° Р±СѓРґРµС‚ Р°РєС‚РёРІРЅР° РґР»СЏ СЌР»РµРјРµРЅС‚РѕРІ С‚Р°Р±Р»РёС†С‹<br/><b>РќРµС‚</b> - РєРѕСЂР·РёРЅР° РЅРµ Р±СѓРґРµС‚ Р°РєС‚РёРІРЅР° РґР»СЏ СЌР»РµРјРµРЅС‚РѕРІ С‚Р°Р±Р»РёС†С‹', 'values' => array(0 => 'РќРµС‚', 1 => 'Р”Р°'), value => pluginGetVariable('basket', 'ntable_flag')));
array_push($cfgX, array('name' => 'ntable_activated', 'title' => "РђРєС‚РёРІР°С†РёСЏ РєРѕСЂР·РёРЅС‹ РІ С‚Р°Р±Р»РёС†Рµ РїРѕ..", 'type' => 'select', 'descr' => '<b>Р’СЃРµРј Р·Р°РїРёСЃСЏРј</b> - "РїРѕР»РѕР¶РёС‚СЊ РІ РєРѕСЂР·РёРЅСѓ" Р±СѓРґРµС‚ РґРѕСЃС‚СѓРїРЅРѕ РґР»СЏ РІСЃРµС… СЌР»РµРјРµРЅС‚РѕРІ<br/><b>РџРѕР»СЋ <i>xfields</i></b> - "РїРѕР»РѕР¶РёС‚СЊ РІ РєРѕСЂР·РёРЅСѓ" РјРѕР¶РЅРѕ Р±СѓРґРµС‚ С‚РѕР»СЊРєРѕ С‚Рµ Р·Р°РїРёСЃРё, РІ РєРѕС‚РѕСЂС‹С… Р·РЅР°С‡РµРЅРёРµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РїРѕР»СЏ <b>> 0</b> (Р±РѕР»СЊС€Рµ РЅСѓР»СЏ)', 'values' => array(0 => 'Р’СЃРµРј Р·Р°РїРёСЃСЏРј', 1 => 'РџРѕР»СЋ xfields'), 'value' => pluginGetVariable('basket', 'ntable_activated')));
array_push($cfgX, array('name' => 'ntable_xfield', 'title' => "РџРѕР»Рµ xfields", 'type' => 'select', 'descr' => 'РџРѕР»Рµ РґР»СЏ РїР°СЂР°РјРµС‚СЂР° "Р°РєС‚РёРІР°С†РёСЏ РєРѕСЂР·РёРЅС‹ РїРѕ.."', 'values' => $xfNTableList, 'value' => pluginGetVariable('basket', 'ntable_xfield')));
array_push($cfgX, array('name' => 'ntable_price', 'title' => "РџРѕР»Рµ СЃ С†РµРЅРѕР№", 'type' => 'select', 'descr' => 'РџРѕР»Рµ xfields СЃ С†РµРЅРѕР№ С‚РѕРІР°СЂР°', 'values' => $xfNTableList, 'value' => pluginGetVariable('basket', 'ntable_price')));
array_push($cfgX, array('name' => 'ntable_itemname', 'type' => 'input', 'title' => 'Р¤РѕСЂРјР°С‚ Р·Р°РіРѕР»РѕРІРєР° РЅР°РёРјРµРЅРѕРІР°РЅРёСЏ С‚РѕРІР°СЂР°:', 'descr' => 'Р”РѕСЃС‚СѓРїРЅС‹Рµ РїРµСЂРµРјРµРЅРЅС‹Рµ:<br/><b>{title}</b> - РЅР°РёРјРµРЅРѕРІР°РЅРёРµ СЌР»РµРјРµРЅС‚Р° РєР°С‚Р°Р»РѕРіР°<br/><b>{xt:NAME}</b> (РіРґРµ <b>NAME</b> - РЅР°Р·РІР°РЅРёРµ РїРѕР»СЏ XFIELDS) - РІС‹РІРµСЃС‚Рё РґРѕРї. РїРѕР»Рµ <u>С‚Р°Р±Р»РёС†С‹</u><br/><b>{x:NAME}</b> (РіРґРµ <b>NAME</b> - РЅР°Р·РІР°РЅРёРµ РїРѕР»СЏ XFIELDS) - РІС‹РІРµСЃС‚Рё РґРѕРї. РїРѕР»Рµ РёР· РѕСЂРёРіРёРЅР°Р»СЊРЅРѕР№ <u>РЅРѕРІРѕСЃС‚Рё</u>', 'html_flags' => 'style="width: 300px;"', 'value' => pluginGetVariable('basket', 'ntable_itemname') ? pluginGetVariable('basket', 'ntable_itemname') : '{title}'));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р Р°Р±РѕС‚Р° СЃ С‚Р°Р±Р»РёС†Р°РјРё РґРѕРї. РїРѕР»РµР№ РІРЅСѓС‚СЂРё РЅРѕРІРѕСЃС‚РµР№</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'news_flag', 'type' => 'select', 'title' => 'Р’РєР»СЋС‡РёС‚СЊ РєРѕСЂР·РёРЅСѓ РґР»СЏ С‚Р°Р±Р»РёС† РґРѕРї. РїРѕР»РµР№ РІРЅСѓС‚СЂРё РЅРѕРІРѕСЃС‚РµР№', 'descr' => '<b>Р”Р°</b> - РєРѕСЂР·РёРЅР° Р±СѓРґРµС‚ Р°РєС‚РёРІРЅР° РґР»СЏ СЌР»РµРјРµРЅС‚РѕРІ С‚Р°Р±Р»РёС†С‹<br/><b>РќРµС‚</b> - РєРѕСЂР·РёРЅР° РЅРµ Р±СѓРґРµС‚ Р°РєС‚РёРІРЅР° РґР»СЏ СЌР»РµРјРµРЅС‚РѕРІ С‚Р°Р±Р»РёС†С‹', 'values' => array(0 => 'РќРµС‚', 1 => 'Р”Р°'), value => pluginGetVariable('basket', 'news_flag')));
array_push($cfgX, array('name' => 'news_activated', 'title' => "РђРєС‚РёРІР°С†РёСЏ РєРѕСЂР·РёРЅС‹ РІ РЅРѕРІРѕСЃС‚СЏС… РїРѕ..", 'type' => 'select', 'descr' => '<b>Р’СЃРµРј Р·Р°РїРёСЃСЏРј</b> - "РїРѕР»РѕР¶РёС‚СЊ РІ РєРѕСЂР·РёРЅСѓ" Р±СѓРґРµС‚ РґРѕСЃС‚СѓРїРЅРѕ РґР»СЏ РІСЃРµС… РЅРѕРІРѕСЃС‚РµР№<br/><b>РџРѕР»СЋ <i>xfields</i></b> - "РїРѕР»РѕР¶РёС‚СЊ РІ РєРѕСЂР·РёРЅСѓ" РјРѕР¶РЅРѕ Р±СѓРґРµС‚ С‚РѕР»СЊРєРѕ С‚Рµ РЅРѕРІРѕСЃС‚Рё, РІ РєРѕС‚РѕСЂС‹С… Р·РЅР°С‡РµРЅРёРµ СѓРєР°Р·Р°РЅРЅРѕРіРѕ РїРѕР»СЏ <b>> 0</b> (Р±РѕР»СЊС€Рµ РЅСѓР»СЏ)', 'values' => array(0 => 'Р’СЃРµРј Р·Р°РїРёСЃСЏРј', 1 => 'РџРѕР»СЋ xfields'), 'value' => pluginGetVariable('basket', 'news_activated')));
array_push($cfgX, array('name' => 'news_xfield', 'title' => "РџРѕР»Рµ xfields", 'type' => 'select', 'descr' => 'РџРѕР»Рµ РґР»СЏ РїР°СЂР°РјРµС‚СЂР° "Р°РєС‚РёРІР°С†РёСЏ РєРѕСЂР·РёРЅС‹ РїРѕ.."', 'values' => $xfCatList, 'value' => pluginGetVariable('basket', 'news_xfield')));
array_push($cfgX, array('name' => 'news_price', 'title' => "РџРѕР»Рµ СЃ С†РµРЅРѕР№", 'type' => 'select', 'descr' => 'РџРѕР»Рµ xfields СЃ С†РµРЅРѕР№ С‚РѕРІР°СЂР°', 'values' => $xfCatList, 'value' => pluginGetVariable('basket', 'news_price')));
array_push($cfgX, array('name' => 'news_itemname', 'type' => 'input', 'title' => 'Р¤РѕСЂРјР°С‚ Р·Р°РіРѕР»РѕРІРєР° РЅР°РёРјРµРЅРѕРІР°РЅРёСЏ С‚РѕРІР°СЂР°:', 'descr' => 'Р”РѕСЃС‚СѓРїРЅС‹Рµ РїРµСЂРµРјРµРЅРЅС‹Рµ:<br/><b>{title}</b> - РЅР°РёРјРµРЅРѕРІР°РЅРёРµ СЌР»РµРјРµРЅС‚Р° РєР°С‚Р°Р»РѕРіР°<br/><b>{x:NAME}</b> (РіРґРµ <b>NAME</b> - РЅР°Р·РІР°РЅРёРµ РїРѕР»СЏ XFIELDS) - РІС‹РІРµСЃС‚Рё РґРѕРї. РїРѕР»Рµ', 'html_flags' => 'style="width: 300px;"', 'value' => pluginGetVariable('basket', 'ntable_itemname') ? pluginGetVariable('basket', 'news_itemname') : '{title}'));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р Р°Р±РѕС‚Р° СЃ РґРѕРї. РїРѕР»СЏРјРё РІРЅСѓС‚СЂРё РЅРѕРІРѕСЃС‚РµР№</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'feedback_form', 'type' => 'select', 'title' => 'Р¤РѕСЂРјР° РѕР±СЂР°С‚РЅРѕР№ СЃРІСЏР·Рё РґР»СЏ РѕС„РѕСЂРјР»РµРЅРёСЏ Р·Р°РєР°Р·Р°', 'descr' => 'РџР»Р°РіРёРЅ <b>basket</b> РѕС‚РІРµС‡Р°РµС‚ С‚РѕР»СЊРєРѕ Р·Р° РЅР°РїРѕР»РЅРµРЅРёРµ РєРѕСЂР·РёРЅС‹ С‚РѕРІР°СЂРѕРІ.<br/>РћС‚РїСЂР°РІРєР° Р·Р°РєР°Р·Р° РїСЂРѕРёР·РІРѕРґРёС‚СЃСЏ С‡РµСЂРµР· С„РѕСЂРјСѓ РѕР±СЂР°С‚РЅРѕР№ СЃРІСЏР·Рё РїР»Р°РіРёРЅР° <b>feedback</b>.<br/>Р’С‹Р±РµСЂРёС‚Рµ С„РѕСЂРјСѓ РѕР±СЂР°С‚РЅРѕР№ СЃРІСЏР·Рё С‡РµСЂРµР· РєРѕС‚РѕСЂСѓСЋ Р±СѓРґРµС‚ РїСЂРѕРёР·РІРѕРґРёС‚СЊСЃСЏ РѕС‚РїСЂР°РІРєР° Р·Р°РєР°Р·Р°', 'values' => $feedbackFormList, value => pluginGetVariable('basket', 'feedback_form')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РёРЅС‚РµРіСЂР°С†РёРё</b>', 'entries' => $cfgX));
// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}

