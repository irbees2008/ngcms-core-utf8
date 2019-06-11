<?php
if (!defined('NGCMS')) die ('HAL');
plugins_load_config();
$cfg = array();
$cfgX = array();
array_push($cfg, array('descr' => 'Р вЂ”Р В°Р С�Р ВµР Р…Р В° РЎРѓР В»Р С•Р Р† Р Р…Р В° Р В°Р Т‘РЎР‚Р ВµРЎРѓ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ '));
$cfgX = array();
array_push($cfgX, array('name' => 'p_count', 'title' => "Р С™Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С• Р В·Р В°Р С�Р ВµР Р… Р С•Р Т‘Р Р…Р С•Р в„– РЎРѓРЎРѓРЎвЂ№Р В»Р С”Р Вµ Р Р† Р С•Р Т‘Р Р…Р С•Р в„– Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘", 'type' => 'input', 'value' => intval(extra_get_param($plugin, 'p_count'))));
array_push($cfgX, array('name' => 'c_replace', 'title' => "Р В Р ВµР В¶Р С‘Р С� Р С—Р С•Р С‘РЎРѓР С”Р В°", 'type' => 'select', 'values' => array('0' => 'Р СњР Вµ РЎвЂљР С•РЎвЂЎР Р…Р С•Р Вµ РЎРѓР С•Р Р†Р С—Р В°Р Т‘Р ВµР Р…Р С‘Р Вµ', '1' => 'Р СћР С•РЎвЂЎР Р…Р С•Р Вµ РЎРѓР С•Р Р†Р С—Р В°Р Т‘Р ВµР Р…Р С‘ Р В±Р ВµР В· РЎС“РЎвЂЎР ВµРЎвЂљР В° РЎР‚Р ВµР С–Р С‘РЎРѓРЎвЂљРЎР‚Р В°', '2' => 'Р СћР С•РЎвЂЎР Р…Р С•Р Вµ РЎРѓР С•Р Р†Р С—Р В°Р Т‘Р ВµР Р…Р С‘Р Вµ РЎРѓ РЎС“РЎвЂЎР ВµРЎвЂљР С•Р С� РЎР‚Р ВµР С–Р С‘РЎРѓРЎвЂљРЎР‚Р В°'), 'value' => intval(extra_get_param($plugin, 'c_replace'))));
array_push($cfgX, array('name' => 'replace', 'title' => "Р РЋР С—Р С‘РЎРѓР С”Р С‘<br><br><i>Р Р€Р С”Р В°Р В¶Р С‘РЎвЂљР Вµ РЎРѓР В»Р С•Р Р†Р В° РЎвЂЎР ВµРЎР‚Р ВµР В· РЎР‚Р В°Р В·Р Т‘Р ВµР В»Р С‘РЎвЂљРЎРЉ | Р С‘ Р С—Р ВµРЎР‚Р ВµР Р†Р С•Р Т‘Р С•Р С� РЎРѓРЎвЂљРЎР‚Р С•Р С”</i><br />Р СџРЎР‚Р С‘Р С�Р ВµРЎР‚:<br />test|http://test|2<br />test2|http://test2<br>Р РЃР В°Р В±Р В»Р С•Р Р…: Р В§РЎвЂљР С•_Р С‘РЎРѓР С”Р В°РЎвЂљРЎРЉ|Р СњР В°_РЎвЂЎРЎвЂљР С•_Р В·Р В°Р С�Р ВµР Р…Р С‘РЎвЂљРЎРЉ|Р С™Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С•_Р Р†_Р С•Р Т‘Р Р…Р С•Р в„–_Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘", 'type' => 'text', 'html_flags' => 'rows=20 cols=130', 'value' => extra_get_param($plugin, 'replace')));
array_push($cfgX, array('name' => 'str_url', 'title' => "Р РЃР В°Р В±Р В»Р С•Р Р… Р С—Р С•Р Т‘Р С�Р ВµР Р…РЎвЂ№<br /><small>Р С™Р В»РЎР‹РЎвЂЎР С‘:<br /><b>%search%</b> - Р пїЅРЎРѓР С”Р С•Р С�Р С•Р Вµ РЎРѓР В»Р С•Р Р†Р С•<br /><b>%replace%</b> - Р вЂ”Р В°Р С�Р ВµР Р…РЎРЏР ВµР С�Р С•Р Вµ РЎРѓР В»Р С•Р Р†Р С•<br /><b>%scriptLibrary%</b> - Р СџРЎС“РЎвЂљРЎРЉ Р Т‘Р С• Р В±Р С‘Р В±Р В»Р С‘Р С•РЎвЂљР ВµР С” http://site/lib<br /><b>%home%</b> - Р С’Р Т‘РЎР‚Р ВµРЎРѓ РЎРѓР В°Р в„–РЎвЂљР В° http://ngcms<br /></small><br />Р СџРЎР‚Р С‘Р С�Р ВµРЎР‚: <pre><a href='%replace%'>%search%</a></pre>", 'type' => 'input', 'html_flags' => 'size="80"', 'value' => extra_get_param($plugin, 'str_url')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°</b>', 'entries' => $cfgX));
if ($_REQUEST['action'] == 'commit') {
	commit_plugin_config_changes('text_replace', $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page('text_replace', $cfg);
}
