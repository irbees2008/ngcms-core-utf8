<html>
<body>
<div style="font: normal 11px verdana, sans-serif;">
	<h3>РЈРІР°Р¶Р°РµРјС‹Р№ Р°РґРјРёРЅРёСЃС‚СЂР°С‚РѕСЂ!</h3>
	Р’Р°Рј С‚РѕР»СЊРєРѕ С‡С‚Рѕ Р±С‹Р»Рѕ РѕС‚РїСЂР°РІР»РµРЅРѕ СЃРѕРѕР±С‰РµРЅРёРµ С‡РµСЂРµР· С„РѕСЂРјСѓ РѕР±СЂР°С‚РЅРѕР№ СЃРІСЏР·Рё.<br/>
	<br/>
	<h4>РџР°СЂР°РјРµС‚СЂС‹ С„РѕСЂРјС‹:</h4>
	<table width="100%" cellspacing="1" cellpadding="1">
		<tr>
			<td style="background: #E0E0E0;"><b>ID:</b></td>
			<td style="background: #EFEFEF;">{{ form.id }}</td>
		</tr>
		<tr>
			<td style="background: #E0E0E0;"><b>РќР°Р·РІР°РЅРёРµ:</b></td>
			<td style="background: #EFEFEF;">{{ form.title }}</td>
		</tr>
		<tr>
			<td style="background: #E0E0E0;"><b>РћРїРёСЃР°РЅРёРµ:</b></td>
			<td style="background: #EFEFEF;">{{ form.description }}</td>
		</tr>
	</table>
	<br/>

	{% if (flags.link_news) %}
		<h4>Р—Р°РїСЂРѕСЃ РїРѕ РЅРѕРІРѕСЃС‚Рё:</h4>
		<table width="100%" cellspacing="1" cellpadding="1">
			<tr>
				<td style="background: #E0E0E0;"><b>ID:</b></td>
				<td style="background: #EFEFEF;">{{ news.id }}</td>
			</tr>
			<tr>
				<td style="background: #E0E0E0;"><b>РЎСЃС‹Р»РєР°:</b></td>
				<td style="background: #EFEFEF;">{{ news.url }}</td>
			</tr>
			<tr>
				<td style="background: #E0E0E0;"><b>Р—Р°РіРѕР»РѕРІРѕРє:</b></td>
				<td style="background: #EFEFEF;">{{ news.title }}</td>
			</tr>
		</table>
		<br/>
	{% endif %}

	<h4>РџРѕР»СЊР·РѕРІР°С‚РµР»СЊ Р·Р°РїРѕР»РЅРёР» СЃР»РµРґСѓСЋС‰РёРµ РїРѕР»СЏ:</h4>
	<table width="100%" cellspacing="1" cellpadding="1">
		<thead>
		<tr>
			<td width="15%" style="background: #E0E0E0; font-weight: bold;">ID</td>
			<td width="35%" style="background: #E0E0E0; font-weight: bold;">Р—Р°РіРѕР»РѕРІРѕРє</td>
			<td style="background: #E0E0E0; font-weight: bold;">РЎРѕРґРµСЂР¶РёРјРѕРµ</td>
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
	РЎ СѓРІР°Р¶РµРЅРёРµРј,<br/>
	РїРѕС‡С‚РѕРІС‹Р№ СЂРѕР±РѕС‚ Р’Р°С€РµРіРѕ СЃР°Р№С‚Р° (СЂР°Р±РѕС‚Р°РµС‚ РЅР° Р±Р°Р·Рµ <b><font color="#90b500">N</font><font color="#5a5047">ext</font>
		<font color="#90b500">G</font><font color="#5a5047">eneration</font> CMS</b> - http://ngcms.ru/)
</div>

</body>
</html>

