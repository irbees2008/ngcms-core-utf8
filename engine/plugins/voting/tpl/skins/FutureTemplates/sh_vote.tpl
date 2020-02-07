<div class="rt-block">
	<div class="module-title">
		<h2 class="title">Нас интересует</h2>
		<form style="margin-bottom: 0px;margin-left: 174px;margin-right: 0px;margin-top: -44px;" action="{post_url}" method="post" id="voteForm">
		<button class="bbcodes" type="submit" onclick="ShowAllVotes(); return false;"><span>Все опросы</span></button>
		</form>
	</div>
	<div class="module-content">
		<center><h2 style="color: rgb(68, 68, 68) !important;font-size: 14px;text-transform: uppercase;">{votename}</h2></center>
		<div class="dpad">
			{votelines}
			<div class="skills-graph"></div>
			<br />
			<div><small>Всего проголосовало: {vcount}</small></div>
		</div>
	</div>
</div>
