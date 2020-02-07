<div id="zz_voting_{voteid}">

<div class="bform"><div class="dpad">
	<h2 class="bfhead">{votename}</h2>
	<table width="100%" class="userstop">
		<form action="{post_url}" method="get" id="voteForm_{voteid}">
		<input type=hidden name=action value=vote />
		<input type=hidden name=voteid value="{voteid}" />
		<input type=hidden name=referer value="{REFERER}" />
		{votelines}<br /><input class="fbutton" type=submit value="Голосовать" onclick="return make_voteL(0,{voteid});" />
		</form>
	</table>
</div></div>
</div>
