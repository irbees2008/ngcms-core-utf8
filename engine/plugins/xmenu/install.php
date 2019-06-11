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
	$text = "РџР»Р°РіРёРЅ <b>xmenu</b> СЂРµР°Р»РёР·СѓРµС‚ СЂР°СЃС€РёСЂРµРЅРЅС‹Рµ РІРѕР·РјРѕР¶РЅРѕСЃС‚Рё РіРµРЅРµСЂР°С†РёРё РјРµРЅСЋ.<br /><br />Р’РЅРёРјР°РЅРёРµ! РџСЂРё СѓСЃС‚Р°РЅРѕРІРєРµ РїР»Р°РіРёРЅ РїСЂРѕРёР·РІРѕРґРёС‚ РёР·РјРµРЅРµРЅРёСЏ РІ Р‘Р” СЃРёСЃС‚РµРјС‹!";
	generate_install_page('finance', $text);
}
?>