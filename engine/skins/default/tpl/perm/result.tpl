<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=users">{{ lang['users'] }}</a></li>
	<li><a href="admin.php?mod=perm">{{ lang['permissions'] }}</a></li>
	<li class="active">{{ lang['list_changes_performed'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div class="{% if (execResult) %}sysmsg_common{% else %}syserror_common{% endif %}">
		{{ lang['result'] }} <b>{% if (execResult) %}{{ lang['success'] }}{% else %}{{ lang['error'] }}{% endif %}</b>
	</div>
	<div class="panel panel-default panel-table">
		<div class="panel-body table-responsive">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>{{ lang['group'] }}</th>
						<th>ID</th>
						<th>{{ lang['name'] }}</th>
						<th>{{ lang['old_value'] }}</th>
						<th>{{ lang['new_value'] }}</th>
					</tr>
				</thead>
				<tbody>
				{% for entry in updateList %}
					<tr>
						<td>{{ GRP[entry.group]['title'] }}</td>
						<td>{{ entry.id }}</td>
						<td>{{ entry.title }}</td>
						<td>{{ entry.displayOld }}</td>
						<td>{{ entry.displayNew }}</td>
					</tr>
				{% else %}
					<tr><td colspan="5"><p>{{ lang['not_found'] }}</p></td></tr>
				{% endfor %}
				</tbody>
			</table>
		</div>
	</div>
</div>
