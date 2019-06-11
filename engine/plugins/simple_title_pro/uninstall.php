<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
plugins_load_config();
if ($_REQUEST['action'] == 'commit') {
	plugin_mark_deinstalled($plugin);
} else {
	generate_install_page($plugin, 'Р Р€Р Т‘Р В°Р В»Р ВµР Р…Р С‘Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°', 'deinstall');
}