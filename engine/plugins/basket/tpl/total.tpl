{% if (not ajaxUpdate) %}
<div id="basketTotalDisplay">
	{% endif %}
	<div class="b500">
		<div id="basket">

			<ul>{% if (count > 0) %}
					<li>Р СћР С•Р Р†Р В°РЎР‚Р С•Р Р†: <font class="f12_product">{{ count }}</font></li>
					<li>Р вЂ™РЎРѓР ВµР С–Р С•: <font class="f12_summa">{{ price }} РЎР‚РЎС“Р В±.</font></li>
					<li>
					<a href="/plugin/basket/"><img src="{{ tpl_url }}/images/btn_order.png" alt="" class="btn_order"/></a>
					</li>{% else %}
					<li>Р С”Р С•РЎР‚Р В·Р С‘Р Р…Р В° Р С—РЎС“РЎРѓРЎвЂљР В°</li>{% endif %}
			</ul>

		</div>
	</div>
	{% if (not ajaxUpdate) %}
</div>
{% endif %}
