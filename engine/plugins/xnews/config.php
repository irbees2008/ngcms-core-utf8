<?php


# protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

# preload config file
pluginsLoadConfig();

LoadPluginLang('xnews', 'config', '', 'tn', ':');


$count = intval(pluginGetVariable($plugin, 'count'));
if ($count < 1 || $count > 50)
	$count = 1;

# fill configuration parameters
$cfg = array();
array_push($cfg, array('descr' => $lang['tn:description']));
array_push($cfg, array('name'  => 'count',
                       'title' => $lang['tn:count_title'],
                       'type'  => 'input',
                       'value' => $count));

for ($i = 1; $i <= $count; $i++) {
	$cfgX = array();

	$currentVar = "{$i}";

	array_push($cfgX, array(
						'name'  => "{$currentVar}_name",
						'title' => 'Р пїЅР Т‘Р ВµР Р…РЎвЂљР С‘РЎвЂћР С‘Р С”Р В°РЎвЂљР С•РЎР‚ Р В±Р В»Р С•Р С”Р В°<br/><small>Р СџР С• Р Т‘Р В°Р Р…Р Р…Р С•Р С�РЎС“ ID Р С�Р С•Р В¶Р Р…Р С• Р В±РЎС“Р Т‘Р ВµРЎвЂљ РЎвЂћР С•РЎР‚Р С�Р С‘РЎР‚Р С•Р Р†Р В°РЎвЂљРЎРЉ Р Т‘Р В°Р Р…Р Р…РЎвЂ№Р в„– Р В±Р В»Р С•Р С” РЎвЂЎР ВµРЎР‚Р ВµР В· Р Р†РЎвЂ№Р В·Р С•Р Р† <b>TWIG</b> РЎвЂћРЎС“Р Р…Р С”РЎвЂ Р С‘Р С‘ <b>callPlugin()</b>',
						'type'  => 'input',
						'value' => pluginGetVariable($plugin, "{$currentVar}_name"))
	);

	array_push($cfgX, array(
						'name'		=> "{$currentVar}_template",
						'title'		=> 'Р пїЅРЎРѓР С—Р С•Р В»РЎРЉР В·РЎС“Р ВµР С�РЎвЂ№Р в„– РЎв‚¬Р В°Р В±Р В»Р С•Р Р…',
						'type'		=> 'input',
//						'values'	=> $templateDirectories,
						'value'		=> pluginGetVariable($plugin, "{$currentVar}_template"))
	);

	array_push($cfgX, array(
						'name'		=> "{$currentVar}_visibilityMode",
						'title'		=> 'Р С›Р В±Р В»Р В°РЎРѓРЎвЂљРЎРЉ Р Р†Р С‘Р Т‘Р С‘Р С�Р С•РЎРѓРЎвЂљР С‘<br/><small>Р Р€Р С”Р В°Р В¶Р С‘РЎвЂљР Вµ Р Р…Р В° Р С”Р В°Р С”Р С‘РЎвЂ¦ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р В°РЎвЂ¦ Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Т‘Р В°Р Р…Р Р…РЎвЂ№Р в„– Р В±Р В»Р С•Р С”</small>',
						'type'		=> 'select',
						'values'	=> array('0' => 'Р вЂ™Р ВµР В·Р Т‘Р Вµ', 1 => 'Р СњР В° РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р Вµ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р в„–', 2 => 'Р СњР В° РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р Вµ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–', 3 => 'Р РЋРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р В° Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р в„– + Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–'),
						'value'		=> pluginGetVariable($plugin, "{$currentVar}_visibilityMode"))
	);

	array_push($cfgX, array(
						'name'  => "{$currentVar}_visibilityCList",
						'title' => 'Р РЋР С—Р С‘РЎРѓР С•Р С” Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р в„– Р Р…Р В° Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№РЎвЂ¦ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°Р ВµРЎвЂљРЎРѓРЎРЏ Р В±Р В»Р С•Р С”<br/><small>Р СљР С•Р В¶Р Р…Р С• РЎС“Р С”Р В°Р В·Р В°РЎвЂљРЎРЉ Р С”Р С•Р Р…Р С”РЎР‚Р ВµРЎвЂљР Р…РЎвЂ№Р Вµ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘ Р С—РЎР‚Р С‘ Р Р†РЎвЂ№Р В±Р С•РЎР‚Р Вµ <b>Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘/Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘</b> Р Р† Р С—РЎР‚Р ВµР Т‘РЎвЂ№Р Т‘РЎС“РЎвЂ°Р ВµР С� Р С—РЎС“Р Р…Р С”РЎвЂљР Вµ',
						'type'  => 'input',
						'value' => pluginGetVariable($plugin, "{$currentVar}_visibilityCList"))
	);

	array_push($cfgX, array(
						'name'		=> "{$currentVar}_categoryMode",
						'title'		=> 'Р пїЅР В· Р С”Р В°Р С”Р С‘РЎвЂ¦ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р в„– Р С–Р ВµР Р…Р ВµРЎР‚Р С‘РЎР‚РЎС“Р ВµРЎвЂљРЎРѓРЎРЏ Р В»Р ВµР Р…РЎвЂљР В° Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–',
						'type'		=> 'select',
						'values'	=> array('0' => 'Р РЋР С—Р С‘РЎРѓР С•Р С” Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р в„–', 1 => 'Р СћР ВµР С”РЎС“РЎвЂ°Р В°РЎРЏ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘РЎРЏ', 2 => 'Р РЋР С—Р С‘РЎРѓР С•Р С” + РЎвЂљР ВµР С”РЎС“РЎвЂ°Р В°РЎРЏ'),
						'value'		=> pluginGetVariable($plugin, "{$currentVar}_categoryMode"))
	);

	array_push($cfgX, array(
						'name' => "{$currentVar}_categories",
						'title' => 'Р РЋР С—Р С‘РЎРѓР С•Р С” Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р в„– Р Т‘Р В»РЎРЏ Р С–Р ВµР Р…Р ВµРЎР‚Р В°РЎвЂ Р С‘Р С‘ Р В»Р ВµР Р…РЎвЂљРЎвЂ№<br/><small>Р вЂ”Р В°Р Т‘Р В°РЎвЂ�РЎвЂљРЎРѓРЎРЏ РЎРѓР С—Р С‘РЎРѓР С•Р С” Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р в„– (РЎвЂЎР ВµРЎР‚Р ВµР В· Р В·Р В°Р С—РЎРЏРЎвЂљРЎС“РЎР‹) Р С—РЎР‚Р С‘ Р Р†РЎвЂ№Р В±Р С•РЎР‚Р Вµ <b>РЎРѓР С—Р С‘РЎРѓР С•Р С”</b> Р Р† Р С—РЎР‚Р ВµР Т‘РЎвЂ№Р Т‘РЎС“РЎвЂ°Р ВµР С� Р С—Р С•Р В»Р Вµ. Р С›РЎРѓРЎвЂљР В°Р Р†РЎРЉРЎвЂљР Вµ Р С—Р С•Р В»Р Вµ Р С—РЎС“РЎРѓРЎвЂљРЎвЂ№Р С� Р Т‘Р В»РЎРЏ Р С–Р ВµР Р…Р ВµРЎР‚Р В°РЎвЂ Р С‘Р С‘ Р В»Р ВµР Р…РЎвЂљРЎвЂ№ Р С—Р С• Р Р†РЎРѓР ВµР С� Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘РЎРЏР С�</small>',
						'type' => 'input',
						'value' => pluginGetVariable($plugin, "{$currentVar}_categories"))
	);

	array_push($cfgX, array(
						'name'  => "{$currentVar}_mainMode",
						'title' => "Р С›РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘Р Вµ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– РЎРѓ Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№<br/><small>Р вЂ™РЎвЂ№Р В±Р ВµРЎР‚Р С‘РЎвЂљР Вµ РЎвЂљР С‘Р С— Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–, Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№Р Вµ Р В±РЎС“Р Т‘РЎС“РЎвЂљ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Р† Р В±Р В»Р С•Р С”Р Вµ</small>",
						'type' => 'select',
						'value' => pluginGetVariable($plugin, "{$currentVar}_mainMode"),
						'values' => array('0' => 'Р вЂ™РЎРѓР Вµ', 1 => 'Р РЋ Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„–', 2 => 'Р СњР Вµ РЎРѓ Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„–'),
	));

	array_push($cfgX, array(
						'name'  => "{$currentVar}_pinMode",
						'title' => "Р С›РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘Р Вµ Р С—РЎР‚Р С‘Р С”РЎР‚Р ВµР С—Р В»Р ВµР Р…Р Р…РЎвЂ№РЎвЂ¦ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–<br/><small>Р вЂ™РЎвЂ№Р В±Р ВµРЎР‚Р С‘РЎвЂљР Вµ РЎвЂљР С‘Р С— Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–, Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№Р Вµ Р В±РЎС“Р Т‘РЎС“РЎвЂљ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Р† Р В±Р В»Р С•Р С”Р Вµ</small>",
						'type' => 'select',
						'value' => pluginGetVariable($plugin, "{$currentVar}_pinMode"),
						'values' => array('0' => 'Р вЂ™РЎРѓР Вµ', 1 => 'Р СџРЎР‚Р С‘Р С”РЎР‚Р ВµР С—Р В»Р ВµР Р…Р Р…РЎвЂ№Р Вµ', 2 => 'Р СњР Вµ Р С—РЎР‚Р С‘Р С”РЎР‚Р ВµР С—Р В»Р ВµР Р…Р Р…РЎвЂ№Р Вµ'),
	));

	array_push($cfgX, array(
						'name'  => "{$currentVar}_favMode",
						'title' => "Р С›РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘Р Вµ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р С‘Р В· Р В·Р В°Р С”Р В»Р В°Р Т‘Р С•Р С”<br/><small>Р вЂ™РЎвЂ№Р В±Р ВµРЎР‚Р С‘РЎвЂљР Вµ РЎвЂљР С‘Р С— Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–, Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№Р Вµ Р В±РЎС“Р Т‘РЎС“РЎвЂљ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Р† Р В±Р В»Р С•Р С”Р Вµ</small>",
						'type' => 'select',
						'value' => pluginGetVariable($plugin, "{$currentVar}_favMode"),
						'values' => array('0' => 'Р вЂ™РЎРѓР Вµ', 1 => 'Р СћР С•Р В»РЎРЉР С”Р С• Р С‘Р В· Р В·Р В°Р С”Р В»Р В°Р Т‘Р С•Р С”', 2 => 'Р СњР Вµ Р Т‘Р С•Р В±Р В°Р Р†Р В»Р ВµР Р…Р Р…РЎвЂ№Р Вµ Р Р† Р В·Р В°Р С”Р В»Р В°Р Т‘Р С”Р С‘'),
	));

	array_push($cfgX, array(
						'name'  => "{$currentVar}_skipCurrent",
						'title' => "Р СњР Вµ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎвЂљРЎРЉ Р Р† Р В±Р В»Р С•Р С”Р Вµ РЎвЂљР ВµР С”РЎС“РЎвЂ°РЎС“РЎР‹ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ<br/><small>Р вЂќР В°Р Р…Р Р…РЎвЂ№Р в„– РЎР‚Р ВµР В¶Р С‘Р С� Р Р…Р Вµ Р С—Р С•Р В·Р Р†Р С•Р В»РЎРЏР ВµРЎвЂљ Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљРЎРЉ Р С”Р ВµРЎв‚¬Р С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р В±Р В»Р С•Р С”Р С•Р Р† Р С‘ Р С—Р С•Р Р†РЎвЂ№РЎв‚¬Р В°Р ВµРЎвЂљ Р Р…Р В°Р С–РЎР‚РЎС“Р В·Р С”РЎС“ Р Р…Р В° РЎРѓР С‘РЎРѓРЎвЂљР ВµР С�РЎС“</small>",
						'type' => 'select',
						'value' => pluginGetVariable($plugin, "{$currentVar}_skipCurrent"),
						'values' => array('0' => 'Р СњР ВµРЎвЂљ', 1 => 'Р вЂќР В°'),
	));

	array_push($cfgX, array(
						'name'  => "{$currentVar}_extractEmbeddedItems",
						'title' => "Р пїЅР В·Р Р†Р В»Р ВµР С”Р В°РЎвЂљРЎРЉ URL'РЎвЂ№ Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘Р в„– Р С‘Р В· РЎвЂљР ВµР С”РЎРѓРЎвЂљР В° Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘<br/><small>Р РЋР С—Р С‘РЎРѓР С•Р С” URL'Р С•Р Р† Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р Т‘Р С•РЎРѓРЎвЂљРЎС“Р С—Р ВµР Р… Р Р† Р С�Р В°РЎРѓРЎРѓР С‘Р Р†Р Вµ news.embed.images, Р С”Р С•Р В»-Р Р†Р С• - Р Р† news.embed.imgCount</small>",
						'type' => 'select',
						'value' => pluginGetVariable($plugin, "{$currentVar}_extractEmbeddedItems"),
						'values' => array('0' => 'Р СњР ВµРЎвЂљ', 1 => 'Р вЂќР В°'),
	));

	array_push($cfgX, array(
					'name' => "{$currentVar}_showNoNews",
					'title' => 'Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРЉ Р В±Р В»Р С•Р С” Р ВµРЎРѓР В»Р С‘ Р Р† Р Р…РЎвЂ�Р С� Р Р…Р ВµРЎвЂљ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–',
					'type' => 'checkbox',
					'value' => pluginGetVariable($plugin ,"{$currentVar}_showNoNews"))
	);

	array_push($cfgX, array(
						'name'  => "{$currentVar}_count",
						'title' => $lang['tn:number_title'],
						'type'  => 'input',
						'value' => intval(pluginGetVariable($plugin, "{$currentVar}_count")) ? pluginGetVariable($plugin, "{$currentVar}_count") : '10')
	);

	array_push($cfgX, array(
						'name'  => "{$currentVar}_skip",
						'title' => 'Р СџРЎР‚Р С•Р С—РЎС“РЎРѓРЎвЂљР С‘РЎвЂљРЎРЉ Р С—Р ВµРЎР‚Р Р†РЎвЂ№Р Вµ <b>X</b> Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р С—РЎР‚Р С‘ Р С—Р С•Р С”Р В°Р В·Р Вµ Р В±Р В»Р С•Р С”Р В°<br/><small>Р вЂ”Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹: 0',
						'type'  => 'input',
						'value' => intval(pluginGetVariable($plugin, "{$currentVar}_skip")) ? pluginGetVariable($plugin , "{$currentVar}_skip") : '0')
	);

	array_push($cfgX, array(
						'name'  => "{$currentVar}_maxAge",
						'title' => $lang['tn:date'],
						'type'  => 'input',
						'value' => intval(pluginGetVariable($plugin, "{$currentVar}_maxAge")))
	);

	$orderby = array(
				'viewed'    => $lang['tn:orderby_views'],
				'commented' => $lang['tn:orderby_comments'],
				'random'   => $lang['tn:orderby_random'],
				'last'     => $lang['tn:orderby_last']
	);

	array_push($cfgX, array(
						'name'   => "{$currentVar}_order",
						'type'   => 'select',
						'title'  => $lang['tn:orderby_title'],
						'values' => $orderby,
						'value'  => pluginGetVariable($plugin, "{$currentVar}_order"))
	);

/*
	array_push($cfgX, array(
						'name' => "{$currentVar}_content",
						'title' => $lang['tn:content'],
						'type' => 'checkbox',
						'value' => pluginGetVariable($plugin ,"{$currentVar}_content"))
	);
	array_push($cfgX, array(
						'name'  => "{$currentVar}_img",
						'title' => $lang['tn:img'],
						'type'  => 'checkbox',
						'value' => pluginGetVariable('xnews',"{$currentVar}_img"))
	);
*/
	$blockName = pluginGetVariable($plugin, "{$currentVar}_name") ? pluginGetVariable('xnews', "{$currentVar}_name") : '# '.$currentVar;
	array_push($cfg,  array(
					'mode'        => 'group',
					'title'       => $lang['tn:group'].$blockName,
					'toggle'      => '1',
					'toggle.mode' => 'hide',
					'entries'     => $cfgX)
	);
}

/*
$cfgX = array();
array_push($cfgX, array(
					'name'   => 'localsource',
					'title'  => $lang['tn:localsource'],
					'type'   => 'select',
					'values' => array ( '0' => $lang['tn:localsource_0'], '1' => $lang['tn:localsource_1']),
					'value'  => intval(pluginGetVariable($plugin, 'localsource')))
);
array_push($cfg, array(
					'mode'    => 'group',
					'title'   => $lang['tn:group_2'],
					'entries' => $cfgX)
);
*/

$cfgX = array();
array_push($cfgX, array(
					'name'   => 'cache',
					'title'  => $lang['tn:cache'],
					'type'   => 'select',
					'values' => array ( '1' => $lang['yesa'], '0' => $lang['noa']),
					'value'  => intval(pluginGetVariable($plugin, 'cache')))
);
array_push($cfgX, array(
					'name'  => 'cacheExpire',
					'title' => $lang['tn:cacheExpire'],
					'type' => 'input',
					'value' => intval(pluginGetVariable($plugin, 'cacheExpire')) ? pluginGetVariable($plugin, 'cacheExpire') :'60')
);
array_push($cfg,  array(
					'mode'    => 'group',
					'title'   => $lang['tn:group_3'],
					'entries' => $cfgX)
);


# RUN
if ($_REQUEST['action'] == 'commit') {
	# if submit requested, do config save
	commit_plugin_config_changes($plugin, $cfg);
	print_commit_complete($plugin);
} else {
	generate_config_page($plugin, $cfg);
}
