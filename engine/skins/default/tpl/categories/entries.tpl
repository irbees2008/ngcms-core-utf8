{% for entry in entries %}
<tr>
	<td>{{ entry.id }}</td>
	<td>{{ entry.level }} {{ entry.name }} {% if (entry.info|length>0) %}<i class="fa fa-info" title="Категория содержит описание"></i>{% endif %}</td>
	<td>{{ entry.alt }}</td>
	<td>{% if (entry.flags.showMain) %}<i class="fa fa-check" title="{{ lang['yesa'] }}"></i>{% else %}<i class="fa fa-times" title="{{ lang['noa'] }}"></i>{% endif %}</td>
	<td>{% if (entry.template == '') %}-_-{% else %}{{ entry.template }}{% endif %}</td>
	<td><a href="admin.php?mod=news&amp;category={{ entry.id }}">{% if (entry.news == 0) %}-_-{% else %}{{ entry.news }}{% endif %}</a></td>
	<td class="text-right td-nowrap">
		{% if (flags.canView) %}
			<a href="admin.php?mod=categories&amp;action=edit&amp;catid={{ entry.id }}" class="btn btn-default"><i class="fa fa-pencil"></i></a>
		{% endif %}
		<a class="btn btn-default" href="{{ entry.linkView }}" title="{{ lang['site.view'] }}" target="_blank"><i class="fa fa-external-link"></i></a>
		{% if (flags.canModify) %}
			<button type="button" class="btn btn-default" onclick="categoryModifyRequest('up', {{ entry.id }}); return false;"><i class="fa fa-arrow-up"></i></button>
			<button type="button" class="btn btn-default" onclick="categoryModifyRequest('down', {{ entry.id }}); return false;"><i class="fa fa-arrow-down"></i></button>
			<button type="button" class="btn btn-danger" onclick="categoryModifyRequest('del', {{ entry.id }}); return false;"><i class="fa fa-trash-o"></i></button>
		{% endif %}
	</td>
</tr>
{% else %}
<tr><td colspan="7"><p>- {{ lang['not_found'] }} -</p></td></tr>
{% endfor %}