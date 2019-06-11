<?php

// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');

function plugin_rating_update(){
	global $mysql, $twig, $userROW;

	LoadPluginLang('rating', 'site');

	// Security protection - limit rating values between 1..5
	$rating = intval($_REQUEST['rating']);
	$itemID = intval($_REQUEST['itemID']);
	$item = trim(secure_html($_REQUEST['item']));
	if (!in_array($item, array('news', 'static', 'users', 'comments')))
		return 'incorrect rating';

	if ( ($rating < -1) or ($rating > 5) ) {
		return 'incorrect rating';
	}

	// Check if referred news exists
	if (!is_array($row = $mysql->record("select * from ".prefix."_".$item." where id = ".db_squote($itemID)))) {
		return 'referred '.$item.' not found';
	}

	// Check if we try to make a duplicated rate
	if ($_COOKIE['rating'.$item.$row['id']])
		return 'you already made your rate';

	// Check if we feet "register only" limitation
	if (pluginGetVariable('rating', $item.'_regonly') && !is_array($userROW)) {
		return 'only registered users can rate '.$item;
	}

	// Ok, everything is fine. Let's update rating.

	@setcookie('rating'.'_'.$item.'_'.$itemID, 'voted', (time() + 31526000), '/');
	$mysql->query("update ".prefix."_".$item." set rating=rating+".$rating.", votes=votes+1 where id = ".db_squote($itemID));
	$data = $mysql->record("select rating, votes from ".prefix."_".$item." where id = ".db_squote($itemID));

	$localskin = pluginGetVariable('rating', $item.'_localskin');
	if (!$localskin) $localskin='basic';
	$tpath = locatePluginTemplates(array('rating', ':rating.css'), 'rating', pluginGetVariable('rating', $item.'_localsource'), $localskin);
	register_stylesheet($tpath['url::rating.css'].'/rating.css'); 

	$tVars = array(
		'tpl_url' => $tpath['url::rating.css'],
		'home' => home,
		'rating' => ($data['rating'] == 0) ? 0 : round(($data['rating'] / $data['votes']), 0),
		'rating_p' => ($data['rating'] == 0) ? 0 : $data['rating'],
		'item' => $item,
		'votes' => $data['votes'],
		);
	
	$templateName = 'rating';
	$xt = $twig->loadTemplate($tpath[$templateName] . $templateName . '.tpl');
	return $xt->render($tVars);
}

function rating_show($item, $itemID, $rating, $votes){
	global $twig, $userROW;

	LoadPluginLang('rating', 'site');
	$localskin = pluginGetVariable('rating', $item.'_localskin');
	if (!$localskin) $localskin='ancient';

	$tpath = locatePluginTemplates(array('rating', 'rating.form', ':rating.css'), 'rating', pluginGetVariable('rating', $item.'_localsource'), $localskin);
	register_stylesheet($tpath['url::rating.css'].'/rating.css'); 
	
	$tVars = array(
		'tpl_url' => $tpath['url::rating.css'],
		'home' => home,
		'ajax_url' => generateLink('core', 'plugin', array('plugin' => 'rating'), array()),
		'item' => $item,
		'itemID' => $itemID,
		'rating' => (!$rating or !$votes) ? 0 : round(($rating / $votes), 0),
		'rating_p' => (!$rating) ? 0 : $rating,
		'votes' => $votes,
		);

	if ((isset($_COOKIE['rating'.'_'.$item.'_'.$itemID]) && $_COOKIE['rating'.'_'.$item.'_'.$itemID]) or (pluginGetVariable('rating', $item.'_regonly') && !is_array($userROW))) {
		// Show
		$templateName = 'rating';
		$xt = $twig->loadTemplate($tpath[$templateName] . $templateName . '.tpl');
		return $xt->render($tVars);
	} else {
		// Edit
		$templateName = 'rating.form';
		$xt = $twig->loadTemplate($tpath[$templateName] . $templateName . '.tpl');
		return $xt->render($tVars);
	}
	return;
}

function plugin_rating_screen(){
	global $SUPRESS_TEMPLATE_SHOW, $template;

	@header('Content-type: text/html; charset="windows-1251"');
	if ($_REQUEST['item'] and $_REQUEST['itemID']) {
		$template['vars']['mainblock'] = plugin_rating_update();
		$SUPRESS_TEMPLATE_SHOW = 1;
	} else {
		$template['vars']['mainblock'] = 'unsupported action';
	}
}

//
// Manage NEWS modifications
if ( pluginGetVariable('rating', 'news_enable') ) {

	// RatingNewsFilter
	class RatingNewsFilter extends NewsFilter {
		function showNews($newsID, $SQLnews, &$tvars, $mode = array()) {
			$tvars['vars']['news']['rating'] = rating_show('news', $SQLnews['id'], $SQLnews['rating'], $SQLnews['votes']);}
	}

	pluginRegisterFilter('news','rating', new RatingNewsFilter);
}

//
// Manage STATIC modifications
if ( pluginGetVariable('rating', 'static_enable') ) {

	// RatingStaticFilter
	class RatingStaticFilter extends StaticFilter {
		function showStatic($staticID, $SQLstatic, &$tvars, $mode) {
			$tvars['vars']['static.rating'] = rating_show('static', $SQLstatic['id'], $SQLstatic['rating'], $SQLstatic['votes']);}
	}

	pluginRegisterFilter('static','rating', new RatingStaticFilter);
}

//
// Manage UPROFILE modifications
if ( pluginGetVariable('rating', 'users_enable') and getPluginStatusActive('uprofile')) {
	LoadPluginLibrary('uprofile', 'lib');

	// RatingUprofileFilter
	class RatingUprofileFilter extends p_uprofileFilter {
		function showProfile($userID, $SQLrow, &$tvars) {
			$tvars['user']['rating'] = rating_show('users', $SQLrow['id'], $SQLrow['rating'], $SQLrow['votes']);}
	}

	pluginRegisterFilter('plugin.uprofile', 'rating', new RatingUprofileFilter);
}

//
// Manage COMMENTS modifications
if ( pluginGetVariable('rating', 'comments_enable') and getPluginStatusActive('comments') ) {
	LoadPluginLibrary('comments', 'lib');

	// RatingUprofileFilter
	class RatingCommentsFilter extends FilterComments {
		function showComments($newsID, $commRec, $comnum, &$tvars) {
			$tvars['vars']['comment.rating'] = rating_show('comments', $commRec['id'], $commRec['rating'], $commRec['votes']);
			$tvars['vars']['user.rating'] = rating_show('users', $commRec['author_id'], $commRec['users_rating'], $commRec['users_votes']);
		}
		function commentsJoinFilter() {
			return array ( 'users' => array ( 'fields' => array ( 'rating', 'votes' )));
		}
	}

	pluginRegisterFilter('comments', 'rating', new RatingCommentsFilter);
}

//
//
register_plugin_page('rating','','plugin_rating_screen',0);
