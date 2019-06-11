<?php

if (!defined('NGCMS')) exit('HAL');

class ShowAvatar_newsNewsFilter extends NewsFilter {
	function showNews($newsID, $SQLnews, &$tvars, $mode = array()){
		global $mysql, $config, $userROW;

/*		
$use_cache = 1;
//Р В РЎв„ўР В РЎвЂўР В РўвЂ�Р В РЎвЂ�Р РЋР вЂљР РЋРЎвЂњР В РЎпїЅ Р В Р вЂ  md5
$cacheFileName = md5('avatar_news'.$config['theme'].$config['default_lang']).'.txt';
		
// Р В Р’В§Р РЋРІР‚С™Р В Р’ВµР В Р вЂ¦Р В РЎвЂ�Р В Р’Вµ (Р В Р вЂ  Р В РЎвЂ”Р В Р’В°Р РЋР вЂљР В Р’В°Р В РЎпїЅР В Р’ВµР РЋРІР‚С™Р РЋР вЂљР В Р’В°Р РЋРІР‚В¦ Р В РЎвЂ”Р В Р’В»Р В Р’В°Р В РЎвЂ“Р В РЎвЂ�Р В Р вЂ¦ Р РЋРІР‚В¦Р РЋР вЂљР В Р’В°Р В Р вЂ¦Р В РЎвЂ�Р РЋРІР‚С™: cache - Р РЋРІР‚С›Р В Р’В»Р В Р’В°Р В РЎвЂ“ Р РЋР С“Р В РЎвЂўР В РЎвЂўР В Р’В±Р РЋРІР‚В°Р В Р’В°Р РЋР вЂ№Р РЋРІР‚В°Р В РЎвЂ�Р В РІвЂћвЂ“ Р В Р вЂ¦Р В Р’В°Р В РўвЂ�Р В РЎвЂў Р В Р’В»Р В РЎвЂ� Р В РЎвЂ�Р РЋР С“Р В РЎвЂ”Р В РЎвЂўР В Р’В»Р РЋР Р‰Р В Р’В·Р В РЎвЂўР В Р вЂ Р В Р’В°Р РЋРІР‚С™Р РЋР Р‰ Р В РЎвЂќР В Р’ВµР РЋРІвЂљВ¬, cacheExpire - Р В Р вЂ Р РЋР вЂљР В Р’ВµР В РЎпїЅР РЋР РЏ Р В Р’В¶Р В РЎвЂ�Р В Р’В·Р В Р вЂ¦Р В РЎвЂ� Р В РЎвЂќР В Р’ВµР РЋРІвЂљВ¬Р В Р’В° Р В Р вЂ  Р РЋР С“Р В Р’ВµР В РЎвЂќР РЋРЎвЂњР В Р вЂ¦Р В РўвЂ�Р В Р’В°Р РЋРІР‚В¦
     if ($use_cache)    {
        $cacheData = cacheRetrieveFile($cacheFileName, 300, 'avatar_news');
        if ($cacheData != false){
            // We got data from cache. Return it and stop
            $template['vars']['avatar_in_news'] = $cacheData;
            return;
        }
    }
	
//pluginGetVariable('avatar_news','cache')
//pluginGetVariable('avatar_news','cacheExpire')
*/


		$result=$mysql->record("select id, avatar from ".uprefix."_users where id = ".$SQLnews['author_id']." limit 1");
			
	// Check for new style of avatars storing
	if ($result['avatar']) {
		$uavatar = $result['avatar'];
	}

	// GRAVATAR.COM integration ** BEGIN **
	if ($result['avatar'] != '') {
		$avatar	= avatars_url.'/'.$uavatar;
	} else {
		if ($config['avatars_gravatar']) {
			$avatar	= 'http://www.gravatar.com/avatar/'.md5(strtolower($userROW['mail'])).'.jpg?s='.$config['avatar_wh'].'&d='.urlencode(avatars_url."/noavatar.gif");
		} else {
			$avatar = avatars_url."/noavatar.gif";
		}
	}
	$tvars['vars']['avatar_in_news'] = $avatar;
	
/*
	if ($use_cache) {
    // Р В РІР‚вЂќР В Р’В°Р В РЎвЂ”Р В РЎвЂ�Р РЋР С“Р РЋР Р‰
    cacheStoreFile($cacheFileName, $avatar, 'avatar_news');
}
*/
		
	}
}

register_filter('news','avatar_news', new ShowAvatar_newsNewsFilter);