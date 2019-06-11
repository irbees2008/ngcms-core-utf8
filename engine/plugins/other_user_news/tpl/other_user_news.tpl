{% if (entries|length > 0) %}
	<br/>
	<b>Р вЂќРЎР‚РЎС“Р С–Р С‘Р Вµ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ Р С•РЎвЂљ Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЏ <a href="{{ author_link }}" target="_blank">{{ author }}</a>:</b>
	<table width="100%">
		<tr>
			<td align="center"><b>Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С”</b></td>
			<td align="center"><b>Р СњР С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ</b></td>
			<td align="center"><b>Р вЂќР В°РЎвЂљР В° Р С—РЎС“Р В±Р В»Р С‘Р С”Р В°РЎвЂ Р С‘Р С‘</b></td>
		</tr>
		{% for entry in entries %}
			<tr>
				<td align="center"><a href="{{ entry.news_link }}" target="_blank">{{ entry.title }}</a></td>
				<td align="center">{{ entry.short_news }}</td>
				<td align="center">{{ entry.postdate|date("d-m-Y h:i") }}</td>
			</tr>
		{% endfor %}
	</table>
{% endif %}
