<?php

if (! defined('NGCMS')) {
    exit('HAL');
}

// Load plugin language
LoadPluginLang('update_to_git', 'index', null, 'update', '::');

echo $twig->render('plugins/update_to_git/tpl/index.tpl', [
    'admin_url' => admin_url,
	'token' => genUToken('core.system.update'),
    'plugin' => 'update_to_git',
]);

// // Show index page to plugin
// updater_index();
//
// function updater_index()
// {
//     global $twig, $lang;
//
//     $tvars = [
//         'skins_url' => skins_url,
//         'plugin' => 'update_to_git',
//     ];
//
//     echo $twig->render('plugins/update_to_git/tpl/index.tpl', $tvars);
// }
