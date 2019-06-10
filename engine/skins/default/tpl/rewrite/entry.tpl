<tr id="re.row.{id}">
	<td id="re.{id}.id">{id}</td>
	<td id="re.{id}.pluginName" width="70px">{pluginName}</td>
	<td id="re.{id}.handlerName" width="80px">{handlerName}</td>
	<td id="re.{id}.description">{description}</td>
	<td id="re.{id}.regex">{regex}</td>
	<td id="re.{id}.flags">{flags}</td>
	<td>
		<button type="button" class="btn btn-default" onclick="reMoveUp({id}); return false;"><i class="fa fa-arrow-up"></i></button>
		<button type="button" class="btn btn-default" onclick="reMoveDown({id}); return false;"><i class="fa fa-arrow-down"></i></button>
		<button id="btn.{id}" type="button" class="btn btn-default" onclick="reEditRow({id});"><i class="fa fa-pencil"></i></button>
		<button id="btn.del.{id}" type="button" class="btn btn-danger" onclick="reDeleteRow({id});"><i class="fa fa-trash-o"></i></button>
	</td>
</tr>
