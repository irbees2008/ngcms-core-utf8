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
array_push($cfg, array('descr' => 'Р СџР В»Р В°Р С–Р С‘Р Р… Р С•Р В±Р ВµРЎРѓР С—Р ВµРЎвЂЎР С‘Р Р†Р В°Р ВµРЎвЂљ Р Р†Р С•Р В·Р С�Р С•Р В¶Р Р…Р С•РЎРѓРЎвЂљРЎРЉ Р С—РЎС“Р В±Р В»Р С‘Р С”Р С•Р Р†Р В°РЎвЂљРЎРЉ/РЎРѓР Р…Р С‘Р С�Р В°РЎвЂљРЎРЉ РЎРѓ Р С—РЎС“Р В±Р В»Р С‘Р С”Р В°РЎвЂ Р С‘Р С‘ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р С—Р С• РЎР‚Р В°РЎРѓР С—Р С‘РЎРѓР В°Р Р…Р С‘РЎР‹.'));
array_push($cfg, array('name' => 'period', 'title' => 'Р СџР ВµРЎР‚Р С‘Р С•Р Т‘Р С‘РЎвЂЎР Р…Р С•РЎРѓРЎвЂљРЎРЉ Р В°Р Р…Р В°Р В»Р С‘Р В·Р В° Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–', 'descr' => 'Р СџР ВµРЎР‚Р С‘Р С•Р Т‘ Р С—РЎР‚Р С•Р Р†Р ВµРЎР‚Р С”Р С‘ Р С—Р С•Р В»Р ВµР в„– <i>Р вЂќР В°РЎвЂљР В° Р Р†Р С”Р В»РЎР‹РЎвЂЎР ВµР Р…Р С‘РЎРЏ</i> Р С‘ <i>Р вЂќР В°РЎвЂљР В° Р С•РЎвЂљР С”Р В»РЎР‹РЎвЂЎР ВµР Р…Р С‘РЎРЏ</i>.<br>Р В§Р ВµР С� РЎР‚Р ВµР В¶Р Вµ Р С—РЎР‚Р С•Р С‘Р В·Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРѓРЎРЏ Р В°Р Р…Р В°Р В»Р С‘Р В· - РЎвЂљР ВµР С� Р Р…Р С‘Р В¶Р Вµ Р Р…Р В°Р С–РЎР‚РЎС“Р В·Р С”Р В° Р Р…Р В° Р вЂ�Р вЂќ, Р Р…Р С• Р С—РЎР‚Р С‘ РЎРЊРЎвЂљР С•Р С� Р С�Р ВµР Р…Р ВµР Вµ РЎвЂљР С•РЎвЂЎР Р…Р С• Р С•РЎвЂљРЎР‚Р В°Р В±Р В°РЎвЂљРЎвЂ№Р Р†Р В°Р ВµРЎвЂљ Р Р†РЎР‚Р ВµР С�РЎРЏ Р С—РЎС“Р В±Р В»Р С‘Р С”Р В°РЎвЂ Р С‘Р С‘/РЎРѓР Р…РЎРЏРЎвЂљР С‘РЎРЏ РЎРѓ Р С—РЎС“Р В±Р В»Р С‘Р С”Р В°РЎвЂ Р С‘Р С‘', 'type' => 'select', 'values' => array('0' => 'Р Р…Р Вµ Р В·Р В°Р С—РЎС“РЎРѓР С”Р В°РЎвЂљРЎРЉ', '5m' => '5 Р С�Р С‘Р Р…РЎС“РЎвЂљ', '10m' => '10 Р С�Р С‘Р Р…РЎС“РЎвЂљ', '15m' => '15 Р С�Р С‘Р Р…РЎС“РЎвЂљ', '30m' => '30 Р С�Р С‘Р Р…РЎС“РЎвЂљ', '1h' => '1 РЎвЂЎР В°РЎРѓ', '2h' => '2 РЎвЂЎР В°РЎРѓР В°', '3h' => '3 РЎвЂЎР В°РЎРѓР В°', '6h' => '6 РЎвЂЎР В°РЎРѓР С•Р Р†', '12h' => '12 РЎвЂЎР В°РЎРѓР С•Р Р†'), value => pluginGetVariable($plugin, 'period')));
// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	//commit_plugin_config_changes($plugin, $cfg);
	$regRun = array();
	switch ($_REQUEST['period']) {
		case '5m'  :
			$regRun = array('*', '*');
			break;
		case '10m' :
			$regRun = array('0,10,20,30,40,50', '*');
			break;
		case '15m' :
			$regRun = array('0,15,30,45', '*');
			break;
		case '30m' :
			$regRun = array('0,30', '*');
			break;
		case '1h'  :
			$regRun = array('0', '*');
			break;
		case '2h'  :
			$regRun = array('0', '0,2,4,6,8,10,12,14,16,18,20,22');
			break;
		case '3h'  :
			$regRun = array('0', '0,3,6,9,12,15,18,21');
			break;
		case '4h'  :
			$regRun = array('0', '0,4,8,12,16,20');
			break;
		case '6h'  :
			$regRun = array('0', '0,6,12,18');
			break;
		case '8h'  :
			$regRun = array('0', '0,8,16');
			break;
		case '12h' :
			$regRun = array('0', '0,12');
			break;
		default       :
			$regRun = array('0', '0');
			break;
	}
	commit_plugin_config_changes($plugin, $cfg);
	$cron->unregisterTask('nsched');
	$cron->registerTask('nsched', 'run', $regRun[0], $regRun[1], '*', '*', '*');
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
