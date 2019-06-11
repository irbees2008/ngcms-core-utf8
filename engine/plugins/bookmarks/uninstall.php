<?php
# protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
# preload config file
pluginsLoadConfig();
$db_update = array(
	array(
		'table'  => 'bookmarks',
		'action' => 'drop',
	),
);
if ($_REQUEST['action'] == 'commit') {
	if (fixdb_plugin_install($plugin, $db_update, 'deinstall')) {
		plugin_mark_deinstalled($plugin);
	}
} else {
	generate_install_page($plugin, 'Р СџР В»Р В°Р С–Р С‘Р Р… РЎС“РЎРѓР С—Р ВµРЎв‚¬Р Р…Р С• РЎС“Р Т‘Р В°Р В»Р ВµР Р…', 'deinstall');
}
?>