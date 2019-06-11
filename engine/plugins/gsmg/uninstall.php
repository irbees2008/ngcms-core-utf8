<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
// Load library
include_once(root . "/plugins/gsmg/lib/common.php");
//
// Configuration file for plugin
//
plugins_load_config();
if ($_REQUEST['action'] == 'commit') {
	remove_gsmg_urls();
	plugin_mark_deinstalled($plugin);
	$url = home . "/engine/admin.php?mod=extras";
	header("HTTP/1.1 301 Moved Permanently");
	header("Location: {$url}");
} else {
	generate_install_page($plugin, 'Р Р€Р Т‘Р В°Р В»Р ВµР Р…Р С‘Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°', 'deinstall');
}
