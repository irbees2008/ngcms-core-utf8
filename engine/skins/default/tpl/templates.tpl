<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li class="active">{{ lang.templates['title'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<div id="templates">
		<div class="navbar navbar-default navbar-templates">
			<div class="navbar-header">
				<button class="collapsed navbar-toggle" data-target="#bs-navbar" data-toggle="collapse" type="button">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand" data-toggle="modal" data-target="#hotkeys">
					<i class="fa fa-question-circle"></i></a>
			</div>
			<nav class="collapse navbar-collapse" id="bs-navbar">
				<ul class="nav navbar-nav">
					<li class="dropdown active">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							{{ lang.templates['tplsite'] }} <span class="caret"></span></a>
						<ul class="dropdown-menu">
							{% for st in siteTemplates %}
								<li><a href="#" class="tpl-select" data-select="{{ st.name }}">{{ st.name }} ({{ st.title }})</a></li>
							{% endfor %}
						</ul>
					</li>
					<li><a href="#" class="tpl-select">{{ lang.templates['tplmodules'] }}</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" title="Fullscreen (F11)" onclick="$('#templates').toggleClass('content-full');return false;"><i class="fa fa-arrows-alt"></i></a></li>
				</ul>
			</nav>
		</div>
		
		<div class="templates-explorer">
			<div class="row">
				<div class="col col-sm-5 col-md-3 ">
					<div id="fileTreeSelector" class="navbar navbar-inverse">TEST CONTENT</div>
				</div>
				<div class="col col-sm-7 col-md-9">
					<div class="fileEditorInfo">
						{{ lang.templates['tpl.edit'] }} [ <b><span id="templateNameArea">default</span> </b>]
						<div id="fileEditorInfo" style=" ">&nbsp;</div>
					</div>
					<div id="fileEditorContainer" class="Code-to-Mirror ">
						<textarea id="fileEditorSelector" rows="30" class="form-control">*** EDITOR ***</textarea>
						<div id="imageViewContainer"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col col-sm-5 col-md-3"></div>
				<div class="col col-sm-7 col-md-9">
					<div class="form-group">
						<input type="button" value="{{ lang['save'] }}" onclick="submitTemplateEdit();" title="Ctrl+S" class="btn btn-success">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="hotkeys" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
				
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4>Help</h4>
			</div>
			<div class="modal-body">
				<h4>Hotkeys for codemirror</h4>
				<div class="row">
					<div class="col col-xs-6">
						
						<table class="table table-condensed">
							<tr>
								<td><kbd>Ctrl + S</kbd></td><td>save template</td>
							</tr>
							<tr>
								<td><kbd>F11</kbd></td><td>view fullscreen</td>
							</tr>
							<tr>
								<td><kbd>Ctrl + E</kbd></td><td>expand abbreviation (<a href="http://docs.emmet.io/cheat-sheet/" target="_blank" title="Emmet cheat sheet" class="">emmet</a>)</td>
							</tr>
						</table>
					</div>
				
					<div class="col col-xs-6">
						<table class="table table-condensed">
							<tr>
								<td><kbd>Ctrl + F</kbd></td><td>start searching</td>
							</tr>
							<tr>
								<td><kbd>Ctrl + G</kbd></td><td>find next</td>
							</tr>
							<tr>
								<td><kbd>Shift + Ctrl + F</kbd></td><td>replace</td>
							</tr>
							<!--tr>
								<td></td>
							</tr>
							<tr>
								<td></td>
							</tr-->
						</table>
					</div>
				</div>
				<!--div class="well">
					<h4>Twig &#123;&#123; variables &#125;&#125; for this template, if it is standard</h4>
					<div class="row">
						<div class="col col-xs-12"><code>&#123;&#123; lang['langcode'] &#125;&#125;</code> - language code</div>
						<div class="col col-xs-12"><code>&#123;&#123; lang['langcode'] &#125;&#125;</code> - language code</div>
					</div>
				</div-->
			</div>
			<div class="modal-footer">
				<button type="cancel" class="btn btn-default" data-dismiss="modal">{{ lang['close'] }}</button>
			</div>
		</div>
	</div>
</div>

<link href="{{ skins_url }}/assets/codemirror-5.23.0/codemirror.css" rel="stylesheet">
<script src="{{ skins_url }}/assets/codemirror-5.23.0/codemirror.js"></script>
<script src="{{ skins_url }}/assets/js/emmet.js"></script>

<script src="{{ home }}/lib/ngFileTree.js"></script>
<link href="{{ home }}/lib/ngFileTree.css" rel="stylesheet" />

<script>
var ngTemplateName = 'default';
var ngFileName = '';
var ngFileType = '';
var ngFileContent = '';
var ngFileTreeParams = { root: '/', script: '{{ admin_url }}/rpc.php', securityToken : '{{ token }}', templateName : ngTemplateName };

var textarea = document.getElementById('fileEditorSelector');
var cmHeight = $('#fileTreeSelector').outerHeight() - $('#fileEditorInfo').outerHeight() - 41;
textarea.style.height = cmHeight+'px';

var ngFileTreeFunc = function(file) {
		
		//(file == 'main.tpl'?' Страницы сайта':'');
		
		ngFileName = file;
		ngShowLoading();
		$.post('{{ admin_url }}/rpc.php', { json : 1, methodName : 'admin.templates.getFile', rndval: new Date().getTime(), params : json_encode({ template : ngTemplateName, 'file' : file, token : '{{ token }}' }) }, function(data) {
			ngHideLoading();
			// Try to decode incoming data
			try {
				resTX = eval('('+data+')');
			} catch (err) {
				$.notify({message: 'Error parsing JSON output (mod=templates). Result: '+resTX.response},{type: 'danger'});
			}
			
			if (!resTX['status'])
				$.notify({message: 'Error ['+resTX['errorCode']+']: '+resTX['errorText']},{type: 'danger'});

			ngFileContent = '';
			ngFileType = resTX['type'];

			$('#fileEditorInfo').html(((ngFileType == 'image')?'Image':'File')+' name: <b>'+ngFileName+'</b> ('+formatSize(resTX['size'])+' )<br/>Last change time: '+resTX['lastChange']);

			// Remove previous codemirror (if installed)
			$(".CodeMirror").remove();
			
			if (resTX['type'] == 'image') {
				document.getElementById('imageViewContainer').style.display = 'block';
				document.getElementById('fileEditorSelector').style.display = 'none';
				$('#imageViewContainer').html(resTX['content']);
			} else {
				document.getElementById('imageViewContainer').style.display = 'none';
				document.getElementById('fileEditorSelector').style.display = 'block';
				$('#fileEditorSelector').val(resTX['content']);
				// Install codemirror
				var tmode;
				if (ngFileName.indexOf(".ini") > 0) {tmode = "text/x-ini"};
				if (ngFileName.indexOf(".tpl") > 0) {tmode = "text/html"};
				if (ngFileName.indexOf(".css") > 0) {tmode = "text/x-gss"};
				if (ngFileName.indexOf(".js") > 0) {tmode = "javascript"};
				var edField = $('#fileEditorSelector');
				var cmHeight = $('#fileTreeSelector').outerHeight() - $('#fileEditorInfo').outerHeight()-41;
				var eW = edField.width();
				var eH = cmHeight;
				var cm = CodeMirror.fromTextArea(
					document.getElementById('fileEditorSelector'), {
						lineNumbers: true,
						mode: tmode,
						lineWrapping: true,
						styleActiveLine: true,
						tabMode: "indent",
						//theme: 'panda-syntax',
						extraKeys: {
							"F11": function(cm) {cm.setOption("fullScreen", !cm.getOption("fullScreen"));},
							"Esc": function(cm) {if (cm.getOption("fullScreen")) cm.setOption("fullScreen", false);}
						}
				});
				cm.setSize(eW, eH);
				cm.on("change", function(cm) {
					$("#fileEditorSelector").val(cm.getValue());
				});
				ngFileContent = resTX['content'];
				emmetCodeMirror(cm);
			}
		}, "text").error(function() {
			ngHideLoading();
			$.notify({message: 'HTTP error during request'},{type: 'danger'});
		});
		$('html, body').animate({scrollTop: $('.fileEditorInfo').offset().top - 50}, '888');

}

function submitTemplateSelector(selTpl) {
	// Remove previous codemirror (if installed)
	$('.CodeMirror').remove();
	$('#fileEditorInfo').html('');
	$('#imageViewContainer').html('');
	$('#fileEditorSelector').val('');
	ngFileName = '';
	if (selTpl) {
		ngTemplateName = selTpl;
		ngFileTreeParams['templateName'] = ngTemplateName;
		$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
		$('#templateNameArea').html(ngTemplateName);
	} else {
		ngTemplateName = '#plugins';
		ngFileTreeParams['templateName'] = ngTemplateName;
		$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
		$('#templateNameArea').html(' PLUGIN TEMPLATES ');
	}
}

function submitTemplateEdit() {
	var editedContent = $('#fileEditorSelector').val();
	ngShowLoading();
	$.post('{{ admin_url }}/rpc.php', { json : 1, methodName : 'admin.templates.updateFile', rndval: new Date().getTime(), params : json_encode({ template : ngTemplateName, 'file' : ngFileName, token : '{{ token }}', 'content' : editedContent }) }, function(data) {
		ngHideLoading();
		// Try to decode incoming data
		try {
			resTX = eval('('+data+')');
		} catch (err) {
			$.notify({message: 'Error parsing JSON output. Result: '+linkTX.response},{type: 'danger'});
		}
		if (!resTX['status']) {
			$.notify({message: 'Error ['+resTX['errorCode']+']: '+resTX['errorText']},{type: 'danger'});
		} else {
			$.notify({message: resTX['content']},{type: 'info'});
		}
	}, "text").error(function() { ngHideLoading(); $.notify({message: 'HTTP error during request'},{type: 'danger'}); });
}

$(document).ready( function() {
	$('#fileTreeSelector').ngFileTree(ngFileTreeParams, ngFileTreeFunc);
	$('.tpl-select').click(function(){
		$(this).parents('.nav').each(function(){
			$(this).find('li').removeClass('active');
		});
		$(this).parents('li').addClass('active');
		submitTemplateSelector($(this).attr('data-select'));
	});
});

document.onkeydown = function(e) {
	e = e || event;
	if (e.ctrlKey && e.keyCode == 'S'.charCodeAt(0)) {
		submitTemplateEdit();
		return false;
	}
	if (e.keyCode == 122 && !$('.CodeMirror').hasClass('CodeMirror-focused')) {
		$('.CodeMirror').toggleClass('CodeMirror-fullscreen');
	return false;
	}
	if (e.keyCode == 27) {
		$('.CodeMirror').removeClass('CodeMirror-fullscreen');
	return false;
	}
}
</script>