<h2>РџРѕРёСЃРє РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№</h2>
<form id="usersearch" method="post" action="">
	РћС‚РєСѓРґР°: {{ boxlist['from'] }}

	{% if pluginIsActive('xfields') %}
		<!-- РІС‹РїР°РґР°СЋС‰РёРµ СЃРїРёСЃРєРё РґРѕРї. РїРѕР»РµР№ -->
		{% for xf in xflist %}
			{% if boxlist[xf.id] %}
				{{ xf.title }}: {{ boxlist[xf.id] }}
			{% endif %}
		{% endfor %}
	{% endif %}

	<input class="btn" type="submit" name="search" value="РќР°Р№С‚Рё"/>
	<input class="btn" type="submit" name="reset" value="РЎР±СЂРѕСЃ"/>
</form>

{% if searched and entries %}
	<!-- РµСЃР»Рё РїРѕРёСЃРє СѓСЃРїРµС€РЅРѕ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅ -->
	<table class="table">
		<thead>
		<tr>
			<th>Р�РјСЏ</th>

			{% if pluginIsActive('xfields') %}
				<!-- Р·Р°РіРѕР»РѕРІРєРё РґРѕРї. РїРѕР»РµР№ -->
				{% for xf in xflist %}
					<th>{{ xf.title }}</th>
				{% endfor %}
			{% endif %}

			<th>РћС‚РєСѓРґР°</th>
			<th>РќРѕРІРѕСЃС‚РµР№</th>
			<th>РљРѕРјРјРµРЅС‚Р°СЂРёРµРІ</th>
			<th>Р—Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅ</th>
			<th>РџРѕСЃР»РµРґРЅРёР№ РІС…РѕРґ</th>
		</tr>
		</thead>
		<tbody>
		{% for entry in entries %}
			<tr>
				<td><a href='{{ entry.profile_link }}'>{{ entry.profile }}</a></td>

				{% if pluginIsActive('xfields') %}
					<!-- СЃРѕРґРµСЂР¶РёРјРѕРµ РґРѕРї. РїРѕР»РµР№ -->
					{% for xf in entry.xfields %}
						<td>{{ xf }}</td>
					{% endfor %}
				{% endif %}

				<td>{{ entry.from }}</td>
				<td>{{ entry.news }}</td>
				<td>{{ entry.com }}</td>
				<td>{{ entry.reg|date("d-m-Y h:i") }}</td>
				<td>
					{% if (entry.last != 0) %}
						{{ entry.last|date("d-m-Y h:i") }}
					{% else %}
						РЅРµ Р±С‹Р» РЅРё СЂР°Р·Сѓ
					{% endif %}
				</td>
			</tr>
		{% endfor %}
		</tbody>
	</table>
{% else %}
	{% if searched %}
		<!-- РµСЃР»Рё СЂРµР·СѓР»СЊС‚Р°С‚ РїРѕРёСЃРєР° РїСѓСЃС‚ -->
		РџРѕР»СЊР·РѕРІР°С‚РµР»Рё, СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰РёРµ РєСЂРёС‚РµСЂРёСЏРј, РЅРµ РЅР°Р№РґРµРЅС‹!
	{% endif %}
{% endif %}