{% if (recs > 0) %}
	<h3>Р’Р°С€Р° РєРѕСЂР·РёРЅР°</h3>
	<div class="table">
		<table class="basket_tb">
			<thead>
			<tr valign="top">
				<td>#</td>
				<td>РќР°РёРјРµРЅРѕРІР°РЅРёРµ</td>
				<td>Р Р°Р·РјРµСЂ</td>
				<td>Р¦РµРЅР°</td>
				<td>РљРѕР»-РІРѕ</td>
				<td>РЎС‚РѕРёРјРѕСЃС‚СЊ</td>
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
				<td colspan="4">Р�С‚РѕРіРѕ:</td>
				<td align="right">{{ total }}</td>
			</tr>
			</tfoot>
		</table>
	</div>
{% else %}
	Р’Р°С€Р° РєРѕСЂР·РёРЅР° РїСѓСЃС‚Р°!
{% endif %}
