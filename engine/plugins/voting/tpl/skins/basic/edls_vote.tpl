<div id="zz_voting_{voteid}">
	<fieldset>
		<legend>РћРїСЂРѕСЃ: <b>{votename}</b></legend>
		[votedescr]
		<small>РћРїРёСЃР°РЅРёРµ: {votedescr}</small>
		<br/>[/votedescr]
		<form action="{post_url}" method="get" id="voteForm_{voteid}">
			<input type=hidden name=action value=vote/>
			<input type=hidden name=voteid value="{voteid}"/>
			<input type=hidden name=referer value="{REFERER}"/>
			{votelines}
			<input type=submit value="Р“РѕР»РѕСЃРѕРІР°С‚СЊ" onclick="return make_voteL(0,{voteid});"/>
			<input type=button value="Р РµР·СѓР»СЊС‚Р°С‚С‹" onclick="document.location='{post_url}?mode=show&voteid={voteid}';"/>
		</form>
	</fieldset>
</div>