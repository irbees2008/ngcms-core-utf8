<html>
<body>
<div style="font: normal 11px verdana, sans-serif;">
	<h3>Р Р€Р Р†Р В°Р В¶Р В°Р ВµР С�РЎвЂ№Р в„– Р В°Р Т‘Р С�Р С‘Р Р…Р С‘РЎРѓРЎвЂљРЎР‚Р В°РЎвЂљР С•РЎР‚!</h3>
	Р вЂ™Р В°Р С� РЎвЂљР С•Р В»РЎРЉР С”Р С• РЎвЂЎРЎвЂљР С• Р В±РЎвЂ№Р В»Р С• Р С•РЎвЂљР С—РЎР‚Р В°Р Р†Р В»Р ВµР Р…Р С• РЎРѓР С•Р С•Р В±РЎвЂ°Р ВµР Р…Р С‘Р Вµ РЎвЂЎР ВµРЎР‚Р ВµР В· РЎвЂћР С•РЎР‚Р С�РЎС“ Р С•Р В±РЎР‚Р В°РЎвЂљР Р…Р С•Р в„– РЎРѓР Р†РЎРЏР В·Р С‘.<br/>
	<br/>
	<h4>Р СџР В°РЎР‚Р В°Р С�Р ВµРЎвЂљРЎР‚РЎвЂ№ РЎвЂћР С•РЎР‚Р С�РЎвЂ№:</h4>
	<table width="100%" cellspacing="1" cellpadding="1">
		<tr>
			<td style="background: #E0E0E0;"><b>ID:</b></td>
			<td style="background: #EFEFEF;">{{ form.id }}</td>
		</tr>
		<tr>
			<td style="background: #E0E0E0;"><b>Р СњР В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ:</b></td>
			<td style="background: #EFEFEF;">{{ form.title }}</td>
		</tr>
		<tr>
			<td style="background: #E0E0E0;"><b>Р С›Р С—Р С‘РЎРѓР В°Р Р…Р С‘Р Вµ:</b></td>
			<td style="background: #EFEFEF;">{{ form.description }}</td>
		</tr>
	</table>
	<br/>

	{% if (flags.link_news) %}
		<h4>Р вЂ”Р В°Р С—РЎР‚Р С•РЎРѓ Р С—Р С• Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘:</h4>
		<table width="100%" cellspacing="1" cellpadding="1">
			<tr>
				<td style="background: #E0E0E0;"><b>ID:</b></td>
				<td style="background: #EFEFEF;">{{ news.id }}</td>
			</tr>
			<tr>
				<td style="background: #E0E0E0;"><b>Р РЋРЎРѓРЎвЂ№Р В»Р С”Р В°:</b></td>
				<td style="background: #EFEFEF;">{{ news.url }}</td>
			</tr>
			<tr>
				<td style="background: #E0E0E0;"><b>Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С”:</b></td>
				<td style="background: #EFEFEF;">{{ news.title }}</td>
			</tr>
		</table>
		<br/>
	{% endif %}

	<h4>Р СџР С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЉ Р В·Р В°Р С—Р С•Р В»Р Р…Р С‘Р В» РЎРѓР В»Р ВµР Т‘РЎС“РЎР‹РЎвЂ°Р С‘Р Вµ Р С—Р С•Р В»РЎРЏ:</h4>
	<table width="100%" cellspacing="1" cellpadding="1">
		<thead>
		<tr>
			<td width="15%" style="background: #E0E0E0; font-weight: bold;">ID</td>
			<td width="35%" style="background: #E0E0E0; font-weight: bold;">Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С”</td>
			<td style="background: #E0E0E0; font-weight: bold;">Р РЋР С•Р Т‘Р ВµРЎР‚Р В¶Р С‘Р С�Р С•Р Вµ</td>
		</tr>
		</thead>
		<tbody>
		{% for entry in entries %}
			<tr style="background: #FFFFFF;" valign="top">
				<td style="background: #EFEFEF;">{{ entry.id }}</td>
				<td style="background: #EFEFEF;">{{ entry.title }}</td>
				<td style="background: #EFEFEF;">{{ entry.value }}</td>
			</tr>
		{% endfor %}
		</tbody>
	</table>

	<br/>
	<br/>
	---<br/>
	Р РЋ РЎС“Р Р†Р В°Р В¶Р ВµР Р…Р С‘Р ВµР С�,<br/>
	Р С—Р С•РЎвЂЎРЎвЂљР С•Р Р†РЎвЂ№Р в„– РЎР‚Р С•Р В±Р С•РЎвЂљ Р вЂ™Р В°РЎв‚¬Р ВµР С–Р С• РЎРѓР В°Р в„–РЎвЂљР В° (РЎР‚Р В°Р В±Р С•РЎвЂљР В°Р ВµРЎвЂљ Р Р…Р В° Р В±Р В°Р В·Р Вµ <b><font color="#90b500">N</font><font color="#5a5047">ext</font>
		<font color="#90b500">G</font><font color="#5a5047">eneration</font> CMS</b> - http://ngcms.ru/)
</div>

</body>
</html>

