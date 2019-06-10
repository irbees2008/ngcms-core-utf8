<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{l_home}</a></li>
	<li><a href="admin.php?mod=extras">{l_extras}</a></li>
	<li class="active">{mode_text}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<form action="admin.php?mod=extras" method="post">
		<input type="hidden" name="mod" value="extras" />
		
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<h3>{plugin}</h3>
			</div>
			<div class="panel-body">
				<table class="table table-condensed">
					{entries}
				</table>
			</div>
			<div class="panel-footer text-center">
				<input type="submit" value="{msg}" class="btn btn-success" />
			</div>
		</div>
	</form>
</div>
