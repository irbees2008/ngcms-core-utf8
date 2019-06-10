<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=static">{{ lang['static_title'] }}</a></li>
	<li class="active">{% if (flags.editMode) %}{{ lang['static_title_edit'] }} "{{ data.title }}"{% else %}{{ lang['static_title_add'] }}{% endif %}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<form name="form" id="postForm" action="admin.php?mod=static" method="post" target="_self" class="form-horizontal">
		<input type="hidden" name="token" value="{{ token }}" />
		
		<div class="row">
			<!-- MAIN CONTENT -->
			<div id="maincontent" class="col col-sm-8">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">{{ lang['maincontent'] }}</h4>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang['title'] }}</label>
							<div class="col-sm-9">
								<input type="text" name="title" value="{{ data.title }}" tabindex="1" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang['alt_name'] }}</label>
							<div class="col-sm-9">
								<input type="text" name="alt_name" value="{{ data.alt_name }}" tabindex="2" class="form-control"/>
							</div>
						</div>
						{% if (flags.isPublished) %}
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang['url_static_page'] }}</label>
							<div class="col-sm-9">
								<div class="input-group">
									<input type="text" name="url" value="{{ data.url }}" tabindex="3" class="form-control" readonly />
									<span class="input-group-addon">
										<a target="_blank" href="{{ data.url }}"><i class="fa fa-external-link"></i></a>
									</span>
								</div>
							</div>
						</div>
						{% endif %}
						<div class="form-group" id="fullwidth">
							<div class="col-sm-12">
								{% if (not isBBCode) %}
									{{ quicktags }}
									<!-- SMILES -->
									<div id="modal-smiles" class="modal fade" tabindex="-1" role="dialog">
										<div class="modal-dialog modal-sm" role="document">
											<div class="modal-content">
												
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
													<h4>Вставить смайл</h4>
												</div>
												<div class="modal-body text-center smiles">
													{{ smilies }}
												</div>
												<div class="modal-footer">
													<button type="cancel" class="btn btn-default" data-dismiss="modal">{{ lang['cancel'] }}</button>
												</div>

											</div>
										</div>
									</div>
								{% else %}
								{% endif %}
								<textarea name="content" {% if (isBBCode) %}class="{{ attributBB }} form-control"{% else %}id="content" class="form-control"{% endif %} rows="10" tabindex="4">{{ data.content }}</textarea>
							</div>
						</div>
						{% if (flags.meta) %}
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang['description'] }}</label>
							<div class="col-sm-9">
								<textarea name="description" tabindex="5" class="form-control">{{ data.description }}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang['keywords'] }}</label>
							<div class="col-sm-9">
								<input type="text" name="keywords" value="{{ data.keywords }}" tabindex="6" class="form-control"/>
							</div>
						</div>
						{% endif %}
					</div>
				</div>
			</div>
			
			<!-- Right edit column -->
			<div id="rightBar" class="col col-sm-4">
				<div class="panel panel-default">
					<div class="panel-heading">{{ lang['editor.configuration'] }}</div>
					<div class="panel-body">
						<label>
							<input type="checkbox" name="flag_published" value="1" {% if (not flags.canPublish) or (not flags.canUnpublish) %}disabled="disabled" {% endif %} {% if (data.flag_published) %}checked="checked" {% endif %}/>&nbsp;
							{{ lang['approve'] }}<br/>
						</label>
						<label>
							<input type="checkbox" name="flag_html" value="1"  {% if (data.flag_html) %}checked="checked" {% endif %}/>&nbsp;
							{{ lang['flag_html'] }}<br/>
						</label>
						<label>
							<input type="checkbox" name="flag_raw" value="1"  {% if (data.flag_raw) %}checked="checked" {% endif %}/>&nbsp;
							{{ lang['flag_raw'] }}
						</label>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">{{ lang['editor.template'] }}</div>
					<div class="panel-body">
						<select name="template" class="form-control">
							{% for t in templateList %}
							<option value="{{ t }}" {% if (data.template == t) %}selected="selected"{% endif %}>{{ t }}</option>
							{% endfor %}
						</select>
						<br/>
						<label>
							<input type="checkbox" name="flag_template_main" value="1" {% if (data.flag_template_main) %}checked="checked" {% endif %} />&nbsp;
							{{ lang['flag_main'] }}
						</label>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">{{ lang['postdate'] }}</div>
					<div class="panel-body">
						<div class="input-group">
							<span class="input-group-addon">
								<input type="checkbox" name="set_postdate" value="1"/>
							</span>
							<input type="text" id="cdate" name="cdate" value="{{ data.cdate }}" class="form-control"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col col-sm-8">
				<div class="well text-center">
					{% if (flags.editMode) %}
						<input type="hidden" name="id" value="{{ data.id }}" />
						<input type="hidden" name="action" value="edit" />
						{% if (flags.canModify) %}
							<button type="submit" title="Ctrl+S {{ lang['do_editnews'] }}" class="btn btn-success">
								<span class="visible-sm-block visible-xs-block"><i class="fa fa-floppy-o"></i></span>
								<span class="hidden-sm hidden-xs">{{ lang['do_editnews'] }}</span>
							</button>
							<button type="button" onClick="confirmIt('admin.php?mod=static&token={{ token }}&action=do_mass_delete&selected[]={{ data.id }}', '{{ lang['sure_del'] }}')" title="{{ lang['delete'] }}" class="btn btn-danger pull-right"><i class="fa fa-trash-o"></i></button>
						{% endif %}
					{% else %}
						<input type="hidden" name="action" value="add" />
						{% if (flags.canAdd) %}
							<input type="submit" value="{{ lang['addstatic'] }}" class="btn btn-success" />
						{% endif %}
					{% endif %}
				</div>
			</div>
		</div>
	</form>
</div>

<form name="DATA_tmp_storage" action="" id="DATA_tmp_storage"><input type="hidden" name="area" value="" /></form>

<link href="{{ skins_url }}/assets/css/datetimepicker.css" rel="stylesheet">
<script src="{{ skins_url }}/assets/js/moment.js"></script>
<script src="{{ skins_url }}/assets/js/datetimepicker.js"></script>

<script>

$('#cdate').datetimepicker({format:'DD.MM.YYYY HH:mm',locale: "{{ lang['langcode'] }}"});

var currentInputAreaID = 'content';

// CTRL+S
document.onkeydown = function(e) {
	e = e || event;
	if (e.ctrlKey && e.keyCode == 'S'.charCodeAt(0)) {
		form.submit();
		return false;
	}
}
</script>

{{ includ_bb }}