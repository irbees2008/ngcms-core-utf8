<?php

// Protect against hack attempts
if (!defined('NGCMS')) {
    die('Galaxy in danger');
}

rpcRegisterFunction('pm_get_username', 'plugin_pm_ajax_get_username');

function plugin_pm_ajax_get_username($params)
{
    global $userROW, $mysql;

    if (!is_array($userROW)) {
        // ACCESS DENIED
        return [
			'status' => 0,
			'errorCode' => 3,
			'errorText' => 'Access denied',

		];
    }

    $searchName = iconv('UTF-8', 'Windows-1251', $params);

    // Return a list of users
    $SQL = 'SELECT name FROM ' . uprefix . '_users WHERE name LIKE ' . db_squote('%' . $searchName . '%') . ' ORDER BY name DESC LIMIT 20';

    // Scan incoming params
    $output = [];

    foreach ($mysql->select($SQL) as $row) {
        $output[] = [
			iconv('Windows-1251', 'UTF-8', $row['name']),

		];
    }

    return [
		'status' => 1,
		'errorCode' => 0,
		'data' => [
			$params,
			$output
		],

	];
}
