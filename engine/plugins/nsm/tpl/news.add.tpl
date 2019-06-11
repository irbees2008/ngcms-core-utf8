<link rel="stylesheet" type="text/css" href="{{ admin_url }}/plugins/nsm/uploader/uploadifive/uploadifive.css">
<script src="{{ admin_url }}/plugins/nsm/uploader/uploadifive/jquery.uploadifive.min.js" type="text/javascript"></script>

<script type="text/javascript">
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
	function approveMode(mode) {
		document.getElementById('approve').value = mode;
		return true;
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

<form id="postForm" name="form" ENCTYPE="multipart/form-data" method="POST" action="{{ currentURL }}">
	<input type="hidden" name="token" value="{{ token }}"/>
	<input type="hidden" name="mod" value="news"/>
	<input type="hidden" name="approve" id="approve" value="0"/>
	<div class="block-title">Р вЂќР С•Р В±Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘:</div>
	<table class="table table-striped table-bordered">
		<tr>
			<th colspan="2"><a role="button" href="{{ listURL }}">Р СџР ВµРЎР‚Р ВµР в„–РЎвЂљР С‘ Р С” РЎРѓР С—Р С‘РЎРѓР С”РЎС“ Р Р†Р В°РЎв‚¬Р С‘РЎвЂ¦ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–</a></th>
		</tr>
		<tr>
			<td>Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С”:</td>
			<td><input type="text" name="title" class="input" value=""/></td>
		</tr>
		<tr>
			<td>Р С’Р В»РЎРЉРЎвЂљ. Р С‘Р С�РЎРЏ:</td>
			<td><input type="text" name="alt_name" class="input" value=""/></td>
		</tr>
		<tr>
			<td>Р С™Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘РЎРЏ:</td>
			<td>{{ mastercat }}</td>
		</tr>
		{% if flags['multicat.show'] %}
			<tr>
				<td>Р вЂќР С•Р С—Р С•Р В»Р Р…Р С‘РЎвЂљР ВµР В»РЎРЉР Р…РЎвЂ№Р Вµ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘:</td>
				<td>{{ extcat }}</td>
			</tr>
		{% endif %}
		{% if (flags.edit_split) %}
			<tr>
				<td colspan="2">
					<b>Р вЂ™Р Р†Р С•Р Т‘Р Р…Р В°РЎРЏ РЎвЂЎР В°РЎРѓРЎвЂљРЎРЉ Р С�Р В°РЎвЂљР ВµРЎР‚Р С‘Р В°Р В»Р В°:</b> (Р С›Р В±РЎРЏР В·Р В°РЎвЂљР ВµР В»РЎРЉР Р…Р С•!)
					<div>
						<div>{{ quicktags }}<br/> {{ smilies }}<br/><br/></div>
						<textarea onclick="changeActive('short');" onfocus="changeActive('short');" name="ng_news_content_short" id="ng_news_content_short" style="width:98%; height: 200px;" class="textarea"></textarea>
					</div>
				</td>
			</tr>
			{% if (flags.extended_more) %}
				<tr>
					<td>Р В Р В°Р В·Р Т‘Р ВµР В»Р С‘РЎвЂљР ВµР В»РЎРЉ:</td>
					<td><input tabindex="2" type="text" name="content_delimiter" class="input" value=""/></td>
				</tr>
			{% endif %}
			<tr>
				<td colspan="2">
					<b>Р СљР В°РЎвЂљР ВµРЎР‚Р С‘Р В°Р В» Р С—Р С•Р В»Р Р…Р С•РЎРѓРЎвЂљРЎРЉРЎР‹:</b> (Р СњР ВµР С•Р В±РЎРЏР В·Р В°РЎвЂљР ВµР В»РЎРЉР Р…Р С•)
					<div>
						<div>{{ quicktags }}<br/> {{ smilies }}<br/><br/></div>
						<textarea onclick="changeActive('full');" onfocus="changeActive('full');" name="ng_news_content_full" id="ng_news_content_full" style="width:98%; height: 200px;" class="textarea"></textarea>
					</div>
				</td>
			</tr>
		{% else %}
			<tr>
				<td colspan="2">
					<div>
						<div>{{ quicktags }}<br/> {{ smilies }}<br/><br/></div>
						<textarea name="ng_news_content" id="ng_news_content" style="width:98%; height: 400px;" class="textarea"></textarea>
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
						<label><input type="checkbox" name="mainpage" value="1" id="mainpage" {% if (flags.mainpage) %}checked="checked" {% endif %}{% if flags['mainpage.disabled'] %}disabled {% endif %} /> {{ lang.addnews['mainpage'] }}
						</label><br/>
					{% endif %}
					{% if not flags['pinned.disabled'] %}
						<label><input type="checkbox" name="pinned" value="1" id="pinned" {% if (flags.pinned) %}checked="checked" {% endif %}{% if flags['pinned.disabled'] %}disabled {% endif %} /> {{ lang.addnews['add_pinned'] }}
						</label><br/>
					{% endif %}
					{% if not flags['catpinned.disabled'] %}
						<label><input type="checkbox" name="catpinned" value="1" id="catpinned" {% if (flags.catpinned) %}checked="checked" {% endif %}{% if flags['catpinned.disabled'] %}disabled {% endif %} /> {{ lang.addnews['add_catpinned'] }}
						</label><br/>
					{% endif %}
					{% if not flags['favorite.disabled'] %}
						<label><input type="checkbox" name="favorite" value="1" id="favorite" {% if (flags.favorite) %}checked="checked" {% endif %}{% if flags['favorite.disabled'] %}disabled {% endif %} /> {{ lang.addnews['add_favorite'] }}
						</label><br/>
					{% endif %}
					{% if not flags['html.disabled'] %}
						<label><input name="flag_HTML" type="checkbox" id="flag_HTML" value="1" {% if (flags['html.disabled']) %}disabled {% endif %}{% if flags['html'] %}checked="checked"{% endif %} /> {{ lang.addnews['flag_html'] }}
						</label><br/>
						<label><input type="checkbox" name="flag_RAW" value="1" id="flag_RAW" {% if (flags['html.disabled']) %}disabled {% endif %}{% if flags['html'] %}checked="checked"{% endif %} /> {{ lang.addnews['flag_raw'] }}
						</label><br/>
					{% endif %}
				</div>
			</td>
		</tr>
	</table>
	<div class="clearfix"></div>
	<div class="label pull-right">
		<label class="default">&nbsp;</label>
		{% if flags['can_publish'] %}
			<input class="button" type="submit" onclick="return approveMode(1);" value="Р вЂќР С•Р В±Р В°Р Р†Р С‘РЎвЂљРЎРЉ Р С�Р В°РЎвЂљР ВµРЎР‚Р С‘Р В°Р В»"/>
		{% else %} &nbsp; {% endif %}
		<input class="button" type="submit" onclick="return approveMode(0);" value="Р С›РЎвЂљР С—РЎР‚Р В°Р Р†Р С‘РЎвЂљРЎРЉ Р Р…Р В° Р С�Р С•Р Т‘Р ВµРЎР‚Р В°РЎвЂ Р С‘РЎР‹"/>
		<input class="button" type="submit" onclick="return approveMode(-1);" value="Р РЋР С•РЎвЂ¦РЎР‚Р В°Р Р…Р С‘РЎвЂљРЎРЉ РЎвЂЎР ВµРЎР‚Р Р…Р С•Р Р†Р С‘Р С”"/>
		<input class="button" type="button" onclick="return preview();" value="Р СџРЎР‚Р С•РЎРѓР С�Р С•РЎвЂљРЎР‚"/>
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
