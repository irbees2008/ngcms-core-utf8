<table class="content" border="0" cellpadding="1" cellspacing="1">
	<tbody>
	<tr>
		<td colspan="2" class="contentHead" width="100%">
			<img src="{{ skins_url }}/images/nav.gif" hspace="8"><a href="?mod=extras" title="Р Р€Р С—РЎР‚Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°Р С�Р С‘">Р Р€Р С—РЎР‚Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ
				Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°Р С�Р С‘</a> &#8594;
			<a href="?mod=extra-config&plugin=xfields&section={{ sectionID }}">{{ lang.xfconfig['config_text'] }}
				xfields</a>
			&#8594; {% if (not flags.editMode) %}{{ lang.xfconfig['title_add'] }}{% else %}{{ lang.xfconfig['title_edit'] }} ({{ id }}){% endif %}
		</td>
	</tr>
	</tbody>
</table>

<script language="javascript">
	function clx(mode) {
		document.getElementById('type_text').style.display = (mode == 'text') ? 'block' : 'none';
		document.getElementById('type_textarea').style.display = (mode == 'textarea') ? 'block' : 'none';
		document.getElementById('type_select').style.display = (mode == 'select') ? 'block' : 'none';
		document.getElementById('type_multiselect').style.display = (mode == 'multiselect') ? 'block' : 'none';
		document.getElementById('type_checkbox').style.display = (mode == 'checkbox') ? 'block' : 'none';
		document.getElementById('type_images').style.display = (mode == 'images') ? 'block' : 'none';
	}
	function storageMode(mode) {
// alert(document.getElementById('storageRow'));
		if (mode == 0) {
			document.getElementById('storageRow').className = 'contRow4';
			document.getElementById('db.type').disabled = true;
			document.getElementById('db.len').disabled = true;
		} else {
			document.getElementById('storageRow').className = 'contRow1';
			document.getElementById('db.type').disabled = false;
			document.getElementById('db.len').disabled = false;
		}

	}

</script>

<div id="edit_yakor"></div>

<form action="?mod=extra-config&plugin=xfields&action=doedit&section={{ sectionID }}" method="post" name="xfieldsform">
	<input type="hidden" name="mod" value="extra-config">
	<input type="hidden" name="edit" value="{% if (flags.editMode) %}1{% else %}0{% endif %}">
	<table border="0" cellspacing="1" cellpadding="1" class="content">
		<tr>
			<td colspan="2" class="contentHead" width="100%">
				<img src="{{ skins_url }}/images/nav.gif" hspace="8">{% if (flags.editMode) %}{{ lang.xfconfig['title_edit'] }}{% else %}{{ lang.xfconfig['title_add'] }}{% endif %}
			</td>
		</tr>
		<tr class="contRow1">
			<td width="50%">{{ lang.xfconfig['disabled'] }}</td>
			<td width="47%">
				<input type="checkbox" name="disabled" value="1" {% if (flags.disabled) %}checked="checked"{% endif %}>
			</td>
		</tr>
		{% if (sectionID == 'users') and (type != 'images') %}
			<tr class="contRow1">
			<td width="50%">{{ lang.xfconfig['regpage'] }}</td>
			<td width="47%">
				<input type="checkbox" name="regpage" value="1" {% if (flags.regpage) %}checked="checked"{% endif %}>
			</td></tr>{% endif %}
		<tr class="contRow1">
			<td width="50%">{{ lang.xfconfig['id'] }}</td>
			<td width="47%">
				<input type="text" name="id" value="{{ id }}" size="40" {% if (flags.editMode) %}readonly{% endif %}>{% if (flags.editMode) %} &nbsp; &nbsp; {{ lang.xfconfig['noeditid'] }}{% endif %}
			</td>
		</tr>
		<tr class="contRow1">
			<td width="50%">{{ lang.xfconfig['title'] }}</td>
			<td><input type="text" name="title" value="{{ title }}" size="40"/></td>
		</tr>
		<tr class="contRow1">
			<td width="50%">{{ lang.xfconfig['type'] }}</td>
			<td>
				<select name="type" size="5" id="xfSelectType" onclick="clx(this.value);" onchange="clx(this.value);"/>{{ type_opts }}</select>
			</td>
		</tr>
	</table>

	<!-- FIELD TYPE: TEXT -->
	<div id="type_text">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_texts'] }}</td>
				<td width="45%">{{ lang.xfconfig['html_support'] }}</td>
				<td><input type="checkbox" name="text_html_support" value="1" {{ html_support }}></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_texts'] }}</td>
				<td width="45%">{{ lang.xfconfig['bb_support'] }}</td>
				<td><input type="checkbox" name="text_bb_support" value="1" {{ bb_support }}></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_texts'] }}</td>
				<td width="45%">{{ lang.xfconfig['default'] }}</td>
				<td><input type="text" name="text_default" value="{{ defaults.text }}" size=40></td>
			</tr>
		</table>
	</div>

	<!-- FIELD TYPE: TEXTAREA -->
	<div id="type_textarea">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_textareas'] }}</td>
				<td width="45%">{{ lang.xfconfig['html_support'] }}</td>
				<td><input type="checkbox" name="textarea_html_support" value="1" {{ html_support }}></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_textareas'] }}</td>
				<td width="45%">{{ lang.xfconfig['bb_support'] }}</td>
				<td><input type="checkbox" name="textarea_bb_support" value="1" {{ bb_support }}></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_textareas'] }}</td>
				<td width="45%">{{ lang.xfconfig['noformat'] }}</td>
				<td><input type="checkbox" name="textarea_noformat" value="1" {{ noformat }}></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_textareas'] }}</td>
				<td width="45%">{{ lang.xfconfig['default'] }}</td>
				<td>
					<textarea name="textarea_default" cols=70 rows=4>{{ defaults.textarea }}</textarea></td>
			</tr>
		</table>
	</div>

	<!-- FIELD TYPE: SELECT -->
	<div id="type_select">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_selects'] }}</td>
				<td width="45%">{{ lang.xfconfig['tselect_storekeys'] }}</td>
				<td><select name="select_storekeys">{{ storekeys_opts }}</select></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_selects'] }}</td>
				<td valign="top">{{ lang.xfconfig['tselect_options'] }}</td>
				<td>
					<table id="xfSelectTable" width="100%" cellspacing="0" cellpadding="0" border="0" class="content" style="padding: 0px;">
						<thead>
						<tr class="contRow1">
							<td>Р С™Р С•Р Т‘</td>
							<td>Р вЂ”Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ</td>
							<td>&nbsp;</td>
						</tr>
						</thead>
						<tbody id="xfSelectRows">
						{{ sOpts }}
						</tbody>
						<tfoot>
						<tr>
							<td colspan="3">
								<input type="button" id="xfBtnAdd" style="width: 300px;" value=" + Р вЂќР С•Р В±Р В°Р Р†Р С‘РЎвЂљРЎРЉ РЎРѓРЎвЂљРЎР‚Р С•Р С”РЎС“"/>
							</td>
						</tr>
						</tfoot>
					</table>
				</td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_selects'] }}</td>
				<td>{{ lang.xfconfig['tselect_default'] }}</td>
				<td><input type="text" name="select_default" value="{{ defaults.select }}" size=40></td>
			</tr>
		</table>
	</div>

	<!-- FIELD TYPE: MULTISELECT -->
	<div id="type_multiselect">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_selects'] }}</td>
				<td width="45%">{{ lang.xfconfig['tselect_storekeys'] }}</td>
				<td><select name="select_storekeys_multi">{{ storekeys_opts }}</select></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_selects'] }}</td>
				<td valign="top">{{ lang.xfconfig['tselect_options'] }}</td>
				<td>
					<table id="xfSelectTable_multi" width="100%" cellspacing="0" cellpadding="0" border="0" class="content" style="padding: 0px;">
						<thead>
						<tr class="contRow1">
							<td>Р С™Р С•Р Т‘</td>
							<td>Р вЂ”Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ</td>
							<td>&nbsp;</td>
						</tr>
						</thead>
						<tbody id="xfSelectRows_multi">
						{{ m_sOpts }}
						</tbody>
						<tfoot>
						<tr>
							<td colspan="3">
								<input type="button" id="xfBtnAdd_multi" style="width: 300px;" value=" + Р вЂќР С•Р В±Р В°Р Р†Р С‘РЎвЂљРЎРЉ РЎРѓРЎвЂљРЎР‚Р С•Р С”РЎС“"/>
							</td>
						</tr>
						</tfoot>
					</table>
				</td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_selects'] }}</td>
				<td>{{ lang.xfconfig['tselect_default'] }}</td>
				<td><input type="text" name="select_default_multi" value="{{ defaults.select }}" size=40></td>
			</tr>
		</table>
	</div>

	<!-- FIELD TYPE: CHECKBOX -->
	<div id="type_checkbox">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">{{ lang.xfconfig['type_checkboxs'] }}</td>
				<td width="45%">{{ lang.xfconfig['default'] }}</td>
				<td><input type="checkbox" name="checkbox_default" value="1" {{ defaults.checkbox }}></td>
			</tr>
		</table>
	</div>

	<!-- FIELD TYPE: IMAGES -->
	<div id="type_images">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ</td>
				<td width="45%" colspan="2">Р СљР В°Р С”РЎРѓР С‘Р С�Р В°Р В»РЎРЉР Р…Р С•Р Вµ Р С”Р С•Р В»-Р Р†Р С• Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘Р в„– Р Т‘Р В»РЎРЏ Р В·Р В°Р С–РЎР‚РЎС“Р В·Р С”Р С‘:</td>
				<td colspan=2"><input type="text" size="3" name="images_maxCount" value="{{ images.maxCount }}"/></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ</td>
				<td width="45%" colspan="2">Р вЂќР С•Р В±Р В°Р Р†Р В»РЎРЏРЎвЂљРЎРЉ РЎв‚¬РЎвЂљР В°Р С�Р С—:</td>
				<td colspan=2"><input type="checkbox" name="images_imgStamp" value="1" {{ images.imgStamp }} /></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ</td>
				<td width="45%" colspan="2">Р вЂќР С•Р В±Р В°Р Р†Р В»РЎРЏРЎвЂљРЎРЉ РЎвЂљР ВµР Р…РЎРЉ:</td>
				<td colspan=2"><input type="checkbox"/ name="images_imgShadow" value="1" {{ images.imgShadow }} /></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ</td>
				<td width="45%" colspan="2">Р Р€Р С�Р ВµР Р…РЎРЉРЎв‚¬Р ВµР Р…Р Р…Р В°РЎРЏ Р С”Р С•Р С—Р С‘РЎРЏ:</td>
				<td colspan=2"><input type="checkbox" name="images_imgThumb" value="1" {{ images.imgThumb }} /></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ</td>
				<td width="5%">&nbsp;</td>
				<td width="40%">Р СњР Вµ Р В±Р С•Р В»Р ВµР Вµ:</td>
				<td>&nbsp;</td>
				<td><input type="text" size="4" name="images_thumbWidth" value="{{ images.thumbWidth }}"/> x
					<input type="text" size="4" name="images_thumbHeight" value="{{ images.thumbHeight }}"/> Р С—Р С‘Р С”РЎРѓР ВµР В»Р С•Р Р†
				</td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ</td>
				<td width="5%">&nbsp;</td>
				<td width="40%">Р вЂќР С•Р В±Р В°Р Р†Р В»РЎРЏРЎвЂљРЎРЉ РЎв‚¬РЎвЂљР В°Р С�Р С—:</td>
				<td>&nbsp;</td>
				<td><input type="checkbox" name="images_thumbStamp" value="1" {{ images.thumbStamp }}/></td>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #EAF0F7; border-left: 1px solid #D1DFEF;">Р С‘Р В·Р С•Р В±РЎР‚Р В°Р В¶Р ВµР Р…Р С‘РЎРЏ</td>
				<td width="5%">&nbsp;</td>
				<td width="40%">Р вЂќР С•Р В±Р В°Р Р†Р В»РЎРЏРЎвЂљРЎРЉ РЎвЂљР ВµР Р…РЎРЉ:</td>
				<td>&nbsp;</td>
				<td><input type="checkbox" name="images_thumbShadow" value="1" {{ images.thumbShadow }}/></td>
			</tr>
		</table>
	</div>
	<!-- FIELD TYPE: /CLOSED/ -->

	<table border="0" cellspacing="1" cellpadding="1" style="width:100%;" class="contRow3">
		<tr class="contRow1">
			<td width="50%">Р В Р ВµР В¶Р С‘Р С� РЎРѓР С•РЎвЂ¦РЎР‚Р В°Р Р…Р ВµР Р…Р С‘РЎРЏ Р Т‘Р В°Р Р…Р Р…РЎвЂ№РЎвЂ¦:</td>
			<td>
				<select name="storage" id="storage" value="{{ storage }}" onclick="storageMode(this.value);" onchange="storageMode(this.value);"/>
				<option value="0">Р вЂўР Т‘Р С‘Р Р…Р С•Р Вµ РЎвЂ¦РЎР‚Р В°Р Р…Р С‘Р В»Р С‘РЎвЂ°Р Вµ</option>
				<option value="1">Р СџР ВµРЎР‚РЎРѓР С•Р Р…Р В°Р В»РЎРЉР Р…Р С•Р Вµ Р С—Р С•Р В»Р Вµ Р Р† Р вЂ�Р вЂќ</option>
				</select></td>
		</tr>
		<tr class="contRow4" id="storageRow">
			<td width="50%">Р СћР С‘Р С— Р С—Р С•Р В»РЎРЏ Р Р† Р вЂ�Р вЂќ:</td>
			<td>
				<select name="db_type" value="{{ db_type }}" id="db.type"/>
				<option value="int">int - РЎвЂљР С•Р В»РЎРЉР С”Р С• РЎвЂ Р С‘РЎвЂћРЎР‚РЎвЂ№</option>
				<option value="decimal">decimal - РЎвЂЎР С‘РЎРѓР В»Р С• РЎРѓ РЎвЂћР С‘Р С”РЎРѓР С‘РЎР‚Р С•Р Р†Р В°Р Р…Р Р…Р С•Р в„– РЎвЂљР С•РЎвЂЎР С”Р С•Р в„–</option>
				<option value="char">char - РЎвЂљР ВµР С”РЎРѓРЎвЂљ РЎРѓ Р С•Р С–РЎР‚Р В°Р Р…Р С‘РЎвЂЎР ВµР Р…Р С‘Р ВµР С� Р Т‘Р В»Р С‘Р Р…РЎвЂ№ (255)</option>
				<option value="text">text - РЎвЂљР ВµР С”РЎРѓРЎвЂљ РЎРѓ Р С•Р С–РЎР‚Р В°Р Р…Р С‘РЎвЂЎР ВµР Р…Р С‘Р ВµР С� Р Т‘Р В»Р С‘Р Р…РЎвЂ№ (65535)</option>
				<option value="datetime">datetime - Р Т‘Р В°РЎвЂљР В°-Р Р†РЎР‚Р ВµР С�РЎРЏ</option>
				</select>
				<input maxlength="5" size="5" type="text" name="db_len" value="{{ db_len }}" id="db.len"/>
			</td>
		</tr>
	</table>
	<table border="0" cellspacing="1" cellpadding="1" class="content">
		<tr class="contRow1">
			<td width="50%">{{ lang.xfconfig['required'] }}</td>
			<td width="47%"><select name="required">{{ required_opts }}</select></td>
		</tr>
		{% if (sectionID != 'tdata') %}
			<tr class="contRow1">
			<td width="50%">Р вЂ�Р В»Р С•Р С”:<br/>
				<small>Р В­РЎвЂљР С•РЎвЂљ Р С—Р В°РЎР‚Р В°Р С�Р ВµРЎвЂљРЎР‚ Р С—Р С•Р В·Р Р†Р С•Р В»РЎРЏР ВµРЎвЂљ РЎС“Р С”Р В°Р В·Р В°РЎвЂљРЎРЉ Р Р† Р С”Р В°Р С”Р С•Р С� Р С‘Р С�Р ВµР Р…Р Р…Р С• Р С�Р ВµРЎРѓРЎвЂљР Вµ Р С‘Р Р…РЎвЂљР ВµРЎР‚РЎвЂћР ВµР в„–РЎРѓР В° Р Т‘Р С•Р В±Р В°Р Р†Р В»Р ВµР Р…Р С‘РЎРЏ/РЎР‚Р ВµР Т‘Р В°Р С”РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘РЎРЏ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘
					Р С—Р С•РЎРЏР Р†Р С‘РЎвЂљРЎРѓРЎРЏ Р Т‘Р В°Р Р…Р Р…Р В°РЎРЏ Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…Р В°РЎРЏ.<br/><b>Р СџР С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹</b> - Р В±Р В»Р С•Р С” `Р Т‘Р С•Р С—Р С•Р В»Р Р…Р С‘РЎвЂљР ВµР В»РЎРЉР Р…Р С•`<br/><b>1</b> - Р В±Р В»Р С•Р С”
					`Р С•РЎРѓР Р…Р С•Р Р†Р Р…Р С•Р Вµ РЎРѓР С•Р Т‘Р ВµРЎР‚Р В¶Р В°Р Р…Р С‘Р Вµ`<br/><b>Р Т‘РЎР‚РЎС“Р С–Р С‘Р Вµ (РЎвЂ Р С‘РЎвЂћРЎР‚Р С•Р Р†РЎвЂ№Р Вµ) Р В·Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘РЎРЏ</b> - Р Т‘Р В»РЎРЏ Р В±Р В»Р С•Р С”Р С•Р Р†, Р Т‘Р С•Р В±Р В°Р Р†Р В»Р ВµР Р…Р Р…РЎвЂ№РЎвЂ¦ Р Р† РЎР‚РЎС“РЎвЂЎР Р…Р С•Р С�
					РЎР‚Р ВµР В¶Р С‘Р С�Р Вµ Р Р† Р В°Р Т‘Р С�Р С‘Р Р… Р С—Р В°Р Р…Р ВµР В»РЎРЉ
				</small>
			</td>
			<td width="47%"><input type="text" name="area" value="{{ area }}"/></td></tr>{% endif %}
	</table>

	<table width="100%">
		<tr>&nbsp;</tr>
		<tr align="center">
			<td class="contentEdit" valign="top" width="100%">
				<input id="xfBtnSubmit" type="submit" class="button" value="{% if (flags.editMode) %}{{ lang.xfconfig['edit'] }}{% else %}{{ lang.xfconfig['save'] }}{% endif %}">
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">
	clx('{{ type }}');
	document.getElementById('storage').value = '{{ storage }}';
	document.getElementById('db.type').value = '{{ db_type }}';
	storageMode(document.getElementById('storage').value);

	var soMaxNum = $('#xfSelectTable >tbody >tr').length + 1;

	$('#xfSelectTable a').click(function () {
		if ($('#xfSelectTable >tbody >tr').length > 1) {
			$(this).parent().parent().remove();
		} else {
			$(this).parent().parent().find("input").val('');
		}
	});

	$("#xfBtnSubmit").click(function () {
		// Check if type == 'select'
		if ($("#xfBtnType").val() == 'select') {
			// Prepare list of data


		}

	});

	// jQuery - INIT `select` configuration
	$("#xfBtnAdd").click(function () {
		var xl = $('#xfSelectTable tbody>tr:last').clone();
		xl.find("input").val('');
		xl.find("input").eq(0).attr("name", "so_data[" + soMaxNum + "][0]");
		xl.find("input").eq(1).attr("name", "so_data[" + soMaxNum + "][1]");
		soMaxNum++;

		xl.insertAfter('#xfSelectTable tbody>tr:last');
		$('#xfSelectTable a').click(function () {
			if ($('#xfSelectTable >tbody >tr').length > 1) {
				$(this).parent().parent().remove();
			} else {
				$(this).parent().parent().find("input").val('');
			}
		});
	});


	var soMaxNum_multi = $('#xfSelectTable_multi >tbody >tr').length + 1;

	$('#xfSelectTable_multi a').click(function () {
		if ($('#xfSelectTable_multi >tbody >tr').length > 1) {
			$(this).parent().parent().remove();
		} else {
			$(this).parent().parent().find("input").val('');
		}
	});

	$("#xfBtnAdd_multi").click(function () {
		var xl = $('#xfSelectTable_multi tbody>tr:last').clone();
		xl.find("input").val('');
		xl.find("input").eq(0).attr("name", "mso_data[" + soMaxNum_multi + "][0]");
		xl.find("input").eq(1).attr("name", "mso_data[" + soMaxNum_multi + "][1]");
		soMaxNum_multi++;

		xl.insertAfter('#xfSelectTable_multi tbody>tr:last');
		$('#xfSelectTable_multi a').click(function () {
			if ($('#xfSelectTable_multi >tbody >tr').length > 1) {
				$(this).parent().parent().remove();
			} else {
				$(this).parent().parent().find("input").val('');
			}
		});
	});


</script>