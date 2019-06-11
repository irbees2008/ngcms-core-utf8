<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
// Load langs
loadPluginLang('feedback', 'config', '', '', ':');
// Load library
include_once(root . "/plugins/feedback/lib/common.php");
// Switch action
switch ($_REQUEST['action']) {
	case 'addform'  :
		addForm();
		showList();
		break;
	case 'saveform':
		saveForm();
		break;
	case 'form'        :
		showForm(0);
		break;
	case 'row'        :
		showFormRow();
		break;
	case 'editrow'    :
		editFormRow();
		break;
	case 'update'    :
		if (doUpdate()) {
			showForm();
		}
		break;
	case 'delform'    :
		delForm();
		showList();
		break;
	default            :
		showList();
}
// Simply create new form
function addForm() {

	global $mysql, $lang;
	$mysql->query("insert into " . prefix . "_feedback (name, title) values ('newform', 'New form')");
}

// Save form params
function saveForm() {

	global $mysql, $lang;
	$id = intval($_REQUEST['id']);
	// First - try to fetch form
	if (!is_array($recF = $mysql->record("select * from " . prefix . "_feedback where id = " . $id))) {
		msg(array('type' => 'error', 'text' => 'Р Р€Р С”Р В°Р В·Р В°Р Р…Р Р…Р В°РЎРЏ Р Р†Р В°Р С�Р С‘ РЎвЂћР С•РЎР‚Р С�Р В° Р Р…Р Вµ РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ'));
		showForm(1);

		return;
	}
	// Р вЂњР С•РЎвЂљР С•Р Р†Р С‘Р С� РЎРѓР С—Р С‘РЎРѓР С•Р С” email Р В°Р Т‘РЎР‚Р ВµРЎРѓР С•Р Р† Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р ВµР в„–
	$emails = '';
	if (is_array($_POST['elist'])) {
		$elist = $_POST['elist'];
		$eok = array();
		$num = 1;
		foreach ($elist as $erec) {
			// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С� Р Р…Р В°Р В»Р С‘РЎвЂЎР С‘Р Вµ email'Р С•Р Р† Р Р† РЎРѓР С—Р С‘РЎРѓР С”Р Вµ
			$mlist = preg_split('# *(\,) *#', trim($erec[2], -1));
			if (count($mlist) && strlen($mlist[0])) {
				$eok[$num] = array($num, trim($erec[1]), $mlist);
				$num++;
			}
		}
		$emails = serialize($eok);
	}
	$name = trim($_REQUEST['name']);
	// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С� Р Р†Р Р†Р С•Р Т‘ Р Р…Р В°Р С‘Р С�Р ВµР Р…Р С•Р Р†Р В°Р Р…Р С‘РЎРЏ
	if ($name == '') {
		msg(array('type' => 'error', 'text' => 'Р СњР ВµР С•Р В±РЎвЂ¦Р С•Р Т‘Р С‘Р С�Р С• Р В·Р В°Р С—Р С•Р В»Р Р…Р С‘РЎвЂљРЎРЉ ID РЎвЂћР С•РЎР‚Р С�РЎвЂ№'));
		showForm(1);

		return;
	}
	// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏР ВµР С� Р Т‘РЎС“Р В±Р В»РЎРЏР В¶
	if (is_array($mysql->record("select * from " . prefix . "_feedback where id <> " . $id . " and name =" . db_squote($name)))) {
		msg(array('type' => 'error', 'text' => 'Р В¤Р С•РЎР‚Р С�Р В° РЎРѓ РЎвЂљР В°Р С”Р С‘Р С� ID РЎС“Р В¶Р Вµ РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ. Р СњР ВµР В»РЎРЉР В·РЎРЏ Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљРЎРЉ Р С•Р Т‘Р С‘Р Р…Р В°Р С”Р С•Р Р†РЎвЂ№Р в„– ID Р Т‘Р В»РЎРЏ РЎР‚Р В°Р В·Р Р…РЎвЂ№РЎвЂ¦ РЎвЂћР С•РЎР‚Р С�'));
		showForm(1);

		return;
	}
	// Р РЋР С•РЎвЂ¦РЎР‚Р В°Р Р…РЎРЏР ВµР С� Р С‘Р В·Р С�Р ВµР Р…Р ВµР Р…Р С‘РЎРЏ
	$flags = ($_REQUEST['jcheck'] ? '1' : '0') .
		($_REQUEST['captcha'] ? '1' : '0') .
		($_REQUEST['html'] ? '1' : '0') .
		(((intval($_REQUEST['link_news']) >= 0) && (intval($_REQUEST['link_news']) <= 2)) ? intval($_REQUEST['link_news']) : 0) .
		($_REQUEST['isSubj'] ? '1' : '0') .
		($_REQUEST['utf8'] ? '1' : '0');
	$params = array(
		'name'        => $name,
		'title'       => $_REQUEST['title'],
		'template'    => $_REQUEST['template'],
		'emails'      => $emails,
		'description' => $_REQUEST['description'],
		'active'      => $_REQUEST['active'],
		'flags'       => $flags,
		'subj'        => $_REQUEST['subj'],
	);
	$sqlParams = array();
	foreach ($params as $k => $v) {
		$sqlParams [] = $k . '=' . db_squote($v);
	}
	$mysql->select("update " . prefix . "_feedback set " . join(", ", $sqlParams) . " where id = " . $id);
	//$mysql->select("update ".prefix."_feedback set name=".db_squote($name).", title=".db_squote($_REQUEST['title']).", template=".db_squote($_REQUEST['template']).", emails=".db_squote($emails).", description=".db_squote($_REQUEST['description']).", active=".intval($_REQUEST['active']).", flags=".db_squote($flags)." where id = ".$id);
	showForm(1);
}

function showList() {

	global $mysql, $lang, $twig;
	$tVars = array();
	$tForms = array();
	foreach ($mysql->select("select * from " . prefix . "_feedback order by name") as $frow) {
		$tForm = array(
			'id'        => $frow['id'],
			'name'      => $frow['name'],
			'title'     => $frow['title'],
			'link_news' => intval(substr($frow['flags'], 3, 1)),
			'flags'     => array(
				'active' => $frow['active'],
			),
			'linkEdit'  => '?mod=extra-config&plugin=feedback&action=form&id=' . $frow['id'],
			'linkDel'   => '?mod=extra-config&plugin=feedback&action=delform&id=' . $frow['id'],
		);
		$tForms[] = $tForm;
	}
	$tVars['entries'] = $tForms;
	$templateName = 'plugins/feedback/tpl/conf.forms.tpl';
	$xt = $twig->loadTemplate($templateName);
	echo $xt->render($tVars);
}

function showForm($edMode) {

	global $mysql, $lang, $twig;
	$tVars = array();
	// Load form
	$id = intval($_REQUEST['id']);
	$tvars = array();
	if (!is_array($frow = $mysql->record("select * from " . prefix . "_feedback where id = " . $id))) {
		$tVars['content'] = "Р Р€Р С”Р В°Р В·Р В°Р Р…Р Р…Р В°РЎРЏ РЎвЂћР С•РЎР‚Р С�Р В° [" . $id . "] Р Р…Р Вµ РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ!";
		$xt = $twig->loadTemplate('plugins/feedback/tpl/conf.notify.tpl');
		echo $xt->render($tVars);

		return false;
	}
	$tVars['formID'] = $frow['id'];
	$tVars['formName'] = $frow['name'];
	// Unpack form data
	$fData = unserialize($frow['struct']);
	if (!is_array($fData)) $fData = array();
	$tEntries = array();
	foreach ($fData as $fName => $fInfo) {
		$tEntry = array(
			'name'  => $fInfo['name'],
			'title' => $fInfo['title'],
			'type'  => $fInfo['type'],
			'auto'  => intval($fInfo['auto']),
			'block' => intval($fInfo['block']),
		);
		$tEntries[] = $tEntry;
	}
	// Р вЂњР С•РЎвЂљР С•Р Р†Р С‘Р С� РЎРѓР С—Р С‘РЎРѓР С•Р С” email'Р С•Р Р†
	$tEGroups = array();
	if (($elist = unserialize($frow['emails'])) === false) {
		$elist[1] = array(1, '', preg_split("# *(\r\n|\n) *#", $frow['emails']));
	}
	$num = 1;
	foreach ($elist as $erec) {
		$tEGroup = array(
			'num'   => $erec[0],
			'name'  => $erec[1],
			'value' => secure_html(join(', ', $erec[2])),
		);
		$tEGroups[] = $tEGroup;
		$num++;
	}
	$tEGroups[] = array($num, '', '');
	$tVars['id'] = $frow['id'];
	$tVars['name'] = $edMode ? $_REQUEST['name'] : $frow['name'];
	$tVars['title'] = $edMode ? $_REQUEST['title'] : $frow['title'];
	$tVars['description'] = $edMode ? $_REQUEST['description'] : $frow['description'];
	$tVars['subj'] = $frow['subj'];
	$tVars['url'] = generateLink('core', 'plugin', array('plugin' => 'feedback'), array('id' => $frow['id']), true, true);
	$tVars['egroups'] = $tEGroups;
	$tVars['link_news'] = array(
		'options' => array(0, 1, 2),
		'value'   => intval(substr($frow['flags'], 3, 1)),
	);
	$tVars['flags'] = array(
		'active'   => intval($edMode ? $_REQUEST['active'] : $frow['active']),
		'jcheck'   => intval($edMode ? $_REQUEST['jcheck'] : intval(substr($frow['flags'], 0, 1))),
		'captcha'  => intval($edMode ? $_REQUEST['captcha'] : intval(substr($frow['flags'], 1, 1))),
		'html'     => intval($edMode ? $_REQUEST['html'] : intval(substr($frow['flags'], 2, 1))),
		'subj'     => intval(substr($frow['flags'], 4, 1)),
		'utf8'     => intval($edMode ? $_REQUEST['utf8'] : intval(substr($frow['flags'], 5, 1))),
		'haveForm' => 1,
	);
	// Generate list of templates
	$lf = array('' => '<Р В°Р Р†РЎвЂљР С•Р С�Р В°РЎвЂљР С‘РЎвЂЎР ВµРЎРѓР С”Р С‘>');
	foreach (feedback_listTemplates() as $k) {
		if (substr($k, 0, 1) == ':') {
			$lf[$k] = 'РЎРѓР В°Р в„–РЎвЂљ: ' . $k;
		} else {
			$lf[$k] = 'Р С—Р В»Р В°Р С–Р С‘Р Р…: ' . $k;
		}
	}
	$lout = '';
	foreach ($lf as $k => $v)
		$lout .= '<option value="' . $k . '"' . ($frow['template'] == $k ? ' selected="selected"' : '') . '>' . $v . '</option>';
	$tVars['template_options'] = $lout;
	$tVars['entries'] = $tEntries;
	// Show template files
	$tVars['tfiles'] = feedback_locateTemplateFiles($frow['template'], substr($frow['flags'], 2, 1) ? true : false);
	$xt = $twig->loadTemplate('plugins/feedback/tpl/conf.form.tpl');
	echo $xt->render($tVars);
}

function showFormRow() {

	global $mysql, $lang, $twig;
	$tVars = array();
	// Load form
	$id = intval($_REQUEST['form_id']);
	$fRowId = $_REQUEST['row'];
	$recordFound = 0;
	do {
		// Check if form exists
		if (!is_array($frow = $mysql->record("select * from " . prefix . "_feedback where id = " . $id))) {
			$tVars['content'] = "Р Р€Р С”Р В°Р В·Р В°Р Р…Р Р…Р В°РЎРЏ РЎвЂћР С•РЎР‚Р С�Р В° [" . $id . "] Р Р…Р Вµ РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ!";
			break;
		}
		$tVars['flags']['haveForm'] = 1;
		$tVars['formID'] = $frow['id'];
		$tVars['formName'] = $frow['name'];
		// Unpack form data
		$fData = unserialize($frow['struct']);
		if (!is_array($fData)) $fData = array();
		// Check if form's row exists
		if ($fRowId && !isset($fData[$fRowId])) {
			$tVars['content'] = "Р Р€Р С”Р В°Р В·Р В°Р Р…Р Р…Р С•Р Вµ Р С—Р С•Р В»Р Вµ [" . $id . "][" . $fRowId . "] Р Р…Р Вµ РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ!";
			break;
		}
		$editMode = ($fRowId) ? 1 : 0;
		if ($editMode) {
			$xRow = $fData[$fRowId];
			$tVars['flags']['haveField'] = 1;
			$tVars['fieldName'] = $xRow['name'];
			$tVars['field']['name'] = $xRow['name'];
			$tVars['field']['title'] = secure_html($xRow['title']);
			$tVars['field']['default'] = secure_html($xRow['default']);
			$tVars['field']['type']['value'] = $xRow['type'];
			$tVars['field']['required']['value'] = $xRow['required'];
			$tVars['field']['auto']['value'] = $xRow['auto'];
			$tVars['field']['block']['value'] = $xRow['block'];
			$tVars['field']['email_send']['value'] = $xRow['email_send'];
			$tVars['field']['email_template']['value'] = $xRow['template'];
		} else {
			$tVars['flags']['addField'] = 1;
			$tVars['field']['title'] = '';
			$tVars['field']['type']['value'] = 'text';
			$tVars['field']['required']['value'] = 0;
			$tVars['field']['auto']['value'] = 0;
			$tVars['field']['block']['value'] = 0;
			$tVars['field']['email_template']['value'] = '';
		}
		$xsel = '';
		foreach (array('text', 'email', 'textarea', 'select', 'date') as $ts) {
			$tVars['field'][$ts . '_default'] = ($xRow['type'] == $ts) ? secure_html($xRow['default']) : '';
			$xsel .= '<option value="' . $ts . '"' . (($xRow['type'] == $ts) ? ' selected' : '') . '>' . $lang['feedback:type.' . $ts];
		}
		$tVars['field']['type']['options'] = $xsel;
		$tVars['field']['select_options'] = join("\n", $xRow['options']);
		$tVars['field']['required']['options'] = array(0, 1);
		$tVars['field']['auto']['options'] = array(0, 1, 2, 3);
		$tVars['field']['block']['options'] = array(0, 1, 2);
		$tVars['field']['email_send']['options'] = array(0, 1);
		// prepare email send template list
		$lf = array('' => '<Р Р…Р Вµ Р С•РЎвЂљР С—РЎР‚Р В°Р Р†Р В»РЎРЏРЎвЂљРЎРЉ>');
		foreach (feedback_listTemplates() as $k) {
			if (substr($k, 0, 1) == ':') {
				$lf[$k] = 'РЎРѓР В°Р в„–РЎвЂљ: ' . $k;
			} else {
				$lf[$k] = 'Р С—Р В»Р В°Р С–Р С‘Р Р…: ' . $k;
			}
		}
		$tVars['field']['email_template']['options'] = $lf;
		$recordFound = 1;
	} while (0);
	$templateName = 'plugins/feedback/tpl/' . ($recordFound ? 'conf.form.editrow' : 'conf.notify') . '.tpl';
	$xt = $twig->loadTemplate($templateName);
	echo $xt->render($tVars);
}

function editFormRow() {

	global $mysql, $lang, $twig;
	// Check params
	$id = intval($_REQUEST['form_id']);
	$fRowId = $_REQUEST['name'];
	$editMode = intval($_REQUEST['edit']);
	$tVars = array();
	$enabled = 0;
	do {
		// Check if form exists
		if (!is_array($frow = $mysql->record("select * from " . prefix . "_feedback where id = " . $id))) {
			$tVars['content'] = "Р Р€Р С”Р В°Р В·Р В°Р Р…Р Р…Р В°РЎРЏ РЎвЂћР С•РЎР‚Р С�Р В° [" . $id . "] Р Р…Р Вµ РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ!";
			break;
		}
		// Check if row id is not valid
		if (is_numeric(substr($fRowId, 0, 1)) || (!preg_match("/^[a-zA-Z\d]+$/", $fRowId)) || (strlen($fRowId) < 3)) {
			$tVars['content'] = "Р СњР ВµР С•Р В±РЎвЂ¦Р С•Р Т‘Р С‘Р С�Р С• РЎРѓР С•Р В±Р В»РЎР‹Р Т‘Р В°РЎвЂљРЎРЉ Р С—РЎР‚Р В°Р Р†Р С‘Р В»Р В° РЎвЂћР С•РЎР‚Р С�Р С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘РЎРЏ ID!";
			break;
		}
		$tVars['flags']['haveForm'] = 1;
		$tVars['formID'] = $frow['id'];
		$tVars['formName'] = $frow['name'];
		// Unpack form data
		$fData = unserialize($frow['struct']);
		if (!is_array($fData)) $fData = array();
		// Check if form's row exists
		if ($editMode && !isset($fData[$fRowId])) {
			$tVars['content'] = "Р Р€Р С”Р В°Р В·Р В°Р Р…Р Р…Р С•Р Вµ Р С—Р С•Р В»Р Вµ [" . $id . "][" . $fRowId . "] Р Р…Р Вµ РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ!";
			break;
		}
		// For "add" mode - check if field already exists
		if (!$editMode && isset($fData[$fRowId])) {
			$tVars['content'] = "Р Р€Р С”Р В°Р В·Р В°Р Р…Р Р…Р С•Р Вµ Р С—Р С•Р В»Р Вµ [" . $id . "][" . $fRowId . "] РЎС“Р В¶Р Вµ РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ!";
			break;
		}
		// Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚Р С”Р В° Р С”Р С•РЎР‚РЎР‚Р ВµР С”РЎвЂљР Р…Р С•РЎРѓРЎвЂљР С‘ РЎРѓР С‘Р С�Р Р†Р С•Р В»Р С•Р Р† Р Р† Р С‘Р С�Р ВµР Р…Р С‘ [ РЎвЂљР С•Р В»РЎРЉР С”Р С• Р В»Р В°РЎвЂљР Р…Р С‘РЎвЂ Р В° Р С‘ РЎвЂ Р С‘РЎвЂћРЎР‚РЎвЂ№ ]
		if (!$editMode && !preg_match('#^[a-zA-Z0-9\.]+$#', $fRowId)) {
			$tVars['content'] = "Р пїЅР С�РЎРЏ Р С—Р С•Р В»РЎРЏ РЎРѓР С•Р Т‘Р ВµРЎР‚Р В¶Р С‘РЎвЂљ Р В·Р В°Р С—РЎР‚Р ВµРЎвЂ°Р ВµР Р…Р Р…РЎвЂ№Р Вµ РЎРѓР С‘Р С�Р Р†Р С•Р В»РЎвЂ№. Р В Р В°Р В·РЎР‚Р ВµРЎв‚¬Р ВµР Р…Р С• Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљРЎРЉ РЎвЂљР С•Р В»РЎРЉР С”Р С• РЎРѓР С‘Р С�Р Р†Р С•Р В»РЎвЂ№ Р В»Р В°РЎвЂљР С‘Р Р…РЎРѓР С”Р С•Р С–Р С• Р В°Р В»РЎвЂћР В°Р Р†Р С‘РЎвЂљР В° Р С‘ РЎвЂ Р С‘РЎвЂћРЎР‚РЎвЂ№!";
			break;
		}
		$tVars['flags']['haveField'] = 1;
		$tVars['fieldName'] = $fRowId;
		//
		$enabled = 1;
		// Fill field's params
		$fld = array('name' => $fRowId, 'title' => $_REQUEST['title'], 'auto' => intval($_REQUEST['auto']), 'block' => intval($_REQUEST['block']));
		if (intval($_REQUEST['required']))
			$fld['required'] = 1;
		switch ($_REQUEST['type']) {
			case 'text':
				$fld['type'] = 'text';
				$fld['default'] = $_REQUEST['text_default'];
				break;
			case 'date':
				$fld['type'] = 'date';
				// Check default date
				if (preg_match('#^ *(\d{1,2})\.(\d{1,2})\.(\d{4}) *$#', $_REQUEST['date_default'], $match) &&
					($match[1] >= 1) && ($match[1] <= 31) && ($match[2] >= 1) && ($match[2] <= 12) && ($match[3] >= 1970) && ($match[3] <= 2099)
				) {
					$fld['default'] = $match[1] . '.' . $match[2] . '.' . $match[3];
					$fld['default:vars']['day'] = $match[1];
					$fld['default:vars']['month'] = $match[2];
					$fld['default:vars']['year'] = $match[3];
				}
				break;
			case 'textarea':
				$fld['type'] = 'textarea';
				$fld['default'] = $_REQUEST['textarea_default'];
				break;
			case 'email':
				$fld['type'] = 'email';
				$fld['default'] = '';
				$fld['template'] = $_REQUEST['email_template'];
				break;
			case 'select':
				$fld['type'] = 'select';
				$fld['options'] = array();
				if ($_REQUEST['select_storekeys']) {
					$fld['storekeys'] = 1;
				}
				foreach (explode("\n", $_REQUEST['select_options']) as $row) {
					if (!strlen(trim($row)))
						continue;
					$fld['options'][] = trim($row);
				}
				break;
			default:
				$tVars['content'] = "Р СњР ВµР С—Р С•Р Т‘Р Т‘Р ВµРЎР‚Р В¶Р С‘Р Р†Р В°Р ВµР С�РЎвЂ№Р в„– РЎвЂљР С‘Р С— Р С—Р С•Р В»РЎРЏ";
				break;
		}
		if (!isset($fld['type']))
			break;
		// Everything is correct. Let's update field data
		$fData[$fRowId] = $fld;
		$mysql->query("update " . prefix . "_feedback set struct = " . db_squote(serialize($fData)) . " where id = " . $frow['id']);
		$tVars['content'] = "Р СџР С•Р В»Р Вµ Р С‘Р В·Р С�Р ВµР Р…Р ВµР Р…Р С•";
	} while (0);
	// Show template
	$xt = $twig->loadTemplate('plugins/feedback/tpl/conf.notify.tpl');
	echo $xt->render($tVars);
}

//
//
function doUpdate() {

	global $mysql, $twig;
	// Check params
	$id = intval($_REQUEST['id']);
	$fRowId = $_REQUEST['name'];
	$enabled = 0;
	$tVars = array();
	do {
		// Check if form exists
		if (!is_array($frow = $mysql->record("select * from " . prefix . "_feedback where id = " . $id))) {
			$tVars['content'] = "Р Р€Р С”Р В°Р В·Р В°Р Р…Р Р…Р В°РЎРЏ РЎвЂћР С•РЎР‚Р С�Р В° [" . $id . "] Р Р…Р Вµ РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ!";
			break;
		}
		$tVars['flags']['haveForm'] = 1;
		$tVars['formID'] = $frow['id'];
		$tVars['formName'] = $frow['name'];
		// Unpack form data
		$fData = unserialize($frow['struct']);
		if (!is_array($fData)) $fData = array();
		// Check if form's row exists
		if (!isset($fData[$fRowId])) {
			$tVars['content'] = "Р Р€Р С”Р В°Р В·Р В°Р Р…Р Р…Р С•Р Вµ Р С—Р С•Р В»Р Вµ [" . $id . "][" . $fRowId . "] Р Р…Р Вµ РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†РЎС“Р ВµРЎвЂљ!";
			break;
		}
		$enabled = 1;
	} while (0);
	if (!$enabled) {
		// Show template
		$xt = $twig->loadTemplate('plugins/feedback/tpl/conf.notify.tpl');
		echo $xt->render($tVars);

		return false;
	}
	// Now make an action
	switch ($_REQUEST['subaction']) {
		case 'del':
			unset($fData[$fRowId]);
			break;
		case 'up':
			array_key_move($fData, $fRowId, -1);
			break;
		case 'down':
			array_key_move($fData, $fRowId, 1);
			break;
	}
	$mysql->query("update " . prefix . "_feedback set struct = " . db_squote(serialize($fData)) . " where id = " . $frow['id']);

	return true;
}

//
function delForm() {

	global $mysql, $lang;
	$mysql->query("delete from " . prefix . "_feedback where id = " . intval($_REQUEST['id']));
}

function array_key_move(&$arr, $key, $offset) {

	$keys = array_keys($arr);
	$index = -1;
	foreach ($keys as $k => $v) if ($v == $key) {
		$index = $k;
		break;
	}
	if ($index == -1) return 0;
	$index2 = $index + $offset;
	if ($index2 < 0) $index2 = 0;
	if ($index2 > (count($arr) - 1)) $index2 = count($arr) - 1;
	if ($index == $index2) return 1;
	$a = min($index, $index2);
	$b = max($index, $index2);
	$arr = array_slice($arr, 0, $a) +
		array_slice($arr, $b, 1) +
		array_slice($arr, $a + 1, $b - $a) +
		array_slice($arr, $a, 1) +
		array_slice($arr, $b, count($arr) - $b);
}