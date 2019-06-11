{% include localPath(0) ~ "conf.navi.tpl" %}

<script language="javascript">
	function clx(mode) {
		document.getElementById('type_text').style.display = (mode == 'text') ? 'block' : 'none';
		document.getElementById('type_email').style.display = (mode == 'email') ? 'block' : 'none';
		document.getElementById('type_textarea').style.display = (mode == 'textarea') ? 'block' : 'none';
		document.getElementById('type_select').style.display = (mode == 'select') ? 'block' : 'none';
		document.getElementById('type_date').style.display = (mode == 'date') ? 'block' : 'none';
	}
</script>

<form action="?mod=extra-config&plugin=feedback&action=editrow&form_id={{ formID }}&name={{ fieldName }}" method="post" name="feedbackform">
	<input type="hidden" name="edit" value="{% if (flags.addField) %}0{% else %}1{% endif %}">
	<table border="0" cellspacing="1" cellpadding="1" class="content">
		<tr class="contRow1">
			<td width="50%">{{ lang['feedback:field.id'] }}</td>
			<td width="47%">
				<input type="text" name="name" value="{{ field.name }}" size="40" {% if (not flags.addField) %}readonly{% endif %}>{% if (not flags.addField) %} &nbsp; &nbsp; {{ lang['feedback:field.noedit'] }}{% endif %}
			</td>
		</tr>
		<tr class="contRow1">
			<td width="50%">{{ lang['feedback:field.title'] }}</td>
			<td><input type="text" name="title" value="{{ field.title }}" size="40"/></td>
		</tr>
		<tr class="contRow1">
			<td width="50%">{{ lang['feedback:field.type'] }}</td>
			<td><select name="type" id="type" onclick="clx(this.value);" onchange="clx(this.value);"/>
				{{ field.type.options }}
				</select></td>
		</tr>
	</table>

	<div id="type_text">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #E0FFFF;">{{ lang['feedback:type.text'] }}</td>
				<td width="45%">{{ lang['feedback:field.default'] }}</td>
				<td><input type="text" name="text_default" value="{{ field.text_default }}" size=40>
			</tr>
		</table>
	</div>
	<div id="type_email">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #E0FFFF;">{{ lang['feedback:type.email'] }}</td>
				<td width="45%">{{ lang['feedback:email.sendmail'] }}</td>
				<td>
					<select name="email_template">
						{% for x,xv in field.email_template.options %}
							<option value="{{ x }}" {% if (field.email_template.value == x) %}selected="selected"{% endif %}>{% if (x == '') %}{{ lang['feedback:email.sendmail.0'] }}{% else %}{{ xv }}{% endif %}</option>
						{% endfor %}
			</tr>
		</table>
	</div>
	<div id="type_textarea">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #FFE0FF;">{{ lang['feedback:type.textarea'] }}</td>
				<td width="45%">{{ lang['feedback:field.default'] }}</td>
				<td><textarea name="textarea_default" cols=70 rows=4>{{ field.textarea_default }}</textarea>
			</tr>
		</table>
	</div>
	<div id="type_select">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #FFFFE0;">{{ lang['feedback:type.select'] }}</td>
				<td>{{ lang['feedback:select.options'] }}</td>
				<td><textarea cols=70 rows=8 name="select_options">{{ field.select_options }}</textarea>
			</tr>
			<tr class="contRow1">
				<td width="5%" style="background-color: #FFFFE0;">{{ lang['feedback:type.select'] }}</td>
				<td>{{ lang['feedback:field.default'] }}</td>
				<td><input type="text" name="select_default" value="{{ field.select_default }}" size=40>
			</tr>
		</table>
	</div>
	<div id="type_date">
		<table border="0" cellspacing="1" cellpadding="1" class="content">
			<tr class="contRow1">
				<td width="5%" style="background-color: #E0FFFF;">{{ lang['feedback:type.date'] }}</td>
				<td width="45%">{{ lang['feedback:field.default.date'] }}</td>
				<td><input type="text" name="date_default" value="{{ field.date_default }}" size=10>
			</tr>
		</table>
	</div>
	<table border="0" cellspacing="1" cellpadding="1" class="content">
		<tr class="contRow1">
			<td width="50%">{{ lang['feedback:field.required'] }}</td>
			<td width="47%"><select name="required">
					{% for x in field.required.options %}
						<option value="{{ x }}" {% if (field.required.value == x) %}selected="selected"{% endif %}>{{ lang['feedback:field.required.' ~ x] }}</option>
					{% endfor %}
				</select></td>
		</tr>
		<tr class="contRow1">
			<td width="50%">РђРІС‚РѕР·Р°РїРѕР»РЅРµРЅРёРµ:<br/>
				<small><b>РќРµС‚</b> - РїРѕР»СЊР·РѕРІР°С‚РµР»СЊ РґРѕР»Р¶РµРЅ СЃР°РјРѕСЃС‚РѕСЏС‚РµР»СЊРЅРѕ Р·Р°РїРѕР»РЅСЏС‚СЊ РїРѕР»Рµ<br/><b>РїР°СЂР°РјРµС‚СЂРѕРј</b> - Р·РЅР°С‡РµРЅРёРµ
					РїРѕР»СЏ РјРѕР¶РµС‚ РїРµСЂРµРґР°РІР°С‚СЊСЃСЏ РІ РєР°С‡РµСЃС‚РІРµ РїР°СЂР°РјРµС‚СЂР° Рє URL'Сѓ РІС‹Р·РѕРІР°<br/><b>СЃРІСЏР·РєРѕР№ СЃ РЅРѕРІРѕСЃС‚СЊСЋ</b> - Р·РЅР°С‡РµРЅРёРµ
					РїРѕР»СЏ РјРѕР¶РµС‚ Р±СЂР°С‚СЊСЃСЏ РёР· РѕРґРЅРѕРёРјС‘РЅРЅРѕРіРѕ РїРѕР»СЏ РїР»Р°РіРёРЅР° <b>xfields</b> СЃРІСЏР·Р°РЅРЅРѕР№ РЅРѕРІРѕСЃС‚Рё<br/><b>СЃРІСЏР·РєР° СЃ
						РїСЂРѕС„РёР»РµРј</b> - Р·РЅР°С‡РµРЅРёРµ РїРѕР»СЏ РјРѕР¶РµС‚ Р±СЂР°С‚СЊСЃСЏ РёР· РѕРґРЅРѕРёРјС‘РЅРЅРѕРіРѕ РїРѕР»СЏ РїР»Р°РіРёРЅР° <b>xfields</b> РїСЂРѕС„РёР»СЏ
					РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ
				</small>
			</td>
			<td>
				<select name="auto">
					{% for x in field.auto.options %}
						<option value="{{ x }}" {% if (field.auto.value == x) %}selected="selected"{% endif %}>{{ lang['feedback:field.auto.' ~ x] }}</option>
					{% endfor %}
				</select>
			</td>
		</tr>
		<tr class="contRow1">
			<td width="50%">Р‘Р»РѕРєРёСЂРѕРІРєР°:<br/>
				<small><b>РќРµС‚</b> - РїРѕР»Рµ РґРѕСЃС‚СѓРїРЅРѕ РґР»СЏ СЂРµРґР°РєС‚РёСЂРѕРІР°РЅРёСЏ<br/><b>Р”Р°</b> - РїРѕР»СЊР·РѕРІР°С‚РµР»СЊ РЅРµ РјРѕР¶РµС‚ СЂРµРґР°РєС‚РёСЂРѕРІР°С‚СЊ
					РґР°РЅРЅРѕРµ РїРѕР»Рµ<br/><b>Р”Р°, РЅРµРІРёРґРёРјРѕ</b> - РїРѕР»Рµ РЅРµРІРёРґРёРјРѕ, РµРіРѕ СЂРµРґР°РєС‚РёСЂРѕРІР°РЅРёРµ Р·Р°РїСЂРµС‰РµРЅРѕ
				</small>
			</td>
			<td>
				<select name="block">
					{% for x in field.block.options %}
						<option value="{{ x }}" {% if (field.block.value == x) %}selected="selected"{% endif %}>{{ lang['feedback:field.block.' ~ x] }}</option>
					{% endfor %}
				</select>
			</td>
		</tr>
		<tr class="contRow1">
			<td colspan=2 align="center"><input type="submit" class="button" value="{{ lang['feedback:button.save'] }}">
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">
	clx('{{ field.type.value }}');
</script>