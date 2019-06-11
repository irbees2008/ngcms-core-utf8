<?php
// #====================================================================================#
// # РќР°РёРјРµРЅРѕРІР°РЅРёРµ РїР»Р°РіРёРЅР°: nsched [ News SCHEDuller ]                                   #
// # Р Р°Р·СЂРµС€РµРЅРѕ Рє РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЋ СЃ: Next Generation CMS                                   #
// # РђРІС‚РѕСЂ: Vitaly A Ponomarev, vp7@mail.ru                                             #
// #====================================================================================#
// #====================================================================================#
// # Р�РЅСЃС‚Р°Р»Р» СЃРєСЂРёРїС‚ РїР»Р°РіРёРЅР°                                                             #
// #====================================================================================#
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
plugins_load_config();
LoadPluginLang('nsched', 'install');
$db_update = array(
	array(
		'table'  => 'news',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'cmodify', 'name' => 'nsched_activate', 'type' => 'datetime'),
			array('action' => 'cmodify', 'name' => 'nsched_deactivate', 'type' => 'datetime'),
		)
	),
);
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	if (fixdb_plugin_install('nsched', $db_update)) {
		plugin_mark_installed('nsched');
	}
} else {
	$text = 'РџР»Р°РіРёРЅ <b>nsched</b> РїРѕР·РІРѕР»СЏРµС‚ РїСѓР±Р»РёРєРѕРІР°С‚СЊ/СЃРЅРёРјР°С‚СЊ СЃ РїСѓР±Р»РёРєР°С†РёРё РЅРѕРІРѕСЃС‚Рё РїРѕ СЂР°СЃРїРёСЃР°РЅРёСЋ.<br><br>';
	generate_install_page('nsched', $text);
}
?>