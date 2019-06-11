<?php

//
// Configuration file for plugin
//

// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

// Preload config file
pluginsLoadConfig();

// Load lang files
LoadPluginLang($plugin, 'config', '', '', ':');

// Prepare configuration parameters
if(empty(pluginGetVariable($plugin, 'site_exists'))) {
    if (is_array($row = $mysql->select("SELECT reg FROM ".prefix."_users WHERE id = '1' limit 1"))) {
        $dReg = date('d.m.Y', $row[0]['reg']);
    } else {
        $dReg = date('d.m.Y', time());
    }
}

// Fill configuration parameters
$cfg = array();
array_push($cfg, array(
    'descr' => $lang[$plugin.':description'],
    ));

$cfgX = array();
    array_push($cfgX, array(
        'name' => 'outNW',
        'title' => 'Р’ СЃР»СѓС‡Р°Рµ РѕС‚СЃСѓС‚СЃС‚РІРёСЏ РјР°С‚РµСЂРёР°Р»РѕРІ РІС‹РІРѕРґРёС‚СЊ С†РёС„СЂС‹ РёР»Рё СЃР»РѕРІР°',
        'descr' => 'РћС‚РјРµС‚СЊС‚Рµ С‡С‚Рѕ РїРёСЃР°С‚СЊ РІ СЃР»СѓС‡Р°Рµ РµСЃР»Рё РїРѕ РѕРїСЂРµРґРµР»РµРЅРЅРѕР№ РїРѕР·РёС†РёРё РјР°С‚РµСЂРёР°Р»РѕРІ РЅРµ РѕР±РЅР°СЂСѓР¶РёС‚СЃСЏ',
        'type' => 'select',
        'values' => array ( '0' => 'С†РёС„СЂС‹', '1' => 'СЃР»РѕРІР°'),
        'value' => pluginGetVariable($plugin, 'outNW'),
        ));
    array_push($cfgX, array(
        'name' => 'site_exists',
        'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ РґРЅРµР№ СЃСѓС‰РµСЃС‚РІРѕРІР°РЅРёСЏ СЃР°Р№С‚Р°',
        'descr' => 'РЈРєР°Р¶РёС‚Рµ РґР°С‚Сѓ СЃРѕР·РґР°РЅРёСЏ СЃР°Р№С‚Р° РІ С„РѕСЂРјР°С‚Рµ <b>dd.mm.YYYY</b> РёР»Рё РѕСЃС‚Р°РІСЊС‚Рµ РїРѕР»Рµ РїСѓСЃС‚С‹Рј, РµСЃР»Рё РЅРµ С…РѕС‚РёС‚Рµ РѕС‚РѕР±СЂР°Р¶Р°С‚СЊ СЌС‚Сѓ РёРЅС„РѕСЂРјР°С†РёСЋ',
        'type' => 'input',
        'html_flags' => 'placeholder="'.$dReg.'"',
        'value' => pluginGetVariable($plugin, 'site_exists') ? pluginGetVariable($plugin, 'site_exists') : $dReg,
        ));
array_push($cfg, array(
	'mode' => 'group',
	'title' => $lang[$plugin.':group.config'],
	'entries' => $cfgX,
	));

$cfgX = array();
    array_push($cfgX, array(
        'name' => 'static',
        'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ СЃС‚Р°С‚РёС‡РµСЃРєРёС… СЃС‚СЂР°РЅРёС†',
        'descr' => 'Р•СЃР»Рё Р’С‹ РїРѕСЃС‚Р°РІРёС‚Рµ РіР°Р»РѕС‡РєСѓ, С‚Рѕ РїР»Р°РіРёРЅ РІС‹РІРµРґРµС‚ РєРѕР»С‡РёРµСЃС‚РІРѕ СЃС‚Р°С‚РёС‡РµСЃРєРёС… СЃС‚СЂР°РЅРёС†',
        'type' => 'checkbox',
        'value' => pluginGetVariable($plugin, 'static'),
        ));
    array_push($cfgX, array(
        'name' => 'category',
        'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ РєР°С‚РµРіРѕСЂРёР№',
        'descr' => 'Р•СЃР»Рё Р’С‹ РїРѕСЃС‚Р°РІРёС‚Рµ РіР°Р»РѕС‡РєСѓ, С‚Рѕ РїР»Р°РіРёРЅ РІС‹РІРµРґРµС‚ РєРѕР»С‡РёРµСЃС‚РІРѕ РєР°С‚РµРіРѕСЂРёР№',
        'type' => 'checkbox',
        'value' => pluginGetVariable($plugin, 'category'),
        ));
    array_push($cfgX, array(
        'name' => 'news',
        'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ РЅРѕРІРѕСЃС‚РµР№',
        'descr' => 'Р•СЃР»Рё Р’С‹ РїРѕСЃС‚Р°РІРёС‚Рµ РіР°Р»РѕС‡РєСѓ, С‚Рѕ РїР»Р°РіРёРЅ РІС‹РІРµРґРµС‚ РєРѕР»С‡РёРµСЃС‚РІРѕ РЅРѕРІРѕСЃС‚РµР№',
        'type' => 'checkbox',
        'value' => pluginGetVariable($plugin, 'news'),
        ));
    array_push($cfgX, array(
        'name' => 'news_na',
        'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ РЅРµРѕРїСѓР±Р»РёРєРѕРІР°РЅРЅС‹С… РЅРѕРІРѕСЃС‚РµР№',
        'descr' => 'Р•СЃР»Рё Р’С‹ РїРѕСЃС‚Р°РІРёС‚Рµ РіР°Р»РѕС‡РєСѓ, С‚Рѕ РїР»Р°РіРёРЅ РІС‹РІРµРґРµС‚ РєРѕР»С‡РёРµСЃС‚РІРѕ РЅРµРѕРїСѓР±Р»РёРєРѕРІР°РЅРЅС‹С… РЅРѕРІРѕСЃС‚РµР№',
        'type' => 'checkbox',
        'value' => pluginGetVariable($plugin,'news_na'),
        ));
    if (getPluginStatusActive('comments')) {
        array_push($cfgX, array(
            'name' => 'comments',
            'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ РєРѕРјРјРµРЅС‚Р°СЂРёРµРІ',
            'descr' => 'Р•СЃР»Рё Р’С‹ РїРѕСЃС‚Р°РІРёС‚Рµ РіР°Р»РѕС‡РєСѓ, С‚Рѕ РїР»Р°РіРёРЅ РІС‹РІРµРґРµС‚ РєРѕР»С‡РёРµСЃС‚РІРѕ РєРѕРјРјРµРЅС‚Р°СЂРёРµРІ',
            'type' => 'checkbox',
            'value' => pluginGetVariable($plugin,'comments'),
            ));
    }
    array_push($cfgX, array(
        'name' => 'images',
        'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РіСЂСѓР¶РµРЅРЅС‹С… РёР·РѕР±СЂР°Р¶РµРЅРёР№',
        'descr' => 'Р•СЃР»Рё Р’С‹ РїРѕСЃС‚Р°РІРёС‚Рµ РіР°Р»РѕС‡РєСѓ, С‚Рѕ РїР»Р°РіРёРЅ РІС‹РІРµРґРµС‚ РєРѕР»С‡РёРµСЃС‚РІРѕ Р·Р°РіСЂСѓР¶РµРЅРЅС‹С… РёР·РѕР±СЂР°Р¶РµРЅРёР№',
        'type' => 'checkbox',
        'value' => pluginGetVariable($plugin,'images'),
        ));
    array_push($cfgX, array(
        'name' => 'files',
        'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РіСЂСѓР¶РµРЅРЅС‹С… С„Р°Р№Р»РѕРІ',
        'descr' => 'Р•СЃР»Рё Р’С‹ РїРѕСЃС‚Р°РІРёС‚Рµ РіР°Р»РѕС‡РєСѓ, С‚Рѕ РїР»Р°РіРёРЅ РІС‹РІРµРґРµС‚ РєРѕР»С‡РёРµСЃС‚РІРѕ Р·Р°РіСЂСѓР¶РµРЅРЅС‹С… С„Р°Р№Р»РѕРІ',
        'type' => 'checkbox',
        'value' => pluginGetVariable($plugin,'files'),
        ));
    array_push($cfgX, array(
        'name' => 'users',
        'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°СЂРµРіРµСЃС‚СЂРёСЂРѕРІР°РЅРЅС‹С… РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№',
        'descr' => 'Р•СЃР»Рё Р’С‹ РїРѕСЃС‚Р°РІРёС‚Рµ РіР°Р»РѕС‡РєСѓ, С‚Рѕ РїР»Р°РіРёРЅ РІС‹РІРµРґРµС‚ РєРѕР»С‡РёРµСЃС‚РІРѕ Р·Р°СЂРµРіРµСЃС‚СЂРёСЂРѕРІР°РЅРЅС‹С… РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№',
        'type' => 'checkbox',
        'value' => pluginGetVariable($plugin,'users'),
        ));
    array_push($cfgX, array(
        'name' => 'users_na',
        'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ РЅРµР°РєС‚РёРІРЅС‹С… РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№',
        'descr' => 'Р•СЃР»Рё Р’С‹ РїРѕСЃС‚Р°РІРёС‚Рµ РіР°Р»РѕС‡РєСѓ, С‚Рѕ РїР»Р°РіРёРЅ РІС‹РІРµРґРµС‚ РєРѕР»С‡РёРµСЃС‚РІРѕ РЅРµР°РєС‚РёРІРЅС‹С… РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№',
        'type' => 'checkbox',
        'value' => pluginGetVariable($plugin,'users_na'),
        ));
    array_push($cfgX, array(
        'name' => 'ipban',
        'title' => 'РџРѕРґСЃС‡РёС‚С‹РІР°С‚СЊ РєРѕР»РёС‡РµСЃС‚РІРѕ Р±Р°РЅРѕРІ РїРѕ Р°Р№РїРё',
        'descr' => 'Р•СЃР»Рё Р’С‹ РїРѕСЃС‚Р°РІРёС‚Рµ РіР°Р»РѕС‡РєСѓ, С‚Рѕ РїР»Р°РіРёРЅ РІС‹РІРµРґРµС‚ РєРѕР»С‡РёРµСЃС‚РІРѕ Р·Р°Р±Р°РЅРµРЅРЅС‹С… РїРѕ Р°Р№РїРё',
        'type' => 'checkbox',
        'value' => pluginGetVariable($plugin,'ipban'),
        ));
    array_push($cfgX, array(
        'name' => 'cache',
        'title' => $lang[$plugin.':cache'],
        'descr' => $lang[$plugin.':cache#desc'],
        'type' => 'select',
        'values' => array('0' => $lang['noa'], '1' => $lang['yesa']),
        'value' => pluginGetVariable($plugin, 'cache'),
        ));
    array_push($cfgX, array(
        'name' => 'cacheExpire',
        'title' => $lang[$plugin.':cacheExpire'],
        'descr' => $lang[$plugin.':cacheExpire#desc'],
        'type' => 'input',
        'value' => intval(pluginGetVariable($plugin, 'cacheExpire')) ? intval(pluginGetVariable($plugin, 'cacheExpire')) : 86400,
        ));
array_push($cfg,  array(
    'mode' => 'group',
    'title' => 'РќР°СЃС‚СЂРѕР№РєРё РѕР±С‰РµР№ СЃС‚Р°С‚РёСЃС‚РёРєРё СЃР°Р№С‚Р°',
    'toggle' => '1',
    'toggle.mode' => 'hide',
    'entries' => $cfgX,
    ));

$cfgX = array();
    array_push($cfgX, array(
        'name' => 'last_time',
        'title' => 'РџРµСЂРёРѕРґ РѕР±РЅРѕРІР»РµРЅРёСЏ РѕРЅР»Р°Р№РЅ СЃС‚Р°С‚РёСЃС‚РёРєРё РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№',
        'descr' => 'Р§РµСЂРµР· СЃРєРѕР»СЊРєРѕ СЃРµРєСѓРЅРґ РїСЂРѕРёСЃС…РѕРґРёС‚ РѕР±РЅРѕРІР»РµРЅРёРµ РѕРЅР»Р°Р№РЅ СЃС‚Р°С‚РёСЃС‚РёРєРё РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№. Р—РЅР°С‡РµРЅРёРµ РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>500</b> СЃРµРє.',
        'type' => 'input',
        'value' => intval(pluginGetVariable($plugin, 'last_time')) ? intval(pluginGetVariable($plugin, 'last_time')) : 500,
        ));
array_push($cfg,  array(
    'mode' => 'group',
    'title' => 'РќР°СЃС‚СЂРѕР№РєРё РѕРЅР»Р°Р№РЅ СЃС‚Р°С‚РёСЃС‚РёРєРё РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№',
    'toggle' => '1',
    'toggle.mode' => 'hide',
    'entries' => $cfgX,
    ));

$cfgX = array();
    array_push($cfgX, array(
        'name' => 'localsource',
        'title' => $lang[$plugin.':localsource'],
        'descr' => $lang[$plugin.':localsource#descr'],
        'type' => 'select',
        'values' => array(
            '0' => $lang[$plugin.':localsource_0'],
            '1' => $lang[$plugin.':localsource_1'],
            ),
        'value' => intval(pluginGetVariable($plugin, 'localsource')) ? intval(pluginGetVariable($plugin, 'localsource')) : 1,
        ));
array_push($cfg, array(
    'mode' => 'group',
    'title' => $lang[$plugin.':group.source'],
    'entries' => $cfgX,
    ));

// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
