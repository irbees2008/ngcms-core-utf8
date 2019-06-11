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
	<div class="texth">РЎРѕРѕР±С‰РёС‚СЊ РѕР± РѕС€РёР±РєРµ:</div>
	<div class="formh">
		<form method="post" target="_blank" action="{form_url}">
			<input type="hidden" name="ds_id" value="{ds_id}"/>
			<input type="hidden" name="entry_id" value="{entry_id}"/>
			<select name="error" class="error" id="errorSelect">
				<option value="">Р’С‹Р±РµСЂРёС‚Рµ С‚РёРї РѕС€РёР±РєРё..</option>
				{errorlist}
			</select>
			<input type="submit" class="report" value="РћС‚РїСЂР°РІРёС‚СЊ" onclick="if (document.getElementById('errorSelect').value==''){alert('РќРµРѕР±С…РѕРґРёРјРѕ РІС‹Р±СЂР°С‚СЊ С‚РёРї РѕС€РёР±РєРё!'); return false;}; "/>
		</form>
	</div>
</div>
