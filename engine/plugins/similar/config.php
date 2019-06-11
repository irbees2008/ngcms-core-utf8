<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
plugins_load_config();
LoadPluginLang($plugin, 'main', '', 'similar', ':');
include_once('inc/similar.php');
$cfg = array();
array_push($cfg, array('name' => 'rebuild', 'title' => $lang['similar:rebuild'], 'descr' => $lang['similar:rebuild_desc'], 'type' => 'select', 'value' => 0, 'values' => array(0 => $lang['noa'], 1 => $lang['yesa']), 'nosave' => 1));
$cfgX = array();
array_push($cfgX, array('name' => 'localsource', 'title' => $lang['similar:localsource'], 'descr' => $lang['simiar_localsource'], 'type' => 'select', 'values' => array('0' => $lang['similar:lsrc_site'], '1' => $lang['similar:lsrc_plugin']), 'value' => intval(extra_get_param($plugin, 'localsource'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>' . $lang['similar:cfg_display'] . '</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'similar_enabled', 'title' => $lang['similar:similar_enabled'], 'descr' => $lang['similar:similar_enabled_desc'], 'type' => 'select', 'values' => array(0 => $lang['noa'], 1 => $lang['yesa']), 'value' => extra_get_param($plugin, 'similar_enabled')));
array_push($cfgX, array('name' => 'count', 'title' => $lang['similar:similar_count'], 'descr' => $lang['similar:similar_count_desc'], 'type' => 'input', 'html_flags' => 'size="4"', 'value' => extra_get_param($plugin, 'count')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>' . $lang['similar:cfg_similar'] . '</b>', 'entries' => $cfgX));
//$cfgX = array();
//array_push($cfgX, array('name' => 'samecat_enabled', 'title' => $lang['similar:samecat_enabled'], 'descr' => $lang['similar:samecat_enabled_desc'], 'type' => 'select', 'values' => array(0 => $lang['noa'], 1 => $lang['yesa']), 'value' => extra_get_param($plugin, 'samecat_enabled')));
//array_push($cfgX, array('name' => 'samecat_count', 'title' => $lang['similar:samecat_count'], 'descr' => $lang['similar:samecat_count_desc'], 'type' => 'input', 'html_flags' => 'size="4"', 'value' => extra_get_param($plugin, 'samecat_count')));
//array_push($cfg,  array('mode' => 'group', 'title' => '<b>'.$lang['similar:cfg_samecateg'].'</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'pcall', 'title' => "Р пїЅР Р…РЎвЂљР ВµР С–РЎР‚Р В°РЎвЂ Р С‘РЎРЏ РЎРѓ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР Р…РЎвЂ№Р С�Р С‘ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°Р С�Р С‘<br /><small><b>Р вЂќР В°</b> - Р Р† Р С—Р В»Р В°Р С–Р С‘Р Р…Р Вµ Р С—Р С•РЎРЏР Р†Р С‘РЎвЂљРЎРѓРЎРЏ Р Р†Р С•Р В·Р С�Р С•Р В¶Р Р…Р С•РЎРѓРЎвЂљРЎРЉ Р С‘РЎРѓР С—Р С•Р В»РЎРЉР Р†Р В°РЎвЂљРЎРЉ Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎвЂ№Р Вµ Р Т‘РЎР‚РЎС“Р С–Р С‘РЎвЂ¦ Р С—Р В»Р В°Р С–Р С‘Р Р…Р С•Р Р†<br /><b>Р СњР ВµРЎвЂљ</b> - Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎвЂ№Р Вµ Р Т‘РЎР‚РЎС“Р С–Р С‘РЎвЂ¦ Р С—Р В»Р В°Р С–Р С‘Р Р…Р С•Р Р† Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљРЎРЉ Р Р…Р ВµР В»РЎРЉР В·РЎРЏ</small>", 'type' => 'select', 'values' => array('1' => 'Р вЂќР В°', '0' => 'Р СњР ВµРЎвЂљ'), 'value' => intval(extra_get_param($plugin, 'pcall'))));
array_push($cfgX, array('name' => 'pcall_mode', 'title' => "Р В Р ВµР В¶Р С‘Р С� Р Р†РЎвЂ№Р В·Р С•Р Р†Р В°", 'descr' => "Р вЂ™Р В°Р С� Р Р…Р ВµР С•Р В±РЎвЂ¦Р С•Р Т‘Р С‘Р С�Р С• Р Р†РЎвЂ№Р В±РЎР‚Р В°РЎвЂљРЎРЉ Р С”Р В°Р С”Р С•Р в„– Р С‘Р В· РЎР‚Р ВµР В¶Р С‘Р С�Р С•Р Р† Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р В±РЎС“Р Т‘Р ВµРЎвЂљ РЎРЊР С�РЎС“Р В»Р С‘РЎР‚Р С•Р Р†Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ<br/><b>РЎРЊР С”РЎРѓР С—Р С•РЎР‚РЎвЂљ</b> - РЎРЊР С”РЎРѓР С—Р С•РЎР‚РЎвЂљ Р Т‘Р В°Р Р…Р Р…РЎвЂ№РЎвЂ¦ Р Р† Р Т‘РЎР‚РЎС“Р С–Р С‘Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р…РЎвЂ№ (<font color=\"red\">РЎР‚Р ВµР С”Р С•Р С�Р ВµР Р…Р Т‘РЎС“Р ВµРЎвЂљРЎРѓРЎРЏ</font>)<br /><b>Р С”Р С•РЎР‚Р С•РЎвЂљР С”Р В°РЎРЏ</b> - Р С”Р С•РЎР‚Р С•РЎвЂљР С”Р В°РЎРЏ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ<br><b>Р С—Р С•Р В»Р Р…Р В°РЎРЏ</b> - Р С—Р С•Р В»Р Р…Р В°РЎРЏ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ</small>", 'type' => 'select', 'values' => array('0' => 'РЎРЊР С”РЎРѓР С—Р С•РЎР‚РЎвЂљ', '1' => 'Р С”Р С•РЎР‚Р С•РЎвЂљР С”Р В°РЎРЏ', '2' => 'Р С—Р С•Р В»Р Р…Р В°РЎРЏ'), 'value' => intval(extra_get_param($plugin, 'pcall_mode'))));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р пїЅР Р…РЎвЂљР ВµР С–РЎР‚Р В°РЎвЂ Р С‘РЎРЏ</b>', 'entries' => $cfgX));
$cfgX = array();
array_push($cfgX, array('name' => 'countX', 'title' => $lang['similar:similarity']));
array_push($cfg, array('mode' => 'group', 'title' => '<b>' . $lang['similar:cfg_similarity'] . '</b>', 'entries' => $cfgX));
if (!$_REQUEST['action']) {
	generate_config_page($plugin, $cfg);
} elseif ($_REQUEST['action'] == 'commit') {
	commit_plugin_config_changes($plugin, $cfg);
	if ($_REQUEST['rebuild']) {
		// Rebuild index table
		// * Truncate index
		$mysql->query("truncate table " . prefix . "_similar_index");
		// * Mark all news to have broken index
		$mysql->query("update " . prefix . "_news set similar_status = 0");
		print $lang['tags_rebuild_done'] . "<br/>";
	}
	print_commit_complete($plugin);
}
