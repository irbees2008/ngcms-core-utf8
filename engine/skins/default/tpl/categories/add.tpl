<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=categories">{{ lang['categories_title'] }}</a></li>
	<li class="active">{{ lang['addnew'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<form action="admin.php?mod=categories" method="post" enctype="multipart/form-data">
		<input type="hidden" name="token" value="{{ token }}" />
		<input type="hidden" name="action" value="doadd" />
		
		<table class="table table-condensed">
			<tr>
				<td width="50%">{{ lang['show_main'] }}</td>
				<td width="50%">
					<label class="btn btn-default form-control">
						<input type="checkbox" autocomplete="off" id="cat_show" name="cat_show" value="1" checked>
					</label>
				</td>
			</tr>
			<tr>
				<td width="50%">{{ lang['parent'] }}</td>
				<td width="50%">{{ parent }}</td>
			</tr>
			<tr>
				<td width="50%">{{ lang['title'] }}</td>
				<td width="50%"><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td width="50%">{{ lang['alt_name'] }}</td>
				<td width="50%"><input type="text" name="alt" /></td>
			</tr>
			{% if (flags.haveMeta) %}
			<tr>
				<td width="50%">{{ lang['cat_desc'] }}</td>
				<td width="50%"><input type="text" name="description" /></td>
			</tr>
			<tr>
				<td width="50%">{{ lang['cat_keys'] }}</td>
				<td width="50%"><input type="text" name="keywords" /></td>
			</tr>
			{% endif %}
			<tr>
				<td width="50%">{{ lang['cat_number'] }}</td>
				<td width="50%"><input type="text" size="4" name="number" /></td>
			</tr>
			<tr>
				<td width="50%">{{ lang['show.link'] }}</td>
				<td width="50%">
				<select name="show_link">
					<option value="0">{{ lang['link.always'] }}</option>
					<option value="1">{{ lang['link.ifnews'] }}</option>
					<option value="2">{{ lang['link.never'] }}</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="50%">{{ lang['cat_tpl'] }}</td>
				<td width="50%"><select name="tpl">{{ tpl_list }}</select></td>
			</tr>
			<tr>
				<td width="70%">{{ lang['template_mode'] }}</td>
				<td width="30%"><select name="template_mode">{{ template_mode }}</select></td>
			</tr>
			<tr>
				<td width="50%">{{ lang['icon'] }}<br/><small>{{ lang['icon#desc'] }}</small></td>
				<td width="50%"><input type="text" name="icon" maxlength="255" /></td>
			</tr>
			<tr>
				<td width="70%">{{ lang['attached_icon'] }}<br/><small>{{ lang['attached_icon#desc'] }}</small></td>
				<td width="30%">
					<div class="btn btn-default btn-fileinput form-control">
						<span><i class="fa fa-plus"></i> {l_attach.new}</span>
						<input type="file" name="image" id="image" onchange="validateFile(this);">
					</div>
				</td>
			</tr>
			<tr>
				<td width="50%">{{ lang['alt_url'] }}</td>
				<td width="50%"><input type=text name="alt_url" /></td>
			</tr>
			<tr>
				<td width="50%">{{ lang['orderby'] }}</td>
				<td width="50%">{{ orderlist }}</td>
			</tr>
			<tr>
				<td width="70%" valign="top">{{ lang['category.info'] }}<br/><small>{{ lang['category.info#desc'] }}</small></td>
				<td width="30%"><textarea id="info" name="info" cols="70" rows="5"></textarea></td>
			</tr>
				{{ extend }}
		</table>

		<div class="well text-center">
			<input type="submit" value="{{ lang['addnew'] }}" class="btn btn-success">
		</div>
	</form>
</div>
