

<section class="section comments-list">
	[comheader]<h5 class="section-heading">Комментарии ({comnum})</h5>[/comheader]

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
	<div class="alert alert-info">
		Комментирование данной новости запрещено.
	</div>
	[/commforbidden]
</section>