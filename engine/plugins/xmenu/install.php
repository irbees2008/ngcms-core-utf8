<?php
//
// Configuration file for plugin
//
plugins_load_config();
LoadPluginLang('xmenu', 'config');
$db_update = array(
	array(
		'table'  => 'category',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'cmodify', 'name' => 'xmenu', 'type' => 'char(10)', 'params' => 'default "#"')
		)
	)
);
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	if (fixdb_plugin_install('xmenu', $db_update)) {
		plugin_mark_installed('xmenu');
	}
} else {
	$text = "Р СџР В»Р В°Р С–Р С‘Р Р… <b>xmenu</b> РЎР‚Р ВµР В°Р В»Р С‘Р В·РЎС“Р ВµРЎвЂљ РЎР‚Р В°РЎРѓРЎв‚¬Р С‘РЎР‚Р ВµР Р…Р Р…РЎвЂ№Р Вµ Р Р†Р С•Р В·Р С�Р С•Р В¶Р Р…Р С•РЎРѓРЎвЂљР С‘ Р С–Р ВµР Р…Р ВµРЎР‚Р В°РЎвЂ Р С‘Р С‘ Р С�Р ВµР Р…РЎР‹.<br /><br />Р вЂ™Р Р…Р С‘Р С�Р В°Р Р…Р С‘Р Вµ! Р СџРЎР‚Р С‘ РЎС“РЎРѓРЎвЂљР В°Р Р…Р С•Р Р†Р С”Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р… Р С—РЎР‚Р С•Р С‘Р В·Р Р†Р С•Р Т‘Р С‘РЎвЂљ Р С‘Р В·Р С�Р ВµР Р…Р ВµР Р…Р С‘РЎРЏ Р Р† Р вЂ�Р вЂќ РЎРѓР С‘РЎРѓРЎвЂљР ВµР С�РЎвЂ№!";
	generate_install_page('finance', $text);
}
?>