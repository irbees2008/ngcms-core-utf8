<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li class="active">{{ lang.editnews['news_title'] }}</li>
</ul>

<script src="{{ scriptLibrary }}/ajax.js"></script>
<script src="{{ scriptLibrary }}/libsuggest.js"></script>

<!-- Info content -->
<div class="page-main">
	<!-- Filter form: BEGIN -->
	<div id="filter" class="collapse">
		<div class="well">
			<form name="options_bar" id="options_bar" action="admin.php?mod=news" method="post">
				<div class="row">
					<!--Block 1-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label for="">{{ lang.editnews['header.search'] }}</label>
							<input type="text" name="sl" id="sl" class="bfsearch form-control" value="{{ sl }}">
						</div>
						<div class="form-group">
							<label for="">Где искать</label>
							<select name="st" class="form-control">
								<option value="0" {% if (selected == '0') %}selected{% endif %}>{{ lang.editnews['header.stitle'] }}</option>
								<option value="1" {% if (selected == '1') %}selected{% endif %}>{{ lang.editnews['header.stext'] }}</option>
							</select>
						</div>
						<div class="form-group">
							<label>{{ lang.editnews['sort'] }}</label>
							<select name="sort" class="bfsortlist form-control">{{ sortlist }}</select>
						</div>
					</div>
					<!--/Block 1-->
					<!--Block 2-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label>{{ lang.editnews['category'] }}</label>
							{{ category_select }}
						</div>
						<div class="form-group has-feedback">
							<label>{{ lang.editnews.author }}</label>
							<input name="an" id="an" class="bfauthor form-control" type="text"  value="{{ an }}" autocomplete="off" />
							<i id="suggestLoader"></i>
						</div>
						<div class="form-group">
							<label>{{ lang.editnews['header.status'] }}</label>
							<select name="status" class="bfstatus form-control">
								<option value="">{{ lang.editnews['smode_all'] }}</option>
								{{ statuslist }}
							</select>
						</div>
					</div>
					<!--/Block 2-->
					<!--Block 3-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label>{{ lang.editnews['header.date'] }} </label>
							<div class="input-group">
								<span class="input-group-addon">{{ lang.editnews['header.date_since'] }}&nbsp;&nbsp;&nbsp;</span>
								<input type="text" id="dr1" name="dr1" value="{{ dr1 }}" class="bfdate form-control">
							</div>
						</div>
						<div class="form-group">
							<label>{{ lang.editnews['header.date'] }} </label>
							<div class="input-group">
								<span class="input-group-addon">{{ lang.editnews['header.date_till'] }}</span>
								<input type="text" id="dr2" name="dr2" value="{{ dr2 }}" class="bfdate form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="rpp">{{ lang['per_page'] }}</label>
							<input type="text" name="rpp" id="rpp" value="{{ rpp }}" class="form-control">
						</div>
					</div>
					<!--/Block 3-->
					<!--Block 4-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label for="">&nbsp;</label>
							<button type="submit" class="btn btn-primary form-control">{{ lang['do_show'] }}</button>
						</div>
					</div>
					<!--/Block 4-->
				</div>
			</form>
		</div>
	</div>
	<!-- Filter form: END -->
	
	<!-- List of news: BEGIN -->
	<div class="panel panel-default panel-table">
		<div class="panel-heading text-right">
			<button type="button" class="btn btn-primary" onclick="printElem($('form .panel-body').html());"><i class="fa fa-print"></i></button>
			
			<button type="button" data-toggle="collapse" data-target="#filter" aria-expanded="false" aria-controls="filter" class="btn btn-primary"><i class="fa fa-cog"></i></button>
			{% if flags.allow_modify %}
				<a href="admin.php?mod=news&action=add" title="{{ lang['add_news'] }}" class="btn btn-success"><i class="fa fa-plus"></i></a>
			{% endif %}
		</div>
		<form name="editnews" action="admin.php?mod=news" method="post">
			<input type="hidden" name="token" value="{{ token }}">
			<input type="hidden" name="mod" value="news">
			<input type="hidden" name="action" value="manage">
				
			<div class="panel-body table-responsive">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th><input type="checkbox" class="select-all"></th>
							<th class="hidden-xs">{{ lang.editnews['postid_short'] }}</th>
							<th class="hidden-xs"></th>
							<th>{{ lang.editnews['title'] }}</th>
							{% if (pluginIsActive('comments') and flags.comments) %}
								<th class="hidden-xs"><i class="fa fa-comments"></i></th>
							{% endif %}
							<th class="hidden-xs"><i class="fa fa-eye"></i></th>
							<th class="hidden-xs">{{ lang.editnews['category'] }}</th>
							<th class="hidden-xs">{{ lang.editnews['author'] }}</th>
							<th class="hidden-xs">{{ lang.editnews['date'] }}</th>
							<th>{{ lang['state'] }}</th>
						</tr>
					</thead>
					<tbody>
					{% for entry in entries %}
						<tr>
							<td><input name="selected_news[]" value="{{ entry.newsid }}" type="checkbox" /></td>
							<td class="hidden-xs">{{ entry.newsid }}</td>
							<td class="hidden-xs" nowrap>
								{% if entry.flags.mainpage %}
									<i class="fa fa-home"></i>
								{% endif %}
								{% if (entry.attach_count > 0) %}
									<i class="fa fa-paperclip" title="{{ lang['attach.count'] }}: {{ entry.attach_count }}"></i>
								{% endif %}
								{% if (entry.images_count > 0) %}
									<i class="fa fa-picture-o" title="{{ lang['images.count'] }}: {{ entry.images_count }}"></i>
								{% endif %}
							</td>
							<td>
								{% if entry.flags.editable %}<a href="admin.php?mod=news&amp;action=edit&amp;id={{ entry.newsid }}">{% endif %}{{ entry.title }}{% if entry.flags.editable %}</a>{% endif %}
							</td>
							{% if (pluginIsActive('comments') and flags.comments) %}
								<td class="hidden-xs">
									{% if (entry.comments > 0) %}
										{{ entry.comments }}
									{% else %}
										-
									{% endif %}
								</td>
							{% endif %}
							<td class="hidden-xs">{% if entry.flags.isActive %}<a href="{{ entry.link }}" target="_blank">{% endif %}{% if (entry.views > 0) %}{{ entry.views }}{% else %}-{% endif %}{% if entry.flags.isActive %}</a>{% endif %}</td>
							<td class="hidden-xs">{{ entry.allcats }}</td>
							<td class="hidden-xs"><a href="admin.php?mod=users&amp;action=editForm&amp;id={{ entry.userid }}">{{ entry.username }}</a></td>
							<td class="hidden-xs">{{ entry.itemdate }}</td>
							<td>
								{% if (entry.state == 1) %}
									<i class="fa fa-check text-success" title="{{ lang['state.published'] }}"></i>
								{% elseif (entry.state == 0) %}
									<i class="fa fa-times text-danger" title="{{ lang['state.unpiblished'] }}"></i>
								{% else %}
									<i class="fa fa-ban text-danger" title="{{ lang['state.draft'] }}"></i>
								{% endif %}
							</td>
						</tr>
						{% else %}
						<tr><td colspan="11"><p>{{ lang['not_found'] }}</p></td></tr>
						{% endfor %}
					</tbody>
				</table>
			</div>
			<div class="panel-footer">
				<div class="row">
					<div class="col col-md-4">
						{% if flags.allow_modify %}
						<div class="input-group">
							<select name="subaction" class="form-control">
								<option value="">-- {{ lang.editnews['action'] }} --</option>
								<option value="mass_approve">{{ lang.editnews['approve'] }}</option>
								<option value="mass_forbidden">{{ lang.editnews['forbidden'] }}</option>
								<option value="" class="divider" disabled>===================</option>
								<option value="mass_mainpage">{{ lang.editnews['massmainpage'] }}</option>
								<option value="mass_unmainpage">{{ lang.editnews['massunmainpage'] }}</option>
								<option value="" class="divider" disabled>===================</option>
								<option value="mass_currdate">{{ lang.editnews['modify.mass.currdate'] }}</option>
								<option value="" class="divider" disabled>===================</option>
								{% if flags.comments %}<option value="mass_com_approve">{{ lang.editnews['com_approve'] }}</option>
								<option value="mass_com_forbidden">{{ lang.editnews['com_forbidden'] }}</option>
								<option value="" class="divider" disabled>===================</option>{% endif %}
								<option value="mass_delete">{{ lang.editnews['delete'] }}</option>
							</select>
							<span class="input-group-btn">
								<button type="submit" class="btn btn-default">{{ lang['ok'] }}</button>
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
	<!-- List of news: END -->
</div>

<!-- DEBUG WINDOW <div id="debugWin" style="overflow: auto; position: absolute; top: 160px; left: 230px; width: 400px; height: 400px; background: white; 4px double black; padding: 2px; margin: 2px;">DEBUG WINDOW</div> -->

<!-- Hidden SUGGEST div -->
<div id="suggestWindow" class="suggestWindow">
	<table id="suggestBlock" class="table"></table>
	<a href="#" id="suggestClose">{{ lang.editnews['close'] }}</a>
</div>

<link href="{{ skins_url }}/assets/css/datetimepicker.css" rel="stylesheet">
<script src="{{ skins_url }}/assets/js/moment.js"></script>
<script src="{{ skins_url }}/assets/js/datetimepicker.js"></script>

<script>
$(document).ready(function() {
	
	$('#dr1').datetimepicker({format: 'DD.MM.YYYY', locale: '{{ lang['langcode'] }}',pickTime:false});
	$('#dr2').datetimepicker({format: 'DD.MM.YYYY', locale: '{{ lang['langcode'] }}',pickTime:false});
	
	var aSuggest = new ngSuggest('an',
								{
									'localPrefix'	: '{{ localPrefix }}',
									'reqMethodName'	: 'core.users.search',
									'lId'		: 'suggestLoader',
									'hlr'		: 'true',
									'iMinLen'	: 1,
									'stCols'	: 2,
									'stColsClass': [ 'cleft', 'cright' ],
									'stColsHLR'	: [ true, false ],
								}
							);
});
</script>
