<script type="text/javascript">
 var vajax = new sack();
 function make_vote(mode){
  var form = document.getElementById('voteForm');
  var choice = -1;
  
  // Return true (to run normal mode) if AJAX failed
  if (vajax.failed)
  	return true;

  for (i=0;i<form.elements.length;i++) {
  	var elem = form.elements[i];
  	if (elem.type == 'radio') {
  		if (elem.checked == true) {
  			choice = elem.value;
  		}
  	}
  }	

  var voteid = form.voteid.value;
  if (mode && (choice < 0)) {
  	alert('Сначала необходимо выбрать вариант!');
  	return false;
  }	

  
  if (mode) { 
  	vajax.setVar("mode", "vote"); 
	vajax.setVar("choice", choice);
  } else {
  	vajax.setVar("mode", "show");
  }
  vajax.setVar("style","ajax");
  vajax.setVar("voteid", voteid);
  vajax.setVar("list", 0);
  vajax.requestFile = "{post_url}";
  vajax.method = 'POST';
  vajax.element = 'voting_ng';
  vajax.runAJAX();
  return false;
 }
</script>
<div id="voting_ng" class="rt-block">
	<div class="module-title">
		<h2 class="title">Нас интересует</h2>
		<form style="margin-bottom: 0px;margin-left: 174px;margin-right: 0px;margin-top: -44px;" action="{post_url}" method="post" id="voteForm">
		<button class="bbcodes" type="submit" onclick="ShowAllVotes(); return false;"><span>Все опросы</span></button>
	</div>
	<div class="module-content">
		<center><h2 style="color: rgb(68, 68, 68) !important;font-size: 14px;text-transform: uppercase;">{votename}</h2></center>
		<div class="dpad">
			{votelines}
			<div class="skills-graph"></div>
			<br />
			<input type="hidden" name="mode" value="vote" />
			<input type="hidden" name="voteid" value="{voteid}" />
			<input type="hidden" name="referer" value="{REFERER}" />
			<button class="bbcodes" style="font-size: 11px !important;padding-bottom: 4px;padding-left: 8px;padding-right: 8px;padding-top: 4px;" type="submit" onclick="return make_vote(1);"><span>Голосовать</span></button>
			&nbsp;
			<button class="bbcodes" style="font-size: 11px !important;padding-bottom: 4px;padding-left: 8px;padding-right: 8px;padding-top: 4px;" type="submit" onclick="return make_vote(0);"><span>Результаты</span></button>
		</form>
		</div>
	</div>
</div>
