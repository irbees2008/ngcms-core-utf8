<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li class="active">{{ lang['users'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<!-- Filter form: BEGIN -->
	<div id="filter" class="collapse">
		<div class="well">
			<form method="GET" action="admin.php">
				<input type="hidden" name="mod" value="users" />
				<input type="hidden" name="action" value="list" />
				
				<div class="row">
					<!--Block 1-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label for="name">{{ lang['name'] }}</label>
							<input type="text" name="name" id="name" value="{{ name }}" class="form-control">
						</div>
					</div>
					<!--/Block 1-->
					<!--Block 2-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label for="group">{{ lang['group'] }}</label>
							<select name="group" id="group" class="form-control">
								<option value="0">-- {{ lang['any'] }} --</option>
								{% for g in ugroup %}
								<option value="{{ g.id }}" {% if (group == g.id) %}selected="selected"{% endif %}>{{ g.name }}</option>
								{% endfor %}
							</select>
						</div>
					</div>
					<!--/Block 2-->
					<!--Block 3-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label for="rpp">{{ lang['per_page'] }}</label>
							<input type="text" name="rpp" id="rpp" value="{{ rpp }}" class="form-control">
						</div>
					</div>
					<!--/Block 3-->
					<!--Block 4-->
					<div class="col col-md-3 col-sm-6 text-right">
						<label for="">&nbsp;</label>
						<button type="submit" class="btn btn-primary form-control">{{ lang['do_show'] }}</button>
					</div>
					<!--/Block 4-->
				</div>
			</form>
		</div>
	</div>
	<!-- Filter form: END -->
	
	<div class="panel panel-default panel-table">
		<div class="panel-heading text-right">
			<a href="admin.php?mod=ugroup&action=addForm" data-toggle="modal" data-target="#categories" class="btn btn-default add_form"><i class="fa fa-pencil"></i></a>
			<button type="button" data-toggle="collapse" data-target="#filter" aria-expanded="false" aria-controls="filter" class="btn btn-primary"><i class="fa fa-cog"></i></button>
			{% if flags.canModify %}
				<a href="#" title="{{ lang['adduser'] }}" class="btn btn-success add_form" data-toggle="modal" data-target="#add_edit_form"><i class="fa fa-plus"></i></a>
			{% endif %}
		</div>
		<!-- Mass actions form: BEGIN -->
		<form name="form_users" id="form_users" action="admin.php" method="GET">
			<div class="panel-body table-responsive">
				<input type="hidden" name="mod" value="users" />
				<input type="hidden" name="token" value="{{ token }}" />
				<input type="hidden" name="name" value="{{ name }}">
				<input type="hidden" name="how" value="{how_value}">
				<input type="hidden" name="sort" value="{sort_value}">
				<input type="hidden" name="page" value="{page_value}">
				<input type="hidden" name="per_page" value="{{ rpp }}">
				
				<table class="table table-condensed">
					<thead>
						<tr>
							<th>{% if flags.canModify %}<input type="checkbox" class="select-all">{% endif %}</th>
							<th><a href="{{ sortLink['i']['link'] }}">#</a> {{ sortLink['i']['sign'] }}</th>
							<th><a href="{{ sortLink['n']['link'] }}">{{ lang['name'] }}</a> {{ sortLink['n']['sign'] }}</th>
							<th><a href="{{ sortLink['r']['link'] }}">{{ lang['regdate'] }}</a> {{ sortLink['r']['sign'] }}</th>
							<th><a href="{{ sortLink['l']['link'] }}">{{ lang['last_login'] }}</a> {{ sortLink['l']['sign'] }}</th>
							<th><a href="{{ sortLink['p']['link'] }}">{{ lang['all_news2'] }}</a> {{ sortLink['p']['sign'] }}</th>
							{% if flags.haveComments %}<th>{l_listhead.comments}</th>{% endif %}
							<th><a href="{{ sortLink['g']['link'] }}">{{ lang['groupName'] }}</a> {{ sortLink['g']['sign'] }}</th>
							<th>{{ lang['status'] }}</th>
						</tr>
					</thead>
					
					<tbody>
					{% for entry in entries %}
						<tr>
							<td>{% if flags.canModify %}{% if flags.canMassAction %}<input name="selected_users[]" value="{{ entry.id }}" type="checkbox" />{% endif %}{% endif %}</td>
							<td>{{ entry.id }}</td>
							<td>{% if flags.canView %}<a href="admin.php?mod=users&amp;action=editForm&amp;id={{ entry.id }}">{{ entry.name }}</a>{% else %}{{ entry.name }}{% endif %}</td>
							<td>{{ entry.regdate }}</td>
							<td>{{ entry.lastdate }}</td>
							<td>{% if entry.cntNews > 0 %}<a href="admin.php?mod=news&amp;aid={{ entry.id }}">{{ entry.cntNews }}</a>{% else %}-{% endif %}</td>
							{% if flags.haveComments %}<td>{% if entry.cntComments > 0 %}{{ entry.cntComments }}{% else %}-{% endif %}</td>{% endif %}
							<td>{{ entry.groupName }}</td>
							<td>
								{% if entry.flags.isActive %}
									<i class="fa fa-check text-success"></i>
								{% else %}
									<i class="fa fa-times text-danger"></i>
								{%endif %}
							</td>
						</tr>
					{% else %}
						<tr><td colspan="6"><p>{{ lang['not_found'] }}</p></td></tr>
					{% endfor %}
					</tbody>
				</table>
			</div>

			<div class="panel-footer">
				<div class="row">
					<div class="col col-md-4">
						{% if flags.canModify %}
						<div class="form-group">
							<div class="input-group">
								<select name="action" onchange="updateAction();" onclick="updateAction();" class="form-control">
									<option value="" class="divider">-- {{ lang['action'] }} --</option>
									<option value="massActivate">{{ lang['activate'] }}</option>
									<option value="massLock">{{ lang['lock'] }}</option>
									<option value="" class="divider" disabled>===================</option>
									<option value="massDel">{{ lang['delete'] }}</option>
									<option value="massDelInactive">{{ lang['delete_unact'] }}</option>
									<option value="" class="divider" disabled>===================</option>
									<option value="massSetStatus">{{ lang['setstatus'] }} &raquo;</option>
								</select>
								
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" value="{{ lang['submit'] }}" onclick="validateAction();">{{ lang['ok'] }}</button>
								</span>
							</div>
							
						</div>
						<div class="form-group" id="newstatus">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">{{ lang['status'] }}</span>
								<select name="newstatus" class="form-control">
									<option value="0" selected></option>
									{% for grp in ugroup %}
									<option value="{{ grp.id }}">{{ grp.id }} ({{ grp.name }})</option>
									{% endfor %}
								</select>
							</div>
						</div>
						{% endif %}
					</div>
					<div class="col col-md-8 text-right">
						{{ pagination }}
					</div>
				</div>
			</div>
		</form>
		<!-- Mass actions form: END -->
	</div>
</div>

{% if flags.canModify %}
<div id="add_edit_form" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form method="post" action="admin.php?mod=users" class="form-horizontal">
				<input type="hidden" name="action" value="add">
				<input type="hidden" name="token" value="{{ token }}">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4>{{ lang['adduser'] }}</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="regusername" class="col-sm-4">{{ lang['name'] }}</label>
						<div class="col-sm-8">
							<input type="text" name="regusername" id="regusername" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="regpassword" class="col-sm-4">{l_password}</label>
						<div class="col-sm-8">
							<input type="password" name="regpassword" id="regpassword" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="regemail" class="col-sm-4">{l_email}</label>
						<div class="col-sm-8">
							<input type="email" name="regemail" id="regemail" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="reglevel" class="col-sm-4">{l_status}</label>
						<div class="col-sm-8">
							<select name="reglevel" id="reglevel" class="form-control">
							{% for grp in ugroup %}
								<option value="{{ grp.id }}">{{ grp.id }} ({{ grp.name }})</option>
							{% endfor %}
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="cancel" class="btn btn-default" data-dismiss="modal">{{ lang['cancel'] }}</button>
					<button type="submit" class="btn btn-success">{l_adduser}</button>
				</div>
			</form>
		</div>
	</div>
</div>
{% endif %}

<script>
	function updateAction() {
		mode = document.forms['form_users'].action.value;

		if (mode == 'massSetStatus')
			$('#newstatus').css( "display", "block" );
		else
			$('#newstatus').css( "display", "none" );
	}

	function validateAction() {
		mode = document.forms['form_users'].action.value;

		if (mode == '') {
			alert('Необходимо выбрать действие!');
			return;
		}

		if ((mode == 'massSetStatus')&&(document.forms['form_users'].newstatus.value < 1)) {
			alert('{l_msge_setstatus}');
			return;
		}

		document.forms['form_users'].submit();
	}
</script>