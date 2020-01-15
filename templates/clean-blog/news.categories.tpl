<ul class="list-unstyled">
{% for entry in entries %}
    <li class="list-unstyled">
    {% if (not entry.flags.active) %}<a href="{{ entry.link }}" class="dropdown-item" title="{{ entry.cat }}">{% else %}<b>{% endif %}
    {{ entry.cat }}{% if (entry.flags.counter) %}[{{ entry.counter }}]{% endif %}
    {% if (not entry.flags.active) %}</a>{% else %}</b>{% endif %}
    {% if (entry.flags.hasChildren) %}
        <ul>
    {% else %}
    </li>{% if isSet(entry.closeToLevel) %}{% for i in (entry.closeToLevel+1) .. entry.level %}</ul></li>{% endfor %}{% endif %}
    {% endif %}
{% endfor %}
</ul>