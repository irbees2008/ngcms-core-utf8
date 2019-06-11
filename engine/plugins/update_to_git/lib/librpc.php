<?php

// Р пїЅР Р…Р С”Р В»РЎР‹Р Т‘ Р С—Р В°РЎР‚Р В°Р С�Р ВµРЎвЂљРЎР‚Р С•Р Р† Р С‘ Р С”Р В»Р В°РЎРѓРЎРѓР В° Р С•Р В±Р Р…Р С•Р Р†Р В»РЎРЏР В»Р С”Р С‘
function rpc_updater_load($params)
{
    global $userROW;

	// Load params
	$params = array_merge($params, include_once(root . '/plugins/update_to_git/params.php'));

    // Check for security token
    if ($params['token'] != genUToken('core.system.update')) {
		return ['status' => 0, 'errorCode' => 999, 'data' => 'wrong_security_code__from_rpc_updater_load'];
    }

	// Scan incoming params
	if (empty($params['user']) or empty($params['repository']) or empty($params['engine_version'])) {
		return ['status' => 0, 'errorCode' => 999, 'data' => 'wrong_params_type__from_rpc_updater_load'];
	}

    // Check for permissions
    if (!is_array($userROW) or !checkPermission(['plugin' => '#admin', 'item' => 'configuration'], null, 'modify')) {
		return ['status' => 0, 'errorCode' => 999, 'data' => 'perm_denied__from_rpc_updater_load'];
    }

	return $params;
}

// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С� Р С‘ Р С—Р С•Р В»РЎС“РЎвЂЎР В°Р ВµР С� РЎРѓР С—Р С‘РЎРѓР С•Р С” РЎвЂћР В°Р в„–Р В»Р С•Р Р†
function rpc_updater_check($params = [])
{
	// Load params
	$params = rpc_updater_load($params);

	// Load library
	include_once(root . '/plugins/update_to_git/lib/CSystemUpdate.php');
	$updater = new CSystemUpdate($params);

	// Check for update
	$updater->check();

	// response
	return $updater->execute();
}

// Р С›Р В±Р Р…Р С•Р Р†Р В»РЎРЏР ВµР С� Р С—Р С• Р С•Р Т‘Р Р…Р С•Р С�РЎС“ РЎвЂћР В°Р в„–Р В»РЎС“, Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№Р в„– Р С—Р ВµРЎР‚Р ВµР Т‘Р В°Р ВµРЎвЂљРЎРѓРЎРЏ
function rpc_updater($params = [])
{
	// Load params
	$params = rpc_updater_load($params);

	// Scan incoming params
	if (empty($params['url']) or empty($params['name']) or empty($params['action'])) {
		return ['status' => 0, 'errorCode' => 999, 'data' => 'wrong_params_type__from_rpc_updater'];
	}

	// Load library
	include_once(root . '/plugins/update_to_git/lib/CSystemUpdate.php');
	$updater = new CSystemUpdate($params);

	// Update file
	$updater->download($params['url'], $params['name'], $params['action']);

	// response
	return $updater->execute();
}

rpcRegisterFunction('plugin.updater.check', 'rpc_updater_check');
rpcRegisterFunction('plugin.updater.execute', 'rpc_updater');
