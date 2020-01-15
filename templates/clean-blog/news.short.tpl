[TWIG]
<article class="post-preview">
    <a href="{{ news.url.full }}"><h2 class="post-title">{{ news.title }}</h2></a>
    <p class="post-meta">{% if pluginIsActive('uprofile') %}<a href="{{ news.author.url }}">{% endif %}{{ news.author.name }}{% if pluginIsActive('uprofile') %}</a>{% endif %} &nbsp;&nbsp;•&nbsp;&nbsp; {{ news.date }} &nbsp;&nbsp;•&nbsp;&nbsp; {{ news.categories.masterText }}</p>
    {% if (news.embed.imgCount > 0) %}
    <p class="post-img">
        <img src="{{ news.embed.images[0] }}" class="img-fluid" />
    </p>
    {% endif %}
    <p class="post-body">{{ news.short|truncateHTML(450,'...')|striptags }} <a href="{{ news.url.full }}"><b>[...]</b></a></p>
</article>
<hr>
[/TWIG]