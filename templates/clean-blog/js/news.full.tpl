[TWIG]
                        <!-- Post Item Start -->
                        <div class="post--item post--single text-center">
                            <!-- Post Slider Start -->
                            <div class="post--img">
                               	<img src="{% if (p.xfields.img.count < 1) %}{{ tpl_url }}/img/no_image.jpg{% else %}{{ p.xfields.img.entries[0].url }}{% endif %}" alt="{{ news.title }}"/>
    						</div>
                            <!-- Post Slider End -->

                            <!-- Post Title Start -->
                            <div class="post--title">
                                <h2 class="h2">{{ news.title }}</h2>
                            </div>
                            <!-- Post Title End -->

                            <!-- Post Content Start -->
                            <div class="post--content clearfix">
							{{ news.short }}
							
							<ul>
                    		{% if (p.xfields.summa.value) %}
							    <li><b>Сумма кредита;</b> {{ p.xfields.summa.value }}</li>
							{% endif %}
                            {% if (p.xfields.stavka.value) %}
							    <li><b>Ставка %</b> {{ p.xfields.stavka.value }}</li>
							{% endif %}
                            {% if (p.xfields.srok.value) %}
							<li><b>Срок кредита:</b> {{ p.xfields.srok.value }}</li>
							{% endif %}
                            {% if (p.xfields.old.value) %}
							<li><b>Возраст :</b> {{ p.xfields.old.value }}"</li>
							{% endif %}
                            </ul>
							{% if (p.xfields.url.value) %}
							<a href="{{ p.xfields.url.value }}" rel="nofollow" target="_blank"class="btn btn-success btn-lg btn-block">Оформить</a>
							{% endif %} 
							
                             {{ news.full }}
							
							                 
                            </div>
                            <!-- Post Content End -->

                            <!-- Post Footer Start -->
                            <div class="post--footer clearfix pt--40">
                                <!-- Post Categories Start -->
                                <ul class="post--cats nav text-primary">
                                    <li><strong>Категория:</strong></li>
                                    <li>{{ news.categories.list[0].name }}</li>
                                </ul>
                                <!-- Post Categories End -->
                                {% if pluginIsActive('tags') %}{% if (p.tags.flags.haveTags) %}
                                <!-- Post Tags Start -->
                                <ul class="post--tags nav float--left">
                                    <li><strong>Теги:</strong></li>
									{{ tags }}
                                </ul>
                                <!-- Post Tags End -->
                                {% endif %}{% endif %}
                                <!-- Post Social Start -->
                                <ul class="post--social nav float--right">
                                    <li><strong>Поделиться:</strong></li>
                                    <div class="plusonet-sb"></div>
                                </ul>
                                <!-- Post Social End -->
                            </div>
                            <!-- Post Footer End -->
                        </div>
                        <!-- Post Item End -->
						
						{neighboring_news}
						
						 <!-- Related Posts Start -->
						 {% if pluginIsActive('similar') %}{{ plugin_similar_tags }}{% endif %}
                         <!-- Related Posts End -->
[/TWIG]