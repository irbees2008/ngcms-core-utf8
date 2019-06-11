<?php
if (!defined('NGCMS')) die ('HAL');
plugins_load_config();
$cfg = array();
$cfgX = array();
array_push($cfg, array('descr' => 'Р—Р°РјРµРЅР° СЃР»РѕРІ РЅР° Р°РґСЂРµСЃ СЃС‚СЂР°РЅРёС†'));
$cfgX = array();
array_push($cfgX, array('name' => 'p_count', 'title' => "РљРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РјРµРЅ РѕРґРЅРѕР№ СЃСЃС‹Р»РєРµ РІ РѕРґРЅРѕР№ РЅРѕРІРѕСЃС‚Рё", 'type' => 'input', 'value' => intval(extra_get_param($plugin, 'p_count'))));
array_push($cfgX, array('name' => 'c_replace', 'title' => "Р РµР¶РёРј РїРѕРёСЃРєР°", 'type' => 'select', 'values' => array('0' => 'РќРµ С‚РѕС‡РЅРѕРµ СЃРѕРІРїР°РґРµРЅРёРµ', '1' => 'РўРѕС‡РЅРѕРµ СЃРѕРІРїР°РґРµРЅРё Р±РµР· СѓС‡РµС‚Р° СЂРµРіРёСЃС‚СЂР°', '2' => 'РўРѕС‡РЅРѕРµ СЃРѕРІРїР°РґРµРЅРёРµ СЃ СѓС‡РµС‚РѕРј СЂРµРіРёСЃС‚СЂР°'), 'value' => intval(extra_get_param($plugin, 'c_replace'))));
array_push($cfgX, array('name' => 'replace', 'title' => "РЎРїРёСЃРєРё<br><br><i>РЈРєР°Р¶РёС‚Рµ СЃР»РѕРІР° С‡РµСЂРµР· СЂР°Р·РґРµР»РёС‚СЊ | Рё РїРµСЂРµРІРѕРґРѕРј СЃС‚СЂРѕРє</i><br />РџСЂРёРјРµСЂ:<br />test|http://test|2<br />test2|http://test2<br>РЁР°Р±Р»РѕРЅ: Р§С‚Рѕ_РёСЃРєР°С‚СЊ|РќР°_С‡С‚Рѕ_Р·Р°РјРµРЅРёС‚СЊ|РљРѕР»РёС‡РµСЃС‚РІРѕ_РІ_РѕРґРЅРѕР№_РЅРѕРІРѕСЃС‚Рё", 'type' => 'text', 'html_flags' => 'rows=20 cols=130', 'value' => extra_get_param($plugin, 'replace')));
array_push($cfgX, array('name' => 'str_url', 'title' => "РЁР°Р±Р»РѕРЅ РїРѕРґРјРµРЅС‹<br /><small>РљР»СЋС‡Рё:<br /><b>%search%</b> - Р�СЃРєРѕРјРѕРµ СЃР»РѕРІРѕ<br /><b>%replace%</b> - Р—Р°РјРµРЅСЏРµРјРѕРµ СЃР»РѕРІРѕ<br /><b>%scriptLibrary%</b> - РџСѓС‚СЊ РґРѕ Р±РёР±Р»РёРѕС‚РµРє http://site/lib<br /><b>%home%</b> - РђРґСЂРµСЃ СЃР°Р№С‚Р° http://ngcms<br /></small><br />РџСЂРёРјРµСЂ: <pre><a href='%replace%'>%search%</a></pre>", 'type' => 'input', 'html_flags' => 'size="80"', 'value' => extra_get_param($plugin, 'str_url')));
array_push($cfg, array('mode' => 'group', 'title' => '<b>РќР°СЃС‚СЂРѕР№РєРё РїР»Р°РіРёРЅР°</b>', 'entries' => $cfgX));
if ($_REQUEST['action'] == 'commit') {
	commit_plugin_config_changes('text_replace', $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page('text_replace', $cfg);
}
