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
array_push($cfg, array('name' => 'extdate', 'title' => 'Р”РѕРїРѕР»РЅРёС‚РµР»СЊРЅС‹Рµ РїРµСЂРµРјРµРЅРЅС‹Рµ РґР»СЏ СѓРїСЂР°РІР»РµРЅРёСЏ РґР°С‚РѕР№', 'descr' => 'Р”РѕСЃС‚СѓРїРЅС‹ РїРµСЂРµРјРµРЅРЅС‹Рµ:<br>{day} - РґРµРЅСЊ (1 - 31)<br>{day0} - РґРµРЅСЊ (01 - 31)<br>{month} - РјРµСЃСЏС† (1 - 12)<br>{month0} - РјРµСЃСЏС† (01 - 12)<br>{year} - РіРѕРґ (00 - 99)<br>{year2} - РіРѕРґ (1980 - 2100)<br>{month_s} - С‚РµРєСЃС‚ РјРµСЃСЏС†Р° (РЇРЅРІ, Р¤РµРІ,...)<br>{month_l} - С‚РµРєСЃС‚ РјРµСЃСЏС†Р° (РЇРЅРІР°СЂСЊ, Р¤РµРІСЂР°Р»СЊ,...)', 'type' => 'select', 'values' => array('0' => 'РІС‹РєР»', '1' => 'РІРєР»'), 'value' => extra_get_param($plugin, 'extdate')));
array_push($cfg, array('name' => 'newdate', 'title' => 'Р�Р·РјРµРЅРёС‚СЊ С„РѕСЂРјР°С‚ РґР°С‚С‹', 'descr' => 'РџСЂРё Р·Р°РїРѕР»РЅРµРЅРёРё РґР°РЅРЅРѕРіРѕ РїР°СЂР°РјРµС‚СЂР° РёР·РјРµРЅСЏРµС‚СЃСЏ С„РѕСЂРјР°С‚ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ РґР°С‚С‹ РІ РЅРѕРІРѕСЃС‚СЏС… РЅР° СѓРєР°Р·Р°РЅРЅС‹Р№', 'type' => 'input', 'value' => extra_get_param($plugin, 'newdate')));
// RUN 
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
?>