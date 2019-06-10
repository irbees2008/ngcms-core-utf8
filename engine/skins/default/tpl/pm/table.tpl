<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{l_home}</a></li>
	<li class="active">{l_pm}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div class="panel panel-default panel-table">
		<div class="panel-heading text-right">
			<a href="admin.php?mod=pm&action=write" title="{l_write}" class="btn btn-success add_form"><i class="fa fa-plus"></i></a>
		</div>
		<form name="form" action="admin.php?mod=pm" method="post">
			<div class="panel-body table-responsive">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th><input type="checkbox" class="select-all"></th>
							<th>{l_from}</th>
							<th>{l_title}</th>
							<th>{l_status}</th>
							<th>{l_pmdate}</th>
							<th class="text-right">{l_action}</th>
						</tr>
					</thead>
					<tbody>
						{entries}
					</tbody>
				</table>
			</div>
			<div class="panel-footer text-right">
				<div class="row">
					<div class="col col-md-4">
						<div class="input-group">
							<select name="action" class="form-control">
								<option value="">-- {l_action} --</option>
								<option value="delete">{l_delete}</option>
							</select>
							<span class="input-group-btn">
								<button type="submit" class="btn btn-default">{l_ok}</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
$(document).ready(function(){
// Р”РѕР±Р°РІР»РµРЅРёРµ СЃРѕРѕР±С‰РµРЅРёСЏ РІ modal
	$('.add_form').on('click', function(){
		$('#modal-dialog .modal-dialog').load($(this).attr('href') + ' #add_edit_form .modal-content');
		$('#modal-dialog').modal('show');
		return false;
	});
	$('.edit_form').on('click', function(){
		$('#modal-dialog .modal-dialog').load($(this).attr('href') + ' #add_edit_form .modal-content');
		$('#modal-dialog').modal('show');
		return false;
	});
});
</script>