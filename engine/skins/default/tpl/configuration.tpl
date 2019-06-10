<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=options">{{ lang['options'] }}</a></li>
	<li class="active">{{ lang['configuration_title'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	
	<form method="post" action="admin.php">
		<input type="hidden" name="mod" value="configuration" />
		<input type="hidden" name="token" value="{{ token }}" />
		<input type="hidden" name="selectedOption" id="selectedOption" />
		<input type="hidden" name="subaction" value="save" />
		<input type="hidden" name="save" value="" />
		
		<ul class="nav nav-tabs nav-justified">
			<li class="active"><a href="#userTabs-db" data-toggle="tab" aria-expanded="true">{{ lang['db'] }}</a></li>
			<li><a href="#userTabs-security" data-toggle="tab" aria-expanded="false">{{ lang['security'] }}</a></li>
			<li><a href="#userTabs-system" data-toggle="tab" aria-expanded="false">{{ lang['syst'] }}</a></li>
			<li><a href="#userTabs-news" data-toggle="tab" aria-expanded="false">{{ lang['sn'] }}</a></li>
			<li><a href="#userTabs-users" data-toggle="tab" aria-expanded="false">{{ lang['users'] }}</a></li>
			<li><a href="#userTabs-imgfiles" data-toggle="tab" aria-expanded="false">{{ lang['files'] }}/{{ lang['img'] }}</a></li>
			<li><a href="#userTabs-cache" data-toggle="tab" aria-expanded="false">{{ lang['cache'] }}</a></li>
			<li><a href="#userTabs-multi" data-toggle="tab" aria-expanded="false">{{ lang['multi'] }}</a></li>
		</ul>

		<div id="userTabs" class="tab-content">
			<!-- ########################## DB TAB ########################## -->
			<div id="userTabs-db" class="tab-pane active">
				<!-- TABLE DB//Connection -->
				<table class="table table-condensed">
					<tr>
						<td colspan="2" class="h3">{{ lang['db_connect'] }}</td>
					</tr>
					<tr>
						<td width="50%">{{ lang['dbhost'] }} <span class="help-block">{{ lang['example'] }} localhost</span></td>
						<td width="50%"><input type="text" name="save_con[dbhost]" value="{{ config['dbhost'] }}" id="db_dbhost"  class="form-control"></td>
					</tr>
					<tr>
						<td width="50%">{{ lang['dbname'] }} <span class="help-block">{{ lang['example'] }} ng</span></td>
						<td width="50%"><input type="text" name="save_con[dbname]" value="{{ config['dbname'] }}" id="db_dbname" class="form-control"></td>
					</tr>
					<tr>
						<td width="50%">{{ lang['dbuser'] }} <span class="help-block">{{ lang['example'] }} root</span></td>
						<td width="50%"><input type="text" name="save_con[dbuser]" value="{{ config['dbuser'] }}" id="db_dbuser" class="form-control"></td>
					</tr>
					<tr>
						<td width="50%">{{ lang['dbpass'] }} <span class="help-block">{{ lang['example'] }} password</span></td>
						<td width="50%"><input type="password" name="save_con[dbpasswd]" value="{{ config['dbpasswd'] }}" id="db_dbpasswd" class="form-control"></td>
					</tr>
					<tr>
						<td width="50%">{{ lang['dbprefix'] }} <span class="help-block">{{ lang['example'] }} ng</span></td>
						<td width="50%"><input type="text" name="save_con[prefix]" value="{{ config['prefix'] }}" class="form-control"></td>
					</tr>
					<tr>
						<td width="50%">&nbsp;</td>
						<td width="50%"><input type="button" value="{{ lang['btn_checkDB'] }}" onclick="ngCheckDB(); return false;" class="btn btn-default"></td>
					</tr>
				</table>
				<!-- END: TABLE DB//Connection -->
				
				<!-- TABLE DB//Backup -->
				<table class="table table-condensed">
					<tr>
						<td colspan="2" class="h3">{{ lang['db_backup'] }}</td>
					</tr>
					<tr>
						<td width="50%">{{ lang['auto_backup'] }} <span class="help-block">{{ lang['auto_backup_desc'] }}</span></td>
						<td width="50%">{{ mkSelectYN({'name' : 'save_con[auto_backup]', 'value' : config['auto_backup'] }) }}</td>
					</tr>
					<tr>
						<td width="50%">{{ lang['auto_backup_time'] }} <span class="help-block">{{ lang['auto_backup_time_desc'] }}</span></td>
						<td width="50%"><input type="text" class="form-control" name="save_con[auto_backup_time]" value="{{ config['auto_backup_time'] }}" maxlength="5" /></td>
					</tr>
				</table>
				<!-- END: TABLE DB//Backup -->
			</div>

			<!-- ########################## SECURITY TAB ########################## -->
			<div id="userTabs-security" class="tab-pane">
				<table class="table table-condensed">
				<tr>
				<td colspan="2" class="h3">{{ lang['logging'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['x_ng_headers'] }} <span class="help-block">{{ lang['x_ng_headers#desc'] }}</span></td>
				<td>{{ mkSelectNY({'name' : 'save_con[x_ng_headers]', 'value' : config['x_ng_headers'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['syslog'] }} <span class="help-block">{{ lang['syslog_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[syslog]', 'value' : config['syslog'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['load'] }} <span class="help-block">{{ lang['load_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[load_analytics]', 'value' : config['load_analytics'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['load_profiler'] }} <span class="help-block">{{ lang['load_profiler_desc'] }}</span></td>
				<td><input type="text" class="form-control" name="save_con[load_profiler]" value="{{ config['load_profiler'] }}" /></td>
				</tr>
				<tr>
				<td colspan="2" class="h3">{{ lang['security'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['flood_time'] }} <span class="help-block">{{ lang['flood_time_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[flood_time]' value='{{ config['flood_time'] }}' size="6" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['use_captcha'] }} <span class="help-block">{{ lang['use_captcha_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[use_captcha]', 'value' : config['use_captcha'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['captcha_font'] }} <span class="help-block">{{ lang['captcha_font_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[captcha_font]', 'value' : config['captcha_font'], 'values' : list['captcha_font'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['use_cookies'] }} <span class="help-block">{{ lang['use_cookies_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[use_cookies]', 'value' : config['use_cookies'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['use_sessions'] }} <span class="help-block">{{ lang['use_sessions_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[use_sessions]', 'value' : config['use_sessions'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['sql_error'] }} <span class="help-block">{{ lang['sql_error_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[sql_error_show]', 'value' : config['sql_error_show'], 'values' : { 0 : lang['sql_error_0'], 1 : lang['sql_error_1'], 2 : lang['sql_error_2'] } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['multiext_files'] }} <span class="help-block">{{ lang['multiext_files_desc'] }}</span></td>
				<td>{{ mkSelectNY({'name' : 'save_con[allow_multiext]', 'value' : config['allow_multiext'] }) }}</td>
				</tr>
				</table>
				<table class="table table-condensed">
				<tr>
				<td colspan="2" class="h3">{{ lang['debug_generate'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['debug'] }} <span class="help-block">{{ lang['debug_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[debug]', 'value' : config['debug'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['debug_queries'] }} <span class="help-block">{{ lang['debug_queries_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[debug_queries]', 'value' : config['debug_queries'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['debug_profiler'] }} <span class="help-block">{{ lang['debug_profiler_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[debug_profiler]', 'value' : config['debug_profiler'] }) }}</td>
				</tr>
				</table>
			</div>
			
			<!-- ########################## SYSTEM TAB ########################## -->
			<div id="userTabs-system" class="tab-pane">
				<table class="table table-condensed">
				<tr>
				<td colspan="2" class="h3">{{ lang['syst'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['home_url'] }} <span class="help-block">{{ lang['example'] }} http://server.com</span></td>
				<td><input class="form-control" type="text" name="save_con[home_url]" value="{{ config['home_url'] }}" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['admin_url'] }} <span class="help-block">{{ lang['example'] }} http://server.com/engine</span></td>
				<td><input class="form-control" type="text" name='save_con[admin_url]' value='{{ config['admin_url'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['home_title'] }} <span class="help-block">{{ lang['example'] }} NGcms</span></td>
				<td><input type="text" class="form-control" name='save_con[home_title]' value="{{ config['home_title']|escape }}" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['admin_mail'] }} <span class="help-block">{{ lang['example'] }} admin@server.com</span></td>
				<td><input class="form-control" type="text" name='save_con[admin_mail]' value='{{ config['admin_mail'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['lock'] }} <span class="help-block">{{ lang['lock_desc'] }}</span></td>
				<td>{{ mkSelectNY({'name' : 'save_con[lock]', 'value' : config['lock'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['lock_reason'] }} <span class="help-block">{{ lang['lock_reason_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[lock_reason]' value='{{ config['lock_reason'] }}' maxlength="200" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['meta'] }} <span class="help-block">{{ lang['meta_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[meta]', 'value' : config['meta'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['description'] }} <span class="help-block">{{ lang['description_desc'] }}</span></td>
				<td><input type="text" class="form-control" name="save_con[description]" value="{{ config['description'] }}" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['keywords'] }} <span class="help-block">{{ lang['keywords_desc'] }}</span></td>
				<td><input type="text" class="form-control" name="save_con[keywords]" value="{{ config['keywords'] }}" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['theme'] }} <span class="help-block">{{ lang['theme_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[theme]', 'value' : config['theme'], 'values' : list['theme'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['lang'] }} <span class="help-block">{{ lang['lang_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[default_lang]', 'value' : config['default_lang'], 'values' : list['default_lang'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['use_gzip'] }} <span class="help-block">{{ lang['use_gzip_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[use_gzip]', 'value' : config['use_gzip'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['404_mode'] }} <span class="help-block">{{ lang['404_mode_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[404_mode]', 'value' : config['404_mode'], 'values' : { 0 : lang['404.int'], 1 : lang['404.ext'], 2 : lang['404.http'] } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['libcompat'] }} <span class="help-block">{{ lang['libcompat_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[libcompat]', 'value' : config['libcompat'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['url_external_nofollow'] }} <span class="help-block">{{ lang['url_external_nofollow_desc'] }}</span></td>
				<td>{{ mkSelectNY({'name' : 'save_con[url_external_nofollow]', 'value' : config['url_external_nofollow'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['url_external_target_blank'] }} <span class="help-block">{{ lang['url_external_target_blank_desc'] }}</span></td>
				<td>{{ mkSelectNY({'name' : 'save_con[url_external_target_blank]', 'value' : config['url_external_target_blank'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['timezone'] }} <span class="help-block">{{ lang['timezone#desc'] }}</span></td>
				<td>
				<select name="save_con[timezone]" id="timezone">
				{% for zone in list['timezoneList'] %}<option value="{{ zone }}" {% if (config['timezone'] == zone) %}selected="selected"{% endif %}>{{ zone }}</option>
				{% endfor %}
				</select>
				</td>
				</tr>
				<tr>
				<td colspan="2" class="h3">{{ lang['email_configuration'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['mailfrom_name'] }} <span class="help-block">{{ lang['example'] }} Administrator</span></td>
				<td><input class="mailfrom_name" type="text" id="mail_fromname" name='save_con[mailfrom_name]' value='{{ config['mailfrom_name'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['mailfrom'] }} <span class="help-block">{{ lang['example'] }} mailbot@server.com</span></td>
				<td><input class="mailfrom" type="text" id="mail_frommail" name='save_con[mailfrom]' value='{{ config['mailfrom'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['mail_mode'] }}: <span class="help-block">{{ lang['mail_mode#desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[mail_mode]', 'id' : 'mail_mode', 'value' : config['mail_mode'], 'values' : { 'mail' : 'mail', 'sendmail' : 'sendmail', 'smtp' : 'smtp' } }) }}</td>
				</tr>
				<tr class="useSMTP">
				<td colspan="2" class="h3">{{ lang['smtp_config'] }}</td>
				</tr>
				<tr class="useSMTP">
				<td width="50%">{{ lang['smtp_host'] }}: <span class="help-block">{{ lang['example'] }} smtp.mail.ru</span></td>
				<td><input class="mailfrom" type="text" name="save_con[mail][smtp][host]" id="mail_smtp_host" value="{{ config['mail']['smtp']['host'] }}" /></td>
				</tr>
				<tr class="useSMTP">
				<td width="50%">{{ lang['smtp_port'] }}: <span class="help-block">{{ lang['example'] }} 25</span></td>
				<td><input class="mailfrom" type="text" name="save_con[mail][smtp][port]" id="mail_smtp_port" value="{{ config['mail']['smtp']['port'] }}" /></td>
				</tr>
				<tr class="useSMTP">
				<td width="50%">{{ lang['smtp_auth'] }}: <span class="help-block">{{ lang['smtp_auth#desc'] }}</span></td>
				<td>{{ mkSelectNY({'name' : 'save_con[mail][smtp][auth]', 'id' : 'mail_smtp_auth', 'value' : config['mail']['smtp']['auth'] }) }}</td>
				</tr>
				<tr class="useSMTP">
				<td width="50%">{{ lang['smtp_secure'] }}: <span class="help-block">{{ lang['smtp_secure#desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[mail][smtp][secure]', 'id' : 'mail_smtp_secure', 'value' : config['mail']['smtp']['secure'], 'values' : { '' : 'None', 'tls' : 'TLS', 'ssl' : 'SSL' } }) }}</td>
				</tr>
				<tr class="useSMTP">
				<td width="50%">{{ lang['smtp_auth_login'] }}: <span class="help-block">{{ lang['example'] }} email@mail.ru</span></td>
				<td><input class="mailfrom" type="text" id="mail_smtp_login" name="save_con[mail][smtp][login]" value="{{ config['mail']['smtp']['login'] }}" /></td>
				</tr>
				<tr class="useSMTP">
				<td width="50%">{{ lang['smtp_auth_pass'] }}: <span class="help-block">{{ lang['example'] }} mySuperPassword</span></td>
				<td><input class="mailfrom" type="text" name="save_con[mail][smtp][pass]" id="mail_smtp_pass" value="{{ config['mail']['smtp']['pass'] }}" /></td>
				</tr>
				<tr>
				<td width="50%"></td>
				<td style="display: block;">
					EMail: 
					<input id="mail_tomail" type="email" name="" value=""><br>
					<input type="button" class="btn btn-default" value="{{ lang['btn_checkSMTP'] }}" onclick="ngCheckEmail(); return false;">
				</td>
				</tr>
				</table>
			</div>

			<!-- ########################## NEWS TAB ########################## -->
			<div id="userTabs-news" class="tab-pane">
				<table class="table table-condensed">
				<tr>
				<td colspan="2" class="h3">{{ lang['sn'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['number'] }}</td>
				<td><input type="text" class="form-control" name='save_con[number]' value='{{ config['number'] }}' size="6" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['news_multicat_url'] }} <span class="help-block">{{ lang['news_multicat_url#desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[news_multicat_url]', 'value' : config['news_multicat_url'], 'values' : { 0 : lang['news_multicat:0'], 1 : lang['news_multicat:1'] } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['nnavigations'] }}<br/><span class="help-block">{{ lang['nnavigations_desc'] }}</span></td>
				<td><input type="text" class="form-control" name="save_con[newsNavigationsCount]" value="{{ config['newsNavigationsCount'] }}" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['nnavigations_admin'] }}<br/><span class="help-block">{{ lang['nnavigations_admin_desc'] }}</span></td>
				<td><input type="text" class="form-control" name="save_con[newsNavigationsAdminCount]" value="{{ config['newsNavigationsAdminCount'] }}" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['category_counters'] }} <span class="help-block">{{ lang['category_counters_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[category_counters]', 'value' : config['category_counters'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['news_view_counters'] }} <span class="help-block">{{ lang['news_view_counters#desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[news_view_counters]', 'value' : config['news_view_counters'], 'values' : { 1 : lang['yesa'], 0 : lang['noa'], 2 : lang['news_view_counters#2'] } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['news.edit.split'] }} <span class="help-block">{{ lang['news.edit.split#desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[news.edit.split]', 'value' : config['news.edit.split'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['news_without_content'] }} <span class="help-block">{{ lang['news_without_content_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[news_without_content]', 'value' : config['news_without_content'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['date_adjust'] }} <span class="help-block">{{ lang['date_adjust_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[date_adjust]' value='{{ config['date_adjust'] }}' size="6" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['timestamp_active'] }} <span class="help-block">{{ lang['date_help'] }}</span></td>
				<td width="50%"><input type="text" class="form-control" name='save_con[timestamp_active]' value='{{ config['timestamp_active'] }}' size="20" /> <span class="help-block">{{ lang['date_now'] }} {{ timestamp_active_now }}</span></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['timestamp_updated'] }} <span class="help-block">{{ lang['date_help'] }}</span></td>
				<td width="50%"><input type="text" class="form-control" name='save_con[timestamp_updated]' value='{{ config['timestamp_updated'] }}' size="20" /> <span class="help-block">{{ lang['date_now'] }} {{ timestamp_updated_now }}</span></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['smilies'] }} <span class="help-block">{{ lang['smilies_desc'] }} (<b>,</b>)</span></td>
				<td><input type="text" class="form-control" name='save_con[smilies]' value='{{ config['smilies'] }}'/></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['blocks_for_reg'] }} <span class="help-block">{{ lang['blocks_for_reg_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[blocks_for_reg]', 'value' : config['blocks_for_reg'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['extended_more'] }} <span class="help-block">{{ lang['extended_more_desc'] }}</span></td>
				<td>{{ mkSelectNY({'name' : 'save_con[extended_more]', 'value' : config['extended_more'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['use_smilies'] }} <span class="help-block">{{ lang['use_smilies_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[use_smilies]', 'value' : config['use_smilies'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['use_bbcodes'] }} <span class="help-block">{{ lang['use_bbcodes_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[use_bbcodes]', 'value' : config['use_bbcodes'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['use_htmlformatter'] }} <span class="help-block">{{ lang['use_htmlformatter_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[use_htmlformatter]', 'value' : config['use_htmlformatter'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['default_newsorder'] }} <span class="help-block">{{ lang['default_newsorder_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[default_newsorder]', 'value' : config['default_newsorder'], 'values' : { 'id desc' : lang['order_id_desc'], 'id asc' : lang['order_id_asc'], 'postdate desc' : lang['order_postdate_desc'], 'postdate asc' : lang['order_postdate_asc'], 'title desc' : lang['order_title_desc'], 'title asc' : lang['order_title_asc'] } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['template_mode'] }} <span class="help-block">{{ lang['template_mode#desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[template_mode]', 'value' : config['template_mode'], 'values' : { 1 : lang['template_mode.1'], 2 : lang['template_mode.2'] } }) }}</td>
				</tr>
				</table>
			</div>
			
			<!-- ########################## USERS TAB ########################## -->
			<div id="userTabs-users" class="tab-pane">
				<table class="table table-condensed">
				<tr>
				<td colspan="2" class="h3">{{ lang['auth'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['remember'] }} <span class="help-block">{{ lang['remember_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[remember]', 'value' : config['remember'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['auth_module'] }} <span class="help-block">{{ lang['auth_module_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[auth_module]', 'value' : config['auth_module'], 'values' : list['auth_module'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['auth_db'] }} <span class="help-block">{{ lang['auth_db_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[auth_db]', 'value' : config['auth_db'], 'values' : list['auth_db'] }) }}</td>
				</tr>
				</table>
				<table class="table table-condensed">
				<tr>
				<td colspan="2" class="h3">{{ lang['users'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['users_selfregister'] }} <span class="help-block">{{ lang['users_selfregister_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[users_selfregister]', 'value' : config['users_selfregister'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['register_type'] }} <span class="help-block">{{ lang['register_type_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[register_type]', 'value' : config['register_type'], 'values' : { 0 : lang['register_extremly'], 1 : lang['register_simple'], 2 : lang['register_activation'], 3 : lang['register_manual'], 4 : lang['register_manual_confirm']  } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['user_aboutsize'] }} <span class="help-block">{{ lang['user_aboutsize_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[user_aboutsize]' value='{{ config['user_aboutsize'] }}'/></td>
				</tr>
				<tr>
				<td colspan="2" class="h3">{{ lang['users.avatars'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['use_avatars'] }} <span class="help-block">{{ lang['use_avatars_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[use_avatars]', 'value' : config['use_avatars'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['avatars_gravatar'] }} <span class="help-block">{{ lang['avatars_gravatar_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[avatars_gravatar]', 'value' : config['avatars_gravatar'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['avatars_url'] }} <span class="help-block">{{ lang['example'] }} http://server.com/uploads/avatars</span></td>
				<td><input class="form-control" type="text" name='save_con[avatars_url]' value='{{ config['avatars_url'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['avatars_dir'] }} <span class="help-block">{{ lang['example'] }} /home/servercom/public_html/uploads/avatars/</span></td>
				<td><input class="form-control" type="text" name='save_con[avatars_dir]' value='{{ config['avatars_dir'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['avatar_wh'] }} <span class="help-block">{{ lang['avatar_wh_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[avatar_wh]' value='{{ config['avatar_wh'] }}'/></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['avatar_max_size'] }} <span class="help-block">{{ lang['avatar_max_size_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[avatar_max_size]' value='{{ config['avatar_max_size'] }}'/></td>
				</tr>
				<tr>
				<td colspan="2" class="h3">{{ lang['users.photos'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['use_photos'] }} <span class="help-block">{{ lang['use_photos_desc'] }}</span></td>
				<td>{{ mkSelectYN({'name' : 'save_con[use_photos]', 'value' : config['use_photos'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['photos_url'] }} <span class="help-block">{{ lang['example'] }} http://server.com/uploads/photos</span></td>
				<td><input class="form-control" type="text" name='save_con[photos_url]' value='{{ config['photos_url'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['photos_dir'] }} <span class="help-block">{{ lang['example'] }} /home/servercom/public_html/uploads/photos/</span></td>
				<td><input class="form-control" type="text" name='save_con[photos_dir]' value='{{ config['photos_dir'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['photos_max_size'] }} <span class="help-block">{{ lang['photos_max_size_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[photos_max_size]' value='{{ config['photos_max_size'] }}'/></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['photos_thumb_size'] }} <span class="help-block">{{ lang['photos_thumb_size_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[photos_thumb_size_x]' value='{{ config['photos_thumb_size_x'] }}'/> x <input type="text" class="form-control" name='save_con[photos_thumb_size_y]' value='{{ config['photos_thumb_size_y'] }}'/></td>
				</tr>
				</table>
			</div>
			
			<!-- ########################## IMAGES TAB ########################## -->
			<div id="userTabs-imgfiles" class="tab-pane">
				<table class="table table-condensed">
				<tr>
				<td colspan="2" class="h3">{{ lang['files'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['files_url'] }} <span class="help-block">{{ lang['example'] }} http://server.com/uploads/files</span></td>
				<td><input class="form-control" type="text" name='save_con[files_url]' value='{{ config['files_url'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['files_dir'] }} <span class="help-block">{{ lang['example'] }} /home/servercom/public_html/uploads/files/</span></td>
				<td><input class="form-control" type="text" name='save_con[files_dir]' value='{{ config['files_dir'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['attach_url'] }} <span class="help-block">{{ lang['example'] }} http://server.com/uploads/dsn</span></td>
				<td><input class="form-control" type="text" name='save_con[attach_url]' value='{{ config['attach_url'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['attach_dir'] }} <span class="help-block">{{ lang['example'] }} /home/servercom/public_html/uploads/dsn/</span></td>
				<td><input class="form-control" type="text" name='save_con[attach_dir]' value='{{ config['attach_dir'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['files_ext'] }} <span class="help-block">{{ lang['files_ext_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[files_ext]' value='{{ config['files_ext'] }}' /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['files_max_size'] }} <span class="help-block">{{ lang['files_max_size_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[files_max_size]' value='{{ config['files_max_size'] }}'/></td>
				</tr>
				</table>
				<table class="table table-condensed">
				<tr>
				<td colspan="2" class="h3">{{ lang['img'] }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['images_url'] }} <span class="help-block">{{ lang['example'] }} http://server.com/uploads/images</span></td>
				<td><input class="form-control" type="text" name='save_con[images_url]' value='{{ config['images_url'] }}'/></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['images_dir'] }} <span class="help-block">{{ lang['example'] }} /home/servercom/public_html/uploads/images/</span></td>
				<td><input class="form-control" type="text" name='save_con[images_dir]' value='{{ config['images_dir'] }}'/></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['images_ext'] }} <span class="help-block">{{ lang['images_ext_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[images_ext]' value='{{ config['images_ext'] }}'/></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['images_max_size'] }} <span class="help-block">{{ lang['images_max_size_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[images_max_size]' value='{{ config['images_max_size'] }}' size="6" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['images_dim_action'] }} <span class="help-block">{{ lang['images_dim_action#desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[images_dim_action]', 'value' : config['images_dim_action'], 'values' : { 0 : lang['images_dim_action#0'], 1 : lang['images_dim_action#1'] } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['images_max_dim'] }} <span class="help-block">{{ lang['images_max_dim#desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[images_max_x]' value='{{ config['images_max_x'] }}' size="6" /> x <input type="text" class="form-control" name='save_con[images_max_y]' value='{{ config['images_max_y'] }}' size="6" /></td>
				</tr>

				<!-- IMAGE transform control -->
				<tr><td colspan="2" class="h3">{{ lang['img.thumb'] }}</td></tr>
				<tr>
				<td width="50%">{{ lang['thumb_mode'] }} <span class="help-block">{{ lang['thumb_mode_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[thumb_mode]', 'value' : config['thumb_mode'], 'values' : { 0 : lang['mode_demand'], 1 : lang['mode_forbid'], 2 : lang['mode_always'] } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['thumb_size'] }} <span class="help-block">{{ lang['thumb_size_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[thumb_size_x]' value='{{ config['thumb_size_x'] }}' size="6" /> x <input type="text" class="form-control" name='save_con[thumb_size_y]' value='{{ config['thumb_size_y'] }}' size="6" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['thumb_quality'] }} <span class="help-block">{{ lang['thumb_quality_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[thumb_quality]' value='{{ config['thumb_quality'] }}' size="6" /></td>
				</tr>
				<tr><td colspan="2" class="h3">{{ lang['img.shadow'] }}</td></tr>
				<tr>
				<td width="50%">{{ lang['shadow_mode'] }} <span class="help-block">{{ lang['shadow_mode_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[shadow_mode]', 'value' : config['shadow_mode'], 'values' : { 0 : lang['mode_demand'], 1 : lang['mode_forbid'], 2 : lang['mode_always'] } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['shadow_place'] }} <span class="help-block">{{ lang['shadow_place_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[shadow_place]', 'value' : config['shadow_place'], 'values' : { 0 : lang['mode_orig'], 1 : lang['mode_copy'], 2 : lang['mode_origcopy'] } }) }}</td>
				</tr>
				<tr><td colspan="2" class="h3">{{ lang['img.stamp'] }}</td></tr>
				<tr>
				<td width="50%">{{ lang['stamp_mode'] }} <span class="help-block">{{ lang['stamp_mode_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[stamp_mode]', 'value' : config['stamp_mode'], 'values' : { 0 : lang['mode_demand'], 1 : lang['mode_forbid'], 2 : lang['mode_always'] } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['stamp_place'] }} <span class="help-block">{{ lang['stamp_place_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[stamp_place]', 'value' : config['stamp_place'], 'values' : { 0 : lang['mode_orig'], 1 : lang['mode_copy'], 2 : lang['mode_origcopy'] } }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['wm_image'] }} <span class="help-block">{{ lang['wm_image_desc'] }}</span></td>
				<td>{{ mkSelect({'name' : 'save_con[wm_image]', 'value' : config['wm_image'], 'values' : list['wm_image'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['wm_image_transition'] }} <span class="help-block">{{ lang['wm_image_transition_desc'] }}</span></td>
				<td><input type="text" class="form-control" name='save_con[wm_image_transition]' value='{{ config['wm_image_transition'] }}' size="6" /></td>
				</tr>
				<!-- END: IMAGE transform control -->
				</table>
			</div>

			<!-- ########################## MULTI TAB ########################## -->
			<div id="userTabs-multi" class="tab-pane">
				<table class="table table-condensed">
				<tr>
				<td colspan="2" class="h3">{{ lang['multi_info'] }}</td>
				</tr>
				<tr>
				<td width="50%" valign=top>{{ lang['mydomains'] }} <span class="help-block">{{ lang['mydomains_desc'] }}</span></td>
				<td width="50%"><textarea cols=45 rows=3 name="save_con[mydomains]">{{ config['mydomains'] }}</textarea></td>
				</tr>
				<tr><td colspan="2">&nbsp;</td></tr>
				<tr>
				<td colspan="2" class="h3">{{ lang['multisite'] }}</td>
				</tr>
				<tr><td colspan=2>
				<table class="contentNav" width="100%">
				<tr><td width="50%"><b>{{ lang['status'] }}</b></td><td width="50%"><b>{{ lang['title'] }}</b></td><td width="50%"><b>{{ lang['domains'] }}</b></td><td width="50%"><b>{{ lang['flags'] }}</b></td></tr>
				{% for MR in multiConfig %}
				<tr class='contentEntry1'><td width="50%">{% if (MR['active']) %}On{% else %}Off{% endif %}</td><td width="50%">{{ MR['key'] }}</td><td width="50%">{% for domain in MR['domains'] %}{{ domain }}<br/>{% else %}- {{ lang['not_specified'] }} -{% endfor %}</td><td width="50%">&nbsp;</td></tr>
				{% else %}
				<tr class='contentEntry1'><td colspan="4">- {{ lang['not_used'] }} -</td></tr>
				{% endfor %}
				</table>
				</td>
				</tr>
				</table>
			</div>

			<!-- ########################## CACHE TAB ########################## -->
			<div id="userTabs-cache" class="tab-pane">
				<table class="table table-condensed">
				<tr>
				<td colspan="2" class="h3">Memcached</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['memcached_enabled'] }} <span class="help-block">{{ lang['memcached_enabled#desc'] }}</span></td>
				<td>{{ mkSelectNY({'name' : 'save_con[use_memcached]', 'value' : config['use_memcached'] }) }}</td>
				</tr>
				<tr>
				<td width="50%">{{ lang['memcached_ip'] }} <span class="help-block">{{ lang['example'] }} localhost</span></td>
				<td width="50%"><input type="text" class="form-control" name="save_con[memcached_ip]" value="{{ config['memcached_ip'] }}" id="memcached_ip" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['memcached_port'] }} <span class="help-block">{{ lang['example'] }} 11211</span></td>
				<td width="50%"><input type="text" class="form-control" name="save_con[memcached_port]" value="{{ config['memcached_port'] }}" id="memcached_port" /></td>
				</tr>
				<tr>
				<td width="50%">{{ lang['memcached_prefix'] }} <span class="help-block">{{ lang['example'] }} ng</span></td>
				<td width="50%"><input type="text" class="form-control" name="save_con[memcached_prefix]" value="{{ config['memcached_prefix'] }}" id="memcached_prefix" /></td>
				</tr>
				<tr>
				<td width="50%">&nbsp;</td>
				<td width="50%"><input type="button" class="btn btn-default" value="{{ lang['btn_checkMemcached'] }}" onclick="ngCheckMemcached(); return false;"/></td>
				</tr>
				</table>
			</div>
		</div>
		<div class="well text-center">
			<input type="submit" value="{{ lang['save'] }}" class="btn btn-success">
		</div>
	</form>
</div>

<script>
// Check DB connection
function ngCheckDB() {
	ngShowLoading();
	$.post('{{ admin_url }}/rpc.php', {
			json : 1,
			methodName : 'admin.configuration.dbCheck',
			rndval: new Date().getTime(),
			params : json_encode(
				{
					'token' : '{{ token }}',
					'dbhost' : $("#db_dbhost").val(),
					'dbname' : $("#db_dbname").val(),
					'dbuser' : $("#db_dbuser").val(),
					'dbpasswd' : $("#db_dbpasswd").val(),
				}
			) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) {
			$.notify({message: '{{ lang['rpc_jsonError'] }} '+data},{type: 'danger'});
		}
		if (!resTX['status']) {
			$.notify({message: 'Error ['+resTX['errorCode']+']: '+resTX['errorText']},{type: 'danger'});
		} else {
			$.notify({message: resTX['errorText']},{type: 'success'});
		}
	}, "text").error(function() { ngHideLoading();
		$.notify({message: '{{ lang['rpc_httpError'] }}'},{type: 'danger'});
	});
}

// Check MEMCached connection
function ngCheckMemcached() {
	ngShowLoading();
	$.post('{{ admin_url }}/rpc.php', {
			json : 1,
			methodName : 'admin.configuration.memcachedCheck',
			rndval: new Date().getTime(),
			params : json_encode(
				{
					'token' : '{{ token }}',
					'ip' : $("#memcached_ip").val(),
					'port' : $("#memcached_port").val(),
					'prefix' : $("#memcached_prefix").val(),
				}
			) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) {
			$.notify({message: '{{ lang['rpc_jsonError'] }} '+data},{type: 'danger'});
		}
		if (!resTX['status']) {
			$.notify({message: 'Error ['+resTX['errorCode']+']: '+resTX['errorText']},{type: 'danger'});
		} else {
			$.notify({message: resTX['errorText']},{type: 'success'});
		}
	}, "text").error(function() { ngHideLoading();
		$.notify({message: '{{ lang['rpc_httpError'] }}'},{type: 'danger'});
	});
}

// Send test e-mail message
function ngCheckEmail() {
	ngShowLoading();
	$.post('{{ admin_url }}/rpc.php', {
			json : 1,
			methodName : 'admin.configuration.emailCheck',
			rndval: new Date().getTime(),
			params : json_encode(
				{
					'token' : '{{ token }}',
					'mode'  : $("#mail_mode").val(),
					'from'  : {
						'name'	: $("#mail_fromname").val(),
						'email' : $("#mail_frommail").val(),
					},
					'to'	: {
						'email' : $("#mail_tomail").val(),
					},
					'smtp'	: {
						'host': $("#mail_smtp_host").val(),
						'port' : $("#mail_smtp_port").val(),
						'auth' : $("#mail_smtp_auth").val(),
						'login': $("#mail_smtp_login").val(),
						'pass': $("#mail_smtp_pass").val(),
						'secure': $("#mail_smtp_secure").val(),
					},
				}
			) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) {
			$.notify({message: '{{ lang['rpc_jsonError'] }} '+data},{type: 'danger'});
		}
		if (!resTX['status']) {
			$.notify({message: 'Error ['+resTX['errorCode']+']: '+resTX['errorText']},{type: 'danger'});
		} else {
			$.notify({message: resTX['errorText']},{type: 'success'});
		}
	}, "text").error(function() { ngHideLoading();
		$.notify({message: '{{ lang['rpc_httpError'] }}'},{type: 'danger'});
	});
}
</script>

<script>
if ($("#mail_mode option:selected").val() != "smtp") {
	$(".useSMTP").hide();
}

$("#mail_mode").on('change', function() {
	if ($("#mail_mode option:selected").val() == "smtp") {
	   $(".useSMTP").show();
	}
	else {
	   $(".useSMTP").hide();
	}
});
</script>
