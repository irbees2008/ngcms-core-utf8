<table border="0" cellspacing="1" cellpadding="1" class="content">
	<tr>
		<td colspan="2" width=100% class="contentHead">
			<img src="{{ skins_url }}/images/nav.gif" hspace="8">
			<a href="?mod=extras" title="{{ lang.extras }}">{{ lang.extras }}</a>
			&#8594; <a href="?mod=extra-config&plugin=feedback">feedback</a>
			{% if (flags.haveForm) %}
				&#8594;    <a href="?mod=extra-config&plugin=feedback&action=form&id={{ formID }}">Р В¤Р С•РЎР‚Р С�Р В° "{{ formName }}
				"</a>
				{% if (flags.haveField) %}
					&#8594;
					<a href="?mod=extra-config&plugin=feedback&action=row&form_id={{ formID }}&row={{ fieldName }}">Р СџР С•Р В»Р Вµ
						"{{ fieldName }}"</a>
				{% endif %}
				{% if (flags.addField) %}
					&#8594;    Р вЂќР С•Р В±Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ Р Р…Р С•Р Р†Р С•Р С–Р С• Р С—Р С•Р В»РЎРЏ
				{% endif %}
			{% endif %}
		</td>
	</tr>
</table>
