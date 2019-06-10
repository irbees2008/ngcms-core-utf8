<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=categories">{{ lang['categories_title'] }}</a></li>
	<li class="active">{{ lang['editing'] }} <b>{{ name }}</b></li>
</ul>

<!-- Info content -->
<div class="page-main">
	<form action="admin.php?mod=categories" method="post" enctype="multipart/form-data">
		<input type="hidden" name="token" value="{{ token }}" />
		<input type="hidden" name="action" value="doedit" />
		<input type="hidden" name="catid" value="{{ catid }}" />

		<table class="table table-condensed">
			<tr>
				<td width="70%">{{ lang['show_main'] }}</td>
				<td width="30%">
					<label class="btn btn-default form-control">
						<input type="checkbox" autocomplete="off" id="cat_show" name="cat_show" value="1" {% if flags.showInMenu %}checked="checked" {% endif %}>
					</label>
				</td>
			</tr>
			<tr>
				<td width="70%">{{ lang['parent'] }}</td>
				<td width="30%">{{ parent }}</td>
			</tr>
			<tr>
				<td width="70%">{{ lang['title'] }}</td>
				<td width="30%"><input value="{{ name }}" type=text size="40" name="name" /></td>
			</tr>
			<tr>
				<td width="70%">{{ lang['alt_name'] }}</td>
				<td width="30%"><input value="{{ alt }}" type=text size="40" name="alt" /></td>
			</tr>
			{% if flags.haveMeta %}
			<tr>
				<td width="70%">{{ lang['cat_desc'] }}</td>
				<td width="30%"><input type="text" size="40" name="description" value="{{ description }}" /></td>
			</tr>
			<tr>
				<td width="70%">{{ lang['cat_keys'] }}</td>
				<td width="30%"><input type="text" size="40" name="keywords" value="{{ keywords }}" /></td>
			</tr>
			{% endif %}
			<tr>
				<td width="70%">{{ lang['cat_number'] }}</td>
				<td width="30%"><input type="text" size="4" name="number" value="{{ number }}" /></td>
			</tr>
			<tr>
				<td width="70%">{{ lang['show.link'] }}</td>
				<td width="30%"><select name="show_link">{{ show_link }}</select></td>
			</tr>
			<tr>
				<td width="70%">{{ lang['cat_tpl'] }}</td>
				<td width="30%"><select name="tpl">{{ tpl_list }}</select></td>
			</tr>
			<tr>
				<td width="70%">{{ lang['template_mode'] }}</td>
				<td width="30%"><select name="template_mode">{{ template_mode }}</select></td>
			</tr>
			<tr>
				<td width="70%">{{ lang['icon'] }}<br/><small>{{ lang['icon#desc'] }}</small></td>
				<td width="30%"><input type="text" size="40" name="icon" value="{{ icon }}" maxlength="255" /></td>
			</tr>
			<tr>
			<td width="70%">{{ lang['attached_icon'] }}<br/><small>{{ lang['attached_icon#desc'] }}</small></td>
			<td width="30%">
				{% if flags.haveAttach %}
				<div id="previewImage" class="text-center form-group">
					<img src="{{ attach_url }}"/>
				</div>
				<div class="form-group">
					<label for="image_del"class="btn btn-danger form-control" title="">
						<input type="checkbox" autocomplete="off" id="image_del" name="image_del" value="1">
						{{ lang['delete_icon'] }}
					</label>
				</div>
				{% endif %}
				<div class="btn btn-default btn-fileinput form-control">
					<span><i class="fa fa-plus"></i> {l_attach.new}</span>
					<input type="file" name="image" id="image" onchange="validateFile(this);">
				</div>
			</td>
			</tr>
			<tr>
				<td width="70%">{{ lang['alt_url'] }}</td>
				<td width="30%"><input value="{{ alt_url }}" type=text size="40" name="alt_url" /></td>
			</tr>
			<tr>
				<td width="70%">{{ lang['orderby'] }}</td>
				<td width="30%">{{ orderlist }}</td>
			</tr>
			<tr>
				<td width="70%" valign="top">{{ lang['category.info'] }}<br/><small>{{ lang['category.info#desc'] }}</small></td>
				<td width="30%"><textarea id="info" name="info" cols="70" rows="5">{{ info }}</textarea></td>
			</tr>
			{{ extend }}
		</table>
		
		<div class="well text-center">
			{% if flags.canModify %}<input type="submit" value="{{ lang['save'] }}" class="btn btn-success">{% endif %}
		</div>
	</form>
</div>
