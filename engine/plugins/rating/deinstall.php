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
			array('action' => 'drop', 'name' => 'rating'),
			array('action' => 'drop', 'name' => 'votes'),
			)),
	array(
		'table'  => 'static',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'drop', 'name' => 'rating'),
			array('action' => 'drop', 'name' => 'votes'),
			)),
	array(
		'table'  => 'comments',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'drop', 'name' => 'rating'),
			array('action' => 'drop', 'name' => 'votes'),
			)),
	array(
		'table'  => 'users',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'drop', 'name' => 'rating'),
			array('action' => 'drop', 'name' => 'votes'),
			)),
	);

if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	if (fixdb_plugin_install($plugin, $db_update, 'deinstall')) {
		plugin_mark_deinstalled($plugin);
	}
} else {
	generate_install_page($plugin, $lang[$plugin.':deinstall'], 'deinstall');
}
