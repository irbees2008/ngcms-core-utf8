{% if (recs > 0) %}
	<h3>Р вЂ™Р В°РЎв‚¬Р В° Р С”Р С•РЎР‚Р В·Р С‘Р Р…Р В°</h3>
	<div class="table">
		<table class="basket_tb">
			<thead>
			<tr valign="top">
				<td>#</td>
				<td>Р СњР В°Р С‘Р С�Р ВµР Р…Р С•Р Р†Р В°Р Р…Р С‘Р Вµ</td>
				<td>Р В Р В°Р В·Р С�Р ВµРЎР‚</td>
				<td>Р В¦Р ВµР Р…Р В°</td>
				<td>Р С™Р С•Р В»-Р Р†Р С•</td>
				<td>Р РЋРЎвЂљР С•Р С‘Р С�Р С•РЎРѓРЎвЂљРЎРЉ</td>
			</tr>
			</thead>
			<tbody>
			{% for entry in entries %}
				<tr>
					<td>{{ loop.index }}</td>
					<td>{{ entry.title }}</td>
					<td>{{ entry.xfields.news.size }}</td>
					<td align="right">{{ entry.price }}</td>
					<td align="right">{{ entry.count }}</td>
					<td align="right">{{ entry.sum }}</td>
				</tr>
			{% endfor %}
			</tbody>
			<tfoot>
			<tr>
				<td colspan="4">Р пїЅРЎвЂљР С•Р С–Р С•:</td>
				<td align="right">{{ total }}</td>
			</tr>
			</tfoot>
		</table>
	</div>
{% else %}
	Р вЂ™Р В°РЎв‚¬Р В° Р С”Р С•РЎР‚Р В·Р С‘Р Р…Р В° Р С—РЎС“РЎРѓРЎвЂљР В°!
{% endif %}
