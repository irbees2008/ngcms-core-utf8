<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li class="active">{{ lang['categories_title'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<!-- List of categories: BEGIN -->
	<div class="panel panel-default panel-table">
		<div class="panel-heading text-right">
			{% if (flags.canModify) %}
				<a href="admin.php?mod=categories&action=add" title="{{ lang['addnew'] }}" class="btn btn-success"><i class="fa fa-plus"></i> </a>
			{% endif %}
		</div>
		<form name="static" action="admin.php?mod=static" method="post">
			<input type="hidden" name="token" value="{{ token }}">
			
			<div class="panel-body table-responsive">
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th>ID</th>
							<th>{{ lang['title'] }}</th>
							<th>{{ lang['alt_name'] }}</th>
							<th>{{ lang['category.header.menushow'] }}</th>
							<th>{{ lang['category.header.template'] }}</th>
							<th>{{ lang['news'] }}</th>
							<th class="text-right">{{ lang['action'] }}</th>
						</tr>
					</thead>
					
					<tbody id="admCatList">
						{% include localPath(0)~"entries.tpl" %}
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<!-- List of categories: END -->
</div>

<script type="text/javascript" src="{{ scriptLibrary }}/ajax.js"></script>
<script type="text/javascript" src="{{ scriptLibrary }}/admin.js"></script>
<script type="text/javascript">
// Process RPC requests for categories
var categoryUToken = '{{ token }}';

function categoryModifyRequest(cmd, cid) {
	var rpcCommand = '';
	var rpcParams = [];
	switch (cmd) {
		case 'up':
		case 'down':
		case 'del':
			rpcCommand = 'admin.categories.modify';
			rpcParams = {'mode' : cmd, 'id' : cid, 'token' : categoryUToken };
			break;
	}
	if (rpcCommand == '') {
		$.notify({message: 'No RPC command'},{type: 'danger'});
		return false;

	}

	var linkTX = new sack();
	linkTX.requestFile = 'rpc.php';
	linkTX.setVar('json', '1');
	linkTX.setVar('methodName', rpcCommand);
	linkTX.setVar('params', json_encode(rpcParams));
	linkTX.method='POST';
	linkTX.onComplete = function() {
		if (linkTX.responseStatus[0] == 200) {
			try {
		 		resTX = eval('('+linkTX.response+')');
		 	} catch (err) {
				$.notify({message: '{{ lang['fmsg.save.json_parse_error'] }} '+linkTX.response},{type: 'danger'});
		 		return false;
		 	}

		 	// First - check error state
		 	if (!resTX['status']) {
				$.notify({message: resTX['errorCode']+': '+resTX['errorText']},{type: 'danger'});
		 	} else {
		 		if (resTX['content'] !== 'undefined') {
					if (resTX['infoText']) {
						$.notify({message: resTX['infoText']},{type: resTX['infoCode']?'success':'danger'});
					}
		 			document.getElementById('admCatList').innerHTML = resTX['content'];
		 		} else {
					$.notify({message: 'Template error: no content received from server for update, server response: '+linkTX.response},{type: 'danger'});
		 		}
		 	}
	 } else {
		$.notify({message: '{{ lang['fmsg.save.httperror'] }} '+linkTX.responseStatus[0]},{type: 'danger'});
	 }
	}
	linkTX.runAJAX();

	return false;
}
</script>
