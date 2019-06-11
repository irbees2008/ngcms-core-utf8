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
$skList = array();
if ($skDir = opendir(extras_dir.'/'.$plugin.'/tpl/skins')) {
	while ($skFile = readdir($skDir)) {
		if (!preg_match('/^\./', $skFile)) {
			$skList[$skFile] = $skFile;
		}
	}
	closedir($skDir);
}

$items = array('news','static','users','comments');

// Fill configuration parameters
$cfg = array();
array_push($cfg, array('descr' => $lang[$plugin.':description']));

foreach( $items as $item) {

	$cfgX = array();
		array_push($cfgX, array(
			'name' => $item.'_enable',
			'title' => $lang[$plugin.':enable'].$lang[$plugin.':'.$item],
			'type' => 'select',
			'values' => array('0' => $lang['noa'], '1' => $lang['yesa']),
			'value' => intval(extra_get_param($plugin, $item.'_enable')),
			));
		array_push($cfgX, array(
			'name' => $item.'_regonly',
			'title' => $lang[$plugin.':regonly'],
			'descr' => $lang[$plugin.':regonly#descr'],
			'type' => 'select',
			'values' => array('0' => $lang['noa'], '1' => $lang['yesa']),
			'value' => intval(extra_get_param($plugin, $item.'_regonly')),
			));
		array_push($cfgX, array(
			'name' => $item.'_localsource',
			'title' => $lang[$plugin.':localsource'],
			'descr' => $lang[$plugin.':localsource#descr'],
			'type' => 'select',
			'values' => array(
				'0' => $lang[$plugin.':localsource_0'],
				'1' => $lang[$plugin.':localsource_1'],
				),
			'value' => intval(extra_get_param($plugin, $item.'_localsource')),
			));
		array_push($cfgX, array(
			'name' => $item.'_localskin',
			'title' => $lang[$plugin.':localskin'],
			'descr' => $lang[$plugin.':localskin#descr'],
			'type' => 'select',
			'values' => $skList,
			'value' => extra_get_param($plugin, $item.'_localskin') ? extra_get_param($plugin, $item.'_localskin') : 'ancient',
			));
	array_push($cfg, array(
		'mode' => 'group',
		'title' => $lang[$plugin.':group.config'].$lang[$plugin.':'.$item],
		'toggle' => '1',
		'toggle.mode' => 'hide',
		'entries' => $cfgX,
		));
}

// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
