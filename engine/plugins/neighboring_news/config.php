<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('Galaxy in danger');
// Preload config file
plugins_load_config();
// Fill configuration parameters
$cfg = array();
array_push($cfg, array('descr' => 'РџР»Р°РіРёРЅ РіРµРЅРµСЂРёСЂСѓРµС‚ СЃСЃС‹Р»РєРё РЅР° СЃР»РµРґСѓСЋС‰СѓСЋ Рё РїСЂРµРґС‹РґСѓС‰СѓСЋ РЅРѕРІРѕСЃС‚Рё.'));
array_push($cfg, array('name' => 'full_mode', 'title' => "Р’С‹РІРѕРґРёС‚СЊ РІ РїРѕР»РЅРѕР№ РЅРѕРІРѕСЃС‚Рё", 'type' => 'checkbox', value => extra_get_param('neighboring_news', 'full_mode')));
array_push($cfg, array('name' => 'short_mode', 'title' => "Р’С‹РІРѕРґРёС‚СЊ РІ РєСЂР°С‚РєРѕР№ РЅРѕРІРѕСЃС‚Рё<br /><small>РќРµ СЂРµРєРѕРјРµРЅРґСѓРµС‚СЃСЏ, С‚.Рє. РєРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РїСЂРѕСЃРѕРІ Рє Р‘Р” СѓРІРµР»РёС‡РёС‚СЃСЏ РЅР° (2*РєРѕР»РёС‡РµСЃС‚РІРѕ РЅРѕРІРѕСЃС‚РµР№ РЅР° РіР»Р°РІРЅРѕР№ СЃС‚СЂР°РЅРёС†Рµ)</small>", 'type' => 'checkbox', value => extra_get_param('neighboring_news', 'short_mode')));
array_push($cfg, array('name' => 'compare', 'title' => 'РџР°СЂР°РјРµС‚СЂ РІС‹Р±РѕСЂРєРё РёР· РєР°С‚РµРіРѕСЂРёР№', 'type' => 'select', 'values' => array('1' => '1 - РЈС‡РёС‚С‹РІР°РµРј С‚РѕР»СЊРєРѕ РіР»Р°РІРЅСѓСЋ', '2' => '2 - РџРѕР»РЅРѕРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРµ'), value => intval(extra_get_param('neighboring_news', 'compare'))));
array_push($cfg, array('name' => 'localsource', 'title' => "Р’С‹Р±РµСЂРёС‚Рµ РєР°С‚Р°Р»РѕРі РёР· РєРѕС‚РѕСЂРѕРіРѕ РїР»Р°РіРёРЅ Р±СѓРґРµС‚ Р±СЂР°С‚СЊ С€Р°Р±Р»РѕРЅС‹ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br /><small><b>РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°</b> - РїР»Р°РіРёРЅ Р±СѓРґРµС‚ РїС‹С‚Р°С‚СЊСЃСЏ РІР·СЏС‚СЊ С€Р°Р±Р»РѕРЅС‹ РёР· РѕР±С‰РµРіРѕ С€Р°Р±Р»РѕРЅР° СЃР°Р№С‚Р°; РІ СЃР»СѓС‡Р°Рµ РЅРµРґРѕСЃС‚СѓРїРЅРѕСЃС‚Рё - С€Р°Р±Р»РѕРЅС‹ Р±СѓРґСѓС‚ РІР·СЏС‚С‹ РёР· СЃРѕР±СЃС‚РІРµРЅРЅРѕРіРѕ РєР°С‚Р°Р»РѕРіР° РїР»Р°РіРёРЅР°<br /><b>РџР»Р°РіРёРЅ</b> - С€Р°Р±Р»РѕРЅС‹ Р±СѓРґСѓС‚ Р±СЂР°С‚СЊСЃСЏ РёР· СЃРѕР±СЃС‚РІРµРЅРЅРѕРіРѕ РєР°С‚Р°Р»РѕРіР° РїР»Р°РіРёРЅР°</small>", 'type' => 'select', 'values' => array('0' => 'РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°', '1' => 'РџР»Р°РіРёРЅ'), 'value' => intval(extra_get_param('neighboring_news', 'localsource'))));
// RUN
if ($_REQUEST['action'] == 'commit') {
	// If submit requested, do config save
	commit_plugin_config_changes('neighboring_news', $cfg);
	print_commit_complete('neighboring_news');
} else {
	generate_config_page('neighboring_news', $cfg);
}
?>
