<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tbody>
	<tr>
		<td colspan="8" class="contNav" width="100%">
			<div id="btnMenu">
				<span class="{{ bclass['news'] }}" onclick='document.location="?mod=extra-config&plugin=xfields&section=news";'>Р СњР С•Р Р†Р С•РЎРѓРЎвЂљР С‘: Р С—Р С•Р В»РЎРЏ</span><span class="btnSeparator">&nbsp;</span>
				<span class="{{ bclass['grp.news'] }}" onclick='document.location="?mod=extra-config&plugin=xfields&section=grp.news";'>Р СњР С•Р Р†Р С•РЎРѓРЎвЂљР С‘: Р С–РЎР‚РЎС“Р С—Р С—РЎвЂ№</span><span class="btnDelimiter">&nbsp;</span>
				<span class="{{ bclass['tdata'] }}" onclick='document.location="?mod=extra-config&plugin=xfields&section=tdata";'>Р СњР С•Р Р†Р С•РЎРѓРЎвЂљР С‘: РЎвЂљР В°Р В±Р В»Р С‘РЎвЂ РЎвЂ№</span><span class="btnSeparator">&nbsp;</span>
				{% if (pluginIsActive('uprofile')) %}
					<span class="{{ bclass['users'] }}" onclick='document.location="?mod=extra-config&plugin=xfields&section=users";'>Р СџР С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р С‘: Р С—Р С•Р В»РЎРЏ</span>
					<span class="btnDelimiter">&nbsp;</span>
				{% endif %}

			</div>
			&nbsp;
		</td>
	</tr>
	</tbody>
</table>
