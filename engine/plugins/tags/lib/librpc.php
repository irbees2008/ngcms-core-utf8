<?php

// Suggest helper for Add/Edit news
function tagsSuggest($params)
{
    global $userROW, $DSlist, $mysql, $twig;

    // Only registered users can use suggest
    if (!is_array($userROW)) {
        return [
			'status' => 0,
			'errorCode' => 1,
			'errorText' => 'Permission denied',

		];
    }

    // Check if suggest module is enabled
    if (pluginGetVariable('tags', 'suggestHelper')) {
        return [
			'status' => 0,
			'errorCode' => 2,
			'errorText' => 'Suggest helper is not enabled',

		];
    }

    // Check if tag is specified
    if ($params == '') {
        return [
			'status' => 1,
			'errorCode' => 0,
			'data' => [
				$params,
				[],

			],

		];
    }

    $searchTag = iconv('UTF-8', 'Windows-1251', $params);

    $output = [];

    foreach ($mysql->select("select * from ".prefix."_tags where tag like ".db_squote($searchTag.'%')." order by posts desc limit 20") as $row) {
        $output[] = [
			iconv('Windows-1251', 'UTF-8', $row['tag']),
			iconv('Windows-1251', 'UTF-8', $row['posts'] . ' постов'),

		];
    }

    return [
		'status' => 1,
		'errorCode' => 0,
		'data' => [
			$params,
			$output,

		],

	];
}

//rpcRegisterFunction('plugin.cart.demo', 'cart_rpc_demo');
rpcRegisterFunction('plugin.tags.suggest', 'tagsSuggest');
