{% if isHandler('news:main|news:by.category') %}
    <!-- Page Header -->
    <header class="intro-header" style="background-image: url('{{ tpl_url }}/img/home-bg.jpg')">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="post-heading">
                        <h1>{% if isHandler('news:by.category') %}{{ category.name }}{% else %}Мой первый блог{% endif %}</h1>
                        <hr class="small">
                        <span class="subheading">{{ lang.news }}</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
{% endif %}

<!-- Main Content -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
            {% for entry in data %}
                {{ entry }}
            {% else %}
                <div class="alert alert-info">
                    <strong>{{ lang.notifyWindowInfo }}</strong>
                    {{ lang.msgi_no_news }}
                </div>
            {% endfor %}
            {{ pagination }}
        </div>
    </div>
</div>
