<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li class="active">{{ lang['static_title'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<!-- Filter form: BEGIN -->
	<div id="filter" class="collapse">
		<div class="well">
			<form action="admin.php" method="get" name="options_bar">
				<input type="hidden" name="mod" value="static" />
			
				<div class="row">
					<!--Block 1-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label for="per_page">{{ lang['per_page'] }}</label>
							<input type="text" name="per_page" id="per_page" value="{{ per_page }}" class="form-control">
						</div>
					</div>
					<!--/Block 1-->
					<!--Block 2-->
					<div class="col col-md-3 col-sm-6">
						
					</div>
					<!--/Block 2-->
					<!--Block 3-->
					<div class="col col-md-3 col-sm-6">
						
					</div>
					<!--/Block 3-->
					<!--Block 4-->
					<div class="col col-md-3 col-sm-6">
						<label for="">&nbsp;</label>
						<button type="submit" class="btn btn-primary form-control">{{ lang['do_show'] }}</button>
					</div>
					<!--Block 4-->
				</div>
			</form>
		</div>
	</div>
	<!-- Filter form: END -->
	
	<div class="panel panel-default panel-table">
		<div class="panel-heading text-right">
			<button type="button" data-toggle="collapse" data-target="#filter" aria-expanded="false" aria-controls="filter" class="btn btn-primary"><i class="fa fa-cog"></i></button>
			{% if (perm.modify) %}
				<a href="admin.php?mod=static&action=addForm" title="{{ lang['addstatic'] }}" class="btn btn-success"><i class="fa fa-plus"></i></a>
			{% endif %}
		</div>
		<form action="admin.php?mod=static" method="post" name="static">
			<input type="hidden" name="token" value="{{ token }}" />
			
			<div class="panel-body table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>{% if (perm.modify) %}<input type="checkbox" class="select-all">{% endif %}</th>
							<th>ID</th>
							<th>{{ lang['title'] }}</th>
							<th>{{ lang['list.altname'] }}</th>
							<th>{{ lang['list.template'] }}</th>
							<th>{{ lang['list.date'] }}</th>
							<th>{{ lang['state'] }}</th>
						</tr>
					</thead>
					
					<tbody>
					{% for entry in entries %}
						<tr>
							<td>{% if (perm.modify) %}<input type="checkbox" name="selected[]" value="{{ entry.id }}">{% endif %}</td>
							<td>{{ entry.id }}</td>
							<td>{% if (perm.details) %}<a href="admin.php?mod=static&amp;action=editForm&amp;id={{ entry.id }}">{% endif %}{{ entry.title }}{% if (perm.details) %}</a>{% endif %}<br/>{{ entry.url }}</td>
							<td>{{ entry.alt_name }}</td>
							<td>{{ entry.template }}</td>
							<td class="text-nowrap">{{ entry.date }}</td>
							<td>{% if (entry.url) %}<i class="fa fa-check text-success" title="{{ lang['state.published'] }}"></i>{% else %}<i class="fa fa-times text-danger" title="{{ lang['state.unpiblished'] }}"></i>{% endif %}</td>
						</tr>
					{% else %}
						<tr><td colspan="6"><p>- {{ lang['not_found'] }} -</p></td></tr>
					{% endfor %}
					</tbody>
				</table>
			</div>

			<div class="panel-footer">
				<div class="row">
					<div class="col col-md-4">
						{% if (perm.modify) %}
						<div class="input-group">
							<select name="action" class="form-control selectpicker">
								<option value="">-- {{ lang['action'] }} --</option>
								<option value="do_mass_delete">{{ lang['delete'] }}</option>
								<option value="do_mass_approve">{{ lang['approve'] }}</option>
								<option value="do_mass_forbidden">{{ lang['forbidden'] }}</option>
							</select>
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit">{{ lang['ok'] }}</button>
							</span>
						</div>
						{% endif %}
					</div>
					<div class="col col-md-8 text-right">
						{{ pagesss }}
					</div>
				</div>
			</div>
		</form>
	</div>
</div>