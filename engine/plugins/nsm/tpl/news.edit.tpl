<link rel="stylesheet" type="text/css" href="{{ admin_url }}/plugins/nsm/uploader/uploadifive/uploadifive.css">
<script src="{{ admin_url }}/plugins/nsm/uploader/uploadifive/jquery.uploadifive.min.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">

	//
	// Global variable: ID of current active input area
		{% if (flags.edit_split) %}var currentInputAreaID = 'ng_news_content_short';
		{% else %}var currentInputAreaID = 'ng_news_content';{% endif %}

	function preview() {
		var form = document.getElementById("postForm");
		if (form.ng_news_content{% if (flags.edit_split) %}_short{% endif %}.value == '' || form.title.value == '') {
			alert('{{ lang.nsm['err.preview'] }}');
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
			document.getElementById('container.content.full').className = 'contentActive';
			document.getElementById('container.content.short').className = 'contentInactive';
			currentInputAreaID = 'ng_news_content_full';
		} else {
			document.getElementById('container.content.short').className = 'contentActive';
			document.getElementById('container.content.full').className = 'contentInactive';
			currentInputAreaID = 'ng_news_content_short';
		}
	}

	$(document).ready(function () {

		var i = 0;
		$('#file_upload').uploadifive({
			'auto': true,
			'formData': {},
			'queueID': 'queue',
			'uploadScript': '/engine/plugins/nsm/uploader/libs/upload_images.php',
			'onUpload': function (filesToUpload) {
				i = 0;
			},
			'onUploadComplete': function (file, data) {
				if (data != "0") {
					var json_data = JSON.parse(data);
					//console.log(file);
					//console.log(json_data);
					var name = json_data['name'];
					var fileurl = json_data['fileurl'];
					var height = json_data['height'];
					var width = json_data['width'];
					var insert_file = '[img="' + fileurl + '" border="0" width="' + width + '" height="' + height + '" align=""]' + name + '[/img]';
					$('#ng_news_content').val($('#ng_news_content').val() + insert_file);
					i++;
				}
			},
			'onQueueComplete': function (uploads) {
				$('#file_upload').uploadifive('clearQueue');
			}
		});

	});

</script>


<form name="DATA_tmp_storage" action="" id="DATA_tmp_storage">
	<input type=hidden name="area" value=""/>
</form>
<form name="form" ENCTYPE="multipart/form-data" method="post" action="{{ php_self }}" id="postForm">
	<input type="hidden" name="token" value="{{ token }}"/>
	<input type="hidden" name="mod" value="news"/>
	<input type="hidden" name="action" value="edit"/>
	<input type="hidden" name="subaction" value="submit"/>
	<div class="block-title">{{ lang.editnews['editnews_title'] }}:</div>
	<table class="table table-striped table-bordered">
		<tr>
			<th colspan="2"><a role="button" href="{{ listURL }}">Р СџР ВµРЎР‚Р ВµР в„–РЎвЂљР С‘ Р С” РЎРѓР С—Р С‘РЎРѓР С”РЎС“ Р Р†Р В°РЎв‚¬Р С‘РЎвЂ¦ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–</a></th>
		</tr>
		<tr>
			<td>{{ lang.editnews['title'] }}:</td>
			<td><input type="text" name="title" class="input" value="{{ title }}"/></td>
		</tr>
		<tr>
			<td>{{ lang.editnews['alt_name'] }}:</td>
			<td><input type="text" name="alt_name" class="input" value="{{ alt_name }}"/></td>
		</tr>
		<tr>
			<td>{{ lang.editnews['category'] }}:</td>
			<td>{{ mastercat }}</td>
		</tr>
		{% if flags['multicat.show'] %}
			<tr>
				<td>{{ lang['editor.extcat'] }}:</td>
				<td>{{ extcat }}</td>
			</tr>
		{% endif %}
		{% if (flags.edit_split) %}
			<tr>
				<td colspan="2">
					<b>Р вЂ™Р Р†Р С•Р Т‘Р Р…Р В°РЎРЏ РЎвЂЎР В°РЎРѓРЎвЂљРЎРЉ Р С�Р В°РЎвЂљР ВµРЎР‚Р С‘Р В°Р В»Р В°:</b> (Р С›Р В±РЎРЏР В·Р В°РЎвЂљР ВµР В»РЎРЉР Р…Р С•!)
					<div>
						<div>{{ quicktags }}<br/> {{ smilies }}<br/><br/></div>
						<textarea onclick="changeActive('short');" onfocus="changeActive('short');" name="ng_news_content_short" id="ng_news_content_short" style="width:98%; height: 200px;" class="textarea">{{ content.short }}</textarea>
					</div>
				</td>
			</tr>
			{% if (flags.extended_more) %}
				<tr>
					<td>Р В Р В°Р В·Р Т‘Р ВµР В»Р С‘РЎвЂљР ВµР В»РЎРЉ:</td>
					<td>
						<input tabindex="2" type="text" name="content_delimiter" class="input" value="{{ content.delimiter }}"/>
					</td>
				</tr>
			{% endif %}
			<tr>
				<td colspan="2">
					<b>Р СљР В°РЎвЂљР ВµРЎР‚Р С‘Р В°Р В» Р С—Р С•Р В»Р Р…Р С•РЎРѓРЎвЂљРЎРЉРЎР‹:</b> (Р СњР ВµР С•Р В±РЎРЏР В·Р В°РЎвЂљР ВµР В»РЎРЉР Р…Р С•)
					<div>
						<div>{{ quicktags }}<br/> {{ smilies }}<br/><br/></div>
						<textarea onclick="changeActive('full');" onfocus="changeActive('full');" name="ng_news_content_full" id="ng_news_content_full" style="width:98%; height: 200px;" class="textarea">{{ content.full }}</textarea>
					</div>
				</td>
			</tr>
		{% else %}
			<tr>
				<td colspan="2">
					<div>
						<div>{{ quicktags }}<br/> {{ smilies }}<br/><br/></div>
						<textarea name="ng_news_content" id="ng_news_content" style="width:98%; height: 400px;" class="textarea">{{ content.short }}</textarea>
					</div>
				</td>
			</tr>
		{% endif %}
		<tr>
			<td colspan="2">
				<div>
					<div id="queue">
					</div>
					<input id="file_upload" name="file_upload" type="file" multiple="true">

				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div>
					{% if not flags['mainpage.disabled'] %}
						<label><input type="checkbox" name="mainpage" value="1" id="mainpage" {% if (flags.mainpage) %}checked="checked" {% endif %}{% if flags['mainpage.disabled'] %}disabled {% endif %} /> {{ lang.editnews['mainpage'] }}
						</label><br/>
					{% endif %}
					{% if not flags['pinned.disabled'] %}
						<label><input type="checkbox" name="pinned" value="1" id="pinned" {% if (flags.pinned) %}checked="checked" {% endif %}{% if flags['pinned.disabled'] %}disabled {% endif %} /> {{ lang.editnews['add_pinned'] }}
						</label><br/>
					{% endif %}
					{% if not flags['catpinned.disabled'] %}
						<label><input type="checkbox" name="catpinned" value="1" id="catpinned" {% if (flags.catpinned) %}checked="checked" {% endif %}{% if flags['catpinned.disabled'] %}disabled {% endif %} /> {{ lang.editnews['add_catpinned'] }}
						</label><br/>
					{% endif %}
					{% if not flags['favorite.disabled'] %}
						<label><input type="checkbox" name="favorite" value="1" id="favorite" {% if (flags.favorite) %}checked="checked" {% endif %}{% if flags['favorite.disabled'] %}disabled {% endif %} /> {{ lang.editnews['add_favorite'] }}
						</label><br/>
					{% endif %}
					{% if not flags['html.disabled'] %}
						<label><input name="flag_HTML" type="checkbox" id="flag_HTML" value="1" {% if (flags['html.disabled']) %}disabled {% endif %}{% if flags['html'] %}checked="checked"{% endif %} /> {{ lang.editnews['flag_html'] }}
						</label><br/>
						<label><input type="checkbox" name="flag_RAW" value="1" id="flag_RAW" {% if (flags['html.disabled']) %}disabled {% endif %}{% if flags['html'] %}checked="checked"{% endif %} /> {{ lang.editnews['flag_raw'] }}
						</label><br/>
					{% endif %}
				</div>
			</td>
		</tr>
		{% if flags['params.lost'] %}
			<tr>
				<td colspan="2">
					<div>
						Р С›Р В±РЎР‚Р В°РЎвЂљР С‘РЎвЂљР Вµ РЎРѓР Р…Р С‘Р С�Р В°Р Р…Р С‘Р Вµ - РЎС“ Р Р†Р В°РЎРѓ Р Р…Р ВµР Т‘Р С•РЎРѓРЎвЂљР В°РЎвЂљР С•РЎвЂЎР Р…Р С• Р С—РЎР‚Р В°Р Р† Р Т‘Р В»РЎРЏ Р С—Р С•Р В»Р Р…Р С•РЎвЂ Р ВµР Р…Р Р…Р С•Р С–Р С• РЎР‚Р ВµР Т‘Р В°Р С”РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘РЎРЏ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘.<br/>
						Р СџРЎР‚Р С‘ РЎРѓР С•РЎвЂ¦РЎР‚Р В°Р Р…Р ВµР Р…Р С‘Р С‘ Р В±РЎС“Р Т‘РЎС“РЎвЂљ Р С—РЎР‚Р С•Р С‘Р В·Р Р†Р ВµР Т‘Р ВµР Р…РЎвЂ№ РЎРѓР В»Р ВµР Т‘РЎС“РЎР‹РЎвЂ°Р С‘Р Вµ Р С‘Р В·Р С�Р ВµР Р…Р ВµР Р…Р С‘РЎРЏ:<br/><br/>
						{% if flags['publish.lost'] %}&#8594; Р СњР С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ Р В±РЎС“Р Т‘Р ВµРЎвЂљ РЎРѓР Р…РЎРЏРЎвЂљР В° РЎРѓ Р С—РЎС“Р В±Р В»Р С‘Р С”Р В°РЎвЂ Р С‘Р С‘{% endif %}
						{% if flags['html.lost'] %}&#8594; Р вЂ™ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р В·Р В°Р С—РЎР‚Р ВµРЎвЂ°Р ВµР Р…Р С• Р С‘РЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°Р Р…Р С‘Р Вµ HTML РЎвЂљР ВµР С–Р С•Р Р† Р С‘ Р В°Р Р†РЎвЂљР С•РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р Вµ{% endif %}
						{% if flags['mainpage.lost'] %}&#8594; Р СњР С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ Р В±РЎС“Р Т‘Р ВµРЎвЂљ РЎС“Р В±РЎР‚Р В°Р Р…Р В° РЎРѓ Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№{% endif %}
						{% if flags['pinned.lost'] %}&#8594; Р РЋ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р В±РЎС“Р Т‘Р ВµРЎвЂљ РЎРѓР Р…РЎРЏРЎвЂљР С• Р С—РЎР‚Р С‘Р С”РЎР‚Р ВµР С—Р В»Р ВµР Р…Р С‘Р Вµ Р Р…Р В° Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„–{% endif %}
						{% if flags['catpinned.lost'] %}&#8594; Р РЋ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р В±РЎС“Р Т‘Р ВµРЎвЂљ РЎРѓР Р…РЎРЏРЎвЂљР С• Р С—РЎР‚Р С‘Р С”РЎР‚Р ВµР С—Р В»Р ВµР Р…Р С‘Р Вµ Р Р† Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘{% endif %}
						{% if flags['favorite.lost'] %}&#8594; Р СњР С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ Р В±РЎС“Р Т‘Р ВµРЎвЂљ РЎС“Р Т‘Р В°Р В»Р ВµР Р…Р В° Р С‘Р В· Р В·Р В°Р С”Р В»Р В°Р Т‘Р С•Р С” Р В°Р Т‘Р С�Р С‘Р Р…Р С‘РЎРѓРЎвЂљРЎР‚Р В°РЎвЂљР С•РЎР‚Р В°{% endif %}
						{% if flags['multicat.lost'] %}&#8594; Р пїЅР В· Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р В±РЎС“Р Т‘РЎС“РЎвЂљ РЎС“Р Т‘Р В°Р В»Р ВµР Р…РЎвЂ№ Р Р†РЎРѓР Вµ Р Т‘Р С•Р С—Р С•Р В»Р Р…Р С‘РЎвЂљР ВµР В»РЎРЉР Р…РЎвЂ№Р Вµ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘{% endif %}
					</div>
				</td>
			</tr>
		{% endif %}
	</table>
	<div class="clearfix"></div>
	<div class="label pull-right">
		<label class="default">&nbsp;</label>
		<input type="hidden" name="id" value="{{ id }}"/>
		{% if flags.editable %}
			<select size="1" disabled>
				<option>{% if (approve == -1) %}{{ lang.editnews['state.draft'] }}{% elseif (approve == 0) %}{{ lang.editnews['state.unpublished'] }}{% else %}{{ lang.editnews['state.published'] }}{% endif %}</option>
			</select> &#8594;
			<select size="1" name="approve" id="approve">
				{% if flags.can_draft %}
					<option value="-1" {% if (approve == -1) %}selected="selected"{% endif %}>{{ lang.editnews['state.draft'] }}</option>{% endif %}
				{% if flags.can_unpublish %}
					<option value="0" {% if (approve == 0) %}selected="selected"{% endif %}>{{ lang.editnews['state.unpublished'] }}</option>{% endif %}
				{% if flags.can_publish %}
					<option value="1" {% if (approve == 1) %}selected="selected"{% endif %}>{{ lang.editnews['state.published'] }}</option>{% endif %}
			</select>
			<input class="button" type="submit" onclick="return approveMode(-1);" value="Р С›РЎвЂљР С—РЎР‚Р В°Р Р†Р С‘РЎвЂљРЎРЉ"/>{% endif %}
		<input class="button" type="button" onClick="preview()" value="Р СџРЎР‚Р С•РЎРѓР С�Р С•РЎвЂљРЎР‚"/>
		{% if flags.deleteable %}
			<input class="button" type="button" onClick="confirmit('{{ deleteURL }}', '{{ lang.editnews['sure_del'] }}')" value="Р Р€Р Т‘Р В°Р В»Р С‘РЎвЂљРЎРЉ"/>
		{% endif %}
	</div>
</form>

<script language="javascript" type="text/javascript">
	// Restore variables if needed
	var jev = {{ JEV }};
	var form = document.getElementById('postForm');
	for (i in jev) {
		//try { alert(i+' ('+form[i].type+')'); } catch (err) {;}
		if (typeof(jev[i]) == 'object') {
			for (j in jev[i]) {
				//alert(i+'['+j+'] = '+ jev[i][j]);
				try {
					form[i + '[' + j + ']'].value = jev[i][j];
				} catch (err) {
					;
				}
			}
		} else {
			try {
				if ((form[i].type == 'text') || (form[i].type == 'textarea') || (form[i].type == 'select-one')) {
					form[i].value = jev[i];
				} else if (form[i].type == 'checkbox') {
					form[i].checked = (jev[i] ? true : false);
				}
			} catch (err) {
				;
			}
		}
	}
</script>
