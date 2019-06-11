{% if (flags.tdata) %}
	<tr>
		<td width="100%" class="contentHead" colspan="2">
			<img src="/engine/skins/default/images/nav.gif" hspace="8" alt=""/>Р СћР В°Р В±Р В»Р С‘РЎвЂЎР Р…РЎвЂ№Р Вµ Р Т‘Р В°Р Р…Р Р…РЎвЂ№Р Вµ
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%" id="tdataTable">
				<thead>
				<tr>
					<td>#</td>
					{% for entry in xtableHdr %}
						<td>{{ entry.title }}</td>
					{% endfor %}
					<td>Р вЂќР ВµР в„–РЎРѓРЎвЂљР Р†Р С‘Р Вµ</td>
				</tr>
				</thead>
				<tbody></tbody>
				<tfoot>
				<tr>
					<td colspan="{{ (xtablecnt+2) }}">
						<input type="button" value="Р Т‘Р С•Р В±Р В°Р Р†Р С‘РЎвЂљРЎРЉ РЎРѓРЎвЂљРЎР‚Р С•Р С”Р С‘.." onclick="tblLoadData(0);"/></td>
				</tr>
				</tfoot>
			</table>
		</td>
	</tr>
{% endif %}
<tr>
	<td width="100%" class="contentHead" colspan="2">
		<img src="/engine/skins/default/images/nav.gif" hspace="8" alt=""/>{{ lang['xfields_group_title'] }}
		<span id="xf_profile"></span></td>
</tr>
<tr>
	<td>
		<table width="100%">
			{% for entry in entries %}
				<tr id="xfl_{{ entry.id }}">
					<td valign="top" width="200">{{ entry.title }}{% if entry.flags.required %} <b>(*)</b>{% endif %}:
					</td>
					<td valign="top">{{ entry.input }}</td>
				</tr>
			{% endfor %}
		</table>
	</td>
</tr>