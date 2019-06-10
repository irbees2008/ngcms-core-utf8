<!-- Navigation bar -->
<ul class="breadcrumb">
	<li><a href="admin.php">{{ lang['home'] }}</a></li>
	<li><a href="admin.php?mod=users">{{ lang['users'] }}</a></li>
	<li class="active">{{ lang['permissions'] }}</li>
</ul>

<!-- Info content -->
<div class="page-main">
	<form id="permSubmit" name="permSubmit" method="post">
		<input type="hidden" name="save" value="1" />
		<input type="hidden" name="token" value="{{ token }}" />

		<!-- Group menu header -->
		<ul class="nav nav-tabs nav-justified">
			{% for group in GRP %}
			<li {% if (loop.index == 1) %}class="active"{% endif %}><a href="#userTabs-{{ group.id }}" data-toggle="tab" aria-expanded="{% if (loop.index == 1) %}true{% else %}false{% endif %}">{{ group.title }}</a></li>
			{% endfor %}
		</ul>
		<div id="userTabs" class="tab-content">
			<!-- Group content header -->
			{% for group in GRP %}
			<!-- Content for group [{{ group.id }}] {{ group.title }} -->
			<div id="userTabs-{{ group.id }}" class="tab-pane {% if (loop.index == 1) %} active in{% endif %}">
				<h3>{{ lang['permissions_for_user_group'] }}: {{ group.title }}</h3>
				
				{% for block in CONFIG %}
				<div class="pconf">
					<h3>{{ block.title }}</h3>
					{% if (block.description) %}<p>{{ block.description }}</p>{% endif %}

					{% for area in block.items %}
						<div class="panel panel-default panel-table">
							<div class="panel-heading">
								<h4>{{ area.title }}</h4>
								{% if (area.description) %}<p>{{ area.description }}</p>{% endif %}
							</div>
							<div class="panel-body table-responsive">
								<table class="table table-condensed">
									<thead>
										<tr class="contHead"><td><b>#ID</b></td><td><b>{{ lang['description'] }}</b></td><td width="90"><b>{{ lang['access'] }}</b></td></td>
									</thead>
									<tbody>
										{% for entry in area.items %}
										<tr>
											<td width="20%">{{entry.id}}</td>
											<td>{{ entry.title }}</td>
											<td width="20%">
												<select name="{{ entry.name }}|{{group.id}}" onchange="onUpdatePerm('{{ entry.name }}|{{group.id}}');" value="{% if isSet(entry.perm[group.id]) %}{% if (entry.perm[group.id]) %}1{% else %}0{% endif %}{% else %}-1{% endif %}">
													<option value="-1">--</option>
													<option value="0"{% if (isSet(entry.perm[group.id]) and (not entry.perm[group.id])) %} selected="selected"{% endif %}>{{ lang['noa'] }}</option>
													<option value="1"{% if (isSet(entry.perm[group.id]) and (entry.perm[group.id])) %} selected="selected"{% endif %}>{{ lang['yesa'] }}</option>
												</select>
											</td>
										</tr>
										{% endfor %}
									</tbody>
								</table>
							</div>
						</div>
					{% endfor %}
				</div>
				{% endfor %}
			</div>
			<!-- /Content for group [{{ group.id }}] {{ group.title }} -->
			{% endfor %}
		</div>
		<div class="well text-center">
			<input type="submit" value="{{ lang['save'] }}" class="btn btn-success" onclick="return onUpdateSubmit();"/>
		</div>
	</form>
</div>

<script>
var permDefault = {{ DEFAULT_JSON }};

function onUpdatePerm(name) {
 var f = document.getElementById('permSubmit');
 var v = permDefault[name];

 if (f[name].value != v) {
 	f[name].className = 'pChanged';
 } else {
 	f[name].className = '';
 }
 //alert(f[name].value);
}

function onUpdateSubmit() {
 return true;

 var f = document.getElementById('permSubmit');
 for (var i = 0; i < f.elements.length; i++) {
 	if (f.elements[i].value != permDefault[f.elements[i].name]) {
		alert(f.elements[i].name+': '+permDefault[f.elements[i].name]+ ' => '+f.elements[i].value);
	}
 	if (i > 10) { break; }
 }
}
</script>
