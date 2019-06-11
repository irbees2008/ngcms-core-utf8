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
LoadPluginLang('voting', 'install');
plugins_load_config();
LoadPluginLang('nsched', 'install');
$db_update = array(
	array(
		'table'  => 'news',
		'action' => 'modify',
		'fields' => array(
			array('action' => 'drop', 'name' => 'nsched_activate'),
			array('action' => 'drop', 'name' => 'nsched_deactivate'),
		)
	),
);
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	if (fixdb_plugin_install('nsched', $db_update, 'deinstall')) {
		plugin_mark_deinstalled('nsched');
	}
} else {
	$text = 'РџСЂРё СѓРґР°Р»РµРЅРёРё РїР»Р°РіРёРЅР° <b>nsched</b> РІСЃСЏ РёРЅС„РѕСЂРјР°С†РёСЏ Рѕ СЂР°СЃРїРёСЃР°РЅРёРё СЂР°Р·РјРµС‰РµРЅРёСЏ/СѓРґР°Р»РµРЅРёСЏ РЅРѕРІРѕСЃС‚РµР№ Р±СѓРґРµС‚ РїРѕС‚РµСЂСЏРЅР°!<br><br>';
	generate_install_page('nsched', $text, 'deinstall');
}
