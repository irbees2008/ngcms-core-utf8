<?php
if (!defined('NGCMS')) {
	die("Don't you figure you're so cool?");
}
plugins_load_config();
$cfg = array();
array_push($cfg, array('name' => 'activate_add', 'title' => 'РђРІС‚РѕРјР°С‚РёС‡РµСЃРєРѕРµ СЃРѕР·РґР°РЅРёРµ РїСЂРё РґРѕР±Р°РІР»РµРЅРёРё РЅРѕРІРѕСЃС‚Рё<br/><small><b>Р”Р°</b> - РєР»СЋС‡РµРІС‹Рµ СЃР»РѕРІР° Р±СѓРґСѓС‚ Р°РІС‚РѕРјР°С‚РёС‡РµСЃРєРё СЃРѕР·РґР°РІР°С‚СЊСЃСЏ РїСЂРё РґРѕР±Р°РІР»РµРЅРёРё РЅРѕРІРѕСЃС‚Рё', 'type' => 'select', values => array(0 => $lang['noa'], 1 => $lang['yesa']), value => pluginGetVariable('autokeys', 'activate_add')));
array_push($cfg, array('name' => 'activate_edit', 'title' => 'РђРІС‚РѕРјР°С‚РёС‡РµСЃРєРѕРµ РїРµСЂРµСЃРѕР·РґР°РЅРёРµ РїСЂРё РёР·РјРµРЅРµРЅРёРё РЅРѕРІРѕСЃС‚Рё<br/><small><b>Р”Р°</b> - РєР»СЋС‡РµРІС‹Рµ СЃР»РѕРІР° Р±СѓРґСѓС‚ Р°РІС‚РѕРјР°С‚РёС‡РµСЃРєРё РїРµСЂРµСЃРѕР·РґР°РІР°С‚СЊСЃСЏ РїСЂРё РёР·РјРµРЅРµРЅРёРё РЅРѕРІРѕСЃС‚Рё', 'type' => 'select', values => array(0 => $lang['noa'], 1 => $lang['yesa']), value => pluginGetVariable('autokeys', 'activate_edit')));
array_push($cfg, array('name' => 'length', 'title' => 'РњРёРЅРёРјР°Р»СЊРЅР°СЏ РґР»РёРЅР° СЃР»РѕРІР°', 'descr' => '(С…РѕСЂРѕС€РёР№ РІР°СЂРёР°РЅС‚ 5)', 'type' => 'input', 'html_flags' => 'style="width: 200px;"', 'value' => pluginGetVariable('autokeys', 'length')));
array_push($cfg, array('name' => 'sub', 'title' => 'РњР°РєСЃРёРјР°Р»СЊРЅР°СЏ РґР»РёРЅР° СЃР»РѕРІР°', 'descr' => 'РџРѕ СѓРјРѕР»С‡Р°РЅРёСЋ РЅРµ РѕРіСЂР°РЅРёС‡РµРЅРѕ', 'type' => 'input', 'html_flags' => 'style="width: 200px;"', 'value' => pluginGetVariable('autokeys', 'sub')));
array_push($cfg, array('name' => 'occur', 'title' => 'РњРёРЅРёРјР°Р»СЊРЅРѕРµ С‡РёСЃР»Рѕ РїРѕРІС‚РѕСЂРµРЅРёР№ СЃР»РѕРІР°', 'descr' => '(С…РѕСЂРѕС€РёР№ РІР°СЂРёР°РЅС‚ 2)', 'type' => 'input', 'html_flags' => 'style="width: 200px;"', 'value' => pluginGetVariable('autokeys', 'occur')));
array_push($cfg, array('name' => 'block_y', 'title' => '<b>РќРµР¶РµР»Р°С‚РµР»СЊРЅС‹Рµ СЃР»РѕРІР°</b>', 'descr' => 'РІРєР»СЋС‡РµРЅРёРµ/РІС‹РєР»СЋС‡РµРЅРёРµ РѕРїС†РёРё', 'type' => 'select', values => array(0 => $lang['noa'], 1 => $lang['yesa']), value => pluginGetVariable('autokeys', 'block_y')));
array_push($cfg, array('name' => 'block', 'title' => 'РЎРїРёСЃРѕРє РЅРµР¶РµР»Р°С‚РµР»СЊРЅС‹С… СЃР»РѕРІ<br><br><i>РќР° РєР°Р¶РґРѕР№ СЃС‚СЂРѕРєРµ РІРІРѕРґРёС‚СЃСЏ РїРѕ РѕРґРЅРѕСѓ СЃР»РѕРІСѓ. РЎР»РѕРІР° РёР· СЌС‚РѕРіРѕ СЃРїРёСЃРєР° РЅРµ Р±СѓРґСѓС‚ РїРѕРїР°РґР°С‚СЊ РІ keywords.</i>', 'type' => 'text', 'html_flags' => 'rows=8 cols=60', 'value' => pluginGetVariable('autokeys', 'block')));
array_push($cfg, array('name' => 'good_y', 'title' => '<b>Р–РµР»Р°РµРјС‹Рµ СЃР»РѕРІР°</b>', 'descr' => 'РІРєР»СЋС‡РµРЅРёРµ/РІС‹РєР»СЋС‡РµРЅРёРµ РѕРїС†РёРё', 'type' => 'select', values => array(0 => $lang['noa'], 1 => $lang['yesa']), value => pluginGetVariable('autokeys', 'good_y')));
array_push($cfg, array('name' => 'good', 'title' => 'РЎРїРёСЃРѕРє Р¶РµР»Р°РµРјС‹С… СЃР»РѕРІ<br><br><i>РќР° РєР°Р¶РґРѕР№ СЃС‚СЂРѕРєРµ РІРІРѕРґРёС‚СЃСЏ РїРѕ РѕРґРЅРѕСѓ СЃР»РѕРІСѓ. РЎР»РѕРІР° РёР· СЌС‚РѕРіРѕ РІСЃРµРіРґР° Р±СѓРґСѓС‚ РїРѕРїР°РґР°С‚СЊ РІ keywords.</i>', 'type' => 'text', 'html_flags' => 'rows=8 cols=60', 'value' => pluginGetVariable('autokeys', 'good')));
array_push($cfg, array('name' => 'add_title', 'title' => 'РЈС‡РёС‚С‹РІР°С‚СЊ Р·Р°РіРѕР»РѕРІРѕРє', 'descr' => 'Р”РѕР±Р°РІР»РµРЅРёСЏ Р·Р°РіРѕР»РѕРІРєР° РЅРѕРІРѕСЃС‚Рё Рє С‚РµРєСЃС‚Сѓ РЅРѕРІРѕСЃС‚Рё РґР»СЏ РіРµРЅРµСЂР°С†РёРё РєР»СЋС‡РµРІС‹С… СЃР»РѕРІ<br />Р·РЅР°С‡РµРЅРёРµ РѕС‚ 0 РґРѕ Р±РµСЃРєРѕРЅРµС‡РЅРѕСЃС‚Рё: <br />0 - РЅРµ РґРѕР±Р°РІР»СЏС‚СЊ, 1 - РґРѕР±Р°РІР»СЏС‚СЊ, 2 - РґРѕР±Р°РІРёС‚СЊ РґРІР° СЂР°Р·Р°', 'type' => 'input', 'html_flags' => 'style="width: 200px;"', 'value' => pluginGetVariable('autokeys', 'add_title')));
array_push($cfg, array('name' => 'sum', 'title' => 'Р”Р»РёРЅР° РєР»СЋС‡РµРІС‹С… СЃР»РѕРІ', 'descr' => 'Р”Р»РёРЅР° РІСЃРµС… РєР»СЋС‡РµРІС‹С… СЃР»РѕРІ РіРµРЅРµСЂРёСЂСѓРµРјС‹С… РїР»Р°РіРёРЅРѕРј (РџРѕ СѓРјРѕР»С‡Р°РЅРёСЋ <=245 СЃРёРјРѕР»РѕРІ)', 'type' => 'input', 'html_flags' => 'style="width: 200px;"', 'value' => pluginGetVariable('autokeys', 'sum')));
array_push($cfg, array('name' => 'count', 'title' => 'РљРѕР»РёС‡РµСЃС‚РІРѕ РєР»СЋС‡РµРІС‹С… СЃР»РѕРІ', 'descr' => 'РљРѕР»РёС‡РµСЃС‚РІРѕ РєР»СЋС‡РµРІС‹С… СЃР»РѕРІ РіРµРЅРµСЂРёСЂСѓРµРјС‹С… РїР»Р°РіРёРЅРѕРј (РџРѕ СѓРјРѕР»С‡Р°РЅРёСЋ РЅРµРѕРіСЂР°РЅРёС‡РµРЅРЅРѕРµ РєРѕР»РёС‡РµСЃС‚РІРѕ)', 'type' => 'input', 'html_flags' => 'style="width: 200px;"', 'value' => pluginGetVariable('autokeys', 'count')));
array_push($cfg, array('name' => 'good_b', 'title' => '<b>РЈСЃРёР»РµРЅРёРµ СЃР»РѕРІ</b>', 'descr' => 'РЈСЃРёР»РµРЅРёРµ СЃР»РѕРІ РІ С‚РµРіРµ [b]', 'type' => 'select', values => array(0 => $lang['noa'], 1 => $lang['yesa']), value => pluginGetVariable('autokeys', 'good_b')));
if ($_REQUEST['action'] == 'commit') {
	commit_plugin_config_changes('autokeys', $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page('autokeys', $cfg);
}
