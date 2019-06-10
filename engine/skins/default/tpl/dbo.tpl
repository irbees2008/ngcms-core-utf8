<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=options">{{ lang['options'] }}</a></li>
	<li class="active">{{ lang.dbo.title }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div class="panel panel-default panel-table">
		<!-- FORM: Perform actions with tables -->
		<form name="form" action="admin.php?mod=dbo" method="post">
			<input type="hidden" name="subaction" value="modify" />
			<input type="hidden" name="token" value="{{ token }}" />
			<input type="hidden" name="massbackup" value="" />
			<input type="hidden" name="cat_recount" value="" />
			<input type="hidden" name="masscheck" value="" />
			<input type="hidden" name="massrepair" value="" />
			<input type="hidden" name="massoptimize" value="" />
			<input type="hidden" name="massconvert" value="" />
			<input type="hidden" name="massdelete" value="" />
			
			<div class="panel-body table-responsive">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th><input type="checkbox" class="select-all" /></th>
							<th>{{ lang.dbo.table }}</th>
							<th>{{ lang.dbo.rows }}</th>
							<th>{{ lang.dbo.data }}</th>
							<th>{{ lang.dbo.overhead }}</th>
						</tr>
					</thead>
					<tbody>
						{% for tbl in tables %}
						<tr>
							<td><input name="tables[]" value="{{ tbl.table }}" type="checkbox" /></td>
							<td>{{ tbl.table }}</td>
							<td>{{ tbl.rows }}</td>
							<td>{{ tbl.data }}</td>
							<td>{{ tbl.overhead }}</td>
						</tr>
						{% endfor %}
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5"><input type="checkbox" class="select-all" /></td>
						</tr>
					</tfoot>
				</table>
			</div>

			<div class="panel-footer">
				<div class="row">
					<div class="col col-md-3">
						<input class="btn btn-default form-control" type="submit" value="{{ lang.dbo.check }}" onclick="document.forms['form'].masscheck.value = 'true';" />&nbsp;
						<input class="btn btn-default form-control" type="submit" value="{{ lang.dbo.repair }}" onclick="document.forms['form'].massrepair.value = 'true';" />&nbsp;
						<input class="btn btn-default form-control" type="submit" value="{{ lang.dbo.optimize }}" onclick="document.forms['form'].massoptimize.value = 'true';" />&nbsp;
						<input class="btn btn-default form-control" type="submit" value="{{ lang.dbo.convert }}" onclick="document.forms['form'].massconvert.value = 'true';" />
					</div>
					<div class="col col-md-3">
						<input class="btn btn-default form-control" type="submit" value="{{ lang.dbo.cat_recount }}" onclick="document.forms['form'].cat_recount.value = 'true';" />&nbsp;
					</div>
					<div class="col col-md-3">
						<input class="btn btn-default form-control" type="submit" value="{{ lang.dbo.backup }}" onclick="document.forms['form'].massbackup.value = 'true';" />
						&nbsp;
						<label class="btn btn-default form-control">
							<input type="checkbox" id="gz" name="gzencode" value="1" autocomplete="off" /> {{ lang.dbo.gzencode }}
						</label>
						&nbsp;
						<label class="btn btn-default form-control">
							<input type="checkbox" id="email" name="email_send" value="1" autocomplete="off" /> {{ lang.dbo.email_send }}
						</label>
					</div>
					<div class="col col-md-3">
						<input class="btn btn-danger form-control" type="submit" value="{{ lang.dbo.delete }}" onclick="document.forms['form'].massdelete.value = 'true';" />
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div class="well">
		<!-- FORM: Perform actions with backups -->
		<form name="backups" action="admin.php?mod=dbo" method="post">
			<input type="hidden" name="subaction" value="modify" />
			<input type="hidden" name="token" value="{{ token }}" />
			<input type="hidden" name="restore" value="" />
			<input type="hidden" name="delbackup" value="" />
			<input type="hidden" name="massdelbackup" value="" />
			
			<div class="row">
				<div class="col col-md-6">
					{{restore}} 
					<label for="cp1251"><input type="checkbox" name="cp1251" id="cp1251" value="1" />Архив БД в кодировке cp1251</label>
				</div>
				<div class="col col-md-3">
					<input class="btn btn-default form-control" type="submit" value="{{ lang.dbo.restore }}" onclick="document.forms['backups'].restore.value = 'true';" />
				</div>
				<div class="col col-md-3">
					<input class="btn btn-danger form-control" type="submit" value="{{ lang.dbo.delete }}" onclick="document.forms['backups'].delbackup.value = 'true';" />
					&nbsp;
					<input class="btn btn-danger form-control" type="submit" value="{{ lang.dbo.deleteall }}" onclick="document.forms['backups'].massdelbackup.value = 'true';" />
				</div>
			</div>
			
		</form>
	</div>
	
</div>
