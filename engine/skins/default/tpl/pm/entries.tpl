<tr>
	<td><input type="checkbox" name="selected_pm[]" value="{pmid}"/></td>
	<td>{link}</td>
	<td><a href="admin.php?mod=pm&action=read&pmid={pmid}">{title}</a></td>
	<td>{viewed}</td>
	<td>{pmdate}</td>
	<td class="text-right">
		<a href="admin.php?mod=pm&action=reply&pmid={pmid}" title="{l_reply}" class="btn btn-default edit_form"><i class="fa fa-reply"></i></a>
		<a href="admin.php?mod=pm&action=delete&selected_pm[]={pmid}" title="{l_delete}"  onClick="confirmIt('admin.php?mod=pm&action=delete&selected_pm[]={pmid}', '{l_sure_del}'); return false;"class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
	</td>
</tr>
