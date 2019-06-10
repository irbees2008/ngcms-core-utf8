<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=options">{{ lang['options'] }}</a></li>
	<li class="active">{{ lang.cron['title'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div class="panel panel-default panel-table">
		<form name="commitForm" id="commitForm" action="admin.php?mod=cron" method="post">
			<input type="hidden" name="mod" value="cron" />
			<input type="hidden" name="action" value="commit" />
			<input type="hidden" name="token" value="{{ token }}" />

			<div class="panel-body table-responsive">
				<table class="table table-condensed">
				<thead>
					<tr>
						<th>Plugin</th>
						<th>Handler</th>
						<th>Min</th>
						<th>Hour</th>
						<th>Day</th>
						<th>Month</th>
						<th>D.O.W.</th>
					</tr>
				</thead>
				<tbody>
					{% for entry in entries %}
					<tr>
						<td>
							<input type="text" name="data[{{ entry.id }}][plugin]" value="{{ entry.plugin }}" class="form-control">
						</td>
						<td>
							<input type="text" name="data[{{ entry.id }}][handler]" value="{{ entry.handler }}" class="form-control">
						</td>
						<td>
							<input type="text" name="data[{{ entry.id }}][min]" value="{{ entry.min }}" class="form-control">
						</td>
						<td>
							<input type="text" name="data[{{ entry.id }}][hour]" value="{{ entry.hour }}" class="form-control">
						</td>
						<td>
							<input type="text" name="data[{{ entry.id }}][day]" value="{{ entry.day }}" class="form-control">
						</td>
						<td>
							<input type="text" name="data[{{ entry.id }}][month]" value="{{ entry.month }}" class="form-control">
						</td>
						<td>
							<input type="text" name="data[{{ entry.id }}][dow]" value="{{ entry.dow }}" class="form-control">
						</td>
					</tr>
					{% endfor %}
				</tbody>
				</table>
			</div>

			<div class="panel-footer text-center">
				<input type="submit" value="{{ lang.cron['commit_change'] }}" class="btn btn-success" onclick="document.location='admin.php?mod=extra-config&plugin=xfields&action=add&section={{ sectionID }}';">
			</div>
		</form>
	</div>
	
	<div class="row">
		<div class="col col-sm-6">
			<div class="alert alert-info">{{ lang.cron['title#desc'] }}</div>
		</div>
		<div class="col col-sm-6">
			<div class="alert alert-info">{{ lang.cron['legend'] }}</div>
		</div>
	</div>
</div>