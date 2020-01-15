<!-- Page Header -->
<header class="intro-header" style="background-image: url('{{ tpl_url }}/img/home-bg.jpg')">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="post-heading">
					<h1>{{ lang['search.site_search'] }}</h1>
					<hr class="small">
					<span class="subheading">{{ lang.news }}</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Page Content -->
<div class="container">
	<div class="row justify-content-center">
		<div class="col-lg-8 col-md-10">
			<form method="GET" action="{{ form_url }}">
				<fieldset>
					<div class="form-group">
						<div class="input-group">
							<input type="text" name="search" value="{{ search }}" placeholder="{{ lang['search.enter'] }}" class="form-control" />
							<span class="input-group-btn">
								<div class="btn-group" data-toggle="buttons">
									<span class="btn btn-secondary" data-toggle="collapse" data-target="#searchSettings">
										<input type="checkbox" autocomplete="off" onchange="setCookie('searchSettings',this.checked?1:0);" {{ searchSettings }} /> <i class="fa fa-sliders"></i>
									</span>
								</div>
							</span>
							<span class="input-group-btn">
								<button id="submit" type="submit" name="submit" class="btn btn-secondary" title="{{ lang['search.submit'] }}"><i class="fa fa-search"></i></button>
							</span>
						</div>
					</div>

					<div id="searchSettings" class="collapse {% if searchSettings %}show{% endif %}">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>{{ lang['search.filter.category'] }}</label>  
									<div>
										<div class="search_catz">{{ catlist }}</div>
									</div>
								</div>
								<div class="form-group">
									<label>{{ lang['search.filter.date'] }}</label>  
									<div>
										<select name="postdate" class="form-control"><option value="">Любая</option>{{ datelist }}</select>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>{{ lang['search.filter.orderlist'] }}</label>  
									<div>
										<select name="orderby" class="form-control">{{ orderlist }}</select>
									</div>
								</div>
								<div class="form-group">
									<label>{{ lang['search.filter.author'] }}</label>  
									<div>
										<input type="text" name="author" value="{{ author }}" class="form-control" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>

			{% if flags.notfound %}
				<p class="alert alert-info">{{ lang['search.notfound'] }}</p>
			{% endif %}
			{% if flags.error %}
				<p class="alert alert-danger">{{ lang['search.error'] }}</p>
			{% endif %}

			{% if flags.found %}
				<p class="alert alert-success">{{ lang['search.found'] }}: <b>{{ count }}</b></p>
				<section class="section">
					{% for entry in data %}
						{{ entry }}
					{% endfor %}
				</section>
			{% endif %}

			{{ pagination }}
		</div>
	</div>
</div>