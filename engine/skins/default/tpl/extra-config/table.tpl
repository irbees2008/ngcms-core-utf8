<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{l_home}</a></li>
	<li><a href="admin.php?mod=extras" title="{l_extras}">{l_extras}</a></li>
	<li class="active">{plugin}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<form name="form" action="admin.php?mod=extra-config" method="post" class="extra-config">
		{entries}
		<div class="well text-center">
			<!-- Не трожь input`ы - стилизация, епт -->
			<input type="hidden" name="token" value="{token}" />
			<input type="hidden" name="plugin" value="{plugin}" />
			<input type="hidden" name="action" value="commit" />
			<input type="submit" value="{l_commit_change}" class="btn btn-success" />
		</div>
	</form>
</div>