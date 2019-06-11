<?php

if (!defined('NGCMS')) die ('HAL');

plugins_load_config();

LoadPluginLang('wysiwyg', 'config');

$bb_list[] = 'Р РЋРЎвЂљР В°Р Р…Р Т‘Р В°РЎР‚РЎвЂљР Р…РЎвЂ№Р в„–';
$bb_list = array_merge($bb_list, ListFiles(extras_dir.'/wysiwyg/bb_code', ''));

//print '<pre>'.var_export($bb_list).'</pre>';

$cfg = array();
$cfgX = array();
array_push($cfg, array('descr' => 'Р С›Р С—Р С‘РЎРѓР В°Р Р…Р С‘Р Вµ'));
array_push($cfgX, array('name' => 'bb_editor', 'title' => 'Р вЂ™РЎвЂ№Р В±Р ВµРЎР‚Р С‘РЎвЂљР Вµ РЎР‚Р ВµР Т‘Р В°Р С”РЎвЂљР С•РЎР‚', 'descr' => 'Р С›Р С—Р С‘РЎРѓР В°Р Р…Р С‘Р Вµ РЎР‚Р ВµР Т‘Р В°Р С”РЎвЂљР С•РЎР‚Р В°','type' => 'select', 'values' => $bb_list, 'value' => pluginGetVariable($plugin, 'bb_editor')));
array_push($cfg,  array('mode' => 'group', 'title' => '<b>Р С›Р В±РЎвЂ°Р С‘Р Вµ Р Р…Р В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘</b>', 'entries' => $cfgX));

if ($_REQUEST['action'] == 'commit') {
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
