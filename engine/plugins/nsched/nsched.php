<?php
// #====================================================================================#
// # Р СњР В°Р С‘Р С�Р ВµР Р…Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°: nsched [ News SCHEDuller ]                                   #
// # Р В Р В°Р В·РЎР‚Р ВµРЎв‚¬Р ВµР Р…Р С• Р С” Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°Р Р…Р С‘РЎР‹ РЎРѓ: Next Generation CMS                                   #
// # Р С’Р Р†РЎвЂљР С•РЎР‚: Vitaly A Ponomarev, vp7@mail.ru                                             #
// #====================================================================================#
// #====================================================================================#
// # Р Р‡Р Т‘РЎР‚Р С• Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°                                                                       #
// #====================================================================================#
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

class NSchedNewsFilter extends NewsFilter {

	function addNewsForm(&$tvars) {

		$perm = checkPermission(array('plugin' => '#admin', 'item' => 'news'), null, array('personal.publish', 'personal.unpublish', 'other.publish', 'other.unpublish'));
		$tvars['plugin']['nsched'] = '';
		if ($perm['personal.publish'] || $perm['personal.unpublish']) {
			$tvars['plugin']['nsched'] .= '<tr><td width="100%" class="contentHead"><img src="' . admin_url . '/skins/default/images/nav.gif" hspace="8" alt="" />Р Р€Р С—РЎР‚Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ Р С—РЎС“Р В±Р В»Р С‘Р С”Р В°РЎвЂ Р С‘Р ВµР в„– Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–</td></tr><tr><td width="100%" class="contentEntry1"><table>';
			if ($perm['personal.publish']) {
				$tvars['plugin']['nsched'] .= '<tr><td>Р вЂќР В°РЎвЂљР В° Р Р†Р С”Р В»РЎР‹РЎвЂЎР ВµР Р…Р С‘РЎРЏ:</td><td><input id="nsched_activate" name="nsched_activate" /> <small>( Р Р† РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљР Вµ Р вЂњР вЂњР вЂњР вЂњ-Р СљР Сљ-Р вЂќР вЂќ Р В§Р В§:Р СљР Сљ )</small></td></tr>';
			}
			if ($perm['personal.unpublish']) {
				$tvars['plugin']['nsched'] .= '<tr><td>Р вЂќР В°РЎвЂљР В° Р С•РЎвЂљР С”Р В»РЎР‹РЎвЂЎР ВµР Р…Р С‘РЎРЏ:</td><td><input id="nsched_deactivate" name="nsched_deactivate"/> <small>( Р Р† РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљР Вµ Р вЂњР вЂњР вЂњР вЂњ-Р СљР Сљ-Р вЂќР вЂќ Р В§Р В§:Р СљР Сљ )</small></td></tr>';
			}
			$tvars['plugin']['nsched'] .= '</table></td></tr><script language="javascript" type="text/javascript">' . "$('#nsched_activate').datetimepicker({ dateFormat: 'yy-mm-dd', timeFormat: 'hh:mm'});$('#nsched_deactivate').datetimepicker({ dateFormat: 'yy-mm-dd', timeFormat: 'hh:mm'});</script>";
		}

		return 1;
	}

	function addNews(&$tvars, &$SQL) {

		$perm = checkPermission(array('plugin' => '#admin', 'item' => 'news'), null, array('personal.publish', 'personal.unpublish', 'other.publish', 'other.unpublish'));
		if ($perm['personal.publish'])
			$SQL['nsched_activate'] = $_REQUEST['nsched_activate'];
		if ($perm['personal.unpublish'])
			$SQL['nsched_deactivate'] = $_REQUEST['nsched_deactivate'];

		return 1;
	}

	function editNewsForm($newsID, $SQLold, &$tvars) {

		global $userROW;
		$perm = checkPermission(array('plugin' => '#admin', 'item' => 'news'), null, array('personal.publish', 'personal.unpublish', 'other.publish', 'other.unpublish'));
		$isOwn = ($SQLold['author_id'] == $userROW['id']) ? 1 : 0;
		$permGroupMode = $isOwn ? 'personal' : 'other';
		$ndeactivate = $SQLold['nsched_deactivate'];
		$nactivate = $SQLold['nsched_activate'];
		if ($nactivate == '0000-00-00 00:00') {
			$nactivate = '';
		}
		if ($ndeactivate == '0000-00-00 00:00') {
			$ndeactivate = '';
		}
		$tvars['plugin']['nsched'] = '';
		if ($perm[$permGroupMode . '.publish'] || $perm[$permGroupMode . '.unpublish']) {
			$tvars['plugin']['nsched'] .= '<tr><td width="100%" class="contentHead"><img src="' . admin_url . '/skins/default/images/nav.gif" hspace="8" alt="" />Р Р€Р С—РЎР‚Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ Р С—РЎС“Р В±Р В»Р С‘Р С”Р В°РЎвЂ Р С‘Р ВµР в„– Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–</td></tr><tr><td width="100%" class="contentEntry1"><table>';
			if ($perm[$permGroupMode . '.publish']) {
				$tvars['plugin']['nsched'] .= '<tr><td>Р вЂќР В°РЎвЂљР В° Р Р†Р С”Р В»РЎР‹РЎвЂЎР ВµР Р…Р С‘РЎРЏ:</td><td><input name="nsched_activate" id="nsched_activate" value="' . $nactivate . '" /> <small>( Р Р† РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљР Вµ Р вЂњР вЂњР вЂњР вЂњ-Р СљР Сљ-Р вЂќР вЂќ Р В§Р В§:Р СљР Сљ )</small></td></tr>';
			}
			if ($perm[$permGroupMode . '.unpublish']) {
				$tvars['plugin']['nsched'] .= '<tr><td>Р вЂќР В°РЎвЂљР В° Р С•РЎвЂљР С”Р В»РЎР‹РЎвЂЎР ВµР Р…Р С‘РЎРЏ:</td><td><input name="nsched_deactivate" id="nsched_deactivate" value="' . $ndeactivate . '" /> <small>( Р Р† РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљР Вµ Р вЂњР вЂњР вЂњР вЂњ-Р СљР Сљ-Р вЂќР вЂќ Р В§Р В§:Р СљР Сљ )</small></td></tr>';
			}
			$tvars['plugin']['nsched'] .= '</table></td></tr><script language="javascript" type="text/javascript">' . "$('#nsched_activate').datetimepicker({ dateFormat: 'yy-mm-dd', timeFormat: 'hh:mm', currentText: '" . $nactivate . "'});$('#nsched_deactivate').datetimepicker({ dateFormat: 'yy-mm-dd', timeFormat: 'hh:mm', currentText: '" . $ndeactivate . "'});</script>";
		}

		return 1;
	}

	function editNews($newsID, $SQLold, &$SQLnew, &$tvars) {

		global $userROW;
		$perm = checkPermission(array('plugin' => '#admin', 'item' => 'news'), null, array('personal.publish', 'personal.unpublish', 'other.publish', 'other.unpublish'));
		$isOwn = ($SQLold['author_id'] == $userROW['id']) ? 1 : 0;
		$permGroupMode = $isOwn ? 'personal' : 'other';
		if ($perm[$permGroupMode . '.publish'])
			$SQLnew['nsched_activate'] = $_REQUEST['nsched_activate'];
		if ($perm[$permGroupMode . '.unpublish'])
			$SQLnew['nsched_deactivate'] = $_REQUEST['nsched_deactivate'];

		return 1;
	}
}

register_filter('news', 'nsched', new NSchedNewsFilter);
//add_act('cron_nsched', 'plugin_nsched');
//
// Р В¤РЎС“Р Р…Р С”РЎвЂ Р С‘РЎРЏ Р Р†РЎвЂ№Р В·РЎвЂ№Р Р†Р В°Р ВµР С�Р В°РЎРЏ Р С—Р С• Р С”РЎР‚Р С•Р Р…РЎС“
//
function plugin_nsched_cron() {

	global $mysql, $catz, $catmap;
	// Р РЋР С—Р С‘РЎРѓР С•Р С” Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„– Р Т‘Р В»РЎРЏ (Р Т‘Р Вµ)Р В°Р С”РЎвЂљР С‘Р Р†Р В°РЎвЂ Р С‘Р С‘
	$listActivate = array();
	$dataActivate = array();
	$listDeactivate = array();
	$dataDeactivate = array();
	// Р вЂ™РЎвЂ№Р В±Р С‘РЎР‚Р В°Р ВµР С� Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р Т‘Р В»РЎРЏ Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№РЎвЂ¦ РЎРѓРЎР‚Р В°Р В±Р С•РЎвЂљР В°Р В» РЎвЂћР В»Р В°Р С– "Р С•Р С—РЎС“Р В±Р В»Р С‘Р С”Р С•Р Р†Р В°РЎвЂљРЎРЉ Р С—Р С• Р Т‘Р В°РЎвЂљР Вµ"
	foreach ($mysql->select("select * from " . prefix . "_news where (nsched_activate>0) and (nsched_activate <= now())") as $row) {
		$listActivate[] = $row['id'];
		$dataActivate[$row['id']] = $row;
		//$mysql->query("update ".prefix."_news set approve=1, nsched_activate=0 where id = ".$row['id']);
	}
	// Р вЂ™РЎвЂ№Р В±Р С‘РЎР‚Р В°Р ВµР С� Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р Т‘Р В»РЎРЏ Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№РЎвЂ¦ РЎРѓРЎР‚Р В°Р В±Р С•РЎвЂљР В°Р В» РЎвЂћР В»Р В°Р С– "РЎРѓР Р…РЎРЏРЎвЂљРЎРЉ Р С—РЎС“Р В±Р В»Р С‘Р С”Р В°РЎвЂ Р С‘РЎР‹ Р С—Р С• Р Т‘Р В°РЎвЂљР Вµ"
	foreach ($mysql->select("select * from " . prefix . "_news where (nsched_deactivate>0) and (nsched_deactivate <= now())") as $row) {
		$listDeactivate[] = $row['id'];
		$dataDeactivate[$row['id']] = $row;
		//$mysql->query("update ".prefix."_news set approve=0, nsched_deactivate=0 where id = ".$row['id']);
	}
	// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С�, Р ВµРЎРѓРЎвЂљРЎРЉ Р В»Р С‘ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р Т‘Р В»РЎРЏ (Р Т‘Р Вµ)Р В°Р С”РЎвЂљР С‘Р Р†Р В°РЎвЂ Р С‘Р С‘
	if (count($listActivate) || count($listDeactivate)) {
		// Р вЂ”Р В°Р С–РЎР‚РЎС“Р В¶Р В°Р ВµР С� Р Р…Р ВµР С•Р В±РЎвЂ¦Р С•Р Т‘Р С‘Р С�РЎвЂ№Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р…РЎвЂ№
		loadActionHandlers('admin');
		loadActionHandlers('admin:mod:editnews');
		// Р вЂ”Р В°Р С–РЎР‚РЎС“Р В¶Р В°Р ВµР С� РЎРѓР С‘РЎРѓРЎвЂљР ВµР С�Р Р…РЎС“РЎР‹ Р В±Р С‘Р В±Р В»Р С‘Р С•РЎвЂљР ВµР С”РЎС“
		require_once(root . 'includes/inc/lib_admin.php');
		// Р вЂ”Р В°Р С—РЎС“РЎРѓР С”Р В°Р ВµР С� Р С�Р С•Р Т‘Р С‘РЎвЂћР С‘Р С”Р В°РЎвЂ Р С‘РЎР‹ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–
		if (count($listActivate)) {
			massModifyNews(array('data' => $dataActivate), array('approve' => 1, 'nsched_activate' => ''), false);
		}
		if (count($listDeactivate)) {
			massModifyNews(array('data' => $dataDeactivate), array('approve' => 0, 'nsched_deactivate' => ''), false);
		}
	}
}

