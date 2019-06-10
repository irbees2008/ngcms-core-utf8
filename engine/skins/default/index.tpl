<!DOCTYPE html>
<html lang="{{ lang['langcode'] }}">
<head>
	<meta charset="{{ lang['encoding'] }}">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>{{ home_title }} - {{ lang['adminpanel'] }}</title>
	<link href="{{ skins_url }}/assets/css/fontawesome.css" rel="stylesheet">
	<link href="{{ themeStyle }}" rel="stylesheet">
	<link href="{{ skins_url }}/css/style.css" rel="stylesheet">

	<script src="{{ skins_url }}/assets/js/jquery-2.1.4.min.js"></script>
	<script src="{{ skins_url }}/assets/js/bootstrap.js"></script>
	<script src="{{ skins_url }}/assets/js/notify.js"></script>
	<script src="{{ skins_url }}/js/script.js"></script>
	<script src="{{ home }}/lib/functions.js"></script>
	<script src="{{ home }}/lib/admin.js"></script>
</head>
<body>
	
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle sidebar-toggle">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand hidden-xs" href="admin.php" title="{{ lang['mainpage_t'] }}"><i class="fa fa-cogs" aria-hidden="true" style="color: #46ddff;"></i> Админпанель</a>
			</div>
			
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
				<li><a href="admin.php?mod=extras&action=clearCacheFiles" title="Очистить кэш"><i class="fa fa-recycle" aria-hidden="true"></i></a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-plus"></i>
						</a>
						<ul class="dropdown-menu dropdown-menu-right">
							<li><a href="{{ php_self }}?mod=news&action=add">{{ lang['head_add_news'] }}</a></li>
							<li><a href="{{ php_self }}?mod=categories&action=add">{{ lang['head_add_cat'] }}</a></li>
							<li><a href="{{ php_self }}?mod=static&action=addForm">{{ lang['head_add_stat'] }}</a></li>
							<li><a href="{{ php_self }}?mod=users" class="add_form">{{ lang['head_add_user'] }}</a></li>
						</ul>
					</li>
					<li class="dropdown notifications-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-bell-o"></i>{{ unnAppLabel }}
						</a>
						<ul class="dropdown-menu">
							<li class="header">{{ unnAppText }}</li>
							{{ unapproved1 }}
							{{ unapproved2 }}
							{{ unapproved3 }}
							<li><a href="{{ php_self }}?mod=pm" title="{{ lang['pm_t'] }}"><i class="fa fa-envelope-o"></i> {{ newpmText }}</a></li>
						</ul>
					</li>
					<li class="dropdown user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" title="{{ userROW['name'] }}"><img src="{{ skin_UAvatar }}" class="img-circle" alt="{{ userROW['name'] }}" width="40" height="40"></a>
						<ul class="dropdown-menu">
							<li class="user-header">
								<!--img src="http://lorempixel.com/output/nature-q-c-280-100-5.jpg"-->
							</li>
							<li class="user-avatar">
								<img src="{{ skin_UAvatar }}" class="img-circle" alt="User Image">
							</li>
							<li class="user-body">
								<p><b>{{ userROW['name'] }}</b><br>{{ skin_UStatus }}</p>
							</li>
							<li class="user-footer">
							<div class="pull-left"><a href="?mod=users&action=editForm&id={{ user.id }}" class="btn btn-default btn-flat">{{ lang['my_profile'] }}</a></div>
								<div class="pull-right"><a href="{{ php_self }}?action=logout" title="{{ lang['logout_t'] }}" class="btn btn-default btn-flat">{{ lang['logout_t'] }}</a></div></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="side-menu-container navbar navbar-inverse">
		<ul class="nav navbar-nav">
			
			<li><a href="{{ home }}" target="_blank"><i class="fa fa-external-link"></i> {{ lang['mainpage'] }}</a></li>
			
			<li>
				<a href="#active_content" data-toggle="collapse" {{ h_active_content }}>
					<i class="fa fa-newspaper-o"></i> {{ lang['content'] }}<span class="caret"></span></a>
				<ul id="active_content" class="navbar-nav panel-collapse collapse">
					<li><a href="{{ php_self }}?mod=news">{{ lang['content_news'] }}</a></li>
					<li><a href="{{ php_self }}?mod=categories">{{ lang['content_categories'] }}</a></li>
					<li><a href="{{ php_self }}?mod=static">{{ lang['content_static'] }}</a></li>
					<li><a href="{{ php_self }}?mod=images">{{ lang['content_images'] }}</a></li>
					<li><a href="{{ php_self }}?mod=files">{{ lang['content_files'] }}</a></li>
				</ul>
			</li>
			
			<li>
				<a href="#h_active_users" data-toggle="collapse" {{ h_active_users }}>
					<i class="fa fa-users"></i> {{ lang['users'] }} <span class="caret"></span></a>
				<ul id="h_active_users" class="navbar-nav panel-collapse collapse">
					<li><a href="{{ php_self }}?mod=users">{{ lang['users_management'] }}</a></li>
					<li><a href="{{ php_self }}?mod=ipban">{{ lang['users_blocked'] }}</a></li>
					<li><a href="{{ php_self }}?mod=ugroup">{{ lang['users_groups'] }}</a></li>
					<li><a href="{{ php_self }}?mod=perm">{{ lang['users_perm'] }}</a></li>
				</ul>
			</li>
			
			<li><a href="{{ php_self }}?mod=extras" {{ h_active_extras }} ><i class="fa fa-puzzle-piece"></i> {{ lang['extras'] }} </a></li>
			
			<li><a href="{{ php_self }}?mod=templates" {{ h_active_templates }} ><i class="fa fa-th-large"></i> {{ lang['templates'] }} </a></li>
			
			<li>
				<a href="#h_active_options" data-toggle="collapse" {{ h_active_options }}>
					<i class="fa fa-cogs"></i> {{ lang['options'] }}  <span class="caret"></span></a>
				<ul id="h_active_options" class="navbar-nav panel-collapse collapse">
					<li><a href="{{ php_self }}?mod=options">{{ lang['options_all'] }} </a></li>
					<li><a href="{{ php_self }}?mod=configuration">{{ lang['options_system'] }} </a></li>
					<li><a href="{{ php_self }}?mod=dbo">{{ lang['options_database'] }} </a></li>
					<li><a href="{{ php_self }}?mod=rewrite">{{ lang['options_rewrite'] }} </a></li>
					<li><a href="{{ php_self }}?mod=cron">{{ lang['options_cron'] }} </a></li>
					<li><a href="{{ php_self }}?mod=statistics">{{ lang['options_statistics'] }} </a></li>
				</ul>
			</li>

			<li>
				<a href="#active_help" data-toggle="collapse" {{ active_help }} >
					<i class="fa fa-leanpub"></i> {{ lang['help'] }} <span class="caret"></span></a>
				<ul id="active_help" class="navbar-nav panel-collapse collapse">
					<li><a href="http://ngcms.ru/forum/" target="_blank"> Форум поддержки</a></li>
					<li><a href="http://wiki.ngcms.ru/" target="_blank"> Wiki NG CMS</a></li>
					<li><a href="http://ngcms.ru/" target="_blank"> Официальный сайт</a></li>
					<li><a href="https://github.com/vponomarev/ngcms-core" target="_blank"> Github</a></li>
				</ul>
			</li>
        </ul>
	</div>
	
	<main id="adminDataBlock" class="side-body">
		
		<noscript>
			<div class="alert alert-danger" role="alert">Внимание! В вашем браузере отключен <b>JavaScript</b></div>
			<div class="alert alert-info" role="alert">Для полноценной работы с админ. панелью <b>включите его</b></div>
		</noscript>

{{ notify }}
{{ main_admin }}

    </main>
	
	<footer class="footer">
		&copy;  2008-{{ year }} <a href="http://ngcms.ru" target="_blank">Next Generation CMS</a>
	</footer>
	
	<div id="modal-dialog" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div id="loading-layer" class="col-md-3"><i class="fa fa-spinner fa-pulse"></i> {{ lang['loading'] }}</div>
	<div id="scrollup" class="fa fa-angle-up"></div>
	<div id="sidenav-overlay"></div>
</body>