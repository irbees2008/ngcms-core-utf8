<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=users">{{ lang['users'] }}</a></li>
	<li class="active">{{ lang['profile_of'] }} <b>{{ name }}</b></li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading"><h4>{{ lang['users.edit'] }}</h4></div>
				<form action="admin.php?mod=users" method="post" class="form-horizontal">
					<input type="hidden" name="token" value="{{ token }}" />
					<input type="hidden" name="id" value="{{ id }}" />
					<input type="hidden" name="action" value="edit" />
					
					<div class="panel-body">
						<div class="form-group">
							<label for="status" class="col-sm-4">{{ lang['groupName'] }}</label>
							<div class="col-sm-8">
								<select name="status" id="status" class="form-control">{{ status }}</select>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-4">{{ lang['new_pass'] }}</label>
							<div class="col-sm-8">
								<input type="password" name="password" id="password" class="form-control">
								<span class="help-block">{{ lang['pass_left'] }}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="mail" class="col-sm-4">{{ lang['email'] }}</label>
							<div class="col-sm-8">
								<input type="email" name="mail" id="email" value="{{ mail }}" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="site" class="col-sm-4">{{ lang['site'] }}</label>
							<div class="col-sm-8">
								<input type="url" name="site" id="site" value="{{ site }}" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="icq" class="col-sm-4">{{ lang['icq'] }}</label>
							<div class="col-sm-8">
								<input type="text" name="icq" id="icq" value="{{ icq }}" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="where_from" class="col-sm-4">{{ lang['from'] }}</label>
							<div class="col-sm-8">
								<input type="text" name="where_from" id="where_from" value="{{ where_from }}" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="info" class="col-sm-4">{{ lang['about'] }}</label>
							<div class="col-sm-8">
								<textarea name="info" id="info" rows="8" class="form-control">{{ info }}</textarea>
							</div>
						</div>
					</div>
					
					{% if (perm.modify) %}
					<div class="panel-footer">
						<div class="clearfix">
							<div class="col-sm-offset-4 col-sm-8">
								<button type="submit" class="btn btn-success">{{ lang['save'] }}</button>
							</div>
						</div>
					</div>
					{% endif %}
				</form>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>{{ lang['statistics'] }}</h4>
				</div>
				<div class="panel-body">
					<dl class="dl-horizontal">
						<dt>{{ lang['regdate'] }}</dt>
						<dd>{{ regdate }}</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>{{ lang['last_login'] }}</dt>
						<dd>{{ last }}</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>{{ lang['last_ip'] }}</dt>
						<dd><a href="http://www.nic.ru/whois/?ip={{ ip }}" title="{{ lang['whois'] }}">{{ ip }}</a></dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>{{ lang['all_news'] }}</dt>
						<dd>{{ news }}</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>{{ lang['all_comments'] }}</dt>
						<dd>{{ com }}</dd>
					</dl>
				</div>
			</div>
			
			{% if (pluginIsActive('xfields')) %}
			<div class="panel panel-default panel-table">
				<div class="panel-heading">
					<h4>Доп. поля в профиле пользователя (только просмотр)</h4>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>ID поля</th>
							<th>Название поля</th>
							<th>Тип поля</th>
							<th>Блок</th>
							<th>Значение</th>
						</tr>
					</thead>
					<tbody>
						{% for xFN,xfV in p.xfields.fields %}
						<tr>
							<td>{{ xFN }}</td>
							<td>{{ xfV.title }}</td>
							<td>{{ xfV.data.type }}</td>
							<td>{{ xfV.data.area }}</td>
							<td>{{ xfV.input }}</td>
						</tr>
						{% endfor %}
					</tbody>
				</table>
				
			</div>
			{% endif %}
		</div>
	</div>
</div>