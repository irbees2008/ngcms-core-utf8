<?php

// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
	
//
// Configuration file for plugin
//

// Preload config file
pluginsLoadConfig();
	
// Fill configuration parameters
$cfg = array();
array_push($cfg, array('descr' => 'Р”Р°РЅРЅС‹Р№ РїР»Р°РіРёРЅ РіРµРЅРµСЂРёСЂСѓРµС‚ QRcode'));

$cfgX = array();     
    array_push($cfgX, array('name' => 'chs', 'title' => 'Р Р°Р·РјРµСЂС‹ РІ РїРёРєСЃРµР»СЏС…', 'type' => 'input', 'value' => intval(pluginGetVariable($plugin,'chs'))?pluginGetVariable($plugin,'chs'):'150'));
	array_push($cfgX, array('name' => 'chld', 'title' => 'РЈСЂРѕРІРµРЅСЊ РєРѕСЂСЂРµРєС†РёРё РѕС€РёР±РѕРє<br /><small><b>L</b> - Allows recovery of up to 7% data loss (<b>РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ</b>)<br /><b>M</b> - Allows recovery of up to 15% data loss<br /><b>Q</b> - Allows recovery of up to 25% data loss<br /><b>H</b> - Allows recovery of up to 30% data loss</small>', 'type' => 'select', 'values' => array ( 'L' => 'L', 'M' => 'M', 'Q' => 'Q', 'H' => 'H'), 'value' => pluginGetVariable($plugin,'chld')));
    array_push($cfgX, array('name' => 'margin', 'title' => 'РћС‚СЃС‚СѓРї', 'type' => 'input', 'value' => intval(pluginGetVariable($plugin,'margin'))?pluginGetVariable($plugin,'margin'):'4'));	
   	array_push($cfgX, array('name' => 'upload', 'title' => 'Р—Р°РіСЂСѓР¶Р°С‚СЊ QRcode РЅР° СЃР°Р№С‚', 'type' => 'checkbox', 'value' => pluginGetVariable($plugin,'upload')));	
array_push($cfg,  array('mode' => 'group', 'title' => '<b>РћСЃРЅРѕРІРЅС‹Рµ РЅР°СЃС‚СЂРѕР№РєРё</b>', 'entries' => $cfgX));

$cfgX = array();
	array_push($cfgX, array('name' => 'localsource', 'title' => 'Р’С‹Р±РµСЂРёС‚Рµ РєР°С‚Р°Р»РѕРі РёР· РєРѕС‚РѕСЂРѕРіРѕ РїР»Р°РіРёРЅ Р±СѓРґРµС‚ Р±СЂР°С‚СЊ С€Р°Р±Р»РѕРЅС‹ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br /><small><b>РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°</b> - РїР»Р°РіРёРЅ Р±СѓРґРµС‚ РїС‹С‚Р°С‚СЊСЃСЏ РІР·СЏС‚СЊ С€Р°Р±Р»РѕРЅС‹ РёР· РѕР±С‰РµРіРѕ С€Р°Р±Р»РѕРЅР° СЃР°Р№С‚Р°; РІ СЃР»СѓС‡Р°Рµ РЅРµРґРѕСЃС‚СѓРїРЅРѕСЃС‚Рё - С€Р°Р±Р»РѕРЅС‹ Р±СѓРґСѓС‚ РІР·СЏС‚С‹ РёР· СЃРѕР±СЃС‚РІРµРЅРЅРѕРіРѕ РєР°С‚Р°Р»РѕРіР° РїР»Р°РіРёРЅР°<br /><b>РџР»Р°РіРёРЅ</b> - С€Р°Р±Р»РѕРЅС‹ Р±СѓРґСѓС‚ Р±СЂР°С‚СЊСЃСЏ РёР· СЃРѕР±СЃС‚РІРµРЅРЅРѕРіРѕ РєР°С‚Р°Р»РѕРіР° РїР»Р°РіРёРЅР°</small>', 'type' => 'select', 'values' => array ( '0' => 'РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°', '1' => 'РџР»Р°РіРёРЅ'), 'value' => intval(pluginGetVariable($plugin,'localsource'))));
array_push($cfg,  array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ</b>', 'entries' => $cfgX));

$cfgX = array();
	array_push($cfgX, array('name' => 'clear_qrcode', 'title' => 'РЈРґР°Р»РёС‚СЊ РЅРµРёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РєСЌС€ Рё QRcode', 'type' => 'select', 'value' => 0, 'values' => array ( 0 => $lang['noa'], 1 => $lang['yesa']), 'nosave' => 1));
array_push($cfg,  array('mode' => 'group', 'title' => '<b>РћС‡РёСЃС‚РєР° СЃРёСЃС‚РµРјС‹</b>', 'entries' => $cfgX));

// RUN 
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	if ($_REQUEST['clear_qrcode']) {
		clear_qrcode();
	}
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}

function clear_qrcode() {
	global $mysql, $fmanager, $config;
	
	@include_once root.'includes/classes/upload.class.php';
	@include_once root.'includes/inc/file_managment.php';

	$fmanager = new file_managment();

	foreach (($mysql->select("select id, description from ".prefix."_images where folder='qrcode'")) as $file) {
		// Check if referred news not exists
		if (!is_array($mysql->record("select * from ".prefix."_news where id = ".db_squote($file['description'])))) {
			$fmanager->file_delete(array('type' => 'image', 'category' => 'qrcode', 'id' => $file['id']));
			if (($dir = get_plugcache_dir('qrcode'))) {
				if ($handle = opendir($dir)) {
					unlink ($dir.md5('qrcode'.$file['description'].$config['home_url'].$config['theme'].$config['default_lang']).'.txt');
					closedir($handle); 
				}
			}
		}
	}
	msg(array('type' => 'info', 'info' => 'РќРµРёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ QRcode СѓРґР°Р»РµРЅС‹'));
	msg(array('type' => 'info', 'info' => 'РљСЌС€ РѕС‡РёС‰РµРЅ'));
}