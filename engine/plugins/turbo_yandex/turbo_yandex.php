<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
include_once root."/includes/news.php";
register_plugin_page('turbo_yandex','','plugin_turbo_yandex',0);
register_plugin_page('turbo_yandex','category','plugin_turbo_yandex_category',0);
function plugin_turbo_yandex() {
	plugin_turbo_yandex_generate();
}
function plugin_turbo_yandex_category($params) {
	plugin_turbo_yandex_generate($params['category']);
}
function plugin_turbo_yandex_generate($catname = ''){
   	global $lang, $PFILTERS, $template, $config, $SUPRESS_TEMPLATE_SHOW, $SUPRESS_MAINBLOCK_SHOW, $mysql, $catz, $catmap, $parse, $twigStringLoader;
	// Initiate instance of TWIG engine with string loader
	$twigString = new Twig_Environment($twigStringLoader);
	// Disable executing of `index` action (widget plugins and so on..)
	actionDisable('index');
	// Suppress templates
	$SUPRESS_TEMPLATE_SHOW = 1;
	$SUPRESS_MAINBLOCK_SHOW = 1;
	// Break if category specified & doesn't exist
	if (($catname != '') && (!isset($catz[$catname]))) {
		header('HTTP/1.1 404 Not found');
		exit;
	}
	// Generate header
	$xcat = (($catname != '') && isset($catz[$catname]))?$catz[$catname]:'';
	// Generate cache file name [ we should take into account SWITCHER plugin ]
	// Take into account: FLAG: use_hide, check if user is logged in
	$cacheFileName = md5('turbo_yandex'.$config['theme'].$config['home_url'].$config['default_lang'].(is_array($xcat)?$xcat['id']:'').pluginGetVariable('turbo_yandex','use_hide').is_array($userROW)).'.txt';
	if (pluginGetVariable('turbo_yandex','cache')) {
		$cacheData = cacheRetrieveFile($cacheFileName, pluginGetVariable('turbo_yandex','cacheExpire'), 'turbo_yandex');
		if ($cacheData != false) {
			// We got data from cache. Return it and stop
			print $cacheData;
			return;
		}
	}
	// Generate output
	$output = plugin_turbo_yandex_mk_header($xcat);
	$maxAge = pluginGetVariable('turbo_yandex','news_age');
	$delay = intval(pluginGetVariable('turbo_yandex', 'delay'));
	if ((!is_numeric($maxAge)) || ($maxAge<0) || ($maxAge>100)) { $maxAge = 10; }
	$old_locale = setlocale(LC_TIME,0);
	setlocale(LC_TIME,'en_EN');
	$query = '';
	$orderBy = "id desc";
	if (is_array($xcat)) {
		$orderBy = ($xcat['orderby'] && in_array($xcat['orderby'], array('id desc', 'id asc', 'postdate desc', 'postdate asc', 'title desc', 'title asc')))?$xcat['orderby']:'id desc';
		$query = "select * from ".prefix."_news where catid regexp '[[:<:]](".$xcat['id'].")[[:>:]]' and approve=1 ";
	} else {
		$query = "select * from ".prefix."_news where approve=1 ";
	}
	$query .= (($delay>0)?(" and ((postdate + ".intval($delay*60).") < unix_timestamp(now())) "):'');
	$query .= " and ((postdate + ".intval($maxAge*86400).") > unix_timestamp(now())) ";
	$query .= ""	." order by ".$orderBy;
	// Fetch SQL record
	$sqlData = $mysql->select($query." limit 100");
	// Check if enclosure is requested and used for "images" field
	$xFList = array();
	$encImages = array();
	$enclosureIsImages = false;
	if (pluginGetVariable('turbo_yandex', 'xfEnclosureEnabled') && getPluginStatusActive('xfields')) {
		$xFList = xf_configLoad();
		$eFieldName = pluginGetVariable('turbo_yandex','xfEnclosure');
		if (isset($xFList['news'][$eFieldName]) && ($xFList['news'][$eFieldName]['type'] == 'images')) {
			$enclosureIsImages = true;
			// Prepare list of news with attached images
			$nAList = array();
			foreach ($sqlData as $row) {
				if ($row['num_images'] > 0)
					$nAList []= $row['id'];
			}
			$iQuery = "select * from ".prefix."_images where (linked_ds = 1) and (linked_id in (".join(",", $nAList).")) and (plugin = 'xfields') and (pidentity = ".db_squote($eFieldName).")";
			foreach ($mysql->select($iQuery) as $row) {
				if (!isset($encImages[$row['linked_id']]))
					$encImages[$row['linked_id']] = $row;
			}
		}
	}
	$newsTitleFormat = pluginGetVariable('turbo_yandex', 'news_title')?pluginGetVariable('turbo_yandex', 'news_title'):'{% if masterCategoryName %}{{masterCategoryName}} :: {% endif %}{{newsTitle}}';
	foreach ($sqlData as $row) {
		// Make standart system call in 'export' mode
        $newsVars = news_showone($row['id'], '', array( 'emulate' => $row, 'style' => 'exportVars', 'extractEmbeddedItems' => pluginGetVariable('turbo_yandex', 'textEnclosureEnabled')?1:0, 'plugin' => 'turbo_yandex' ));
		$enclosureList = array();
		// Check if Enclosure `xfields` integration is activated
		if (pluginGetVariable('turbo_yandex', 'xfEnclosureEnabled') && (true || getPluginStatusActive('xfields'))) {
			// Load (if needed XFIELDS plugin
			include_once(root."/plugins/xfields/xfields.php");
			if (is_array($xfd = xf_decode($row['xfields'])) && isset($xfd[pluginGetVariable('turbo_yandex','xfEnclosure')])) {
				// Check enclosure field type
				if ($enclosureIsImages) {
					// images
					if (isset($encImages[$row['id']])) {
						$enclosureList []= '   <enclosure url="'.($encImages[$row['id']]['storage']?$config['attach_url']:$config['images_url']).'/'.$encImages[$row['id']]['folder'].'/'.$encImages[$row['id']]['name'].'" />';
					}
				} else {
					// text
					$enclosureList []= '   <enclosure url="'.$xfd[pluginGetVariable('turbo_yandex','xfEnclosure')].'" />';
				}
			}
		}
		// Check if embedded items should be exported in enclosure
		if (pluginGetVariable('turbo_yandex', 'textEnclosureEnabled') && isset($newsVars['news']['embed']['images']) && is_array($newsVars['news']['embed']['images'])) {
			foreach ($newsVars['news']['embed']['images'] as $url) {
				// Check for absolute link
				if (!preg_match('#^http(s{0,1})\:\/\/#', $url)) $url = home . $url;
				$enclosureList []= '   <enclosure url="'.$url.'" />';
			}
		}
		// Calculate news category list
		$catList = array();
		foreach (explode(",", $row['catid']) as $v) {
			if (isset($catmap[$v])) {
				$catList []= $catz[$catmap[$v]]['name'];
			}
		}
		$masterCategoryName = '';
		if (count($catList))
			$masterCategoryName = $catList[0];
		$output .= "   <title>".((pluginGetVariable('rss_export','news_title') == 1)&&GetCategories($row['catid'],true)?GetCategories($row['catid'], true).' :: ':'').secure_html($row['title'])."</title>\n";
		$output .= "   <link>".newsGenerateLink($row, false, 0, true)."</link>\n";
		$output .= "   <pubDate>".gmstrftime('%a, %d %b %Y %H:%M:%S GMT',$row['postdate'])."</pubDate>\n";
		$output .= "  <turbo:content>\n";
		$output .= "   <description>".$newsVars['short-story']."</description>\n";
		// Generate list of enclosures
		$output .= join("\n", $enclosureList);
		if (count($enclosureList)) $output .= "\n";
		$output .= "   <category>".GetCategories($row['catid'], true)."</category>\n";
		$output .= "   <guid isPermaLink=\"false\">".home."?id=".$row['id']."</guid>\n";
		$output .= "</turbo:content>\n";
	}
	setlocale(LC_TIME,$old_locale);
	$output .= " </item>\n</channel>\n</rss>\n";
	// Print output
	print $output;
	if (pluginGetVariable('turbo_yandex','cache')) {
		cacheStoreFile($cacheFileName, $output, 'turbo_yandex');
	}
}
function plugin_turbo_yandex_mk_header($xcat) {
	global $config, $twigStringLoader;
	// Initiate instance of TWIG engine with string loader
	$twigString = new Twig_Environment($twigStringLoader);
	$feedTitleFormat = pluginGetVariable('turbo_yandex', 'feed_title')?pluginGetVariable('turbo_yandex', 'feed_title'):'{{ siteTitle }}';
	// Generate RSS header
	$line = '<?xml version="1.0" encoding="utf-8"?>'."\n";
	$line.= ' <rss xmlns:yandex="http://news.yandex.ru"
	xmlns:media="http://search.yahoo.com/mrss/"
	xmlns:turbo="http://turbo.yandex.ru"
	version="2.0">'."\n";
	$line.= " <channel>\n";
	// Channel title
	$line.= "  <title>".pluginGetVariable('rss_export', 'feed_title_value')."</title>\n";
	// LINK
	$line.= "  <link>".$config['home_url']."</link>\n";
	// Description
	$line.= "  <description>".$config['description']."</description>\n";
    // Description
	$line.= "  <item turbo='true'>\n";
	$line.= "<link>".generateLink('news', 'main', array(), array(), false, true)."</link>\n";
	return $line;
}
