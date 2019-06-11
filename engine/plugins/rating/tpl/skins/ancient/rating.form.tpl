<div id="ratingdiv_{{ item }}_{{ itemID }}" class="ani-rating">
	<script>
		var ajax = new sack();
		function rating(rating, item, itemID){
			ajax.onShow('');
			ajax.setVar('rating', rating);
			ajax.setVar('item', item);
			ajax.setVar('itemID', itemID);
			ajax.requestFile = '{{ ajax_url }}';
			ajax.method = 'GET';
			ajax.element = 'ratingdiv_'+item+'_'+itemID;
			ajax.runAJAX();
		}
	</script>
	<div class="aniRating">{{ lang['rating_rating'] }}:</div>
	<div class="aniRating">
		<ul class="uniRating">
		<li class="r{{ rating }}">{{ rating }}</li>
			<li><a href="#" title="{{ lang['rating_1'] }}" class="r1u" onclick="rating('1', '{{ item }}', '{{ itemID }}'); return false;"></a></li>
			<li><a href="#" title="{{ lang['rating_2'] }}" class="r2u" onclick="rating('2', '{{ item }}', '{{ itemID }}'); return false;"></a></li>
			<li><a href="#" title="{{ lang['rating_3'] }}" class="r3u" onclick="rating('3', '{{ item }}', '{{ itemID }}'); return false;"></a></li>
			<li><a href="#" title="{{ lang['rating_4'] }}" class="r4u" onclick="rating('4', '{{ item }}', '{{ itemID }}'); return false;"></a></li>
			<li><a href="#" title="{{ lang['rating_5'] }}" class="r5u" onclick="rating('5', '{{ item }}', '{{ itemID }}'); return false;"></a></li>
		</ul>
	</div>
	<div class="aniRating">&nbsp;({{ lang['rating_votes'] }} {{ votes }})</div>
</div>