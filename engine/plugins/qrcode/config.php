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
array_push($cfg, array('descr' => 'Р вЂќР В°Р Р…Р Р…РЎвЂ№Р в„– Р С—Р В»Р В°Р С–Р С‘Р Р… Р С–Р ВµР Р…Р ВµРЎР‚Р С‘РЎР‚РЎС“Р ВµРЎвЂљ QRcode'));

$cfgX = array();     
    array_push($cfgX, array('name' => 'chs', 'title' => 'Р В Р В°Р В·Р С�Р ВµРЎР‚РЎвЂ№ Р Р† Р С—Р С‘Р С”РЎРѓР ВµР В»РЎРЏРЎвЂ¦', 'type' => 'input', 'value' => intval(pluginGetVariable($plugin,'chs'))?pluginGetVariable($plugin,'chs'):'150'));
	array_push($cfgX, array('name' => 'chld', 'title' => 'Р Р€РЎР‚Р С•Р Р†Р ВµР Р…РЎРЉ Р С”Р С•РЎР‚РЎР‚Р ВµР С”РЎвЂ Р С‘Р С‘ Р С•РЎв‚¬Р С‘Р В±Р С•Р С”<br /><small><b>L</b> - Allows recovery of up to 7% data loss (<b>Р С—Р С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹</b>)<br /><b>M</b> - Allows recovery of up to 15% data loss<br /><b>Q</b> - Allows recovery of up to 25% data loss<br /><b>H</b> - Allows recovery of up to 30% data loss</small>', 'type' => 'select', 'values' => array ( 'L' => 'L', 'M' => 'M', 'Q' => 'Q', 'H' => 'H'), 'value' => pluginGetVariable($plugin,'chld')));
    array_push($cfgX, array('name' => 'margin', 'title' => 'Р С›РЎвЂљРЎРѓРЎвЂљРЎС“Р С—', 'type' => 'input', 'value' => intval(pluginGetVariable($plugin,'margin'))?pluginGetVariable($plugin,'margin'):'4'));	
   	array_push($cfgX, array('name' => 'upload', 'title' => 'Р вЂ”Р В°Р С–РЎР‚РЎС“Р В¶Р В°РЎвЂљРЎРЉ QRcode Р Р…Р В° РЎРѓР В°Р в„–РЎвЂљ', 'type' => 'checkbox', 'value' => pluginGetVariable($plugin,'upload')));	
array_push($cfg,  array('mode' => 'group', 'title' => '<b>Р С›РЎРѓР Р…Р С•Р Р†Р Р…РЎвЂ№Р Вµ Р Р…Р В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘</b>', 'entries' => $cfgX));

$cfgX = array();
	array_push($cfgX, array('name' => 'localsource', 'title' => 'Р вЂ™РЎвЂ№Р В±Р ВµРЎР‚Р С‘РЎвЂљР Вµ Р С”Р В°РЎвЂљР В°Р В»Р С•Р С– Р С‘Р В· Р С”Р С•РЎвЂљР С•РЎР‚Р С•Р С–Р С• Р С—Р В»Р В°Р С–Р С‘Р Р… Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р В±РЎР‚Р В°РЎвЂљРЎРЉ РЎв‚¬Р В°Р В±Р В»Р С•Р Р…РЎвЂ№ Р Т‘Р В»РЎРЏ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ<br /><small><b>Р РЃР В°Р В±Р В»Р С•Р Р… РЎРѓР В°Р в„–РЎвЂљР В°</b> - Р С—Р В»Р В°Р С–Р С‘Р Р… Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р С—РЎвЂ№РЎвЂљР В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Р†Р В·РЎРЏРЎвЂљРЎРЉ РЎв‚¬Р В°Р В±Р В»Р С•Р Р…РЎвЂ№ Р С‘Р В· Р С•Р В±РЎвЂ°Р ВµР С–Р С• РЎв‚¬Р В°Р В±Р В»Р С•Р Р…Р В° РЎРѓР В°Р в„–РЎвЂљР В°; Р Р† РЎРѓР В»РЎС“РЎвЂЎР В°Р Вµ Р Р…Р ВµР Т‘Р С•РЎРѓРЎвЂљРЎС“Р С—Р Р…Р С•РЎРѓРЎвЂљР С‘ - РЎв‚¬Р В°Р В±Р В»Р С•Р Р…РЎвЂ№ Р В±РЎС“Р Т‘РЎС“РЎвЂљ Р Р†Р В·РЎРЏРЎвЂљРЎвЂ№ Р С‘Р В· РЎРѓР С•Р В±РЎРѓРЎвЂљР Р†Р ВµР Р…Р Р…Р С•Р С–Р С• Р С”Р В°РЎвЂљР В°Р В»Р С•Р С–Р В° Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°<br /><b>Р СџР В»Р В°Р С–Р С‘Р Р…</b> - РЎв‚¬Р В°Р В±Р В»Р С•Р Р…РЎвЂ№ Р В±РЎС“Р Т‘РЎС“РЎвЂљ Р В±РЎР‚Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р С‘Р В· РЎРѓР С•Р В±РЎРѓРЎвЂљР Р†Р ВµР Р…Р Р…Р С•Р С–Р С• Р С”Р В°РЎвЂљР В°Р В»Р С•Р С–Р В° Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°</small>', 'type' => 'select', 'values' => array ( '0' => 'Р РЃР В°Р В±Р В»Р С•Р Р… РЎРѓР В°Р в„–РЎвЂљР В°', '1' => 'Р СџР В»Р В°Р С–Р С‘Р Р…'), 'value' => intval(pluginGetVariable($plugin,'localsource'))));
array_push($cfg,  array('mode' => 'group', 'title' => '<b>Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ</b>', 'entries' => $cfgX));

$cfgX = array();
	array_push($cfgX, array('name' => 'clear_qrcode', 'title' => 'Р Р€Р Т‘Р В°Р В»Р С‘РЎвЂљРЎРЉ Р Р…Р ВµР С‘РЎРѓР С—Р С•Р В»РЎРЉР В·РЎС“Р ВµР С�РЎвЂ№Р Вµ Р С”РЎРЊРЎв‚¬ Р С‘ QRcode', 'type' => 'select', 'value' => 0, 'values' => array ( 0 => $lang['noa'], 1 => $lang['yesa']), 'nosave' => 1));
array_push($cfg,  array('mode' => 'group', 'title' => '<b>Р С›РЎвЂЎР С‘РЎРѓРЎвЂљР С”Р В° РЎРѓР С‘РЎРѓРЎвЂљР ВµР С�РЎвЂ№</b>', 'entries' => $cfgX));

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
	msg(array('type' => 'info', 'info' => 'Р СњР ВµР С‘РЎРѓР С—Р С•Р В»РЎРЉР В·РЎС“Р ВµР С�РЎвЂ№Р Вµ QRcode РЎС“Р Т‘Р В°Р В»Р ВµР Р…РЎвЂ№'));
	msg(array('type' => 'info', 'info' => 'Р С™РЎРЊРЎв‚¬ Р С•РЎвЂЎР С‘РЎвЂ°Р ВµР Р…'));
}