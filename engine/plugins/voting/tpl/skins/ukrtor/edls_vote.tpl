<div id="zz_voting_{voteid}">
<h1>{votename}</h1>
<div class="basecont">
		<form action="{post_url}" method="get" id="voteForm_{voteid}">
		<input type=hidden name=action value=vote />
		<input type=hidden name=voteid value="{voteid}" />
		<input type=hidden name=referer value="{REFERER}" />
		{votelines}<br /><input type=submit value="Голосовать" onclick="return make_voteL(0,{voteid});" />
		</form>
</div>
</div>
