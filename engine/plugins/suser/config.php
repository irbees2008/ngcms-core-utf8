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
					'descr' => array('russian' => 'Р РЋР С—Р С‘РЎРѓР С•Р С” Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р ВµР в„–'),
				)
			);
			$ULIB->registerCommand('suser', 'search',
				array(
					'vars'  => array(),
					'descr' => array('russian' => 'Р СџР С•Р С‘РЎРѓР С” Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р ВµР в„–'),
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
	$url = '<option value="0" ' . (empty($url) ? 'selected' : '') . '>Р СњР ВµРЎвЂљ</option><option value="1" ' . (!empty($url) ? 'selected' : '') . '>Р вЂќР В°</option>';
	$pvars['vars']['info'] = $url;
	$tpl->template('url', $tpath['config/url'] . 'config');
	$tpl->vars('url', $pvars);
	$tvars['vars'] = array(
		'entries' => $tpl->show('url'),
		'global'  => 'Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р В° Р В§Р СџР Р€'
	);
	$tpl->template('main', $tpath['config/main'] . 'config');
	$tpl->vars('main', $tvars);
	print $tpl->show('main');
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
	$localsource = '<option value="0" ' . (empty($localsource) ? 'selected' : '') . '>Р РЃР В°Р В±Р В»Р С•Р Р… РЎРѓР В°Р в„–РЎвЂљР В°</option><option value="1" ' . (!empty($localsource) ? 'selected' : '') . '>Р СџР В»Р В°Р С–Р С‘Р Р…</option>';
	if (empty($user_per_page))
		msg(array("type" => "error", "text" => "Р С™РЎР‚Р С‘РЎвЂљР С‘РЎвЂЎР ВµРЎРѓР С”Р В°РЎРЏ Р С•РЎв‚¬Р С‘Р В±Р С”Р В°. <br /> Р СњР Вµ Р В·Р В°Р Т‘Р В°Р Р…Р С• Р С”Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С• Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р ВµР в„– Р Р…Р В° РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р Вµ"), 1);
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
		'global'  => 'Р С›Р В±РЎвЂ°Р С‘Р Вµ'
	);
	$tpl->template('main', $tpath['config/main'] . 'config');
	$tpl->vars('main', $tvars);
	print $tpl->show('main');
}

function redirect_suser($url) {

	if (headers_sent()) {
		echo "<script>document.location.href='{$url}';</script>\n";
	} else {
		header('HTTP/1.1 302 Moved Permanently');
		header("Location: {$url}");
	}
}