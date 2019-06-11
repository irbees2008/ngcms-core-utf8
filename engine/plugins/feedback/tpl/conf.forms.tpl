{% include localPath(0) ~ "conf.navi.tpl" %}

<table width="100%">
	<tr align="left">
		<td class="contentHead"><b>Р С™Р С•Р Т‘</b></td>
		<td class="contentHead"><b>ID РЎвЂћР С•РЎР‚Р С�РЎвЂ№</b></td>
		<td class="contentHead"><b>Р СњР В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ РЎвЂћР С•РЎР‚Р С�РЎвЂ№</b></td>
		<td class="contentHead"><b>Р СџРЎР‚Р С‘Р Р†РЎРЏР В·Р С”Р В° Р С” Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЏР С�</b></td>
		<td class="contentHead"><b>Р С’Р С”РЎвЂљР С‘Р Р†Р Р…Р В°</b></td>
		<td class="contentHead">&nbsp;</td>
	</tr>
	{% for entry in entries %}
		<tr align="left" class="contRow1">
			<td width="30"><a href="{{ entry.linkEdit }}">{{ entry.id }}</a></td>
			<td style="padding:2px;"><a href="{{ entry.linkEdit }}">{{ entry.name }}</a></td>
			<td>{{ entry.title }}</td>
			<td>{{ lang['feedback:link_news.' ~ entry.link_news] }}</td>
			<td>{{ entry.flags.active ? lang['yesa'] : lang['noa'] }}</td>
			<td nowrap>{% if (entry.flags.active) %}
				<a onclick="alert('{{ lang['feedback:active_nodel'] }}');">{% else %}
					<a href="{{ entry.linkDel }}" onclick="return confirm('{{ lang['feedback:suretest'] }}');">{% endif %}
						<img src="{{ skins_url }}/images/delete.gif" alt="DEL" width="12" height="12"/></a></td>
		</tr>
	{% endfor %}
	<tr>
		<td></td>
		<td colspan="5" style="text-align: left; padding: 10px 10px 0 0;">
			<a href="?mod=extra-config&plugin=feedback&action=addform">Р РЋР С•Р В·Р Т‘Р В°РЎвЂљРЎРЉ Р Р…Р С•Р Р†РЎС“РЎР‹ РЎвЂћР С•РЎР‚Р С�РЎС“</a>
		</td>
	</tr>
</table>
</form>