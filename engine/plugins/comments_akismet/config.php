<?php
plugins_load_config();
$cfg = array();
$cfgX = array();
array_push($cfg, array('descr' => 'Р СџР В»Р В°Р С–Р С‘Р Р… Р С—Р С•Р В·Р Р†Р С•Р В»РЎРЏР ВµРЎвЂљ Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљРЎРЉ РЎРѓР ВµРЎР‚Р Р†Р С‘РЎРѓ Akismet Р Т‘Р В»РЎРЏ РЎвЂћР С‘Р В»РЎРЉРЎвЂљРЎР‚Р В°РЎвЂ Р С‘Р С‘ РЎРѓР С—Р В°Р С�Р В° Р Р† Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘РЎРЏРЎвЂ¦'));
array_push($cfgX, array('name' => 'akismet_server', 'title' => "API-РЎРѓР ВµРЎР‚Р Р†Р ВµРЎР‚", 'type' => 'input', 'value' => extra_get_param($plugin, 'akismet_server') ? extra_get_param($plugin, 'akismet_server') : 'rest.akismet.com'));
array_push($cfgX, array('name' => 'akismet_apikey', 'title' => "API-Р С”Р В»РЎР‹РЎвЂЎ", 'type' => 'input', 'value' => extra_get_param($plugin, 'akismet_apikey')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘</b>', 'entries' => $cfgX));
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
?>
