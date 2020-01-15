<!-- Page Header -->
<header class="intro-header" style="background-image: url('{{ tpl_url }}/img/home-bg.jpg')">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="post-heading">
					<h1>{{ user.name }}</h1>
					<hr class="small">
					<span class="subheading">{{ lang.uprofile['profile_of'] }}</span>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- Page Content -->
<div class="container">
	<div class="row justify-content-center">
		<div class="col-lg-8 col-md-10">
			<div class="row">
				<div class="col-md-3 text-center">
					<a href="{{ user.avatar }}" target="_blank"><img src="{{ user.avatar }}" alt="{{ user.name }}" class="img-circle img-responsive" /></a>
					{% if (user.flags.hasPhoto) %}<a href="{{ user.photo }}" target="_blank"><img src="{{ user.photo_thumb }}" alt="{{ user.name }}" class="img-circle img-responsive" /></a>{% endif %}
					{% if not (global.user.status == 0) and not (user.flags.isOwnProfile) and pluginIsActive('pm') %}
						<p><a href="{{ home }}/plugin/pm/?action=write&name={{ user.name }}" class="btn btn-primary"><i class="fa fa-envelope"></i> {{ lang.uprofile['write_pm'] }}</a></p>
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
								<td>{{ lang.uprofile['site'] }}</td><td>{{ user.site }}</td>
							</tr>
							<tr>
								<td>{{ lang.uprofile['icq'] }}</td><td>{{ user.icq }}</td>
							</tr>
							<tr>
								<td>{{ lang.uprofile['from'] }}</td><td>{{ user.from }}</td>
							</tr>
							<tr>
								<td colspan="2">{{ lang.uprofile['about'] }}<br /><br />{{ user.info }}</td>
							</tr>
							{% if (user.flags.isOwnProfile) %}
							<tr>
								<td>&nbsp;</td>
                                <td><a href="{{ home }}/profile.html" class="btn btn-primary">{{ lang.uprofile['edit_profile'] }}</a></td>
							</tr>
							{% endif %}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
