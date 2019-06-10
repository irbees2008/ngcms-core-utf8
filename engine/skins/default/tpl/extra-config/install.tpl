<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{l_home}</a></li>
	<li><a href="admin.php?mod=extras">{l_extras}</a></li>
	<li class="active">{mode_text}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<form action="admin.php?mod=extra-config" method="post">
		<input type="hidden" name="plugin" value="{plugin}" />
		<input type="hidden" name="stype" value="{stype}" />
		<input type="hidden" name="action" value="commit" />
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>{plugin}</h3>
			</div>
			<div class="panel-body">
				{install_text}
			</div>
			<div class="panel-footer text-center">
				<input type="submit" value="{mode_commit}" class="btn btn-success" />
			</div>
		</div>
	</form>
</div>

