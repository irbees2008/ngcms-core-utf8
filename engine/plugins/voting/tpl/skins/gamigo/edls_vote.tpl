<div id="zz_voting_{voteid}">

<div class="base">
<div class="heading"><div class="binner"><div><span class="argr" style="padding-left: 3px;"></span><h1>{votename}</h1></div></div></div>
<div class="binner maincont"><div>

		<form action="{post_url}" method="get" id="voteForm_{voteid}">
		<input type=hidden name=action value=vote />
		<input type=hidden name=voteid value="{voteid}" />
		<input type=hidden name=referer value="{REFERER}" />
		{votelines}<br /><input type=submit value="Голосовать" class="bbcodes" onclick="return make_voteL(0,{voteid});" />
		</form>

<div class="clr"></div></div></div>
<div class="binner morelink" style="padding-left: 0;"><div>
<div class="clr"></div>
</div></div>
</div>

</div>
