<?php
plugins_load_config();
$cfg = array();
$cfgX = array();
array_push($cfg, array('descr' => 'РџР»Р°РіРёРЅ РїРѕР·РІРѕР»СЏРµС‚ РёСЃРїРѕР»СЊР·РѕРІР°С‚СЊ СЃРµСЂРІРёСЃ Akismet РґР»СЏ С„РёР»СЊС‚СЂР°С†РёРё СЃРїР°РјР° РІ РєРѕРјРјРµРЅС‚Р°СЂРёСЏС…'));
array_push($cfgX, array('name' => 'akismet_server', 'title' => "API-СЃРµСЂРІРµСЂ", 'type' => 'input', 'value' => extra_get_param($plugin, 'akismet_server') ? extra_get_param($plugin, 'akismet_server') : 'rest.akismet.com'));
array_push($cfgX, array('name' => 'akismet_apikey', 'title' => "API-РєР»СЋС‡", 'type' => 'input', 'value' => extra_get_param($plugin, 'akismet_apikey')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё</b>', 'entries' => $cfgX));
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
?>
