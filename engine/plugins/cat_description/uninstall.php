<?php
// Protect against hack attempts
if (!defined('NGCMS')) die ('HAL');
if ($_REQUEST['action'] == 'commit') {
	plugin_mark_deinstalled('cat_description');
} else {
	$text = 'CР ВµР в„–РЎвЂЎР В°РЎРѓ Р С—Р В»Р В°Р С–Р С‘Р Р… Р В±РЎС“Р Т‘Р ВµРЎвЂљ РЎС“Р Т‘Р В°Р В»Р ВµР Р…';
	generate_install_page('cat_description', $text, 'deinstall');
}