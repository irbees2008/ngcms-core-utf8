<h2>Р РЋР С•РЎР‚РЎвЂљР С‘РЎР‚Р С•Р Р†Р С”Р В° Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р ВµР в„–</h2>
<form id="userlist" method="post" action="">
	<table class="table">
		<tr>
			<th colspan="2">Р Р€Р С”Р В°Р В¶Р С‘РЎвЂљР Вµ Р Р…Р ВµР С•Р В±РЎвЂ¦Р С•Р Т‘Р С‘Р С�РЎвЂ№Р Вµ Р С—Р В°РЎР‚Р В°Р С�Р ВµРЎвЂљРЎР‚РЎвЂ№ РЎРѓР С•РЎР‚РЎвЂљР С‘РЎР‚Р С•Р Р†Р С”Р С‘</th>
		</tr>
		<tr>
			<td>Р пїЅР С�РЎРЏ:</td>
			<td><input type="text" name="username" value="{{ username }}" size="25"/></td>
		</tr>
		<tr>
			<td>Р вЂњРЎР‚РЎС“Р С—Р С—Р В°:</td>
			<td>
				<select name="show_group">
					<option value="-1" {% if (show_group_) %}selected{% endif %}>
						Р вЂ™РЎРѓР Вµ Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р С‘
					</option>
					<option value="1" {% if (show_group_1) %}selected{% endif %}>
						Р С’Р Т‘Р С�Р С‘Р Р…Р С‘РЎРѓРЎвЂљРЎР‚Р В°РЎвЂљР С•РЎР‚РЎвЂ№
					</option>
					<option value="2" {% if (show_group_2) %}selected{% endif %}>
						Р В Р ВµР Т‘Р В°Р С”РЎвЂљР С•РЎР‚РЎвЂ№
					</option>
					<option value="3" {% if (show_group_3) %}selected{% endif %}>
						Р вЂ“РЎС“РЎР‚Р Р…Р В°Р В»Р С‘РЎРѓРЎвЂљРЎвЂ№
					</option>
					<option value="4" {% if (show_group_4) %}selected{% endif %}>
						Р С™Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎвЂљР С•РЎР‚РЎвЂ№
					</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Р РЋР С•РЎР‚РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°РЎвЂљРЎРЉ Р С—Р С•:</td>
			<td>
				<select name="sort_by">
					<option value="username" {% if (sort_by_username) %}selected{% endif %}>
						Р пїЅР С�РЎРЏ
					</option>
					<option value="registered" {% if (sort_by_registered) %}selected{% endif %}>
						Р вЂ”Р В°РЎР‚Р ВµР С–Р С‘РЎРѓРЎвЂљРЎР‚Р С‘РЎР‚Р С•Р Р†Р В°Р Р…
					</option>
					<option value="num_posts" {% if (sort_by_num_posts) %}selected{% endif %}>
						Р С™Р С•Р В»-Р Р†Р С• Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–
					</option>
					<option value="num_comments" {% if (sort_by_num_comments) %}selected{% endif %}>
						Р С™Р С•Р В»-Р Р†Р С• Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р ВµР Р†
					</option>

					{% if pluginIsActive('xfields') %}
						<!-- РЎРѓР С—Р С‘РЎРѓР С•Р С” Р Т‘Р С•Р С—. Р С—Р С•Р В»Р ВµР в„– -->
						{% for xf in xflist %}
							<option value="{{ xf.id }}" {% if (sort == xf.id) %}selected{% endif %}>
								{{ xf.title }}
							</option>
						{% endfor %}
					{% endif %}
				</select>
			</td>
		</tr>
		<tr>
			<td>Р Р€Р С—Р С•РЎР‚РЎРЏР Т‘Р С•РЎвЂЎР С‘РЎвЂљРЎРЉ Р С—Р С•:</td>
			<td>
				<select name="sort_dir">
					<option value="ASC" {% if (sort_dir_ASC) %}selected{% endif %}>
						Р вЂ™Р С•Р В·РЎР‚Р В°РЎРѓРЎвЂљР В°Р Р…Р С‘РЎР‹
					</option>
					<option value="DESC" {% if (sort_dir_DESC) %}selected{% endif %}>
						Р Р€Р В±РЎвЂ№Р Р†Р В°Р Р…Р С‘РЎР‹
					</option>
				</select>
			</td>
		</tr>
	</table>
	<input class="btn" type="submit" name="submit" value="Р С›РЎвЂљР С—РЎР‚Р В°Р Р†Р С‘РЎвЂљРЎРЉ"/>
	<input class="btn" type="submit" name="reset" value="Р РЋР В±РЎР‚Р С•РЎРѓ"/>
</form>

<div id="users1">
	<h2>Р СџР С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р С‘</h2>
	<table class="table">
		<tr>
			<th>Р пїЅР С�РЎРЏ</th>

			{% if pluginIsActive('xfields') %}
				<!-- Р В·Р В°Р С–Р С•Р В»Р С•Р Р†Р С”Р С‘ Р Т‘Р С•Р С—. Р С—Р С•Р В»Р ВµР в„– -->
				{% for xf in xflist %}
					<th>{{ xf.title }}</th>
				{% endfor %}
			{% endif %}

			<th>Р С›РЎвЂљР С”РЎС“Р Т‘Р В°</th>
			<th>Р СњР С•Р Р†Р С•РЎРѓРЎвЂљР ВµР в„–</th>
			<th>Р С™Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р ВµР Р†</th>
			<th>Р вЂ”Р В°РЎР‚Р ВµР С–Р С‘РЎРѓРЎвЂљРЎР‚Р С‘РЎР‚Р С•Р Р†Р В°Р Р…</th>
			<th>Р СџР С•РЎРѓР В»Р ВµР Т‘Р Р…Р С‘Р в„– Р Р†РЎвЂ¦Р С•Р Т‘</th>
		</tr>
		{% for entry in entries %}
			<tr>
				<td><a href='{{ entry.profile_link }}'>{{ entry.profile }}</a></td>

				{% if pluginIsActive('xfields') %}
					<!-- РЎРѓР С•Р Т‘Р ВµРЎР‚Р В¶Р С‘Р С�Р С•Р Вµ Р Т‘Р С•Р С—. Р С—Р С•Р В»Р ВµР в„– -->
					{% for xf in entry.xfields %}
						<td>{{ xf }}</td>
					{% endfor %}
				{% endif %}

				<td>{{ entry.from }}</td>
				<td>{{ entry.news }}</td>
				<td>{{ entry.com }}</td>
				<td>{{ entry.reg|date("d-m-Y h:i") }}</td>
				<td>
					{% if (entry.last != 0) %}
						{{ entry.last|date("d-m-Y h:i") }}
					{% else %}
						Р Р…Р Вµ Р В±РЎвЂ№Р В» Р Р…Р С‘ РЎР‚Р В°Р В·РЎС“
					{% endif %}
				</td>
			</tr>
		{% else %}
			<tr>
				<td colspan="4">Р СџР С• Р Р†Р В°РЎв‚¬Р ВµР С�РЎС“ Р В·Р В°Р С—РЎР‚Р С•РЎРѓРЎС“ Р Р…Р С‘РЎвЂЎР ВµР С–Р С• Р Р…Р Вµ Р Р…Р В°Р в„–Р Т‘Р ВµР Р…Р С•.</td>
			</tr>
		{% endfor %}
	</table>
</div>

{% if (pages.true) %}
	<p>
		{% if (prevlink.true) %} {{ prevlink.link }} {% endif %}
		{{ pages.print }}
		{% if (nextlink.true) %} {{ nextlink.link }} {% endif %}
	</p>
{% endif %}
