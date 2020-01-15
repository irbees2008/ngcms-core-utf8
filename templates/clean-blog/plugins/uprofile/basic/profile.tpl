<!-- Page Header -->
<header class="intro-header" style="background-image: url('{{ tpl_url }}/img/home-bg.jpg')">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="post-heading">
					<h1>{{ user.name }}</h1>
					<hr class="small">
					<span class="subheading">{{ lang.uprofile['header.edit'] }}</span>
				</div>
			</div>
		</div>
	</div>
</header>

<!-- Page Content -->
<div class="container">
	<div class="row justify-content-center">
		<div class="col-lg-8 col-md-10">
			<form id="profileForm" action="{{ form_action }}" method="post" enctype="multipart/form-data" class="form-horizontal">
				<input type="hidden" name="token" value="{{ token }}" />

				<div class="row">
					<div class="col-md-3 text-center">
						{% if (flags.avatarAllowed) %}
							<a href="{{ user.avatar }}" target="_blank"><img src="{{ user.avatar }}" alt="{{ user.name }}" class="img-circle img-responsive" /></a>
							{% if (user.flags.hasAvatar) %}
								<p class="checkbox"><label><input type="checkbox" name="delavatar" id="delavatar" /> {{ lang.uprofile['avatar_delete'] }}</label></p>
							{% endif %}
						{% endif %}

						{% if (flags.photoAllowed and user.flags.hasPhoto) %}
							<a href="{{ user.photo }}" target="_blank"><img src="{{ user.photo_thumb }}" alt="{{ user.name }}" class="img-circle img-responsive" /></a>
							<p class="checkbox"><label><input type="checkbox" name="delphoto" id="delphoto" /> {{ lang.uprofile['photo_delete'] }}</label></p>
						{% endif %}
					</div>

					<div class="col-md-9"> 
						<table class="table table-user-information">
							<tbody>
                                <tr>
                                    <td>{{ lang.uprofile['status'] }}</td><td>{{ user.status }}</td>
                                </tr>
                                <tr>
                                    <td>{{ lang.uprofile['regdate'] }}</td><td>{{ user.reg }}</td>
                                </tr>
                                <tr>
                                    <td>{{ lang.uprofile['last'] }}</td><td>{{ user.last }}</td>
                                </tr>
                                <tr>
                                    <td>{{ lang.uprofile['all_news'] }}</td><td>{{ user.news }}</td>
                                </tr>
                                <tr>
                                    <td>{{ lang.uprofile['all_comments'] }}</td><td>{{ user.com }}</td>
                                </tr>
								<tr>
									<td><label class="control-label">{{ lang.uprofile['site'] }}</label></td><td><input type="text" name="editsite" value="{{ user.site }}" class="form-control input-sm" /></td>
								</tr>
								<tr>
									<td><label class="control-label">{{ lang.uprofile['icq'] }}</label></td><td><input type="text" name="editicq" value="{{ user.icq }}" class="form-control input-sm" /></td>
								</tr>
								<tr>
									<td><label class="control-label">{{ lang.uprofile['from'] }}</label></td><td><input type="text" name="editfrom" value="{{ user.from }}" class="form-control" /></td>
								</tr>
								<tr>
									<td><label class="control-label">{{ lang.uprofile['about'] }}</label></td><td><textarea name="editabout" id="editabout" rows="5" class="form-control" {% if (info_sizelimit > 0) %} maxlength="{about_sizelimit}" {% endif %}>{{ user.info }}</textarea>
									{% if (info_sizelimit > 0) %}<span class="help-block">{{ lang.uprofile['sizelimit_min'] }} {{ lang.uprofile['characters'] }}: <b id="sizelimit_text">{about_sizelimit}</b></span>{% endif %}</td>
								</tr>
								{% if (flags.avatarAllowed) %}
									<tr>
										<td><label class="control-label">{{ lang.uprofile['avatar_upload'] }}</label></td><td><input type="file" name="newavatar" class="upload" /></td>
									</tr>
								{% else %}
									<tr>
										<td><label class="control-label">{{ lang.uprofile['avatar'] }}</label></td><td>{{ lang.uprofile['avatars_denied'] }}</td>
									</tr>
								{% endif %}
								{% if (flags.photoAllowed) %}
									<tr>
										<td><label class="control-label">{{ lang.uprofile['photo_upload'] }}</label></td><td><input type="file" name="newphoto" class="upload" /></td>
									</tr>
								{% else %}
									<tr>
										<td><label class="control-label">{{ lang.uprofile['photo'] }}</label></td><td>{{ lang.uprofile['photos_denied'] }}</td>
									</tr>
								{% endif %}
								{% if pluginIsActive('xfields') %}
									{{ plugin_xfields_0 }}
									{{ plugin_xfields_1 }}
								{% endif %}
								<tr>
									<td><label class="control-label">{{ lang.uprofile['email'] }}</label></td><td><input type="text" name="editmail" value="{{ user.email }}" class="form-control input-sm" /></td>
								</tr>
								<tr>
									<td><label class="control-label">{{ lang.uprofile['new_pass'] }}</label></td>
									<td><input type="password" name="editpassword" class="form-control input-sm" onclick="$('#oldpass').css('display', '');" onchange="$('#oldpass').css('display', '');" /></td>
								</tr>
								<tr id="oldpass" style="display:none;">
									<td><label class="control-label">{{ lang.uprofile['oldpass'] }}</label></td>
									<td><input type="password" name="oldpass" value="" class="form-control input-sm" />
									<span class="help-block">{{ lang.uprofile['oldpass#desc'] }}</span></td>
								</tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td><input type="submit" onclick="return validate_form();" value="{{ lang.uprofile['save'] }}" class="btn btn-success" /></td>
                                </tr>
							</tbody>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(function() {
		var sizelimit = {{ info_sizelimit }};
		if(sizelimit > 0 ) {
			calculateMaxLen($('#editabout'), $('#sizelimit_text'), sizelimit);
		}

		$('#editabout').on('click focus keyup', function(event) {
			if(sizelimit > 0 ) {
				calculateMaxLen($(this), $('#sizelimit_text'), sizelimit);
			}
		});
	});

	function validate_form() {
		var f = document.getElementById('profileForm');
		// ICQ
		var icq = f.editicq.value;
		if ((icq.length > 0)&&(! icq.match(/^\d{4,10}$/))) { 
			alert("{{ lang.uprofile['wrong_icq'] }}"); 
			return false; 
		}
		// Email
		var email = f.editmail.value;
		if ((email.length > 0) && (! emailCheck(email))) {
			alert("{{ lang.uprofile['wrong_email'] }}");
			return false;
		}
		// About
		var about = f.editabout.value;
		if (({{ info_sizelimit }} > 0) && (about.length > {{ info_sizelimit }})) {
			alert("{{ info_sizelimit_text }}");
			return false;	
		}
		return true;
	}
</script>