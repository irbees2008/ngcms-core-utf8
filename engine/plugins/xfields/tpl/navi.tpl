<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tbody>
	<tr>
		<td colspan="8" class="contNav" width="100%">
			<div id="btnMenu">
				<span class="{{ bclass['news'] }}" onclick='document.location="?mod=extra-config&plugin=xfields&section=news";'>РќРѕРІРѕСЃС‚Рё: РїРѕР»СЏ</span><span class="btnSeparator">&nbsp;</span>
				<span class="{{ bclass['grp.news'] }}" onclick='document.location="?mod=extra-config&plugin=xfields&section=grp.news";'>РќРѕРІРѕСЃС‚Рё: РіСЂСѓРїРїС‹</span><span class="btnDelimiter">&nbsp;</span>
				<span class="{{ bclass['tdata'] }}" onclick='document.location="?mod=extra-config&plugin=xfields&section=tdata";'>РќРѕРІРѕСЃС‚Рё: С‚Р°Р±Р»РёС†С‹</span><span class="btnSeparator">&nbsp;</span>
				{% if (pluginIsActive('uprofile')) %}
					<span class="{{ bclass['users'] }}" onclick='document.location="?mod=extra-config&plugin=xfields&section=users";'>РџРѕР»СЊР·РѕРІР°С‚РµР»Рё: РїРѕР»СЏ</span>
					<span class="btnDelimiter">&nbsp;</span>
				{% endif %}

			</div>
			&nbsp;
		</td>
	</tr>
	</tbody>
</table>
