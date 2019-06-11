<script type="text/javascript">
	var vajax = new sack();
	function make_vote(mode) {
		var form = document.getElementById('voteForm');
		var choice = -1;

		// Return true (to run normal mode) if AJAX failed
		if (vajax.failed)
			return true;

		for (i = 0; i < form.elements.length; i++) {
			var elem = form.elements[i];
			if (elem.type == 'radio') {
				if (elem.checked == true) {
					choice = elem.value;
				}
			}
		}

		var voteid = form.voteid.value;
		if (mode && (choice < 0)) {
			alert('Р РЋР Р…Р В°РЎвЂЎР В°Р В»Р В° Р Р…Р ВµР С•Р В±РЎвЂ¦Р С•Р Т‘Р С‘Р С�Р С• Р Р†РЎвЂ№Р В±РЎР‚Р В°РЎвЂљРЎРЉ Р Р†Р В°РЎР‚Р С‘Р В°Р Р…РЎвЂљ!');
			return false;
		}


		if (mode) {
			vajax.setVar("mode", "vote");
			vajax.setVar("choice", choice);
		} else {
			vajax.setVar("mode", "show");
		}
		vajax.setVar("style", "ajax");
		vajax.setVar("voteid", voteid);
		vajax.setVar("list", 0);
		vajax.requestFile = "{post_url}";
		vajax.method = 'POST';
		vajax.element = 'voting_ng';
		vajax.runAJAX();
		return false;
	}
</script>


<div id="voting_ng">
	{votename}<br/><br/>
	<form action="{post_url}" method="post" id="voteForm">
		<input type=hidden name="mode" value="vote"/>
		<input type=hidden name="voteid" value="{voteid}"/>
		<input type=hidden name="referer" value="{REFERER}"/>
		{votelines}<br/>
		<input type="submit" value="Р вЂњР С•Р В»Р С•РЎРѓРЎС“Р Р†Р В°РЎвЂљР С‘!" onclick="return make_vote(1);" class="search4"/>
	</form>
</div>