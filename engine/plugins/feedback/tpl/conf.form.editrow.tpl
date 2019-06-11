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
			<td width="50%">Р С’Р Р†РЎвЂљР С•Р В·Р В°Р С—Р С•Р В»Р Р…Р ВµР Р…Р С‘Р Вµ:<br/>
				<small><b>Р СњР ВµРЎвЂљ</b> - Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЉ Р Т‘Р С•Р В»Р В¶Р ВµР Р… РЎРѓР В°Р С�Р С•РЎРѓРЎвЂљР С•РЎРЏРЎвЂљР ВµР В»РЎРЉР Р…Р С• Р В·Р В°Р С—Р С•Р В»Р Р…РЎРЏРЎвЂљРЎРЉ Р С—Р С•Р В»Р Вµ<br/><b>Р С—Р В°РЎР‚Р В°Р С�Р ВµРЎвЂљРЎР‚Р С•Р С�</b> - Р В·Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ
					Р С—Р С•Р В»РЎРЏ Р С�Р С•Р В¶Р ВµРЎвЂљ Р С—Р ВµРЎР‚Р ВµР Т‘Р В°Р Р†Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Р† Р С”Р В°РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р Вµ Р С—Р В°РЎР‚Р В°Р С�Р ВµРЎвЂљРЎР‚Р В° Р С” URL'РЎС“ Р Р†РЎвЂ№Р В·Р С•Р Р†Р В°<br/><b>РЎРѓР Р†РЎРЏР В·Р С”Р С•Р в„– РЎРѓ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉРЎР‹</b> - Р В·Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ
					Р С—Р С•Р В»РЎРЏ Р С�Р С•Р В¶Р ВµРЎвЂљ Р В±РЎР‚Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р С‘Р В· Р С•Р Т‘Р Р…Р С•Р С‘Р С�РЎвЂ�Р Р…Р Р…Р С•Р С–Р С• Р С—Р С•Р В»РЎРЏ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В° <b>xfields</b> РЎРѓР Р†РЎРЏР В·Р В°Р Р…Р Р…Р С•Р в„– Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘<br/><b>РЎРѓР Р†РЎРЏР В·Р С”Р В° РЎРѓ
						Р С—РЎР‚Р С•РЎвЂћР С‘Р В»Р ВµР С�</b> - Р В·Р Р…Р В°РЎвЂЎР ВµР Р…Р С‘Р Вµ Р С—Р С•Р В»РЎРЏ Р С�Р С•Р В¶Р ВµРЎвЂљ Р В±РЎР‚Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р С‘Р В· Р С•Р Т‘Р Р…Р С•Р С‘Р С�РЎвЂ�Р Р…Р Р…Р С•Р С–Р С• Р С—Р С•Р В»РЎРЏ Р С—Р В»Р В°Р С–Р С‘Р Р…Р В° <b>xfields</b> Р С—РЎР‚Р С•РЎвЂћР С‘Р В»РЎРЏ
					Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЏ
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
			<td width="50%">Р вЂ�Р В»Р С•Р С”Р С‘РЎР‚Р С•Р Р†Р С”Р В°:<br/>
				<small><b>Р СњР ВµРЎвЂљ</b> - Р С—Р С•Р В»Р Вµ Р Т‘Р С•РЎРѓРЎвЂљРЎС“Р С—Р Р…Р С• Р Т‘Р В»РЎРЏ РЎР‚Р ВµР Т‘Р В°Р С”РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘РЎРЏ<br/><b>Р вЂќР В°</b> - Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЉ Р Р…Р Вµ Р С�Р С•Р В¶Р ВµРЎвЂљ РЎР‚Р ВµР Т‘Р В°Р С”РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°РЎвЂљРЎРЉ
					Р Т‘Р В°Р Р…Р Р…Р С•Р Вµ Р С—Р С•Р В»Р Вµ<br/><b>Р вЂќР В°, Р Р…Р ВµР Р†Р С‘Р Т‘Р С‘Р С�Р С•</b> - Р С—Р С•Р В»Р Вµ Р Р…Р ВµР Р†Р С‘Р Т‘Р С‘Р С�Р С•, Р ВµР С–Р С• РЎР‚Р ВµР Т‘Р В°Р С”РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р В·Р В°Р С—РЎР‚Р ВµРЎвЂ°Р ВµР Р…Р С•
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