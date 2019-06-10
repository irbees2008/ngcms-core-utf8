<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=users">{{ lang['users'] }}</a></li>
	<li class="active">{{ lang['user_groups'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div class="panel panel-default panel-table">
		{% if (flags.canAdd) %}
			<div class="panel-heading text-right">
				<a href="admin.php?mod=ugroup&action=addForm" title="{{ lang['add_group'] }}" class="btn btn-success add_form"><i class="fa fa-plus"></i></a>
			</div>
		{% endif %}
		<div class="panel-body table-responsive">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>#</th>
						<th>{{ lang['identifier'] }}</th>
						<th>{{ lang['name'] }}</th>
						<th>{{ lang['users_in_group'] }}</th>
						<th>{{ lang['action'] }}</th>
					</tr>
				</thead>
				<tbody id="admCatList">
					{% for entry in entries %}
					<tr>
						<td>{{ entry.id }}</td>
						<td>{{ entry.identity }}</td>
						<td>{{ entry.name }}</td>
						<td>{{ entry.count }}</td>
						<td>
							{% if (entry.flags.canEdit) %}[ <a href="?mod=ugroup&action=editForm&id={{entry.id}}" data-id="{{entry.id}}" class="edit_form">Edit</a> ]{% endif %}
							{% if (entry.flags.canDelete) %}[ <a href="?mod=ugroup&action=delete&id={{entry.id}}&token={{ token }}">Delete</a> ]{% endif %}</td>
					</tr>
					{% endfor %}
				</tbody>
			</table>
		</div>
	</div>
</div>

<div id="add_edit_form" class="modal fade in" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
			<form action="admin.php?mod=ugroup" method="post" class="form-horizontal">
				<input type="hidden" name="token" value="{{ token }}"/>
				<input type="hidden" name="id" value="{{ entry.id }}"/>
				<input type="hidden" name="action" value="{% if (flags.editMode) %}edit{% else %}add{% endif %}" />
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4>{% if flags.editMode %} {{ lang['edit_group'] }} "{{ entry.identity }}" [ {{ entry.id }} ]{% else %}{{ lang['add_group'] }}{% endif %}</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="col-sm-4">ID</label>
						<div class="col-sm-8">
							{{ entry.id }}
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4">{{ lang['identifier'] }}</label>
						<div class="col-sm-8">
							<input type="text" name="identity" value="{{ entry.identity }}" class="form-control" />
						</div>
					</div>
					{% for eLang,eLValue in entry.langName %}
					<div class="form-group">
						<label class="col-sm-4">{{ lang['name_group_lang'] }} [{{ eLang }}]</label>
						<div class="col-sm-8">
							<input type="text" name="langname[{{ eLang }}]" value="{{ eLValue }}" class="form-control" />
						</div>
					</div>
					{% endfor %}
				</div>
				<div class="modal-footer">
					<button type="cancel" class="btn btn-default" data-dismiss="modal">{{ lang['cancel'] }}</button>
					{% if (flags.canModify) %}
					<button type="submit" class="btn btn-success">{% if flags.editMode %}{{ lang['save'] }}{% else %}{{ lang['add_group'] }}{% endif %}</button>
					{% endif %}
				</div>
			</form>
		</div>
</div>
