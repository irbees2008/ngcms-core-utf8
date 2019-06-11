<div id="zz_voting_{voteid}">
	<fieldset>
		<legend>Р С›Р С—РЎР‚Р С•РЎРѓ: <b>{votename}</b></legend>
		[votedescr]
		<small>Р С›Р С—Р С‘РЎРѓР В°Р Р…Р С‘Р Вµ: {votedescr}</small>
		<br/>[/votedescr]
		<form action="{post_url}" method="get" id="voteForm_{voteid}">
			<input type=hidden name=action value=vote/>
			<input type=hidden name=voteid value="{voteid}"/>
			<input type=hidden name=referer value="{REFERER}"/>
			{votelines}
			<input type=submit value="Р вЂњР С•Р В»Р С•РЎРѓР С•Р Р†Р В°РЎвЂљРЎРЉ" onclick="return make_voteL(0,{voteid});"/>
			<input type=button value="Р В Р ВµР В·РЎС“Р В»РЎРЉРЎвЂљР В°РЎвЂљРЎвЂ№" onclick="document.location='{post_url}?mode=show&voteid={voteid}';"/>
		</form>
	</fieldset>
</div>