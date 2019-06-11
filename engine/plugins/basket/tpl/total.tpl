{% if (not ajaxUpdate) %}
<div id="basketTotalDisplay">
	{% endif %}
	<div class="b500">
		<div id="basket">

			<ul>{% if (count > 0) %}
					<li>РўРѕРІР°СЂРѕРІ: <font class="f12_product">{{ count }}</font></li>
					<li>Р’СЃРµРіРѕ: <font class="f12_summa">{{ price }} СЂСѓР±.</font></li>
					<li>
					<a href="/plugin/basket/"><img src="{{ tpl_url }}/images/btn_order.png" alt="" class="btn_order"/></a>
					</li>{% else %}
					<li>РєРѕСЂР·РёРЅР° РїСѓСЃС‚Р°</li>{% endif %}
			</ul>

		</div>
	</div>
	{% if (not ajaxUpdate) %}
</div>
{% endif %}
