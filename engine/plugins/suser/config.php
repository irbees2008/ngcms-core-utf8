<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
plugins_load_config();
LoadPluginLang('suser', 'config', '', '', '#');
switch ($_REQUEST['action']) {
	case 'url':
		url();
		break;
	default:
		main();
}
function url() {

	global $tpl;
	$tpath = locatePluginTemplates(array('config/main', 'config/url'), 'suser', 1);
	if (isset($_REQUEST['submit'])) {
		if (isset($_REQUEST['url']) && !empty($_REQUEST['url'])) {
			$ULIB = new urlLibrary();
			$ULIB->loadConfig();
			$ULIB->registerCommand('suser', '',
				array(
					'vars'  =>
						array(),
					'descr' => array('russian' => 'РЎРїРёСЃРѕРє РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№'),
				)
			);
			$ULIB->registerCommand('suser', 'search',
				array(
					'vars'  => array(),
					'descr' => array('russian' => 'РџРѕРёСЃРє РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№'),
				)
			);
			$ULIB->saveConfig();
		} else {
			$ULIB = new urlLibrary();
			$ULIB->loadConfig();
			$ULIB->removeCommand('suser', '');
			$ULIB->removeCommand('suser', 'search');
			$ULIB->saveConfig();
		}
		pluginSetVariable('suser', 'url', intval($_REQUEST['url']));
		pluginsSaveConfig();
		redirect_suser('?mod=extra-config&plugin=suser&url');
	}
	$url = pluginGetVariable('suser', 'url');
	$url = '<option value="0" ' . (empty($url) ? 'selected' : '') . '>РќРµС‚</option><option value="1" ' . (!empty($url) ? 'selected' : '') . '>Р”Р°</option>';
	$pvars['vars']['info'] = $url;
	$tpl->template('url', $tpath['config/url'] . 'config');
	$tpl->vars('url', $pvars);
	$tvars['vars'] = array(
		'entries' => $tpl->show('url'),
		'global'  => 'РќР°СЃС‚СЂРѕР№РєР° Р§РџРЈ'
	);
	$tpl->template('main', $tpath['config/main'] . 'config');
	$tpl->vars('main', $tvars);
	$main_admin = $tpl->show('main');
}

function main() {

	global $tpl;
	$tpath = locatePluginTemplates(array('config/main', 'config/general.from'), 'suser', 1);
	if (isset($_REQUEST['submit'])) {
		pluginSetVariable('suser', 'user_per_page', intval($_REQUEST['user_per_page']));
		pluginSetVariable('suser', 'title_plg', trim($_REQUEST['title_plg']));
		pluginSetVariable('suser', 'description', secure_html($_REQUEST['description']));
		pluginSetVariable('suser', 'keywords', secure_html($_REQUEST['keywords']));
		pluginSetVariable('suser', 'localsource', intval($_REQUEST['localsource']));
		pluginsSaveConfig();
		redirect_suser('?mod=extra-config&plugin=suser');
	}
	$user_per_page = pluginGetVariable('suser', 'user_per_page');
	$title_plg = pluginGetVariable('suser', 'title_plg');
	$description = pluginGetVariable('suser', 'description');
	$keywords = pluginGetVariable('suser', 'keywords');
	$localsource = pluginGetVariable('suser', 'localsource');
	$localsource = '<option value="0" ' . (empty($localsource) ? 'selected' : '') . '>РЁР°Р±Р»РѕРЅ СЃР°Р№С‚Р°</option><option value="1" ' . (!empty($localsource) ? 'selected' : '') . '>РџР»Р°РіРёРЅ</option>';
	if (empty($user_per_page))
		msg(array("type" => "error", "text" => "РљСЂРёС‚РёС‡РµСЃРєР°СЏ РѕС€РёР±РєР°. <br /> РќРµ Р·Р°РґР°РЅРѕ РєРѕР»РёС‡РµСЃС‚РІРѕ РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№ РЅР° СЃС‚СЂР°РЅРёС†Рµ"), 1);
	$pvars['vars'] = array(
		'user_per_page' => $user_per_page,
		'title_plg'     => $title_plg,
		'description'   => $description,
		'keywords'      => $keywords,
		'localsource'   => $localsource,
	);
	$tpl->template('general.from', $tpath['config/general.from'] . 'config');
	$tpl->vars('general.from', $pvars);
	$tvars['vars'] = array(
		'entries' => $tpl->show('general.from'),
		'global'  => 'РћР±С‰РёРµ'
	);
	$tpl->template('main', $tpath['config/main'] . 'config');
	$tpl->vars('main', $tvars);
	$main_admin = $tpl->show('main');
}

function redirect_suser($url) {

	if (headers_sent()) {
		echo "<script>document.location.href='{$url}';</script>\n";
	} else {
		header('HTTP/1.1 302 Moved Permanently');
		header("Location: {$url}");
	}
}