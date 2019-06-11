<!-- List of news start here -->
<form action="/engine/admin.php?mod=extra-config&plugin=subscribe_comments&action=modify" method="post" name="subscribe_comments">
	<table border="0" cellspacing="0" cellpadding="0" class="content" align="center">
		<tr align="left" class="contHead">
			<td width="5%" nowrap>ID</td>
			<td width="45%">Р РЋРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р В°</td>
			<td width="10%">Email</td>
			<td width="5%">
				<input class="check" type="checkbox" name="master_box" title="Р вЂ™РЎвЂ№Р В±РЎР‚Р В°РЎвЂљРЎРЉ Р Р†РЎРѓР Вµ" onclick="javascript:check_uncheck_all(subscribe_comments)"/>
			</td>
		</tr>
		{entries}
		<tr>
			<td width="100%" colspan="8">&nbsp;</td>
		</tr>

		<tr align="center">
			<td colspan="8" class="contentEdit" align="right" valign="top">
				<div style="text-align: left;">
					Р вЂќР ВµР в„–РЎРѓРЎвЂљР Р†Р С‘Р Вµ: <select name="subaction" style="font: 12px Verdana, Courier, Arial; width: 230px;">
						<option value="">-- Р вЂќР ВµР в„–РЎРѓРЎвЂљР Р†Р С‘Р Вµ --</option>
						<option value="mass_delete">Р Р€Р Т‘Р В°Р В»Р С‘РЎвЂљРЎРЉ Р С—Р С•Р Т‘Р С—Р С‘РЎРѓР С”РЎС“</option>
					</select>
					<input type="submit" value="Р вЂ™РЎвЂ№Р С—Р С•Р В»Р Р…Р С‘РЎвЂљРЎРЉ.." class="button"/>
					<br/>
				</div>
			</td>
		</tr>
		<tr>
			<td width="100%" colspan="8">&nbsp;</td>
		</tr>
		<tr>
			<td align="center" colspan="8" class="contentHead">{pagesss}</td>
		</tr>
	</table>
</form>