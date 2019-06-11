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
	'title'  => "<font color='red'><b>Р вЂ™Р С•РЎРѓРЎРѓРЎвЂљР В°Р Р…Р С•Р Р†Р С‘РЎвЂљРЎРЉ Р С‘Р Р…Р Т‘Р ВµР С”РЎРѓР Р…РЎвЂ№Р Вµ РЎвЂљР В°Р В±Р В»Р С‘РЎвЂ РЎвЂ№</b></font>",
	'descr'  => "Р вЂќР В°Р Р…Р Р…Р В°РЎРЏ Р С•Р С—Р ВµРЎР‚Р В°РЎвЂ Р С‘РЎРЏ РЎвЂљРЎР‚Р ВµР В±РЎС“Р ВµРЎвЂљРЎРѓРЎРЏ Р Р† РЎРѓР В»Р ВµР Т‘РЎС“РЎР‹РЎвЂ°Р С‘РЎвЂ¦ РЎРѓР В»РЎС“РЎвЂЎР В°РЎРЏРЎвЂ¦:<br/>1. Р вЂ™РЎвЂ№ Р С•Р В±Р Р…Р С•Р Р†Р В»РЎРЏР ВµРЎвЂљР Вµ Р С—Р В»Р В°Р С–Р С‘Р Р… РЎРѓ Р С—РЎР‚Р ВµР Т‘РЎвЂ№Р Т‘РЎС“РЎвЂ°Р ВµР в„– Р Р†Р ВµРЎР‚РЎРѓР С‘Р С‘<br/>2. Р вЂ™РЎвЂ№ Р С—РЎР‚Р С•Р Р†Р С•Р Т‘Р С‘Р В»Р С‘ РЎР‚РЎС“РЎвЂЎР Р…Р С•Р Вµ Р С‘Р В·Р С�Р ВµР Р…Р ВµР Р…Р С‘Р Вµ РЎвЂљР В°Р В±Р В»Р С‘РЎвЂ РЎвЂ№ РЎРѓР С•Р С•Р В±РЎвЂ°Р ВµР Р…Р С‘Р в„–<br/>3. Р Р€ Р Р†Р В°РЎРѓ Р ВµРЎРѓРЎвЂљРЎРЉ Р С—Р С•Р Т‘Р С•Р В·РЎР‚Р ВµР Р…Р С‘Р Вµ Р Р…Р В° Р Р…Р ВµР Р†Р ВµРЎР‚Р Р…Р С•Р Вµ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘Р Вµ РЎРѓРЎвЂЎР ВµРЎвЂљРЎвЂЎР С‘Р С”Р С•Р Р†",
	'type'   => 'select',
	'value'  => 0,
	'values' => array(0 => 'Р Р…Р ВµРЎвЂљ', 1 => 'Р Т‘Р В°'),
	'nosave' => 1
));
$cfgX = array();
array_push($cfgX, array(
	'name'  => 'msg_per_page',
	'title' => "Р С™Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С• РЎРѓР С•Р С•Р В±РЎвЂ°Р ВµР Р…Р С‘Р в„– Р Р…Р В° РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р Вµ<br /><small>Р СџР С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹: <b>10</b></small>",
	'type'  => 'input',
	'value' => intval(pluginGetVariable($plugin, 'msg_per_page') ? intval(pluginGetVariable($plugin, 'msg_per_page')) : 10)
));
array_push($cfgX, array(
	'name'  => 'title_length',
	'title' => "Р СљР В°Р С”РЎРѓР С‘Р С�Р В°Р В»РЎРЉР Р…Р В°РЎРЏ Р Т‘Р В»Р С‘Р Р…Р В° РЎвЂљР ВµР С�РЎвЂ№ РЎРѓР С•Р С•Р В±РЎвЂ°Р ВµР Р…Р С‘РЎРЏ<br /><small>Р СџР С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹: <b>50</b></small>",
	'type'  => 'input',
	'value' => intval(pluginGetVariable($plugin, 'title_length') ? intval(pluginGetVariable($plugin, 'title_length')) : 50)
));
array_push($cfgX, array(
	'name'  => 'message_length',
	'title' => "Р СљР В°Р С”РЎРѓР С‘Р С�Р В°Р В»РЎРЉР Р…Р В°РЎРЏ Р Т‘Р В»Р С‘Р Р…Р В° РЎРѓР С•Р С•Р В±РЎвЂ°Р ВµР Р…Р С‘РЎРЏ<br /><small>Р СџР С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹: <b>3000</b></small>",
	'type'  => 'input',
	'value' => intval(pluginGetVariable($plugin, 'message_length') ? intval(pluginGetVariable($plugin, 'message_length')) : 3000)
));
array_push($cfg, array(
	'mode'    => 'group',
	'title'   => '<b>Р С›Р В±РЎвЂ°Р С‘Р Вµ Р Р…Р В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘</b>',
	'entries' => $cfgX
));
$cfgX = array();
array_push($cfgX, array(
	'name'   => 'localsource',
	'title'  => "Р вЂ™РЎвЂ№Р В±Р ВµРЎР‚Р С‘РЎвЂљР Вµ Р С”Р В°РЎвЂљР В°Р В»Р С•Р С– Р С‘Р В· Р С”Р С•РЎвЂљР С•РЎР‚Р С•Р С–Р С• Р С—Р В»Р В°Р С–Р С‘Р Р… Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р В±РЎР‚Р В°РЎвЂљРЎРЉ РЎв‚¬Р В°Р В±Р В»Р С•Р Р…РЎвЂ№ Р Т‘Р В»РЎРЏ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ<br /><small><b>Р РЃР В°Р В±Р В»Р С•Р Р… РЎРѓР В°Р в„–РЎвЂљР В°</b> - Р С—Р В»Р В°Р С–Р С‘Р Р… Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р С—РЎвЂ№РЎвЂљР В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Р†Р В·РЎРЏРЎвЂљРЎРЉ РЎв‚¬Р В°Р В±Р В»Р С•Р Р…РЎвЂ№ Р С‘Р В· Р С•Р В±РЎвЂ°Р ВµР С–Р С• РЎв‚¬Р В°Р В±Р В»Р С•Р Р…Р В° РЎРѓР В°Р в„–РЎвЂљР В°; Р Р† РЎРѓР В»РЎС“РЎвЂЎР В°Р Вµ Р Р…Р ВµР Т‘Р С•РЎРѓРЎвЂљРЎС“Р С—Р Р…Р С•РЎРѓРЎвЂљР С‘ - РЎв‚¬Р В°Р В±Р В»Р С•Р Р…РЎвЂ№ Р В±РЎС“Р Т‘РЎС“РЎвЂљ Р Р†Р В·РЎРЏРЎвЂљРЎвЂ№ Р С‘Р В· РЎРѓР С•Р В±РЎРѓРЎвЂљР Р†Р ВµР Р…Р Р…Р С•Р С–Р С• Р С”Р В°РЎвЂљР В°Р В»Р С•Р С–Р В° Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°<br /><b>Р СџР В»Р В°Р С–Р С‘Р Р…</b> - РЎв‚¬Р В°Р В±Р В»Р С•Р Р…РЎвЂ№ Р В±РЎС“Р Т‘РЎС“РЎвЂљ Р В±РЎР‚Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р С‘Р В· РЎРѓР С•Р В±РЎРѓРЎвЂљР Р†Р ВµР Р…Р Р…Р С•Р С–Р С• Р С”Р В°РЎвЂљР В°Р В»Р С•Р С–Р В° Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°</small>",
	'type'   => 'select',
	'values' => array('0' => 'Р РЃР В°Р В±Р В»Р С•Р Р… РЎРѓР В°Р в„–РЎвЂљР В°', '1' => 'Р СџР В»Р В°Р С–Р С‘Р Р…'),
	'value'  => intval(pluginGetVariable($plugin, 'localsource'))
));
array_push($cfg, array(
	'mode'    => 'group',
	'title'   => '<b>Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ</b>',
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