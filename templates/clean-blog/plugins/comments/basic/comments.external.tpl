<!-- Page Header -->
<header class="intro-header" style="background-image: url('{tpl_url}/img/home-bg.jpg')">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="post-heading">
					<h1>{title}</h1>
					<hr class="small">
					<span class="subheading">Все комментарии посетителей к записи <a href="{link}">{title}</a></span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Page Content -->
<div class="container">
	<div class="row justify-content-center">
		<div class="col-lg-8 col-md-10">
			<section class="section comments-list">

				<ul class="list-unstyled">
					{entries}
					<li id="new_comments"></li>
				</ul>

				<nav>
					<ul class="pagination">{more_comments}</ul>
				</nav>

				{form}

				[regonly]
				<div class="alert alert-info">
					Уважаемый посетитель, Вы зашли на сайт как незарегистрированный пользователь.<br />
					Мы рекомендуем Вам <a href="{home}/register/">зарегистрироваться</a> либо <a href="{home}/login/">войти</a> на сайт под своим именем.
				</div>
				[/regonly]

				[commforbidden]
				<div class="alert alert-danger">
					Комментирование данной новости запрещено.
				</div>
				[/commforbidden]
			</section>
		</div>
	</div>
</div>