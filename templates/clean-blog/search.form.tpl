<form action="{{ form_url }}" method="GET" class="navbar-form navbar-left">
	<input type="hidden" name="category" value="" />
	<input type="hidden" name="postdate" value="" />

	<input type="text" name="search" placeholder="{{ lang['search.enter'] }}" class="form-control" />
	<input type="submit" value="{{ lang['search.submit'] }}" class="btn btn-default" />
</form>