<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
LoadPluginLibrary('xfields', 'common');
LoadPluginLibrary('feedback', 'common');
register_htmlvar('js', admin_url . '/plugins/basket/js/basket.js');
//
// Р С›РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘Р Вµ Р С•Р В±РЎвЂ°Р ВµР в„– Р С‘Р Р…РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂ Р С‘Р С‘/Р С•РЎРѓРЎвЂљР В°РЎвЂљР С”Р С•Р Р† Р Р† Р С”Р С•РЎР‚Р В·Р С‘Р Р…Р Вµ
function plugin_basket_total() {

	global $mysql, $twig, $userROW, $template;
	// Р С›Р С—РЎР‚Р ВµР Т‘Р ВµР В»РЎРЏР ВµР С� РЎС“РЎРѓР В»Р С•Р Р†Р С‘РЎРЏ Р Р†РЎвЂ№Р В±Р С•РЎР‚Р С”Р С‘
	$filter = array();
	if (is_array($userROW)) {
		$filter [] = '(user_id = ' . db_squote($userROW['id']) . ')';
	}
	if (isset($_COOKIE['ngTrackID']) && ($_COOKIE['ngTrackID'] != '')) {
		$filter [] = '(cookie = ' . db_squote($_COOKIE['ngTrackID']) . ')';
	}
	// Р РЋРЎвЂЎР С‘РЎвЂљР В°Р ВµР С� Р С‘РЎвЂљР С•Р С–Р С‘
	$tCount = 0;
	$tPrice = 0;
	if (count($filter) && is_array($res = $mysql->record("select count(*) as count, sum(price*count) as price from " . prefix . "_basket where " . join(" or ", $filter), 1))) {
		$tCount = $res['count'];
		$tPrice = $res['price'];
	}
	// Р вЂњР С•РЎвЂљР С•Р Р†Р С‘Р С� Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎвЂ№Р Вµ
	$tVars = array(
		'count' => $tCount,
		'price' => $tPrice,
	);
	// Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� РЎв‚¬Р В°Р В±Р В»Р С•Р Р…
	$tpath = locatePluginTemplates(array('total'), 'basket', pluginGetVariable('basket', 'localsource'));
	$xt = $twig->loadTemplate($tpath['total'] . '/total.tpl');
	$template['vars']['plugin_basket'] = $xt->render($tVars);
}

//
// Р СџР С•Р С”Р В°Р В·Р В°РЎвЂљРЎРЉ РЎРѓР С•Р Т‘Р ВµРЎР‚Р В¶Р С‘Р С�Р С•Р Вµ Р С”Р С•РЎР‚Р В·Р С‘Р Р…РЎвЂ№
function plugin_basket_list() {

	global $mysql, $twig, $userROW, $template;
	// Р С›Р С—РЎР‚Р ВµР Т‘Р ВµР В»РЎРЏР ВµР С� РЎС“РЎРѓР В»Р С•Р Р†Р С‘РЎРЏ Р Р†РЎвЂ№Р В±Р С•РЎР‚Р С”Р С‘
	$filter = array();
	if (is_array($userROW)) {
		$filter [] = '(user_id = ' . db_squote($userROW['id']) . ')';
	}
	if (isset($_COOKIE['ngTrackID']) && ($_COOKIE['ngTrackID'] != '')) {
		$filter [] = '(cookie = ' . db_squote($_COOKIE['ngTrackID']) . ')';
	}
	// Р вЂ™РЎвЂ№Р С—Р С•Р В»Р Р…РЎРЏР ВµР С� Р Р†РЎвЂ№Р В±Р С•РЎР‚Р С”РЎС“
	$recs = array();
	$total = 0;
	if (count($filter)) {
		foreach ($mysql->select("select * from " . prefix . "_basket where " . join(" or ", $filter), 1) as $rec) {
			$total += round($rec['price'] * $rec['count'], 2);
			$rec['sum'] = sprintf('%9.2f', round($rec['price'] * $rec['count'], 2));
			$rec['xfields'] = unserialize($rec['linked_fld']);
			unset($rec['linked_fld']);
			$recs [] = $rec;
		}
	}
	$tVars = array(
		'recs'     => count($recs),
		'entries'  => $recs,
		'total'    => sprintf('%9.2f', $total),
		'form_url' => generatePluginLink('feedback', null, array(), array('id' => intval(pluginGetVariable('basket', 'feedback_form')))),
	);
	// Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� РЎв‚¬Р В°Р В±Р В»Р С•Р Р…
	$xt = $twig->loadTemplate('plugins/basket/list.tpl');
	$template['vars']['mainblock'] = $xt->render($tVars);
}

// Update basket content/counters
function plugin_basket_update() {

	global $mysql, $twig, $userROW, $template, $SUPRESS_TEMPLATE_SHOW;
	// Р С›Р С—РЎР‚Р ВµР Т‘Р ВµР В»РЎРЏР ВµР С� РЎС“РЎРѓР В»Р С•Р Р†Р С‘РЎРЏ Р Р†РЎвЂ№Р В±Р С•РЎР‚Р С”Р С‘
	$filter = array();
	if (is_array($userROW)) {
		$filter [] = '(user_id = ' . db_squote($userROW['id']) . ')';
	}
	if (isset($_COOKIE['ngTrackID']) && ($_COOKIE['ngTrackID'] != '')) {
		$filter [] = '(cookie = ' . db_squote($_COOKIE['ngTrackID']) . ')';
	}
	// Scan POST params
	if (count($filter)) {
		foreach ($_POST as $k => $v) {
			if (preg_match('#^count_(\d+)$#', $k, $m)) {
				if (intval($v) < 1) {
					$mysql->query("delete from " . prefix . "_basket where (id = " . db_squote($m[1]) . ") and (" . join(" or ", $filter) . ")");
				} else {
					$mysql->query("update " . prefix . "_basket set count = " . db_squote(intval($v)) . "where (id = " . db_squote($m[1]) . ") and (" . join(" or ", $filter) . ")");
				}
			}
		}
	}
	// Redirect to basket page
	$SUPRESS_TEMPLATE_SHOW = true;
	@header("Location: " . generatePluginLink('basket', null, array(), array(), false, true));
}

// XFields filter
if (class_exists('XFieldsFilter') && class_exists('FeedbackFilter')) {
	class BasketXFieldsFilter extends XFieldsFilter {

		function showTableEntry($newsID, $SQLnews, $rowData, &$rowVars) {

			global $DSlist;
			// Р С›Р С—РЎР‚Р ВµР Т‘Р ВµР В»РЎРЏР ВµР С� - РЎР‚Р В°Р В±Р С•РЎвЂљР В°Р ВµР С� Р В»Р С‘ Р С�РЎвЂ№ Р Р†Р Р…РЎС“РЎвЂљРЎР‚Р С‘ РЎРѓРЎвЂљРЎР‚Р С•Р С” РЎвЂљР В°Р В±Р В»Р С‘РЎвЂ 
			if (!pluginGetVariable('basket', 'ntable_flag'))
				return;
			// Р В Р В°Р В±Р С•РЎвЂљР В°Р ВµР С�. Р С›Р С—РЎР‚Р ВµР Т‘Р ВµР В»РЎРЏР ВµР С� РЎР‚Р ВµР В¶Р С‘Р С� РЎР‚Р В°Р В±Р С•РЎвЂљРЎвЂ№ - Р С—Р С• Р Р†РЎРѓР ВµР С� РЎРѓРЎвЂљРЎР‚Р С•Р С”Р В°Р С� Р С‘Р В»Р С‘ Р С—Р С• РЎС“РЎРѓР В»Р С•Р Р†Р С‘РЎР‹ "Р С—Р С•Р В»Р Вµ Р С‘Р В· xfields Р Р…Р Вµ РЎР‚Р В°Р Р†Р Р…Р С• Р Р…РЎС“Р В»РЎР‹"
			if (pluginGetVariable('basket', 'ntable_activated')) {
				if (!$rowData['xfields_' . pluginGetVariable('basket', 'ntable_xfield')])
					return;
			}
			$rowVars['flags']['basket_allow'] = true;
			$rowVars['basket_link'] = generatePluginLink('basket', 'add', array('ds' => $DSlist['#xfields:tdata'], 'id' => $rowData['id']), array(), false, true);
			// Р РЋРЎвЂљРЎР‚Р С•Р С”РЎС“ Р С�Р С•Р В¶Р Р…Р С• Р Т‘Р С•Р В±Р В°Р Р†Р В»РЎРЏРЎвЂљРЎРЉ Р Р† Р С”Р С•РЎР‚Р В·Р С‘Р Р…РЎС“
			//print "rowData <pre>(".var_export($rowVars, true).")</pre><br/>\n";
		}
	}

	// Feedback filter
	class BasketFeedbackFilter extends FeedbackFilter {

		// Action executed when form is showed
		function onShow($formID, $formStruct, $formData, &$tvars) {

			global $userROW, $mysql, $twig;
			// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С� ID РЎвЂћР С•РЎР‚Р С�РЎвЂ№ - Р Т‘Р В°Р Р…Р Р…РЎвЂ№Р Вµ Р С”Р С•РЎР‚Р В·Р С‘Р Р…РЎвЂ№ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎР‹РЎвЂљРЎРѓРЎРЏ РЎвЂљР С•Р В»РЎРЉР С”Р С• Р Р† Р С”Р С•Р Р…Р С”РЎР‚Р ВµРЎвЂљР Р…Р С•Р в„– РЎвЂћР С•РЎР‚Р С�Р Вµ
			if (pluginGetVariable('basket', 'feedback_form') != $formID)
				return;
			// Р С›Р С—РЎР‚Р ВµР Т‘Р ВµР В»РЎРЏР ВµР С� РЎС“РЎРѓР В»Р С•Р Р†Р С‘РЎРЏ Р Р†РЎвЂ№Р В±Р С•РЎР‚Р С”Р С‘
			$filter = array();
			if (is_array($userROW)) {
				$filter [] = '(user_id = ' . db_squote($userROW['id']) . ')';
			}
			if (isset($_COOKIE['ngTrackID']) && ($_COOKIE['ngTrackID'] != '')) {
				$filter [] = '(cookie = ' . db_squote($_COOKIE['ngTrackID']) . ')';
			}
			// Р вЂ™РЎвЂ№Р С—Р С•Р В»Р Р…РЎРЏР ВµР С� Р Р†РЎвЂ№Р В±Р С•РЎР‚Р С”РЎС“
			$recs = array();
			$total = 0;
			if (count($filter)) {
				foreach ($mysql->select("select * from " . prefix . "_basket where " . join(" or ", $filter)) as $rec) {
					$total += round($rec['price'] * $rec['count'], 2);
					$rec['sum'] = sprintf('%9.2f', round($rec['price'] * $rec['count'], 2));
					$rec['xfields'] = unserialize($rec['linked_fld']);
					unset($rec['linked_fld']);
					$recs [] = $rec;
				}
			}
			$tVars = array(
				'recs'    => count($recs),
				'entries' => $recs,
				'total'   => sprintf('%9.2f', $total),
			);
			// Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� РЎв‚¬Р В°Р В±Р В»Р С•Р Р…
			$xt = $twig->loadTemplate('plugins/basket/lfeedback.tpl');
			$tvars['plugin_basket'] .= $xt->render($tVars);
		}

		function onProcess($formID, $formStruct, $formData, $flagHTML, &$tvars) {

			global $userROW, $mysql, $twig;
			// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С� ID РЎвЂћР С•РЎР‚Р С�РЎвЂ№ - Р Т‘Р В°Р Р…Р Р…РЎвЂ№Р Вµ Р С”Р С•РЎР‚Р В·Р С‘Р Р…РЎвЂ№ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎР‹РЎвЂљРЎРѓРЎРЏ РЎвЂљР С•Р В»РЎРЉР С”Р С• Р Р† Р С”Р С•Р Р…Р С”РЎР‚Р ВµРЎвЂљР Р…Р С•Р в„– РЎвЂћР С•РЎР‚Р С�Р Вµ
			if (pluginGetVariable('basket', 'feedback_form') != $formID)
				return 1;
			// Р С›Р С—РЎР‚Р ВµР Т‘Р ВµР В»РЎРЏР ВµР С� РЎС“РЎРѓР В»Р С•Р Р†Р С‘РЎРЏ Р Р†РЎвЂ№Р В±Р С•РЎР‚Р С”Р С‘
			$filter = array();
			if (is_array($userROW)) {
				$filter [] = '(user_id = ' . db_squote($userROW['id']) . ')';
			}
			if (isset($_COOKIE['ngTrackID']) && ($_COOKIE['ngTrackID'] != '')) {
				$filter [] = '(cookie = ' . db_squote($_COOKIE['ngTrackID']) . ')';
			}
			// Р вЂ™РЎвЂ№Р С—Р С•Р В»Р Р…РЎРЏР ВµР С� Р Р†РЎвЂ№Р В±Р С•РЎР‚Р С”РЎС“
			$recs = array();
			$total = 0;
			if (count($filter)) {
				foreach ($mysql->select("select * from " . prefix . "_basket where " . join(" or ", $filter)) as $rec) {
					$total += round($rec['price'] * $rec['count'], 2);
					$rec['sum'] = sprintf('%9.2f', round($rec['price'] * $rec['count'], 2));
					$rec['xfields'] = unserialize($rec['linked_fld']);
					unset($rec['linked_fld']);
					$recs [] = $rec;
				}
			}
			$bVars = array(
				'recs'    => count($recs),
				'entries' => $recs,
				'total'   => sprintf('%9.2f', $total),
			);
			// Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘Р С� РЎв‚¬Р В°Р В±Р В»Р С•Р Р…
			$xt = $twig->loadTemplate('plugins/basket/lfeedback.tpl');
			$tvars['plugin_basket'] = $xt->render($bVars);
		}

		// Action executed when post request is completed
		function onProcessNotify($formID) {

			global $mysql, $userROW;
			// Р С›Р С—РЎР‚Р ВµР Т‘Р ВµР В»РЎРЏР ВµР С� РЎС“РЎРѓР В»Р С•Р Р†Р С‘РЎРЏ Р Р†РЎвЂ№Р В±Р С•РЎР‚Р С”Р С‘
			$filter = array();
			if (is_array($userROW)) {
				$filter [] = '(user_id = ' . db_squote($userROW['id']) . ')';
			}
			if (isset($_COOKIE['ngTrackID']) && ($_COOKIE['ngTrackID'] != '')) {
				$filter [] = '(cookie = ' . db_squote($_COOKIE['ngTrackID']) . ')';
			}
			// Р вЂ™РЎвЂ№Р С—Р С•Р В»Р Р…РЎРЏР ВµР С� Р Р†РЎвЂ№Р В±Р С•РЎР‚Р С”РЎС“
			if (count($filter)) {
				$mysql->query("delete from " . prefix . "_basket where " . join(" or ", $filter));
			}
		}
	}

	register_plugin_page('basket', '', 'plugin_basket_list', 0);
	register_plugin_page('basket', 'update', 'plugin_basket_update', 0);
	register_filter('xfields', 'basket', new BasketXFieldsFilter);
	register_filter('feedback', 'basket', new BasketFeedbackFilter);
} else {
	//print "Basket error: XFields and Feedback plugins must be activated";
}

// Perform replacements while showing news
class BasketNewsFilter extends NewsFilter {

	// Show news call :: processor (call after all processing is finished and before show)
	function showNews($newsID, $SQLnews, &$tvars, $mode = array()) {

		global $DSlist;
		// Р С›Р С—РЎР‚Р ВµР Т‘Р ВµР В»РЎРЏР ВµР С� - РЎР‚Р В°Р В±Р С•РЎвЂљР В°Р ВµР С� Р В»Р С‘ Р С�РЎвЂ№ Р Р†Р Р…РЎС“РЎвЂљРЎР‚Р С‘ РЎРѓРЎвЂљРЎР‚Р С•Р С” РЎвЂљР В°Р В±Р В»Р С‘РЎвЂ 
		if (!pluginGetVariable('basket', 'news_flag')) {
			$tvars['regx']['#\[basket\](.*?)\[\/basket\]#is'] = '';

			return;
		}
		// Р В Р В°Р В±Р С•РЎвЂљР В°Р ВµР С�. Р С›Р С—РЎР‚Р ВµР Т‘Р ВµР В»РЎРЏР ВµР С� РЎР‚Р ВµР В¶Р С‘Р С� РЎР‚Р В°Р В±Р С•РЎвЂљРЎвЂ№ - Р С—Р С• Р Р†РЎРѓР ВµР С� РЎРѓРЎвЂљРЎР‚Р С•Р С”Р В°Р С� Р С‘Р В»Р С‘ Р С—Р С• РЎС“РЎРѓР В»Р С•Р Р†Р С‘РЎР‹ "Р С—Р С•Р В»Р Вµ Р С‘Р В· xfields Р Р…Р Вµ РЎР‚Р В°Р Р†Р Р…Р С• Р Р…РЎС“Р В»РЎР‹"
		if (pluginGetVariable('basket', 'news_activated')) {
			if (!$SQLnews['xfields_' . pluginGetVariable('basket', 'news_xfield')]) {
				$tvars['regx']['#\[basket\](.*?)\[\/basket\]#is'] = '';

				return;
			}
		}
		$tvars['regx']['#\[basket\](.*?)\[\/basket\]#is'] = '$1';
		$tvars['vars']['basket_link'] = generatePluginLink('basket', 'add', array('ds' => $DSlist['news'], 'id' => $SQLnews['id']), array(), false, true);
	}
}

register_filter('news', 'basket', new BasketNewsFilter);
//
// Р вЂ™РЎвЂ№Р В·Р С•Р Р† Р С•Р В±РЎР‚Р В°Р В±Р С•РЎвЂљРЎвЂЎР С‘Р С”Р В°
add_act('index', 'plugin_basket_total');
