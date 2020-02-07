<div id="zz_voting_{voteid}" class="basecont">
	<div class="binner">
		<div class="heading">
			<h1>{votename}</h1>
		</div>
		<div class="maincont">
			<div>
			<form action="{post_url}" method="get" id="voteForm_{voteid}">
			<input type=hidden name=action value=vote />
			<input type=hidden name=voteid value="{voteid}" />
			<input type=hidden name=referer value="{REFERER}" />
			{votelines}<br /><input class="bbcodes" style="font-size: 11px !important;padding-bottom: 4px;padding-left: 8px;padding-right: 8px;padding-top: 4px;" type=submit value="Голосовать" onclick="return make_voteL(0,{voteid});" /> <input class="bbcodes" style="font-size: 11px !important;padding-bottom: 4px;padding-left: 8px;padding-right: 8px;padding-top: 4px;" type=button value="Результаты" onclick="document.location='{post_url}?mode=show&voteid={voteid}';" />
			</form>
			</div>
			<div class="clr"></div>
		</div>
	</div>
	<div class="hsep"></div>
</div>
