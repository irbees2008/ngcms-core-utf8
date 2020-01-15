[TWIG]
<!-- Page Header -->
<header class="intro-header" style="background-image: url('{% if (news.embed.imgCount > 0) %}{{ news.embed.images[0] }}{% else %}{{ tpl_url }}/img/home-bg.jpg{% endif %}')">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="post-heading">
					<h1>{{ news.title }}</h1>
					<hr class="small">
					<div class="subheading">{{ category }}</div>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Post Content -->
<article class="post-full">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<p>{{ news.short|striptags }}</p>
				<p class="post-meta clearfix">
					<span class="pull-left">
						{% if pluginIsActive('uprofile') %}<a href="{{ news.author.url }}">{% endif %}{{ news.author.name }}{% if pluginIsActive('uprofile') %}</a>{% endif %}&nbsp;&nbsp;•&nbsp;&nbsp;{{ news.dateStamp|cdate }}
					</span>
					<span class="pull-right">
						<i class="fa fa-eye" title="{{ lang.views }}"></i> {{ news.views }} &nbsp;&nbsp;•&nbsp;&nbsp; {% if pluginIsActive('comments') %} <i class="fa fa-comments" title="{{ lang.com }}"></i> {comments-num}{% endif %}
					</span>
				</p>
				<hr class="alert-info">
				<p>{{ news.full }}</p>
				{% if (news.flags.hasPagination) %}
				<!-- Pager -->
				<nav><ul class="pagination justify-content-center">{{ news.pagination }}</ul></nav>
				{% endif %}
			</div>
		</div>
	</div>
</article>

<!-- Aditional Content -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
            {% if pluginIsActive('share') %}<hr class="alert-info">{{ plugin_share }}{% endif %}
            {% if pluginIsActive('similar') %}{{ plugin_similar_tags }}{% endif %}
            {% if pluginIsActive('comments') %}{{ plugin_comments }}{% endif %}
        </div>
    </div>
</div>
[/TWIG]