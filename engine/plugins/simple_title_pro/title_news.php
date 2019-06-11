<?php
/*
=====================================================
 Р вЂќР С•Р В±Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ <title></title> РЎРѓ Р В°Р Т‘Р С�Р С‘Р Р…Р С”Р С‘ v 0.01
-----------------------------------------------------
 Author: Nail' R. Davydov (ROZARD)
-----------------------------------------------------
 Jabber: ROZARD@ya.ru
 E-mail: ROZARD@list.ru
-----------------------------------------------------
 Р’В© Р СњР В°РЎРѓРЎвЂљР С•РЎРЏРЎвЂ°Р С‘Р в„– Р С—РЎР‚Р С•Р С–РЎР‚Р В°Р С�Р С�Р С‘РЎРѓРЎвЂљ Р Р…Р С‘Р С”Р С•Р С–Р Т‘Р В° Р Р…Р Вµ РЎРѓРЎвЂљР В°Р Р†Р С‘РЎвЂљ 
 Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р ВµР Р†. Р СћР С•, РЎвЂЎРЎвЂљР С• Р С—Р С‘РЎРѓР В°Р В»Р С•РЎРѓРЎРЉ РЎРѓ РЎвЂљРЎР‚РЎС“Р Т‘Р С•Р С�, Р Т‘Р С•Р В»Р В¶Р Р…Р С• 
 Р С—Р С•Р Р…Р С‘Р С�Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ РЎРѓ РЎвЂљРЎР‚РЎС“Р Т‘Р С•Р С�. :))
-----------------------------------------------------
 Р вЂќР В°Р Р…Р Р…РЎвЂ№Р в„– Р С”Р С•Р Т‘ Р В·Р В°РЎвЂ°Р С‘РЎвЂ°Р ВµР Р… Р В°Р Р†РЎвЂљР С•РЎР‚РЎРѓР С”Р С‘Р С�Р С‘ Р С—РЎР‚Р В°Р Р†Р В°Р С�Р С‘
=====================================================
*/
if (!defined('NGCMS'))
	exit('HAL');

class TitleNewsFilter extends NewsFilter {

	function addNewsForm(&$tvars) {

		$tvars['titles'] = '';
	}

	function addNews(&$tvars, &$SQL) {

		return true;
	}

	function addNewsNotify(&$tvars, $SQL, $newsid) {

		global $mysql;
		$title = secure_html($_REQUEST['titles']);
		if (isset($title) && !empty($title)) {
			if (isset($newsid) && !empty($newsid)) {
				$mysql->query('INSERT INTO ' . prefix . '_simple_title_pro
									(	title,
										news_id
									) VALUES (
										' . db_squote($title) . ',
										' . db_squote($newsid) . '
									)
				');
			}
		}
	}

	function editNewsForm($newsID, $SQLold, &$tvars) {

		global $mysql;
		if ($row = $mysql->result('SELECT title FROM ' . prefix . '_simple_title_pro WHERE news_id = \'' . intval($newsID) . '\' LIMIT 1'))
			$tvars['titles'] = $row;
		else
			$tvars['titles'] = '';
	}

	function editNews($newsID, $SQLold, &$SQLnew, &$tvars) {

		global $mysql, $config;
		$title = isset($_REQUEST['titles']) ? secure_html($_REQUEST['titles']) : '';
		if (isset($newsID)) {
			if ($mysql->result('SELECT 1 FROM ' . prefix . '_simple_title_pro WHERE news_id = \'' . intval($newsID) . '\' LIMIT 1')) {
				$cacheFileName = md5('block_directory_sites_news' . $newsID . $config['default_lang']) . '.txt';
				cacheStoreFile($cacheFileName, $title, 'simple_title_pro');
				$mysql->query('UPDATE ' . prefix . '_simple_title_pro SET 
					title = ' . db_squote($title) . '
					WHERE news_id = \'' . intval($newsID) . '\'
				');
			} else {
				if (!empty($title)) {
					$mysql->query('INSERT INTO ' . prefix . '_simple_title_pro (title, news_id) 
							VALUES 
							(' . db_squote($title) . ',
							' . db_squote($newsID) . '
							)
					');
				}
			}
		}

		return true;
	}
}

register_filter('news', 'simple_title_pro', new TitleNewsFilter);