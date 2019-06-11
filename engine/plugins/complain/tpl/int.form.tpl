<style type="text/css">
	#senderror {
		padding-top: 10px;
		background: #fff7e1;
		border: 1px dashed #e8e8e8;
		margin-top: 10px;
		padding-bottom: 20px;
	}

	#senderror select.error {
		border: 1px solid #e8e8e8;
		background: #fff;
	}

	#senderror input.report {
		border: 1px solid #e8e8e8;
		background: #fff;
	}

	#senderror .texth {
		float: left;
		position: relative;
		left: 10px;
	}

	#senderror .formh {
		float: right;
		position: relative;
		top: -4px;
		right: 10px;
	}
</style>
<div id="senderror">
	<div class="texth">Р РЋР С•Р С•Р В±РЎвЂ°Р С‘РЎвЂљРЎРЉ Р С•Р В± Р С•РЎв‚¬Р С‘Р В±Р С”Р Вµ:</div>
	<div class="formh">
		<form method="post" target="_blank" action="{form_url}">
			<input type="hidden" name="ds_id" value="{ds_id}"/>
			<input type="hidden" name="entry_id" value="{entry_id}"/>
			<select name="error" class="error" id="errorSelect">
				<option value="">Р вЂ™РЎвЂ№Р В±Р ВµРЎР‚Р С‘РЎвЂљР Вµ РЎвЂљР С‘Р С— Р С•РЎв‚¬Р С‘Р В±Р С”Р С‘..</option>
				{errorlist}
			</select>
			<input type="submit" class="report" value="Р С›РЎвЂљР С—РЎР‚Р В°Р Р†Р С‘РЎвЂљРЎРЉ" onclick="if (document.getElementById('errorSelect').value==''){alert('Р СњР ВµР С•Р В±РЎвЂ¦Р С•Р Т‘Р С‘Р С�Р С• Р Р†РЎвЂ№Р В±РЎР‚Р В°РЎвЂљРЎРЉ РЎвЂљР С‘Р С— Р С•РЎв‚¬Р С‘Р В±Р С”Р С‘!'); return false;}; "/>
		</form>
	</div>
</div>
