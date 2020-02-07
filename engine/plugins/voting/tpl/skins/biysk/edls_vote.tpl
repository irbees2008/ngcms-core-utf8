<div id="zz_voting_{voteid}">
<h1><span>{votename}</span></h1>
<div class="well">
<form action="{post_url}" method="get" id="voteForm_{voteid}">
	<p>{votelines}</p><br />
	<input type=hidden name=action value=vote />
	<input type=hidden name=voteid value="{voteid}" />
	<input type=hidden name=referer value="{REFERER}" />
	<span class="btn btn-info" type="submit" onclick="return make_voteL(0,{voteid});">Голосовать</span>
	<span class="btn btn-warning" type="button" onclick="document.location='{post_url}?mode=show&voteid={voteid}';"><i class="icon-align-left icon-white"></i></span>
</form>
</div>
</div>
