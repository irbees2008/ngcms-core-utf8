<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
//
// Configuration file for plugin
//
plugins_load_config();
$db_update = array(
	array(
		'table'  => 'subscribe_comments',
		'action' => 'drop',
	),
	array(
		'table'  => 'subscribe_comments_temp',
		'action' => 'drop',
	),
);
if ($_REQUEST['action'] == 'commit') {
	if (fixdb_plugin_install($plugin, $db_update, 'deinstall')) {
		plugin_mark_deinstalled($plugin);
	}
} else {
	generate_install_page($plugin, 'Р Р€Р Т‘Р В°Р В»Р ВµР Р…Р С‘Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°', 'deinstall');
}
?>