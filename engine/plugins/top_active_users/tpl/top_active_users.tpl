<table width="100%">
	<tr>
		<td align="center"><b>Р С’Р Р†Р В°РЎвЂљР В°РЎР‚</b></td>
		<td align="center"><b>Р В®Р В·Р ВµРЎР‚</b></td>
	</tr>
	{% for entry in entries %}
		<tr>
			<td align="center">{% if (entry.use_avatars) %}
					<img src="{{ entry.avatar_url }}" alt="{{ entry.name }}" />{% endif %}</td>
			<td align="center">
				<a href="{{ entry.link }}" title="{{ entry.name }}">{{ entry.name }}</a> {{ entry.com }} {{ entry.news }}
			</td>
		</tr>
	{% endfor %}
</table>
</div>