<div id="zz_voting_{voteid}">
	<fieldset>
		<legend>Р С›Р С—РЎР‚Р С•РЎРѓ: <b>{votename}</b></legend>
		<form action="{post_url}" method="get" id="voteForm_{voteid}">
			<input type=hidden name=action value=vote/>
			<input type=hidden name=voteid value="{voteid}"/>
			<input type=hidden name=referer value="{REFERER}"/>
			{votelines}
			<input type="submit" value="Р вЂњР С•Р В»Р С•РЎРѓР С•Р Р†Р В°РЎвЂљРЎРЉ!" onclick="return make_voteL(0,{voteid});" class="search4"/>
		</form>
	</fieldset>
</div>