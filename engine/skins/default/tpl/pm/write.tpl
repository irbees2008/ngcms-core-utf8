<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{l_home}</a></li>
	<li><a href="admin.php?mod=pm">{l_pm}</a></li>
	<li class="active">{l_write}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div id="add_edit_form">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form name="form" action="admin.php?mod=pm&action=send" method="post" class="form-horizontal">
					
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4>{l_write}</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="col-sm-4">{l_title}</label>
							<div class="col-sm-8">
								<input type="text" name="title" tabindex="1" maxlength="50" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4">{l_receiver}</label>
							<div class="col-sm-8">
								<input type="text" name="sendto" tabindex="2" maxlength="70" class="form-control"/>
								<span class="helper-block">{l_receiver_desc}</span>
							</div>
						</div>
						<div id="fullwidth" class="form-group">
							<label class="col-sm-4">{l_content}</label>
							<div class="col-sm-8">
								{quicktags}
								<div class="btn-group btn-group-justified smiles" data-toggle="buttons">
									{smilies}
								</div>
								<textarea name="content" id="content" rows="10" tabindex="3" maxlength="3000" class="form-control"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="cancel" class="btn btn-default" data-dismiss="modal">{l_cancel}</button>
						<button type="submit" class="btn btn-success">{l_send}</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>