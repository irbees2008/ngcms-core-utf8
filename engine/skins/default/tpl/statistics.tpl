<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=options">{{ lang['options'] }}</a></li>
	<li class="active">{{ lang['statistics'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	{% if(flags.confError) %}
	<!-- Configuration errors -->
	<div class=" alert alert-danger" role="alert">
		<h3>{{ lang['pconfig.error'] }}</h3>
		<table class="table table-condensed">
			<thead>
				<tr>
					<th>{{ lang['perror.parameter'] }}</th>
					<th>{{ lang['perror.shouldbe'] }}</th>
					<th>{{ lang['perror.set'] }}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Register Globals</td>
					<td>{{ lang['statistics.disabled'] }}</td>
					<td>{{ flags.register_globals }}</td>
				</tr>
				<tr>
					<td>Magic Quotes GPC</td>
					<td>{{ lang['statistics.disabled'] }}</td>
					<td>{{ flags.magic_quotes_gpc }}</td>
				</tr>
				<tr>
					<td>Magic Quotes Runtime</td>
					<td>{{ lang['statistics.disabled'] }}</td>
					<td>{{ flags.magic_quotes_runtime }}</td>
				</tr>
				<tr>
					<td>Magic Quotes Sybase</td>
					<td>{{ lang['statistics.disabled'] }}</td>
					<td>{{ flags.magic_quotes_sybase }}</td>
				</tr>
			</tbody>
		</table>
		
		<p><a href="#" data-toggle="modal" data-target="#perror">{{ lang['perror.howto'] }}?</a></p>
	</div>
	<div id="perror" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4>{{ lang['perror.howto'] }}</h4>
				</div>
				<div class="modal-body">
					{{ lang['perror.descr'] }}
				</div>
				<div id="modalmsgWindowButton" class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">{{ lang['close'] }}</button>
				</div>
			</div>
		</div>
	</div>
	{% endif %}
	
	<div class="row">
		<div class="col-lg-3 col-xs-6">
			<a href="admin.php?mod=news" class="small-box bg-info">
				<div class="inner">
				<script>
function scroll(val,el,timeout,step){
var i=0;
(function(){
if(i<=val){
setTimeout(arguments.callee,timeout);
document.getElementById(el).innerHTML=i;
i=i+step;
}else{
document.getElementById(el).innerHTML=val;
}
})();
}
scroll({{ news_draft + news_unapp + news }},'shethik-cifra',1,2);
</script>
					<h3><div id="shethik-cifra"></div></h3>
					<p>{{ lang['news'] }}</p>
				</div>
				<i class="fa fa-newspaper-o"></i>
			</a>
		</div>
		<div class="col-lg-3 col-xs-6">
			<a href="admin.php?mod=images" class="small-box bg-success">
				<div class="inner">
					<script>
function scroll(val,el,timeout,step){
var i=0;
(function(){
if(i<=val){
setTimeout(arguments.callee,timeout);
document.getElementById(el).innerHTML=i;
i=i+step;
}else{
document.getElementById(el).innerHTML=val;
}
})();
}
scroll({{ images }},'images',1,10);
</script>
					<h3><div id="images"></div></h3>
					<p>{{ lang['images'] }}</p>
				</div>
				<i class="fa fa-picture-o"></i>
			</a>
		</div>
		<div class="col-lg-3 col-xs-6">
			<a href="admin.php?mod=files" class="small-box bg-warning">
				<div class="inner">
					<script>
function scroll(val,el,timeout,step){
var i=0;
(function(){
if(i<=val){
setTimeout(arguments.callee,timeout);
document.getElementById(el).innerHTML=i;
i=i+step;
}else{
document.getElementById(el).innerHTML=val;
}
})();
}
scroll({{ files }},'files',1,2);
</script>
					<h3><div id="files"></div></h3>
					<p>{{ lang['files'] }}</p>
				</div>
				<i class="fa fa-file-text-o"></i>
			</a>
		</div>
		<div class="col-lg-3 col-xs-6">
			<a href="admin.php?mod=users" class="small-box bg-danger">
				<div class="inner">
					<script>
function scroll(val,el,timeout,step){
var i=0;
(function(){
if(i<=val){
setTimeout(arguments.callee,timeout);
document.getElementById(el).innerHTML=i;
i=i+step;
}else{
document.getElementById(el).innerHTML=val;
}
})();
}
scroll({{ users }},'users',1,2);
</script>
					<h3><div id="users"></div></h3>
					<p>{{ lang['users'] }}</p>
				</div>
				<i class="fa fa-user"></i>
			</a>
		</div>
	</div>
		  
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>{{ lang['server'] }}</h4>
				</div>
				<table class="table table-statistics">
					<tr>
						<td>{{ lang['os'] }}</td>
						<td>{{ php_os }}</td>
					</tr>
					<tr>
						<td>{{ lang['php_version'] }}</td>
						<td>{{ php_version }}</td>
					</tr>
					<tr>
						<td>{{ lang['mysql_version'] }}</td>
						<td>{{ mysql_version }}</td>
					</tr>
					<tr>
						<td>{{ lang['gd_version'] }}</td>
						<td>{{ gd_version }}</td>
					</tr>
					<tr>
						<td>{{ lang['pdo_support'] }}</td>
						<td>{{ pdo_support }}</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Next Generation CMS<span id="needUpdate" class="badge bg-success pull-right">loading..</span></h4>
                </div>
                <table class="table table-statistics">
                    <tr>
                        <td>{{ lang['current_version'] }}</td>
                        <td>{{ currentVersion }} [ {{engineVersionBuild}} ]</td>
                    </tr>
                    <tr>
                        <td>{{ lang['lastRelease'] }}</td>
                        <td><span id="lastRelease">loading..</span></td>
                    </tr>
                    {% if(perm.coreSystemUpdate) %}
                    <tr>
                        <td>{{ lang['git_version'] }}</td>
                        <td><span id="lastCommit">loading..</span></td>
                    </tr>
                    {% endif %}
                    <!--tr>
                        <td>{{ lang.lastCommit }}</td>
                        <td><span id="lastCommit">loading..</span></td>
                    </tr-->
                </table>
            </div>
        </div>
    </div>
	
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>{{ lang['size'] }}</h4>
				</div>
				<table class="table table-statistics">
					<thead>
						<tr>
							<th>{{ lang['group'] }}</th>
							<th>{{ lang['amount'] }}</th>
							<th>{{ lang['volume'] }}</th>
							<th>{{ lang['permissions'] }}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>{{ lang['group_images'] }}</td>
							<td>{{ image_amount }}</td>
							<td>{{ image_size }}</td>
							<td>{{ image_perm }}</td>
						</tr>
						<tr>
							<td>{{ lang['group_files'] }}</td><td>{{ file_amount }}</td><td>{{ file_size }}</td><td> &nbsp; {{ file_perm }}</td>
						</tr>
						<tr>
							<td>{{ lang['group_photos'] }}</td><td>{{ photo_amount }}</td><td>{{ photo_size }}</td><td>&nbsp; {{ photo_perm }}</td>
						</tr>
						<tr><td>{{ lang['group_avatars'] }}</td><td>{{ avatar_amount }}</td><td>{{ avatar_size }}</td><td> &nbsp; {{ avatar_perm }}</td></tr>
						<tr><td>{{ lang['group_backup'] }}</td><td>{{ backup_amount }}</td><td>{{ backup_size }}</td><td> &nbsp; {{ backup_perm }}</td></tr>
						<tr>
						<td colspan="2">{{ lang['allowed_size'] }}</td>
						<td>{{ allowed_size }}</td>
						<td></td>
						</tr>
						<tr>
						<td colspan="2">{{ lang['mysql_size'] }}</td>
						<td>{{ mysql_size }}</td>
						<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>{{ lang['system'] }}</h4>
				</div>
				<table class="table table-statistics">
					<tr>
						<td>{{ lang['all_cats'] }}</td>
						<td>{{ categories }}</td>
					</tr>
					<tr>
						<td>{{ lang['all_news'] }}</td>
						<td><a href="?mod=news&status=1">{{ news_draft }}</a> / <a href="?mod=news&status=2">{{ news_unapp }}</a> / <a href="?mod=news&status=3">{{ news }}</a></td>
					</tr>
					<tr>
						<td>{{ lang['all_comments'] }}</td>
						<td>{{ comments }}</td>
					</tr>
					<tr>
						<td>{{ lang['all_users'] }}</td>
						<td>{{ users }}</td>
					</tr>
					<tr>
						<td>{{ lang['all_users_unact'] }}</td>
						<td>{{ users_unact }}</td>
					</tr>
					<tr>
						<td>{{ lang['all_images'] }}</td>
						<td>{{ images }}</td>
					</tr>
					<tr>
						<td>{{ lang['all_files'] }}</td>
						<td>{{ files }}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12">
			<div class="admin_note panel panel-default">
				<div class="panel-heading">
					<h4>{{ lang['note'] }}</h4>
				</div>
				<form method="post" action="admin.php?mod=statistics">
					<input type="hidden" name="action" value="save" >
					<div class="panel-body">
						<textarea name="note" class="form-control" rows="8"{% if (not admin_note) %}placeholder="{{ lang['no_notes'] }}"{% endif %}>{{ admin_note }}</textarea>
					</div>
					<div class="panel-footer">
						<button type="submit" class="btn btn-success">{{ lang['save_note'] }}</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade update-modal" tabindex="-1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Обновление системы <small id="timer"></small></h4>
        </div>
        <div class="modal-body">
            <p id="status-files">Формирование списка файлов ...</p>
            <ul id="table-files"></ul>
            <div class="progress">
                <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
            </div>
        </div>
        <div class="modal-footer">
            <code class="pull-left">{{ currentVersion }} <i class="fa fa-arrow-circle-right"></i> GIT</code>
            <button type="button" class="btn btn-default" data-dismiss="modal" disabled>Закрыть</button>
        </div>
    </div>
  </div>
</div>

<style>
.modal-title {
    color: #000;
}
#status-files {
    font-weight: bold;
}
#table-files {
    height: 18px;
    overflow-y: hidden;
    overflow-x: hidden;
    white-space: nowrap;
}
.progress {
    margin: 0;
}
</style>
<script>
$(function(){

    {% if(perm.coreSystemUpdate) %}
    $(document).on( 'click', '#compare', function() {
        var reqCompare = "https://api.github.com/repos/irbees2008/ngcms-core/compare/{{ currentVersion }}...master";
        requestJSON(reqCompare, function(json) {
            
            if(json.message == "Not Found") {
                $('#status-files').html('No Info Found');
                $.notify({message: 'No Info Found'},{type: 'info'});
            } else if (0 === json.total_commits) {
                $.notify({message: 'Нет изменений в версии GIT'},{type: 'info'});
            } else {
                timerShow('timer');
                $('.update-modal').modal({keyboard: false, backdrop: 'static', show: true});
                window.onbeforeunload = function (e) {
                    var e = e || window.event;
                    var message = "Обновление еще не завершено. Продолжить?";
                    if (typeof e == "undefined") e = window.event;
                    if (e) e.returnValue = message;
                    return message;
                }
                var div = $("#table-files"),
                    status = $('#status-files'),
                    progress = $('.progress .progress-bar');
                div.attr('class', 'list-unstyled text-primary');
                status.html('Выполняется обновление системных файлов. Пожалуйста, подождите ...');
                var files = json.files,
                    current = count = files.length,
                    thisError = false;

                $(files).each(function(index, value) {
                    var curURL = this.raw_url;
                    curURL = curURL.replace('github.com/irbees2008/ngcms-core/raw/', 'raw.githubusercontent.com/irbees2008/ngcms-core/');
                    var url = '{{ admin_url }}/rpc.php';
                    var method = 'core.system.update';
                    var params = {'token': '{{ token }}', 'url': curURL, 'name': this.filename, 'action': this.status};
                    $.reqJSON(url, method, params, function(data) {
                        if(data.status === 1) {
                            div.append('<li><samp>' + data.msg + '&nbsp;&nbsp;•&nbsp;&nbsp;' + data.file+'</samp></li>');
                        } else {
                            div.append('<li><samp class="text-danger">' + data.errorText + '</samp></li>');
                            thisError = true;
                        }
                        div.scrollTop(div.prop('scrollHeight'));
                        --current;
                        if (!current) {
                            if(!thisError) {
                                progress.css({'width': '100%'});
                                status.html('Обновление успешно завершено. Список измененных файлов системы:');
                            } else {
                                status.html('Обновление не удалось');
                            }
                            div.css({'padding': '4px 8px','border': '1px solid #e5e5e5','overflow-y': 'auto'})
                                .animate({height: '292px',}, 888, function() {
                                    $('.progress').slideUp(888);
                                    $('.update-modal .modal-footer button').removeAttr('disabled');
                                    $('#timer').removeAttr('id');
                                    window.onbeforeunload = function () {}
                                });
                        } else {
                            var percent = ( ((count - current)/count) * 100).toFixed(2) + '%';
                            progress.css({'width': percent});
                        }
                    });
                });

            }
        });
        return false;
    });
    {% endif %}

    var reqReleas = "https://api.github.com/repos/irbees2008/ngcms-core/releases/latest";

    requestJSON(reqReleas, function(json) {
        if(json.message == "Not Found") {
            $('#lastRelease').html("No Info Found");
        } else {
            var currentVersion = '{{ currentVersion }}';
            var engineVersionBuild = '{{ engineVersionBuild }}';
            var publish = json.published_at;
            if (currentVersion >= json.tag_name && engineVersionBuild >= publish.split('T')[0]) {
                $('#needUpdate').html('Обновление не требуется');
            } else {
                $('#needUpdate').html('Обновите CMS');
            }
            $('#lastRelease').html('<a href="'+ json.zipball_url +'">' + json.tag_name + '</a> [ ' + json.published_at.slice(0, 10) + ' ]');
        }
    });

    var reqCommit = "https://api.github.com/repos/irbees2008/ngcms-core/commits";

    requestJSON(reqCommit, function(json) {
        if(json.message == "Not Found") {
            $('#lastCommit').html("No Info Found");
        } else {
            /*$('#lastCommit').html('<a href="'+json[0].html_url+'" target="_blank">'+json[0].sha.slice(0, 7)+'</a> \
                <b>@</b> <a href="'+json[0].committer.html_url+'" target="_blank">'+json[0].committer.login+'</a> [ '+
                json[0].commit.author.date.slice(0, 10) + ' ]');*/
            $('#lastCommit').html('<a href="#" id="compare">Обновить до Git</a> [ '+json[0].commit.author.date.slice(0, 10) + ' ]');
        }
    });
    function requestJSON(url, callback) {
        $.ajax({
            url: url,
            beforeSend: function(jqXHR) {
                jqXHR.overrideMimeType("application/json; charset=UTF-8");
                // Repeat send header ajax
                jqXHR.setRequestHeader("X-Requested-With", "XMLHttpRequest");
            },
        })
        .done(function(data, textStatus, jqXHR) {
            if (typeof(data) == 'object') {
                callback.call(null, data);
            } else {
                $.notify({message: '<i><b>Bad reply from server</b></i>'},{type: 'danger'});
            }
        })
        .catch(function(jqXHR) {
            if (0  ===  jqXHR.status || jqXHR.status >= 400)
                $.notify({message: '<i><b>Bad reply from server</b></i>'},{type: 'danger'});
        });
    }
});
</script>
