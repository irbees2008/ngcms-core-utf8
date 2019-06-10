<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{l_home}</a></li>
	<li class="active">{l_edit_comment}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<!-- Main content form -->
	<form name="form" action="admin.php?mod=editcomments" method="post" class="form-horizontal">
		<input type="hidden" name="newsid" value="{newsid}" />
		<input type="hidden" name="comid" value="{comid}" />
		<input type="hidden" name="poster" value="{author}" />
		<input type="hidden" name="subaction" value="doeditcomment" />
		
		<div class="row">
			<div class="col col-sm-8">
				<!-- MAIN CONTENT -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">{l_maincontent}</h4>
					</div>
					<div class="panel-body">
						<div id="maincontent">
							<div class="form-group">
								<label class="col-sm-3">{l_comment}</label>
								<div class="col-sm-9">
									<textarea name="comment" rows="4" class="form-control">{text}</textarea>
								</div>
							</div>
							<div class="form-group" id="fullwidth">
								<label class="col-sm-3">{l_answer}</label>
								<div class="col-sm-9">
									{quicktags}
									<div class="btn-group btn-group-justified smiles" data-toggle="buttons">
										{smilies}
									</div>
									<textarea id="content" name="content" rows="4" class="form-control">{answer}</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-3"></div>
								<div class="col-sm-9">
									<label for="send">
										<input type="checkbox" id="send" name="send_notice" value="send_notice" />&nbsp;
										{l_send_notice}
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-3">
								
							</div>
							<div class="col-sm-9">
								<button type="button" title="{l_delete}" onClick="confirmIt('admin.php?mod=editcomments&subaction=deletecomment&newsid={newsid}&comid={comid}&poster={author}', '{l_sure_del}')" class="btn btn-danger pull-right"><i class="fa fa-trash-o"></i></button>
								<button type="submit" title="{l_save} (Ctrl+S)" tabindex="5" class="btn btn-success">{l_save}</button>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
			<!-- Right edit column -->
			<div id="rightBar" class="col col-sm-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">{l_additional}</h4>
					</div>
					<table class="table table-condensed">
						<tbody>
							<tr>
								<td>{l_date}</td>
								<td>{comdate}</td>
							</tr>
							<tr>
								<td>{l_name}</td>
								<td>{author}</td>
							</tr>
							<tr>
								<td>{l_email}</td>
								<td><input type="text" name="mail" value="{mail}" class="form-control"/></td>
							</tr>
							<tr>
								<td>{l_ip}</td>
								<td>
									<b>{ip}</b>
									<div class="pull-right">
										<a href="http://www.nic.ru/whois/?ip={ip}" target="_blank" class="btn-sm btn-default"><i class="fa fa-eye"></i></a>&nbsp;
										<a href="admin.php?mod=ipban&iplock={ip}" target="_blank" class="btn-sm btn-default"><i class="fa fa-ban"></i></a>&nbsp;
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
</div>

<script>
document.onkeydown = function(e) {
  e = e || event;

  if (e.ctrlKey && e.keyCode == 'S'.charCodeAt(0)) {
    form.submit();
    return false;
  }
}
</script>