<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=news">{{ lang['news_title'] }}</a></li>
	<li class="active">{{ lang.editnews['editnews_title'] }} <b>{{ title }}</b></li>
</ul>

<script src="{{ home }}/lib/ajax.js"></script>
<script src="{{ home }}/lib/libsuggest.js"></script>

<!-- Info content -->
<div class="page-main">
	<!-- Main content form -->
	<form name="form" id="postForm" action="admin.php?mod=news" method="post" enctype="multipart/form-data" target="_self" class="form-horizontal">
		<input type="hidden" name="token" value="{{ token }}" />
		<input type="hidden" name="mod" value="news" />
		<input type="hidden" name="action" value="edit" />
		<input type="hidden" name="subaction" value="submit" />
		<input type="hidden" name="id" value="{{ id }}" />
		
		<div class="row">
			<div class="col col-sm-8">
				<!-- MAIN CONTENT -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title"><i class="fa fa-th-list"></i> {{ lang['maincontent'] }}</h4>
					</div>
					<div id="maincontent" class="panel-body">
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang.addnews['title'] }}</label>
							<div class="col-sm-9">
								<input type="text" name="title" id="newsTitle" value="{{ title }}" tabindex="1" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang.editnews['alt_name'] }}</label>
							<div class="col-sm-9">
								<input type="text" name="alt_name" value="{{ alt_name }}" tabindex="2" class="form-control"{% if flags['altname.disabled'] %} disabled {% endif %}/>
							</div>
						</div>
						{% if (approve == 1) %}
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang['url_news_page'] }}</label>
							<div class="col-sm-9">
								<div class="input-group">
									<input type="text" value="{{ link }}" tabindex="3" class="form-control" readonly />
									<span class="input-group-addon">
										<a href="{{ link }}" target="_blank"><i class="fa fa-external-link"></i></a>
									</span>
								</div>
							</div>
						</div>
						{% endif %}
						<div class="form-group">
							<label class="col-sm-3 control-label">
								{{ lang.editnews['category'] }}
								{% if (flags.mondatory_cat) %} <span class="text-danger"><b>*</b></span>{% endif %}
							</label>
							<div class="col-sm-9">{{ mastercat }}</div>
						</div>
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
								<script>function counter(el)
{var wrapper = document.createElement('DIV');
wrapper.innerHTML = el.value;
var len = (wrapper.textContent || wrapper.innerText).length;
document.getElementById('count').innerHTML = len + ' | ' + el.value.length;
document.getElementById('kb').innerHTML = (len/1024).toFixed(2);
}
</script>
								{% if (flags.edit_split) %}
									<div id="container.content.short" class="contentActive">
										<textarea onclick="changeActive('short');" onfocus="changeActive('short');" name="ng_news_content_short" {% if (isBBCode) %}class="{{ attributBB }} form-control"{% else %}id="ng_news_content_short" class="form-control"{% endif %} rows="6" tabindex="3" onkeyup="counter(this);" onchange="counter(this);">{{ content.short }}</textarea>
										<BR/>Вы ввели: <span id='count'>0</span> символов. <span id='kb'>0</span>Kb
									</div>
									{% if (flags.extended_more) %}
										<div class="form-group">
											<label class="col-sm-3 control-label">{{ lang.addnews['editor.divider'] }}</label>
											<div class="col-sm-9">
												<input type="text" name="content_delimiter" value="" tabindex="4" class="form-control"/>
											</div>
										</div>
									{% endif %}
									<div id="container.content.full" class="contentInactive">
										<textarea onclick="changeActive('full');" onfocus="changeActive('full');" name="ng_news_content_full" {% if (isBBCode) %}class="{{ attributBB }} form-control"{% else %}id="ng_news_content_full" class="form-control"{% endif %} rows="10" tabindex="5" onkeyup="counter(this);" onchange="counter(this);">{{ content.full }}</textarea>
										<BR/>Вы ввели: <span id='count'>0</span> символов. <span id='kb'>0</span>Kb
									</div>
								{% else %}
									<div id="container.content" class="contentActive">
									<textarea name="ng_news_content" {% if (isBBCode) %}class="{{ attributBB }} form-control"{% else %}id="ng_news_content" class="form-control"{% endif %} rows="10" tabindex="5" onkeyup="counter(this);" onchange="counter(this);">{{ content.short }}</textarea>
									<BR/>Вы ввели: <span id='count'>0</span> символов. <span id='kb'>0</span>Kb
									</div>
								{% endif %}
							</div>
						</div>
						{% if (flags.meta) %}
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang.addnews['description'] }}</label>
							<div class="col-sm-9">
								<textarea name="description" class="form-control" rows="4" tabindex="6">{{ description }}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang.addnews['keywords'] }}</label>
							<div class="col-sm-9">
								<input type="text" name="keywords" id="newsKeywords" value="{{ keywords }}" tabindex="7" class="form-control"/>
							</div>
						</div>
						{% endif %}
						{% if (pluginIsActive('comments')) %}
						<div class="form-group">
							<label class="col-sm-3 control-label">{{ lang['comments:mode.header'] }}</label>
							<div class="col-sm-9">
								<select name="allow_com" class="form-control">
									<option value="0"{{ plugin.comments['acom:0'] }}>{{ lang['comments:mode.disallow'] }}
									<option value="1"{{ plugin.comments['acom:1'] }}>{{ lang['comments:mode.allow'] }}
									<option value="2"{{ plugin.comments['acom:2'] }}>{{ lang['comments:mode.default'] }}
								</select>
							</div>
						</div>
						{% endif %}
						<div class="form-group">
							<label class="col-sm-3">{{ lang.editnews['set_views'] }}</label>
							<div class="col-sm-3">
								<div class="input-group">
									<span class="input-group-addon">
										<input type="checkbox" name="setViews" value="1" id="setViews" {% if (flags['setviews.disabled']) %}disabled{% endif %} />
									</span>
									<input type="text" name="views" value="{{ views }}"  {% if (flags['setviews.disabled']) %}disabled{% endif %}class="form-control" />
								</div>
							</div>
						</div>
					</div>
					{% if (pluginIsActive('xfields') and plugin.xfields[1]) %}
					<!-- XFields -->
					<table class="table table-condensed">
							{{ plugin.xfields[1] }}
						</table>
					<!-- /XFields -->
					{% endif %}
				</div>
				
				<div class="panel-group" id="accordion">
					<!-- ADDITIONAL -->
					<div class="panel panel-default panel-table">
						<div class="panel-heading">
							<h4 class="panel-title"><i class="fa fa-th-list"></i> 
								<a href="#additional" data-toggle="collapse" data-parent="#accordion" aria-expanded="false">{{ lang.editnews['bar.additional'] }}</a>
							</h4>
						</div>
						<div id="additional" class="panel-collapse collapse" aria-expanded="false">
							<div class="panel-body">
								<table class="table table-condensed">
									<tbody>
										<tr>
										{% if (pluginIsActive('tags')) %}{{ plugin.tags }}{% endif %}
										{% if (pluginIsActive('xfields') and plugin.xfields[0]) %}{{ plugin.xfields[0] }}{% endif %}
										{% if (pluginIsActive('nsched')) %}{{ plugin.nsched }}{% endif %}
										{% if (pluginIsActive('finance')) %}{{ plugin.finance }}{% endif %}
										{% if (pluginIsActive('tracker')) %}{{ plugin.tracker }}{% endif %}
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<!-- ATTACHES -->
					<div class="panel panel-default panel-table">
						<div class="panel-heading">
							<h4 class="panel-title"><i class="fa fa-th-list"></i> 
								<a href="#attaches" data-toggle="collapse" data-parent="#accordion" aria-expanded="false">{{ lang.editnews['bar.attaches'] }} ({% if (attachCount>0) %}{{ attachCount }}{% else %}{{ lang['noa'] }}{% endif %})</a>
							</h4>
						</div>
						<div id="attaches" class="panel-collapse collapse" aria-expanded="false">
							<div class="panel-body">
								<table id="attachFilelist_edit" class="table table-condensed table-bordered">
									<thead>
										<tr>
											<th>ID</th>
											<th><i class="fa fa-paperclip fa-2x"></i></th>
											<th>{{ lang.editnews['attach.filename'] }}</th>
											<th>{{ lang.editnews['attach.size'] }}</th>
											<th>{{ lang.editnews['attach.date'] }}</th>
											<th class="text-center">{{ lang['do_delete'] }}</th>
										</tr>
									</thead>
									<tbody>
									{% for entry in attachEntries %}
										<tr>
											<td>{{ entry.id }}</td>
											<td>
												<a href="#" onclick="insertext('[attach#{{ entry.id }}]{{ entry.orig_name }}[/attach]','', currentInputAreaID); return false;" title="{{ lang['tags.file'] }}"><i class="fa fa-paperclip fa-2x"></i></a>
											</td>
											<td><a href="{{ entry.url }}">{{ entry.orig_name }}</a></td>
											<td>{{ entry.filesize }}</td>
											<td>{{ entry.date }}</td>
											<td class="text-center"><input type="checkbox" name="delfile_{{ entry.id }}" value="1" /></td>
										</tr>
									{% else %}
										<tr><td colspan="5">{{ lang.editnews['attach.no_files_attached'] }}</td></tr>
									{% endfor %}
										<tr>
											<td colspan="5"></td>
											<td class="text-center" width="10">
												<button type="button" title="{l_attach.more_rows}" onclick="attachAddRow('attachFilelist_edit');" class="btn btn-primary" title="{l_attach.more_rows}"><i class="fa fa-plus"></i></button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				{% if flags['params.lost'] %}
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h4 class="panel-title">Обратите внимание - у вас недостаточно прав для полноценного редактирования новости.</h4>
					</div>
					<div class="panel-body">
						<p>При сохранении будут произведены следующие изменения:</p>
						<ul>
							{% if flags['publish.lost'] %}<li>Новость будет снята с публикации</li>{% endif %}
							{% if flags['html.lost'] %}<li>В новости будет запрещено использование HTML тегов и автоформатирование</li>{% endif %}
							{% if flags['mainpage.lost'] %}<li>Новость будет убрана с главной страницы</li>{% endif %}
							{% if flags['pinned.lost'] %}<li>С новости будет снято прикрепление на главной</li>{% endif %}
							{% if flags['catpinned.lost'] %}<li>С новости будет снято прикрепление в категории</li>{% endif %}
							{% if flags['favorite.lost'] %}<li>Новость будет удалена из закладок администратора</li>{% endif %}
							{% if flags['multicat.lost'] %}<li>Из новости будут удалены все дополнительные категории</li>{% endif %}
						</ul>
					</div>
				</div>
				{% endif %}
			</div>
			
			<!-- Right edit column -->
			<div id="rightBar" class="col col-sm-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">{{ lang['editor.comminfo'] }}</h4>
					</div>
					<table class="table table-condensed">
						<tbody>
							<tr>
								<td>{{ lang['editor.author'] }}</td>
								<td>
									<b><span id="news-author">{{ author }}</span></b>
									<div class="pull-right">
									{% if (pluginIsActive('uprofile')) %}
									<a href="{{ author_page }}" target="_blank" title="{{ lang.editnews['site.viewuser'] }}" class="btn-sm btn-default"><i class="fa fa-eye"></i></a>&nbsp;
									{% endif %}
									<a href="admin.php?mod=users&amp;action=editForm&amp;id={{ authorid }}" target="_blank" class="btn-sm btn-default"><i class="fa fa-pencil"></i></a>&nbsp;
									</div>
								</td>
							</tr>
							<tr>
								<td>{{ lang['editor.dcreate'] }}</td>
								<td>{{ createdate }}</td>
							</tr>
							<tr>
								<td>{{ lang['editor.dedit'] }}</td>
								<td>{{ editdate }}</td>
							</tr>
							<tr>
								<td>{{ lang['state'] }}</td>
								<td><b>{% if (approve == -1) %}<span class="text-danger">{{ lang['state.draft'] }}</span>{% elseif (approve == 0) %}<span class="text-danger">{{ lang['state.unpublished'] }}</span>{% else %}<span class="text-success">{{ lang['state.published'] }}{% endif %}</span></b>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">{{ lang['editor.extcat'] }}</h4>
					</div>
					<div class="panel-body cat-list">{{ extcat }}</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">{{ lang['editor.configuration'] }}</h4>
					</div>
					<div class="panel-body">
						<label><input type="checkbox" name="mainpage" value="1" {% if (flags.mainpage) %}checked="checked"{% endif %} id="mainpage" {% if (flags['mainpage.disabled']) %}disabled{% endif %} /> {{ lang.editnews['mainpage'] }}</label><br />
						<label><input type="checkbox" name="pinned" value="1" {% if (flags.pinned) %}checked="checked"{% endif %} id="pinned" {% if (flags['pinned.disabled']) %}disabled{% endif %} /> {{ lang.editnews['add_pinned'] }}</label><br />
						<label><input type="checkbox" name="catpinned" value="1" {% if (flags.catpinned) %}checked="checked"{% endif %} id="catpinned" {% if (flags['catpinned.disabled']) %}disabled{% endif %} /> {{ lang.editnews['add_catpinned'] }}</label><br />
						<label><input type="checkbox" name="favorite" value="1" {% if (flags.favorite) %}checked="checked"{% endif %} id="favorite"  {% if (flags['favorite.disabled']) %}disabled{% endif %} /> {{ lang.editnews['add_favorite'] }}</label><br />
						<label><input name="flag_HTML" type="checkbox" id="flag_HTML" value="1" {% if (flags.html) %}checked="checked"{% endif %} {% if (flags['html.disabled']) %}disabled{% endif %} /> {{ lang.editnews['flag_html'] }}</label><br />
						<label><input type="checkbox" name="flag_RAW" value="1" {% if (flags.raw) %}checked="checked"{% endif %} id="flag_RAW" {% if (flags['html.disabled']) %}disabled{% endif %} /> {{ lang.editnews['flag_raw'] }}</label> {% if (flags['raw.disabled']) %}[<font color=red>{{ lang.editnews['flags_lost'] }}</font>]{% endif %}
						
						
						
					</div>
				</div>
				
				{% if not flags['customdate.disabled'] %}
				<div class="panel panel-default">
					<div class="panel-heading">{{ lang.editnews['date.manage'] }}</div>
					<div class="panel-body">
						<div class="input-group">
							<span class="input-group-addon">
								<input type="checkbox" name="setdate_current" id="setdate_current" value="1" onclick="document.getElementById('setdate_custom').checked=false;" />
							</span>
							<input type="text" value="{{ lang.editnews['date.setcurrent'] }}" class="form-control"/>
						</div>
						&nbsp;
						<div class="input-group" title="{{ lang.editnews['date.setdate'] }}">
							<span class="input-group-addon">
								<input type="checkbox" name="setdate_custom" id="setdate_custom" value="1" onclick="document.getElementById('setdate_current').checked=false;" />
							</span>
							<input type="text" id="cdate" name="cdate" value="{{ cdate }}" class="form-control"/>
						</div>
					</div>
				</div>
				{% endif %}
			</div>
		</div>
		
		<div class="row">
			<div class="col col-sm-12">
				{% if (pluginIsActive('xfields')) %}
				<!-- XFields [GENERAL] -->
				<table class="table table-condensed">
					{{ plugin.xfields.general }}
				</table>
				<!-- /XFields [GENERAL] -->
				{% endif %}
			</div>
		</div>
		
		<div class="row">
			<div class="col col-sm-8">
				<div class="well panel-fixed-bottom">
					<div class="row">
						<div class="col col-xs-6">
							<select name="approve" id="approve" class="form-control">
								{% if flags.can_publish %}
									<option value="1" {% if (approve == 1) %}selected="selected"{% endif %}>{{ lang.addnews['publish'] }}</option>
								{% endif %}
								{% if flags.can_unpublish %}
									<option value="0" {% if (approve == 0) %}selected="selected"{% endif %}>{{ lang.addnews['send_moderation'] }}</option>
								{% endif %}
								{% if flags.can_draft %}
									<option value="-1" {% if (approve == -1) %}selected="selected"{% endif %}>{{ lang.addnews['save_draft'] }}</option>
								{% endif %}
							</select>
						</div>
						<div class="col col-xs-6 text-right">
							{% if flags.editable %}
								<button type="submit" title="Ctrl+S {{ lang.editnews['do_editnews'] }}" class="btn btn-success">
									<span class="visible-sm-block visible-xs-block"><i class="fa fa-floppy-o"></i></span>
									<span class="hidden-sm hidden-xs">{{ lang.editnews['do_editnews'] }}</span>
								</button>
							{% endif %}
							<button type="button" onClick="return preview();" title="{{ lang.editnews['preview'] }}" class="btn btn-primary"><i class="fa fa-eye"></i></button>
							{% if flags.deleteable %}
								<button type="button" onClick="confirmIt('admin.php?mod=news&amp;action=manage&amp;subaction=mass_delete&amp;selected_news[]={{ id }}&amp;token={{ token }}', '{{ lang.editnews['sure_del'] }}')" title="{{ lang.editnews['delete'] }}" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<!-- COMMENTS -->
	<form name="commentsForm" id="commentsForm" action="admin.php?mod=news" method="post">
		<input type="hidden" name="token" value="{{ token }}" />
		<input type="hidden" name="action" value="edit" />
		<input type="hidden" name="subaction" value="mass_com_delete" />
		<input type="hidden" name="id" value="{{ id }}" />
		
		<div class="row">
			<div class="col col-sm-8">
				<!-- MAIN CONTENT -->
				<div id="comments" class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title"><i class="fa fa-th-list"></i> {{ lang.editnews['bar.comments'] }} ({{ plugin.comments.count }})</h4>
					</div>
					{% if plugin.comments.count>0 %}
					<table class="table table-">
					<tbody>
						<tr>
							<td colspan="2" class="text-right"><input type="checkbox" name="master_box" value="all" class="select-all" /></td>
						</tr>
						{{ plugin.comments.list }}
					</tbody>
					</table>
					<div class="panel-footer text-right">
						<button type="submit" title="{{ lang.editnews['comdelete'] }}" onClick="if (!confirm('{{ lang.editnews['sure_del_com'] }}')) {return false;}" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
					</div>
					{% endif %}
				</div>
			</div>
		</div>
	</form>
</div>

<div id="iframediv"></div>

<!-- Hidden SUGGEST div -->
<div id="suggestWindow" class="suggestWindow"><table id="suggestBlock" cellspacing="0" cellpadding="0" width="100%"></table><a href="#" align="right" id="suggestClose">close</a></div>

<form name="DATA_tmp_storage" action="" id="DATA_tmp_storage"><input type="hidden" name="area" value="" /></form>

<link href="{{ skins_url }}/assets/css/datetimepicker.css" rel="stylesheet">
<script src="{{ skins_url }}/assets/js/moment.js"></script>
<script src="{{ skins_url }}/assets/js/datetimepicker.js"></script>

<script>

$('#cdate').datetimepicker({format:'DD.MM.YYYY HH:mm',locale: "{{ lang['langcode'] }}"});

//
// Global variable: ID of current active input area
var currentInputAreaID = 'ng_news_content{% if (flags.edit_split) %}_short{% endif %}';
var form = document.getElementById('postForm');

function preview(){
	
	if (form.ng_news_content{% if (flags.edit_split) %}_short{% endif %}.value == '' || form.title.value == '') {
		$.notify({message: '{{ lang.addnews['msge_preview'] }}'},{type: 'danger'});
		return false;
	}
	
	form['mod'].value = "preview";
	form.target = "_blank";
	form.submit();

	form['mod'].value = "news";
	form.target = "_self";
	return true;
}

function changeActive(name) {
	if (name == 'full') {
		document.getElementById('container.content.full').className  = 'contentActive';
		document.getElementById('container.content.short').className = 'contentInactive';
		currentInputAreaID = 'ng_news_content_full';
	} else {
		document.getElementById('container.content.short').className = 'contentActive';
		document.getElementById('container.content.full').className  = 'contentInactive';
		currentInputAreaID = 'ng_news_content_short';
	}
}

// Add first row
var flagRequireReload = 0;
attachAddRow('attachFilelist_edit');

// HotKeys to this page
document.onkeydown = function(e) {
	e = e || event;
	if (e.ctrlKey && e.keyCode == 'S'.charCodeAt(0)) {
		form.submit();
		return false;
	}
}

</script>

{{ includ_bb }}