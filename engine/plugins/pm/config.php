<?php
/*
 * Plugin's "Private message" configuration file for NextGeneration CMS (http://ngcms.ru/)
 * Copyright (C) 2011 Alexey N. Zhukov (http://digitalplace.ru)
 * http://digitalplace.ru
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 */
# protect against hack attempts
if (!defined('NGCMS')) die ('Galaxy in danger');
# preload config file
PluginsLoadConfig();
# fill configuration parameters
$cfg = array();
array_push($cfg, array(
	'name'   => 'rebuild',
	'title'  => "<font color='red'><b>Р’РѕСЃСЃС‚Р°РЅРѕРІРёС‚СЊ РёРЅРґРµРєСЃРЅС‹Рµ С‚Р°Р±Р»РёС†С‹</b></font>",
	'descr'  => "Р”Р°РЅРЅР°СЏ РѕРїРµСЂР°С†РёСЏ С‚СЂРµР±СѓРµС‚СЃСЏ РІ СЃР»РµРґСѓСЋС‰РёС… СЃР»СѓС‡Р°СЏС…:<br/>1. Р’С‹ РѕР±РЅРѕРІР»СЏРµС‚Рµ РїР»Р°РіРёРЅ СЃ РїСЂРµРґС‹РґСѓС‰РµР№ РІРµСЂСЃРёРё<br/>2. Р’С‹ РїСЂРѕРІРѕРґРёР»Рё СЂСѓС‡РЅРѕРµ РёР·РјРµРЅРµРЅРёРµ С‚Р°Р±Р»РёС†С‹ СЃРѕРѕР±С‰РµРЅРёР№<br/>3. РЈ РІР°СЃ РµСЃС‚СЊ РїРѕРґРѕР·СЂРµРЅРёРµ РЅР° РЅРµРІРµСЂРЅРѕРµ РѕС‚РѕР±СЂР°Р¶РµРЅРёРµ СЃС‡РµС‚С‡РёРєРѕРІ",
	'type'   => 'select',
	'value'  => 0,
	'values' => array(0 => 'РЅРµС‚', 1 => 'РґР°'),
	'nosave' => 1
));
$cfgX = array();
array_push($cfgX, array(
	'name'  => 'msg_per_page',
	'title' => "РљРѕР»РёС‡РµСЃС‚РІРѕ СЃРѕРѕР±С‰РµРЅРёР№ РЅР° СЃС‚СЂР°РЅРёС†Рµ<br /><small>РџРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>10</b></small>",
	'type'  => 'input',
	'value' => intval(pluginGetVariable($plugin, 'msg_per_page') ? intval(pluginGetVariable($plugin, 'msg_per_page')) : 10)
));
array_push($cfgX, array(
	'name'  => 'title_length',
	'title' => "РњР°РєСЃРёРјР°Р»СЊРЅР°СЏ РґР»РёРЅР° С‚РµРјС‹ СЃРѕРѕР±С‰РµРЅРёСЏ<br /><small>РџРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>50</b></small>",
	'type'  => 'input',
	'value' => intval(pluginGetVariable($plugin, 'title_length') ? intval(pluginGetVariable($plugin, 'title_length')) : 50)
));
array_push($cfgX, array(
	'name'  => 'message_length',
	'title' => "РњР°РєСЃРёРјР°Р»СЊРЅР°СЏ РґР»РёРЅР° СЃРѕРѕР±С‰РµРЅРёСЏ<br /><small>РџРѕ СѓРјРѕР»С‡Р°РЅРёСЋ: <b>3000</b></small>",
	'type'  => 'input',
	'value' => intval(pluginGetVariable($plugin, 'message_length') ? intval(pluginGetVariable($plugin, 'message_length')) : 3000)
));
array_push($cfg, array(
	'mode'    => 'group',
	'title'   => '<b>РћР±С‰РёРµ РЅР°СЃС‚СЂРѕР№РєРё</b>',
	'entries' => $cfgX
));
$cfgX = array();
array_push($cfgX, array(
	'name'   => 'localsource',
	'title'  => "Р’С‹Р±РµСЂРёС‚Рµ РєР°С‚Р°Р»РѕРі РёР· РєРѕС‚РѕСЂРѕРіРѕ РїР»Р°РіРёРЅ Р±СѓРґРµС‚ Р±СЂР°С‚СЊ С€Р°Р±Р»РѕРЅС‹ РґР»СЏ РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ<br /><small><b>РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°</b> - РїР»Р°РіРёРЅ Р±СѓРґРµС‚ РїС‹С‚Р°С‚СЊСЃСЏ РІР·СЏС‚СЊ С€Р°Р±Р»РѕРЅС‹ РёР· РѕР±С‰РµРіРѕ С€Р°Р±Р»РѕРЅР° СЃР°Р№С‚Р°; РІ СЃР»СѓС‡Р°Рµ РЅРµРґРѕСЃС‚СѓРїРЅРѕСЃС‚Рё - С€Р°Р±Р»РѕРЅС‹ Р±СѓРґСѓС‚ РІР·СЏС‚С‹ РёР· СЃРѕР±СЃС‚РІРµРЅРЅРѕРіРѕ РєР°С‚Р°Р»РѕРіР° РїР»Р°РіРёРЅР°<br /><b>РџР»Р°РіРёРЅ</b> - С€Р°Р±Р»РѕРЅС‹ Р±СѓРґСѓС‚ Р±СЂР°С‚СЊСЃСЏ РёР· СЃРѕР±СЃС‚РІРµРЅРЅРѕРіРѕ РєР°С‚Р°Р»РѕРіР° РїР»Р°РіРёРЅР°</small>",
	'type'   => 'select',
	'values' => array('0' => 'РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°', '1' => 'РџР»Р°РіРёРЅ'),
	'value'  => intval(pluginGetVariable($plugin, 'localsource'))
));
array_push($cfg, array(
	'mode'    => 'group',
	'title'   => '<b>РќР°СЃС‚СЂРѕР№РєРё РѕС‚РѕР±СЂР°Р¶РµРЅРёСЏ</b>',
	'entries' => $cfgX
));
// RUN
if ($_REQUEST['action'] == 'commit') {
	if ($_REQUEST['rebuild']) {
		$mysql->query('UPDATE ' . prefix . '_users SET `pm_sync` = 0');
	}
	// If submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}