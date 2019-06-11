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

// Fill configuration parameters
$db_update = array(
	array(
		'table'  => 'news',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'cmodify', 'name' => 'rating', 'type' => 'int(10)', 'params' => 'not null default 0'),
			array('action' => 'cmodify', 'name' => 'votes', 'type' => 'int(10)', 'params' => 'not null default 0'),
			)),
	array(
		'table'  => 'static',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'cmodify', 'name' => 'rating', 'type' => 'int(10)', 'params' => 'not null default 0'),
			array('action' => 'cmodify', 'name' => 'votes', 'type' => 'int(10)', 'params' => 'not null default 0'),
			)),
	array(
		'table'  => 'comments',
		'action' => 'cmodify',
		'fields' => array(
			array('action' => 'cmodify', 'name' => 'rating', 'type' => 'int(10)', 'params' => 'not null default 0'),
			array('action' => 'cmodify', 'name' => 'votes', 'type' => 'int(10)', 'params' => 'not null default 0'),
			)),
	array(
		'table'  => 'users',
		'action' => 'cmodify',
		'fields' => array(
			array('action' => 'cmodify', 'name' => 'rating', 'type' => 'int(10)', 'params' => 'not null default 0'),
			array('action' => 'cmodify', 'name' => 'votes', 'type' => 'int(10)', 'params' => 'not null default 0'),
			)),
	);

if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	if (fixdb_plugin_install($plugin, $db_update)) {
		plugin_mark_installed($plugin);
	}
} else {
	generate_install_page('rating', $lang[$plugin.':install']);
}
