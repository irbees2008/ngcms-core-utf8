<?php

// Protect against hack attempts.
if (!defined('NGCMS')) {
    die('HAL');
}

// Duplicate var.
$plugin = 'ggg_recaptcha';

plugins_load_config();
LoadPluginLang($plugin, 'backend', '', '', ':');

// Prepare var.
$scores = [];
foreach (range(0.1, 0.9, 0.1) as $score) {
	$scores["$score"] = $score;
}

$cfg = [];
array_push($cfg, [
    'descr' => $lang[$plugin.':description'],
]);
array_push($cfg, [
    'name' => 'site_key',
    'title' => $lang[$plugin.':site_key'],
    'descr' => $lang[$plugin.':site_key#descr'],
    'type' => 'input',
    'html_flags' => 'style="min-width:260px;text-align:right;" autocomplete="off" required',
    'value' => pluginGetVariable($plugin, 'site_key') ?: null,
]);
array_push($cfg, [
    'name' => 'secret_key',
    'title' => $lang[$plugin.':secret_key'],
    'descr' => $lang[$plugin.':secret_key#descr'],
    'type' => 'input',
    'html_flags' => 'style="min-width:260px;text-align:right;" autocomplete="off" required',
    'value' => pluginGetVariable($plugin, 'secret_key') ?: null,
]);
array_push($cfg, [
    'name' => 'score',
    'title' => $lang[$plugin.':score'],
    'descr' => $lang[$plugin.':score#descr'],
    'type' => 'select',
    'values' => $scores,
	'value' => (double) (pluginGetVariable($plugin, 'score') ?: 0.5),
]);

if ('commit' == $_REQUEST['action']) {
	// Check incomming variables.
    if (empty($site_key = trim(secure_html($_POST['site_key']))) or empty($secret_key = trim(secure_html($_POST['secret_key'])))) {
        msg([
			'type' => 'error',
			'text' => $lang[$plugin.':msg.not_complete'],
		]);

        return generate_config_page($plugin, $cfg);
    }

	commit_plugin_config_changes($plugin, $cfg);

    return print_commit_complete($plugin);
}

generate_config_page($plugin, $cfg);
