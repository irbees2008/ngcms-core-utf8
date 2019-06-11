<div style="text-align : left;">
	<table class="content" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td width="100%" colspan="2" class="contentHead">
				<img src="{{ skins_url }}/images/nav.gif" hspace="8" alt=""/>Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р В° Р С—Р В»Р В°Р С–Р С‘Р Р…Р В°: Simple Title Pro
				=> {{ global }} </td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>

	<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr align="center">
			<td width="100%" class="contentNav" align="center" style="background-repeat: no-repeat; background-position: left;">
				<input type="button" onmousedown="javascript:window.location.href='{{ admin_url }}/admin.php?mod=extra-config&plugin=simple_title_pro'" value="Р С›Р В±РЎвЂ°Р С‘Р Вµ" class="navbutton"/>
				<input type="button" onmousedown="javascript:window.location.href='{{ admin_url }}/admin.php?mod=extra-config&plugin=simple_title_pro&action=list_static'" value="Р РЋР С—Р С‘РЎРѓР С•Р С” РЎРѓРЎвЂљР В°РЎвЂљР С‘Р С”Р С•Р Р†" class="navbutton"/>
				<input type="button" onmousedown="javascript:window.location.href='{{ admin_url }}/admin.php?mod=extra-config&plugin=simple_title_pro&action=list_cat'" value="Р РЋР С—Р С‘РЎРѓР С•Р С” Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р в„–" class="navbutton"/>
				<input type="button" onmousedown="javascript:window.location.href='{{ admin_url }}/admin.php?mod=extra-config&plugin=simple_title_pro&action=list_news'" value="Р РЋР С—Р С‘РЎРѓР С•Р С” Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–" class="navbutton"/>
				<input type="button" onmousedown="javascript:window.location.href='{{ admin_url }}/admin.php?mod=extra-config&plugin=simple_title_pro&action=clear_cache'" value="Р С›РЎвЂЎР С‘РЎРѓРЎвЂљР С‘РЎвЂљРЎРЉ Р С”РЎРЊРЎв‚¬" class="navbutton"/>
				<input type="button" onmousedown="javascript:window.location.href='{{ admin_url }}/admin.php?mod=extra-config&plugin=simple_title_pro&action=about'" value="Р С› Р С—Р В»Р В°Р С–Р С‘Р Р…Р Вµ" class="navbutton"/>
			</td>
		</tr>
	</table>
	<br/>
	{% if (info.true) %}
		<tr>
		<td class="contentNav">
			<font color="red">
				{{ info.print }}
			</font>
		</td>
		</tr>{% endif %}
	{% if (reklama.true) %}
		<tr>
		<td class="contentNav">
			<font color="blue">
				{{ reklama.print }}
			</font>
		</td>
		</tr>{% endif %}
	{{ entries }}

</div>