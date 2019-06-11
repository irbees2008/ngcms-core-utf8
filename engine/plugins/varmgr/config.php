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
array_push($cfg, array('name' => 'extdate', 'title' => 'Р вЂќР С•Р С—Р С•Р В»Р Р…Р С‘РЎвЂљР ВµР В»РЎРЉР Р…РЎвЂ№Р Вµ Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎвЂ№Р Вµ Р Т‘Р В»РЎРЏ РЎС“Р С—РЎР‚Р В°Р Р†Р В»Р ВµР Р…Р С‘РЎРЏ Р Т‘Р В°РЎвЂљР С•Р в„–', 'descr' => 'Р вЂќР С•РЎРѓРЎвЂљРЎС“Р С—Р Р…РЎвЂ№ Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎвЂ№Р Вµ:<br>{day} - Р Т‘Р ВµР Р…РЎРЉ (1 - 31)<br>{day0} - Р Т‘Р ВµР Р…РЎРЉ (01 - 31)<br>{month} - Р С�Р ВµРЎРѓРЎРЏРЎвЂ  (1 - 12)<br>{month0} - Р С�Р ВµРЎРѓРЎРЏРЎвЂ  (01 - 12)<br>{year} - Р С–Р С•Р Т‘ (00 - 99)<br>{year2} - Р С–Р С•Р Т‘ (1980 - 2100)<br>{month_s} - РЎвЂљР ВµР С”РЎРѓРЎвЂљ Р С�Р ВµРЎРѓРЎРЏРЎвЂ Р В° (Р Р‡Р Р…Р Р†, Р В¤Р ВµР Р†,...)<br>{month_l} - РЎвЂљР ВµР С”РЎРѓРЎвЂљ Р С�Р ВµРЎРѓРЎРЏРЎвЂ Р В° (Р Р‡Р Р…Р Р†Р В°РЎР‚РЎРЉ, Р В¤Р ВµР Р†РЎР‚Р В°Р В»РЎРЉ,...)', 'type' => 'select', 'values' => array('0' => 'Р Р†РЎвЂ№Р С”Р В»', '1' => 'Р Р†Р С”Р В»'), 'value' => extra_get_param($plugin, 'extdate')));
array_push($cfg, array('name' => 'newdate', 'title' => 'Р пїЅР В·Р С�Р ВµР Р…Р С‘РЎвЂљРЎРЉ РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљ Р Т‘Р В°РЎвЂљРЎвЂ№', 'descr' => 'Р СџРЎР‚Р С‘ Р В·Р В°Р С—Р С•Р В»Р Р…Р ВµР Р…Р С‘Р С‘ Р Т‘Р В°Р Р…Р Р…Р С•Р С–Р С• Р С—Р В°РЎР‚Р В°Р С�Р ВµРЎвЂљРЎР‚Р В° Р С‘Р В·Р С�Р ВµР Р…РЎРЏР ВµРЎвЂљРЎРѓРЎРЏ РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ Р Т‘Р В°РЎвЂљРЎвЂ№ Р Р† Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЏРЎвЂ¦ Р Р…Р В° РЎС“Р С”Р В°Р В·Р В°Р Р…Р Р…РЎвЂ№Р в„–', 'type' => 'input', 'value' => extra_get_param($plugin, 'newdate')));
// RUN 
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
?>