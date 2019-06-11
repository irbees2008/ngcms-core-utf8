<h2>Р СџР С•Р С‘РЎРѓР С” Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р ВµР в„–</h2>
<form id="usersearch" method="post" action="">
	Р С›РЎвЂљР С”РЎС“Р Т‘Р В°: {{ boxlist['from'] }}

	{% if pluginIsActive('xfields') %}
		<!-- Р Р†РЎвЂ№Р С—Р В°Р Т‘Р В°РЎР‹РЎвЂ°Р С‘Р Вµ РЎРѓР С—Р С‘РЎРѓР С”Р С‘ Р Т‘Р С•Р С—. Р С—Р С•Р В»Р ВµР в„– -->
		{% for xf in xflist %}
			{% if boxlist[xf.id] %}
				{{ xf.title }}: {{ boxlist[xf.id] }}
			{% endif %}
		{% endfor %}
	{% endif %}

	<input class="btn" type="submit" name="search" value="Р СњР В°Р в„–РЎвЂљР С‘"/>
	<input class="btn" type="submit" name="reset" value="Р РЋР В±РЎР‚Р С•РЎРѓ"/>
</form>

{% if searched and entries %}
	<!-- Р ВµРЎРѓР В»Р С‘ Р С—Р С•Р С‘РЎРѓР С” РЎС“РЎРѓР С—Р ВµРЎв‚¬Р Р…Р С• Р С•РЎРѓРЎС“РЎвЂ°Р ВµРЎРѓРЎвЂљР Р†Р В»Р ВµР Р… -->
	<table class="table">
		<thead>
		<tr>
			<th>Р пїЅР С�РЎРЏ</th>

			{% if pluginIsActive('xfields') %}
				<!-- Р В·Р В°Р С–Р С•Р В»Р С•Р Р†Р С”Р С‘ Р Т‘Р С•Р С—. Р С—Р С•Р В»Р ВµР в„– -->
				{% for xf in xflist %}
					<th>{{ xf.title }}</th>
				{% endfor %}
			{% endif %}

			<th>Р С›РЎвЂљР С”РЎС“Р Т‘Р В°</th>
			<th>Р СњР С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–</th>
			<th>Р С™Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р ВµР Р†</th>
			<th>Р вЂ”Р В°РЎР‚Р ВµР С–Р С‘РЎРѓРЎвЂљРЎР‚Р С‘РЎР‚Р С•Р Р†Р В°Р Р…</th>
			<th>Р СџР С•РЎРѓР В»Р ВµР Т‘Р Р…Р С‘Р в„– Р Р†РЎвЂ¦Р С•Р Т‘</th>
		</tr>
		</thead>
		<tbody>
		{% for entry in entries %}
			<tr>
				<td><a href='{{ entry.profile_link }}'>{{ entry.profile }}</a></td>

				{% if pluginIsActive('xfields') %}
					<!-- РЎРѓР С•Р Т‘Р ВµРЎР‚Р В¶Р С‘Р С�Р С•Р Вµ Р Т‘Р С•Р С—. Р С—Р С•Р В»Р ВµР в„– -->
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
						Р Р…Р Вµ Р В±РЎвЂ№Р В» Р Р…Р С‘ РЎР‚Р В°Р В·РЎС“
					{% endif %}
				</td>
			</tr>
		{% endfor %}
		</tbody>
	</table>
{% else %}
	{% if searched %}
		<!-- Р ВµРЎРѓР В»Р С‘ РЎР‚Р ВµР В·РЎС“Р В»РЎРЉРЎвЂљР В°РЎвЂљ Р С—Р С•Р С‘РЎРѓР С”Р В° Р С—РЎС“РЎРѓРЎвЂљ -->
		Р СџР С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р С‘, РЎРѓР С•Р С•РЎвЂљР Р†Р ВµРЎвЂљРЎРѓРЎвЂљР Р†РЎС“РЎР‹РЎвЂ°Р С‘Р Вµ Р С”РЎР‚Р С‘РЎвЂљР ВµРЎР‚Р С‘РЎРЏР С�, Р Р…Р Вµ Р Р…Р В°Р в„–Р Т‘Р ВµР Р…РЎвЂ№!
	{% endif %}
{% endif %}