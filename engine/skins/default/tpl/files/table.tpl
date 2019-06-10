<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{l_home}</a></li>
	<li class="active">{l_files_title}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<!-- Filter form: BEGIN -->
	<div id="filter" class="collapse">
		<div class="well">
			<form name="options_bar" id="options_bar" action="admin.php?mod=files" method="post">
				<input type="hidden" name="action" value="list" />
				<input type="hidden" name="area" value="{area}" />
				
				<div class="row">
					<!--Block 1-->
					<div class="col col-md-3 col-sm-6">
						[status]
						<div class="form-group">
							<label>{l_category}</label>
							{dirlistcat}
						</div>
						<div class="form-group">
							<label for="">{l_author}</label>
							<select name="author" class="form-control">
								<option value="">- {l_all} -</option>
								{authorlist}
							</select>
						</div>
						[/status]
					</div>
					<!--/Block 1-->
					<!--Block 2-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label for="">{l_month}</label>
							<select name="postdate" class="form-control">
								<option selected value="">- {l_all} -</option>
								{dateslist}
							</select>
						</div>
					</div>
					<!--/Block 2-->
					<!--Block 3-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label for="">{l_per_page}</label>
							<input type="text" name="npp" id="npp" value="{npp}" class="form-control">
						</div>
					</div>
					<!--/Block 3-->
					<!--Block 4-->
					<div class="col col-md-3 col-sm-6">
						<div class="form-group">
							<label for="">&nbsp;</label>
							<button type="submit" class="btn btn-primary form-control">{l_do_show}</button>
						</div>
					</div>
					<!--/Block 4-->
				</div>
			</form>
		</div>
	</div>
	<!-- Filter form: END -->
	
	<!-- List of files: BEGIN -->
	<div class="panel panel-default panel-table">
		<div class="panel-heading text-right">
			<a href="#" data-toggle="modal" data-target="#categories" class="btn btn-default"><i class="fa fa-pencil"></i></a>
			<button type="button" data-toggle="collapse" data-target="#filter" aria-expanded="false" aria-controls="filter" class="btn btn-primary"><i class="fa fa-cog"></i></button>
			<a href="#" title="{l_uploadnew}" class="btn btn-success" data-toggle="modal" data-target="#modal-upload"><i class="fa fa-plus"></i></a>
		</div>
		<form name="imagedelete" id="delform" action="admin.php?mod=files" method="post">
			<input type="hidden" name="area" value="{area}">
			
			<div class="panel-body table-responsive">
				<table class="table table-condensed">
					<thead>
						<tr>
							<th><input type="checkbox" class="select-all"></th>
							<th>#</th>
							<th>{l_name}</th>
							<th>{l_size}</th>
							<th>{l_category}</th>
							<th>{l_author}</th>
							<th>{l_action}</th>
						</tr>
					</thead>
					
					<tbody>
						{entries}
					</tbody>
				</table>
			</div>
			<div class="panel-footer">
				<div class="row">
					<div class="col col-md-4">
						[status]
						<div class="form-group">
							<div class="input-group">
								<select name="subaction" onchange="updateAction();" onclick="updateAction();" class="form-control">
									<option value="">-- {l_action} --</option>
									<option value="move">{l_move}</option>
									<option value="delete">{l_delete}</option>
								</select>
								<span class="input-group-btn">
									<button type="submit" class="btn btn-default">{l_ok}</button>
								</span>
							</div>
						</div>
						<div class="form-group" id="category" style="display: none;">
							{dirlist}
						</div>
						[/status]
					</div>
					<div class="col col-md-8 text-right">
						{pagesss}
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- List of images: END -->
</div>

[status]
<div id="categories" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">{l_categories}</h4>
			</div>
			<div class="modal-body">
				<form name="newcat" action="admin.php?mod=files" method="post">
					<input type="hidden" name="subaction" value="newcat">
					<input type="hidden" name="area" value="{area}">
					<div class="form-group">
						<label for="">{l_addnewcat}</label>
						<div class="input-group">
							<input type="text" name="newfolder" class="form-control" >
							<span class="input-group-btn">
								<button type="submit" class="btn btn-success">{l_ok}</button>
							</span>
						</div>
						
					</div>
				</form>
				<form name="delcat" action="admin.php?mod=files" method="post">
					<input type="hidden" name="subaction" value="delcat">
					<input type="hidden" name="area" value="{area}">
					<label for="">{l_delcat}</label>
					<div class="input-group">
						{dirlist}
						<span class="input-group-btn">
							<button type="submit" class="btn btn-success">{l_ok}</button>
						</span>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">{l_cancel}</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
[/status]

<div id="modal-upload" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">{l_uploadnew}</h4>
			</div>
			<div class="modal-body">
				<div id="mfs" class="alert alert-info"></div>
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#upload" id="upload-tab" aria-controls="upload" data-toggle="tab" aria-expanded="true" role="tab">{l_upload_file}</a>
					</li>
					<li role="presentation">
						<a href="#uploadurl" id="uploadurl-tab" aria-controls="uploadurl" data-toggle="tab" aria-expanded="false" role="tab">{l_upload_file_url}</a>
					</li>
				</ul>
				
				<!-- Tab panes -->
				<div class="tab-content">
					<div id="upload" class="tab-pane active in" aria-labelledby="upload-tab" role="tabpanel">
						<form name="sn" id="upload-files" action="admin.php?mod=files" method="post" enctype="multipart/form-data" class="form-horizontal">
							<input type="hidden" name="uploadType" value="file">
							<input type="hidden" name="subaction" value="upload">
							<input type="hidden" name="area" value="{area}">
							
							<table id="fileup" class="table table-condensed table-bordered">
								<thead>
									<tr>
										<th>{l_attach.filename} - {l_attach.size}</th>
										<th class="text-right" width="10">{l_do_delete}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td class="text-center" width="10">
											<button type="button" title="{l_attach.more_rows}" onclick="attachAddRow('fileup');" class="btn btn-primary" title="{l_attach.more_rows}"><i class="fa fa-plus"></i></button>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="form-group">
								<label class="col-sm-4">{l_category}</label>
								<div class="col-sm-8">
									{dirlistS}
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4">{l_options}</label>
								<div class="col-sm-8">
									<label for="flagReplace">
										<input type="checkbox" name="replace" id="flagReplace" value="1">&nbsp;{l_do_replace}
									</label><br>
									<label for="flagRand">
										<input type="checkbox" name="rand" id="flagRand" value="1">&nbsp;{l_do_rand}
									</label>
								</div>
							</div>
							<div class="row text-right">
								<hr>
								<label class="col-sm-4"></label>
								<div class="col-sm-8">
									<button type="button" class="btn btn-default" data-dismiss="modal">{l_cancel}</button>
									<input type="submit" id="i_submit" value='{l_upload}' class="btn btn-success">
								</div>
							</div>
						</form>
					</div>
					
					<div id="uploadurl" class="tab-pane" aria-labelledby="uploadurl-tab" role="tabpanel">
						<form name="snup" action="admin.php?mod=files" method="post" class="form-horizontal">
							<input type="hidden" name="subaction" value="uploadurl">
							<input type="hidden" name="area" value="{area}">
							
							<table id="fileup2" class="table table-condensed table-bordered">
								<thead>
									<tr>
										<th>{l_attach.url}</th>
										<th class="text-right" width="10">{l_do_delete}</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td class="text-center" width="10">
											<button type="button" title="{l_attach.more_rows}" onclick="attachAddRow('fileup2');" class="btn btn-primary" title="{l_attach.more_rows}"><i class="fa fa-plus"></i></button>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="form-group">
								<label class="col-sm-4">{l_category}</label>
								<div class="col-sm-8">
									{dirlist}
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-4">{l_options}</label>
								<div class="col-sm-8">
									<label for="replace2">
										<input type="checkbox" name="replace" id="replace2" value="1">&nbsp;{l_do_replace}
									</label><br>
									<label for="rand2">
										<input type="checkbox" name="rand" id="rand2" value="1">&nbsp;{l_do_rand}
									</label>
								</div>
							</div>
							
							<div class="row text-right">
								<hr>
								<label class="col-sm-4"></label>
								<div class="col-sm-8">
									<button type="button" class="btn btn-default" data-dismiss="modal">{l_cancel}</button>
									<input type="submit" value='{l_upload}' class="btn btn-success">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Main scripts -->
<script>
$(document).ready(function(){

	$('#mfs').html('Максимальный размер файлов: ' + formatSize({maxSize})+'<br>Допустимые расширения файлов: {listExt}');

	$('#modal-upload').on("hidden.bs.modal", function(){
		if (flagRequireReload)
			document.location.href = document.location.href;
	});

});

function updateAction() {
	mode = document.forms['delform'].subaction.value;
	if (mode == 'move')
		$('#category').css( "display", "block" );
	else
		$('#category').css( "display", "none" );
}

// Add first row
var flagRequireReload = 0;
attachAddRow('fileup');
attachAddRow('fileup2');

</script>
