<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{l_home}</a></li>
	<li><a href="admin.php?mod=images">{l_images_title}</a></li>
	<li class="active">{l_edit_title} <b>{orig_name}</b></li>
</ul>

<!-- Info content -->
<div class="page-main">
	<!-- Options edit: BEGIN -->
	<form action="admin.php?mod=images" method="post" class="form-horizontal">
		<input type="hidden" name="subaction" value="editApply" />
		<input type="hidden" name="id" value="{id}" />
		
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>{l_edit_title}</h4>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label for="" class="col-sm-4">{l_name}</label>
							<div class="col-sm-8">
								<p class="form-control-static" onclick="$(this).parent().html('<input type=text name=newname value={name} class=form-control>');">{name}<a href="#" title="{l_rename}" class="pull-right"><i class="fa fa-pencil" aria-hidden="true"></i></a></p>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-4">{l_description}</label>
							<div class="col-sm-8">
								<textarea name="description" rows="4" class="form-control">{description}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-4">{l_wmimage}</label>
							<div class="col-sm-8">
								[no_stamp]<label><input type="checkbox" name="createStamp" value="1"></label> {l_add}[/no_stamp]
								[have_stamp]<p class="form-control-static">{l_added}</p>[/have_stamp]
							</div>
						</div>
						<fieldset>
							<legend >{l_preview}</legend>
							<div class="form-group">
								<label for="" class="col-sm-4">{l_status}</label>
								<div class="col-sm-8">
									<p class="form-control-static">{preview_status}</p>
									[preview]
									<div class="thumbnail">
										<a href="{thumburl}" target="_blank">
											<img src="{thumburl}" class="img-responsive" style="width:100%;">
											<div class="caption text-center">
												{preview_width} x {preview_height} ( {preview_size} )
											</div>
										</a>
									</div>
									[/preview]
									<label><input type="checkbox" name="flagPreview" value="1" data-toggle="collapse" data-target="#createPreview"/> {l_create_edit_preview}</label>
								</div>
							</div>
							<div id="createPreview" class="collapse">
								<div class="form-group">
									<label for="" class="col-sm-4">{l_size_max}</label>
									<div class="col-sm-8">
										<div class="input-group">
											<input type="text" name="thumbSizeX" value="{thumb_size_x}" class="form-control" />
											<span class="input-group-addon"> x </span>
											<input type="text" name="thumbSizeY" value="{thumb_size_y}" class="form-control" />
											<span class="input-group-addon">{l_pixels}</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-sm-4">{l_quality_jpeg}</label>
									<div class="col-sm-8">
										<div class="input-group">
											<input name="thumbQuality" value="{thumb_quality}" class="form-control" />
											<span class="input-group-addon"> % </span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-sm-4">{l_s_wmimage}</label>
									<div class="col-sm-8">
										<label><input type="checkbox" name="flagStamp" value="1" /> {l_set_up}</label>
									</div>
								</div>
								<div class="form-group">
									<label for="" class="col-sm-4">{l_s_shadow}</label>
									<div class="col-sm-8">
										<label><input type="checkbox" name="flagShadow" value="1" /> {l_add}</label>
									</div>
								</div>
							</div>
						</fieldset>
					</div>
					<div class="panel-footer">
						<div class="clearfix">
							<div class="col-sm-offset-4 col-sm-8">
								<button type="submit" class="btn btn-success">{l_save}</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>{l_statistics}</h4>
					</div>
					<div class="panel-body">
						<dl>
							<dt>{l_url}</dt>
							<dd><a href="{fileurl}" target="_blank">{fileurl}</a></dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>{l_original_name}</dt>
							<dd>{orig_name}</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>{l_date}</dt>
							<dd>{date}</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>{l_author}</dt>
							<dd>{author}</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>{l_img_size}</dt>
							<dd>{width} x {height} ( {size} )</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>{l_category}</dt>
							<dd>{category}</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
