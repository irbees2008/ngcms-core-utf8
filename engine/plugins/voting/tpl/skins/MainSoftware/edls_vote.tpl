<div id="zz_voting_{voteid}">
<div class="story">
<div class="story_b">
<div class="story_h"><div class="story_title"><h2><font color="#00FF00">{votename}</font></h2></div></div>
<div class="story_c">
<div class="story_text">
		<form action="{post_url}" method="get" id="voteForm_{voteid}">
		<font color="#00FF00">
		<input type=hidden name=action value=vote />
		<input type=hidden name=voteid value="{voteid}" />
		<input type=hidden name=referer value="{REFERER}" />
		</font><font color="#00FF00">{votelines}<br /><input type=submit value="Голосовать" onclick="return make_voteL(0,{voteid});" />
		</font>
		</form>
</div>
</div>
</div>
</div>
</div>
