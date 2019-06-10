<span id="save_area" style="display: block;"></span>
<div id="tags" class="btn-group btn-group-justified bbcodes" data-toggle="buttons">
	
	<a href="#" class="btn btn-default" onclick="insertext('[p]','[/p]', {area})" title='{l_tags.paragraph}'><i class="fa fa-paragraph"></i></a>

	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-font"></i> <span class="caret"></span></button>
		<ul class="dropdown-menu">
			<li><a href="#" onclick="insertext('[b]','[/b]', {area})"><i class="fa fa-bold"></i> {l_tags.bold}</a></li>
			<li><a href="#" onclick="insertext('[u]','[/u]', {area})"><i class="fa fa-underline"></i> {l_tags.underline}</a></li>
			<li><a href="#" onclick="insertext('[i]','[/i]', {area})"><i class="fa fa-italic"></i> {l_tags.italic}</a></li>
			<li><a href="#" onclick="insertext('[s]','[/s]', {area})"><i class="fa fa-strikethrough"></i>{l_tags.crossline}</a></li>
		</ul>
	</div>
	
	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-align-left"></i> <span class="caret"></span></button>
		<ul class="dropdown-menu">
			<li><a href="#" onclick="insertext('[left]','[/left]', {area})"><i class="fa fa-align-left"></i> {l_tags.left}</a></li>
			<li><a href="#" onclick="insertext('[center]','[/center]', {area})"><i class="fa fa-align-center"></i> {l_tags.center}</a></li>
			<li><a href="#" onclick="insertext('[right]','[/right]', {area})"><i class="fa fa-align-right"></i> {l_tags.right}</a></li>
			<li><a href="#" onclick="insertext('[justify]','[/justify]', {area})"><i class="fa fa-align-justify"></i> {l_tags.justify}</a></li>
		</ul>
	</div>
	
	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-quote-left"></i> <span class="caret"></span></button>
		<ul class="dropdown-menu">
			<li><a href="#" onclick="insertext('[ul]\n[li][/li]\n[li][/li]\n[li][/li]\n[/ul]','', {area})"><i class="fa fa-list-ul"></i> {l_tags.bulllist}</a></li>
			<li><a href="#" onclick="insertext('[ol]\n[li][/li]\n[li][/li]\n[li][/li]\n[/ol]','', {area})"><i class="fa fa-list-ol"></i> {l_tags.numlist}</a></li>
			<li role="separator" class="divider"></li>
			<li><a href="#" onclick="insertext('[quote]','[/quote]', {area})"><i class="fa fa-quote-left"></i> {l_tags.comment}</a></li>
			<li><a href="#" onclick="insertext('[code]','[/code]', {area})"><i class="fa fa-code"></i> {l_tags.code}</a></li>
			<li><a href="#" onclick="insertext('[hide]','[/hide]', {area})"><i class="fa fa-shield"></i> {l_tags.hide}</a></li>
			<li><a href="#" onclick="insertext('[spoiler]','[/spoiler]', {area})"><i class="fa fa-list-alt"></i> {l_tags.spoiler}</a></li>
		</ul>
	</div>
	
	<a href="#modal-url" class="btn btn-default" data-toggle="modal" title="{l_tags.link}"><i class="fa fa-link"></i></a>
	
	<a href="#" class="btn btn-default" onclick="try{document.forms['DATA_tmp_storage'].area.value={area};} catch(err){;} getImageList('img_popup', 8, 1);" title='{l_tags.image}'><i class="fa fa-file-image-o"></i></a>
	
	<a href="#" class="btn btn-default" onclick="try{document.forms['DATA_tmp_storage'].area.value={area};} catch(err){;} window.open('admin.php?mod=files&amp;ifield='+{area}, '_Addfile', 'height=600,resizable=yes,scrollbars=yes,width=767');return false;" target="DATA_Addfile" title='{l_tags.file}'><i class="fa fa-file-text-o"></i></a>
	
	<a href="#" class="btn btn-default" onclick="insertext('<!--nextpage-->','', {area})" title="{l_tags.nextpage}"><i class="fa fa-files-o"></i></a>
	
	<a href="#modal-smiles" class="btn btn-default" data-toggle="modal"><i class="fa fa-smile-o"></i></a>
	
</div>


<!-- URL LINK -->
<div id="modal-url" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4>{l_tags.link}</h4>
			</div>

			<div class="modal-body">
				<ul class="nav nav-tabs nav-justified">
					<li class="active"><a href="#tags-link" data-toggle="tab" aria-expanded="true">{l_tags.link}</a></li>
					<li><a href="#tags-email" data-toggle="tab" aria-expanded="false">{l_tags.email}</a></li>
					<li><a href="#tags-img-url" data-toggle="tab" aria-expanded="false">{l_tags.imagelink}</a></li>
				</ul>
				
				<div class="form-group"></div>
				
				<!-- Tab panes -->
				<div class="tab-content">
					<!-- LINK -->
					<div id="tags-link" class="tab-pane active">
						<div class="form-group">
							<label class="col-sm-3 control-label">Адрес ссылки</label>
							<div class="col-sm-9">
								<input type="url" id="modal-url-1" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Текст ссылки</label>
							<div class="col-sm-9">
								<input type="text" id="modal-url-2" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label"></label>
							<div class="col-sm-9">
								<label><input type="checkbox" id="modal-url-3" /> Open link in new window</label>
							</div>
						</div>
					</div>
					
					<!-- EMAIL -->
					<div id="tags-email" class="tab-pane">
						<div class="form-group">
							<label class="col-sm-3 control-label">Электронная почта</label>
							<div class="col-sm-9">
								<input type="email" id="modal-email-1" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Текст ссылки</label>
							<div class="col-sm-9">
								<input type="text" id="modal-email-2" class="form-control" />
							</div>
						</div>
					</div>
					
					<!-- IMG LINK -->
					<div id="tags-img-url" class="tab-pane">
						<div class="form-group">
							<label class="col-sm-3 control-label">Ссылка на изображение</label>
							<div class="col-sm-9">
								<input type="url" id="modal-img-url-1" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Alternate Text</label>
							<div class="col-sm-9">
								<input type="text" id="modal-img-url-2" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Dimensions</label>
							<div class="col-sm-9">
								<div class="input-group">
									<input type="text" id="modal-img-url-3" placeholder="width" class="form-control">
									<span class="input-group-addon"> x </span>
									<input type="text" id="modal-img-url-4" placeholder="height" class="form-control">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Alignment</label>
							<div class="col-sm-9">
								<select id="modal-img-url-5" class="form-control">
									<option value="0" selected>{l_noa}</option>
									<option value="left">{l_tags.left}</option>
									<option value="center">{l_tags.center}</option>
									<option value="right">{l_tags.right}</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Class</label>
							<div class="col-sm-9">
								<input type="text" id="modal-img-url-6" placeholder="thumbnail" class="form-control" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="cancel" class="btn btn-default" data-dismiss="modal">{l_cancel}</button>
				<button type="button" id="modal-url-submit" class="btn btn-success" data-dismiss="modal">{l_ok}</button>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	$('#modal-url-submit').click(function() {
		var activeTab = $(this).parents('#modal-url').find('.tab-pane.active').prop('id');
		
		if ( activeTab == 'tags-link' ){
			var targetLink = $('#modal-url-3').prop('checked') ? ' target="_blank"' : '';
			insertext('[url=' + $('#modal-url-1').val() + ' ' + targetLink + ']' + $('#modal-url-2').val(),'[/url]', {area})
		}
		
		if ( activeTab == 'tags-email' ){
			insertext('[email=' + $('#modal-email-1').val() + ']' + $('#modal-email-2').val(),'[/email]', {area})
		}
		
		if ( activeTab == 'tags-img-url' ){
			var widthImg = $('#modal-img-url-3').val() ? ' width="' + $('#modal-img-url-3').val() + '"' : '';
			var heightImg = $('#modal-img-url-4').val() ? ' height="' + $('#modal-img-url-4').val() + '"' : '';
			var alignImg = $('#modal-img-url-5').val() !== '0' ? ' align="' + $('#modal-img-url-5').val() + '"' : '';
			var classImg = $('#modal-img-url-6').val() ? ' class="' + $('#modal-img-url-6').val() + '"' : '';
			insertext('[img=' + $('#modal-img-url-1').val() + widthImg + heightImg + alignImg + classImg + ']' + $('#modal-img-url-2').val(),'[/img]', {area})
		}
	});
});
</script>