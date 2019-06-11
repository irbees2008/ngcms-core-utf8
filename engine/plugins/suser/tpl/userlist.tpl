<h2>РЎРѕСЂС‚РёСЂРѕРІРєР° РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№</h2>
<form id="userlist" method="post" action="">
	<table class="table">
		<tr>
			<th colspan="2">РЈРєР°Р¶РёС‚Рµ РЅРµРѕР±С…РѕРґРёРјС‹Рµ РїР°СЂР°РјРµС‚СЂС‹ СЃРѕСЂС‚РёСЂРѕРІРєРё</th>
		</tr>
		<tr>
			<td>Р�РјСЏ:</td>
			<td><input type="text" name="username" value="{{ username }}" size="25"/></td>
		</tr>
		<tr>
			<td>Р“СЂСѓРїРїР°:</td>
			<td>
				<select name="show_group">
					<option value="-1" {% if (show_group_) %}selected{% endif %}>
						Р’СЃРµ РїРѕР»СЊР·РѕРІР°С‚РµР»Рё
					</option>
					<option value="1" {% if (show_group_1) %}selected{% endif %}>
						РђРґРјРёРЅРёСЃС‚СЂР°С‚РѕСЂС‹
					</option>
					<option value="2" {% if (show_group_2) %}selected{% endif %}>
						Р РµРґР°РєС‚РѕСЂС‹
					</option>
					<option value="3" {% if (show_group_3) %}selected{% endif %}>
						Р–СѓСЂРЅР°Р»РёСЃС‚С‹
					</option>
					<option value="4" {% if (show_group_4) %}selected{% endif %}>
						РљРѕРјРјРµРЅС‚Р°С‚РѕСЂС‹
					</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>РЎРѕСЂС‚РёСЂРѕРІР°С‚СЊ РїРѕ:</td>
			<td>
				<select name="sort_by">
					<option value="username" {% if (sort_by_username) %}selected{% endif %}>
						Р�РјСЏ
					</option>
					<option value="registered" {% if (sort_by_registered) %}selected{% endif %}>
						Р—Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅ
					</option>
					<option value="num_posts" {% if (sort_by_num_posts) %}selected{% endif %}>
						РљРѕР»-РІРѕ РЅРѕРІРѕСЃС‚РµР№
					</option>
					<option value="num_comments" {% if (sort_by_num_comments) %}selected{% endif %}>
						РљРѕР»-РІРѕ РєРѕРјРјРµРЅС‚Р°СЂРёРµРІ
					</option>

					{% if pluginIsActive('xfields') %}
						<!-- СЃРїРёСЃРѕРє РґРѕРї. РїРѕР»РµР№ -->
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
			<td>РЈРїРѕСЂСЏРґРѕС‡РёС‚СЊ РїРѕ:</td>
			<td>
				<select name="sort_dir">
					<option value="ASC" {% if (sort_dir_ASC) %}selected{% endif %}>
						Р’РѕР·СЂР°СЃС‚Р°РЅРёСЋ
					</option>
					<option value="DESC" {% if (sort_dir_DESC) %}selected{% endif %}>
						РЈР±С‹РІР°РЅРёСЋ
					</option>
				</select>
			</td>
		</tr>
	</table>
	<input class="btn" type="submit" name="submit" value="РћС‚РїСЂР°РІРёС‚СЊ"/>
	<input class="btn" type="submit" name="reset" value="РЎР±СЂРѕСЃ"/>
</form>

<div id="users1">
	<h2>РџРѕР»СЊР·РѕРІР°С‚РµР»Рё</h2>
	<table class="table">
		<tr>
			<th>Р�РјСЏ</th>

			{% if pluginIsActive('xfields') %}
				<!-- Р·Р°РіРѕР»РѕРІРєРё РґРѕРї. РїРѕР»РµР№ -->
				{% for xf in xflist %}
					<th>{{ xf.title }}</th>
				{% endfor %}
			{% endif %}

			<th>РћС‚РєСѓРґР°</th>
			<th>РќРѕРІРѕСЃС‚РµР№</th>
			<th>РљРѕРјРјРµРЅС‚Р°СЂРёРµРІ</th>
			<th>Р—Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅ</th>
			<th>РџРѕСЃР»РµРґРЅРёР№ РІС…РѕРґ</th>
		</tr>
		{% for entry in entries %}
			<tr>
				<td><a href='{{ entry.profile_link }}'>{{ entry.profile }}</a></td>

				{% if pluginIsActive('xfields') %}
					<!-- СЃРѕРґРµСЂР¶РёРјРѕРµ РґРѕРї. РїРѕР»РµР№ -->
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
						РЅРµ Р±С‹Р» РЅРё СЂР°Р·Сѓ
					{% endif %}
				</td>
			</tr>
		{% else %}
			<tr>
				<td colspan="4">РџРѕ РІР°С€РµРјСѓ Р·Р°РїСЂРѕСЃСѓ РЅРёС‡РµРіРѕ РЅРµ РЅР°Р№РґРµРЅРѕ.</td>
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
