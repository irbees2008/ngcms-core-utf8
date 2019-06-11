<div class="block-title">Р РЋР С—Р С‘РЎРѓР С•Р С” Р Р†Р В°РЎв‚¬Р С‘РЎвЂ¦ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–:</div>
<table class="table table-striped table-bordered">
	<tr>
		<th colspan="4"><a href="{{ addURL }}">Р вЂќР С•Р В±Р В°Р Р†Р С‘РЎвЂљРЎРЉ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ..</a></th>
	</tr>
	<tr align="center">
		<td width="40">Р РЋРЎвЂљР В°РЎвЂљРЎС“РЎРѓ</td>
		<td width="60">Р вЂќР В°РЎвЂљР В°</td>
		<td>&nbsp;</td>
		<td>Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С”</td>
	</tr>
	{% for entry in entries %}
		<tr>
			<td width="25" align="center">
				{% if (entry.state == 1) %}
					<img src="{{ skins_url }}/images/yes.png" alt="{{ lang['state.published'] }}"/>
				{% elseif (entry.state == 0) %}
					<img src="{{ skins_url }}/images/no.png" alt="{{ lang['state.unpiblished'] }}"/>
				{% else %}
					<img src="{{ skins_url }}/images/no_plug.png" alt="{{ lang['state.draft'] }}"/>
				{% endif %}
			</td>
			<td width="60">{% if entry.flags.canEdit %}
				<a href="{{ entry.editlink }}">{% endif %}{{ entry.itemdate }}{% if entry.flags.canView %}</a>{% endif %}
			</td>
			<td width="48" cellspacing=0 cellpadding=0 align="center">
				{% if entry.flags.mainpage %}
					<img src="{{ skins_url }}/images/mainpage.png" border="0" width="16" height="16" title="Р СњР В° Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„–"/> {% endif %}
				{% if (entry.attach_count > 0) %}
					<img src="{{ skins_url }}/images/attach.png" border="0" width="16" height="16" title="Р В¤Р В°Р в„–Р В»Р С•Р Р†: {{ entry.attach_count }}"/> {% endif %}
				{% if (entry.images_count > 0) %}
					<img src="{{ skins_url }}/images/img_group.png" border="0" width="16" height="16" title="Р С™Р В°РЎР‚РЎвЂљР С‘Р Р…Р С•Р С”: {{ entry.images_count }}"/> {% endif %}
			</td>
			<td>
				{% if entry.flags.status %}
				<a href="{{ entry.link }}">{% endif %}{{ entry.title }}{% if entry.flags.status %}</a>{% endif %}
			</td>
		</tr>
	{% else %}
		<tr>
			<td colspan="4">Р Р€ Р Р†Р В°РЎРѓ Р Р…Р ВµРЎвЂљ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–</td>
		</tr>
	{% endfor %}
</table>