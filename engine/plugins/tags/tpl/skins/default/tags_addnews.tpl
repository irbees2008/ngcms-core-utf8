<tr>
	<td width="100%" class="contentHead" colspan="2">
		<img src="{admin_url}/skins/default/images/nav.gif" hspace="8" alt=""/>Р СћР ВµР С–Р С‘ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘
	</td>
</tr>
<tr>
	<td width="100%" class="contentEntry1">
		<table>
			<tr>
				<td>Р РЋР С—Р С‘РЎРѓР С•Р С” РЎвЂљР ВµР С–Р С•Р Р†:<br/>
					<small>РЎС“Р С”Р В°Р В·РЎвЂ№Р Р†Р В°Р ВµРЎвЂљРЎРѓРЎРЏ РЎвЂЎР ВµРЎР‚Р ВµР В· Р В·Р В°Р С—РЎРЏРЎвЂљРЎС“РЎР‹</small>
				</td>
				<td><input style="width: 300px;" name="tags" id="pTags"/></td>
			</tr>
		</table>
	</td>
</tr>
<script language="javascript" type="text/javascript">
	// INIT NEW SUGGEST LIBRARY [ call only after full document load ]
	var aSuggest = new ngSuggest('pTags',
		{
			'localPrefix': '{localPrefix}',
			'reqMethodName': 'plugin.tags.suggest',
			'lId': 'suggestLoader',
			'hlr': 'true',
			'iMinLen': 1,
			'stCols': 2,
			'stColsClass': ['cleft', 'cright'],
			'stColsHLR': [true, false],
			'listDelimiter': ',',
		}
	);

</script>
