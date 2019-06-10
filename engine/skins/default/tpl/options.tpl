<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang.options['home'] }}</a></li>
	<li class="active">{{ lang.options['options_title'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>{{ lang.options['news'] }}</h4>
				</div>
				<div class="panel-body">
					<ul>
						{% if (perm.static) %}<li><a href="admin.php?mod=static" title="{l_static}">{% endif %}{{ lang.options['static'] }}{% if (perm.static) %}</a></li>{% endif %}
						{% if (perm.categories) %}<li><a href="admin.php?mod=categories" title="{{ lang.options['news.categories'] }}">{% endif %}{{ lang.options['news.categories'] }}{% if (perm.categories) %}</a></li>{% endif %}
						{% if (perm.addnews) %}<li><a href="admin.php?mod=news&action=add" title="{{ lang.options['news.add'] }}">{% endif %}{{ lang.options['news.add'] }}{% if (perm.addnews) %}</a></li>{% endif %}
						{% if (perm.editnews) %}<li><a href="admin.php?mod=news" title="{{ lang.options['news.edit'] }}">{% endif %}{{ lang.options['news.edit'] }}{% if (perm.editnews) %}</a></li>{% endif %}
					</ul>
				</div>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>{{ lang.options['system'] }}</h4>
				</div>
				<div class="panel-body">
					<ul>
						{% if (perm.configuration) %}<li><a href="admin.php?mod=configuration" title="{{ lang.options['configuration'] }}">{% endif %}{{ lang.options['configuration'] }}{% if (perm.configuration) %}</a></li>{% endif %}
						{% if (perm.dbo) %}<li><a href="admin.php?mod=dbo" title="{{ lang.options['dbo'] }}">{% endif %}{{ lang.options['dbo'] }}{% if (perm.dbo) %}</a></li>{% endif %}
						<li><a href="admin.php?mod=statistics" title="{{ lang.options['statistics'] }}">{{ lang.options['statistics'] }}</a></li>
						{% if (perm.rewrite) %}<li><a href="admin.php?mod=rewrite" title="{{ lang.options['rewrite'] }}">{% endif %}{{ lang.options['rewrite'] }}{% if (perm.rewrite) %}</a></li>{% endif %}
						{% if (perm.cron) %}<li><a href="admin.php?mod=cron" title="{{ lang.options['cron'] }}">{% endif %}{{ lang.options['cron'] }}{% if (perm.cron) %}</a></li>{% endif %}
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>{{ lang.options['userman'] }}</h4>
				</div>
				<div class="panel-body">
					<ul>
						{% if (perm.users) %}<li><a href="admin.php?mod=users" title="{{ lang.options['users'] }}">{% endif %}{{ lang.options['users'] }}{% if (perm.users) %}</a></li>{% endif %}
						{% if (perm.ipban) %}<li><a href="admin.php?mod=ipban" title="{{ lang.options['ipban'] }}">{% endif %}{{ lang.options['ipban'] }}{% if (perm.ipban) %}</a></li>{% endif %}
						<li><a href="admin.php?mod=ugroup" title="{{ lang.options['ugroup'] }}">{{ lang.options['ugroup'] }}</a></li>
						<li><a href="admin.php?mod=perm" title="{{ lang.options['uperm'] }}">{{ lang.options['uperm'] }}</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>{{ lang.options['other'] }}</h4>
				</div>
				<div class="panel-body">
					<ul>
						<li><a href="admin.php?mod=extras" title="{{ lang.options['extras'] }}">{{ lang.options['extras'] }}</a></li>
						<li><a href="admin.php?mod=images" title="{{ lang.options['images'] }}">{{ lang.options['images'] }}</a></li>
						<li><a href="admin.php?mod=files" title="{{ lang.options['files'] }}">{{ lang.options['files'] }}</a></li>
						{% if (perm.templates) %}<li><a href="admin.php?mod=templates" title="{{ lang.options['templates'] }}">{% endif %}{{ lang.options['templates'] }}{% if (perm.templates) %}</a></li>{% endif %}
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>Настройки админ. панели</h4>
				</div>
				<div class="panel-body">
					<div class="row">
						<!--Block 1-->
						<div class="col col-md-3 col-sm-6">
							<div class="form-group">
								<label>Тема оформления </label>
								<div class="input-group">
									<select id="theme-style">
										<option value="default">Default</option>
										<option value="cerulean">Cerulean</option>
										<option value="cosmo">Cosmo</option>
										<option value="cyborg">Cyborg</option>
										<option value="darkly">Darkly</option>
										<option value="flatly">Flatly</option>
										<option value="journal">Journal</option>
										<option value="lumen">Lumen</option>
										<option value="paper">Paper</option>
										<option value="sandstone">Sandstone</option>
										<option value="simplex">Simplex</option>
										<option value="slate">Slate</option>
										<option value="spacelab">Spacelab</option>
										<option value="superhero">Superhero</option>
										<option value="united">United</option>
										<option value="yeti">Yeti</option>
									</select>
									<span class="input-group-btn">
										<button type="button" id="themes" class="btn btn-success">{{ lang.options['ok'] }}</button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
if (typeof(localStorage) == "undefined") {
    $.notify({message: 'Sorry! No Web Storage support . . .'},{type: 'danger'});
}
</script>