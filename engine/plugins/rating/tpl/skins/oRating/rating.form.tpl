<script type="text/javascript">
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

<div id="ratingdiv_{{ item }}_{{ itemID }}">
	<div class="oRating">
		<div class="oRating_btn">
			<a href="#" onclick="rating('1', '{{ item }}', '{{ itemID }}');return false;" class="oRating_p" title="Нравится"></a>
			<a href="#" onclick="rating('-1', '{{ item }}', '{{ itemID }}');return false;" class="oRating_m" title="Не нравится"></a>
		</div>
		<div class="oRating_num">
			<a href="#" class="oRating_res">{{ rating_p }}</a>
		</div>
	</div>
</div>