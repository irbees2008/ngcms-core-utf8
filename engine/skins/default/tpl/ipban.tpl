<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=users">{{ lang['users'] }}</a></li>
	<li class="active">{{ lang.ipban['hdr.list'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div class="panel panel-default panel-table">
		{% if flags.permModify %}
			<div class="panel-heading text-right">
				<a href="#" title="{{ lang.ipban['add.submit'] }}" data-toggle="modal" data-target="#add_edit_form" class="btn btn-danger add_form"><i class="fa fa-ban"></i> </a>
				
			</div>
		{% endif %}
		<!-- List of ipbans: BEGIN -->
		<div class="panel-body table-responsive">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>{{ lang.ipban['hdr.ip'] }}</th>
						<th>{{ lang.ipban['hdr.counter'] }}</th>
						<th>{{ lang.ipban['hdr.type'] }}</th>
						<th>{{ lang.ipban['hdr.reason'] }}</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					{% for entry in entries %}
					<tr>
						<td nowrap><a href="http://www.nic.ru/whois/?ip={{ entry.whoisip }}" target="_blank">?</a> {{ entry.ip }}</td>
						<td>{{ entry.hitcount }}</td>
						<td>{{ entry.type }}</td>
						<td>{{ entry.descr }}</td>
						<td>{% if flags.permModify %}<a href="admin.php?mod=ipban&amp;action=del&amp;id={{ entry.id }}&amp;token={{ token }}"><img src="{{skins_url}}/images/delete.gif" hspace="8" alt="{{ lang.ipban['act.unblock'] }}" title="{{ lang.ipban['act.unblock'] }}" /></a>{% endif %}</td>
					</tr>
					{% else %}
					<tr><td colspan="5"><p>{{ lang['not_found'] }}</p></td></tr>
					{% endfor %}
				</tbody>
			</table>
		</div>
		<!-- List of ipbans: END -->
	</div>
</div>

{% if flags.permModify %}
<div id="add_edit_form" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form name="form" method="post" action="admin.php?mod=ipban" class="form-horizontal">
				<input type="hidden" name="token" value="{{token}}"/>
				<input type="hidden" name="action" value="add"/>
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4>{{ lang.ipban['hdr.block'] }}</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<div class="col-sm-12">
							<div class="alert alert-info" role="alert"><p>{{ lang.ipban['info.descr'] }}</p></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4">{{ lang.ipban['add.ip'] }}</label>
						<div class="col-sm-8">
							<input type="text" name="ip" value="{{ iplock }}" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4">{{ lang.ipban['add.block.open'] }}</label>
						<div class="col-sm-8">
							<select disabled="disabled" name="lock:open" class="form-control">
								<option value="0">--</option>
								<option value="1" class="text-info">{{ lang.ipban['lock.block'] }}</option>
								<option value="2" class="text-danger">{{ lang.ipban['lock.silent'] }}</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4">{{ lang.ipban['add.block.reg'] }}</label>
						<div class="col-sm-8">
							<select name="lock:reg" class="form-control">
								<option value="0">--</option>
								<option value="1" class="text-info">{{ lang.ipban['lock.block'] }}</option>
								<option value="2" class="text-danger">{{ lang.ipban['lock.silent'] }}</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4">{{ lang.ipban['add.block.login'] }}</label>
						<div class="col-sm-8">
							<select name="lock:login" class="form-control">
								<option value="0">--</option>
								<option value="1" class="text-info">{{ lang.ipban['lock.block'] }}</option>
								<option value="2" class="text-danger">{{ lang.ipban['lock.silent'] }}</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4">{{ lang.ipban['add.block.comm'] }}</label>
						<div class="col-sm-8">
							<select name="lock:comm" class="form-control">
								<option value="0">--</option>
								<option value="1" class="text-info">{{ lang.ipban['lock.block'] }}</option>
								<option value="2" class="text-danger">{{ lang.ipban['lock.silent'] }}</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4">{{ lang.ipban['add.block.rsn'] }}</label>
						<div class="col-sm-8">
							<input type="text" name="lock:rsn" class="form-control">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="cancel" class="btn btn-default" data-dismiss="modal">{{ lang['cancel'] }}</button>
					<button type="submit" class="btn btn-danger">{{ lang.ipban['add.submit'] }}</button>
				</div>
			</form>
		</div>
	</div>
</div>
{% endif %}
