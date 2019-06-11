{% include localPath(0) ~ "conf.navi.tpl" %}
<form method="post" action="">
	<input type="hidden" name="mod" value="extra-config"/>
	<input type="hidden" name="plugin" value="feedback"/>
	<input type="hidden" name="action" value="saveform"/>

	<table width="100%" border="0">
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>Р С™Р С•Р Т‘ РЎвЂћР С•РЎР‚Р С�РЎвЂ№ / URL РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№:</b></td>
			<td>
				<input style="width: 30px; background: white;" type="text" name="id" value="{{ id }}" disabled="disabled"/>
				[ <a href="{{ url }}" target="_blank">Р С•РЎвЂљР С”РЎР‚РЎвЂ№РЎвЂљРЎРЉ</a> ]<br/>
				<input style="width: 420px; background: white;" type="text" value="{{ url }}" readonly="readonly"/></td>
			<td rowspan="6" width="3" style="background-image: url({{ skins_url }}/images/delim.png); background-repeat: repeat-y;"></td>
			<td>
				<input type="checkbox" id="id_active" name="active" value="1" {{ flags.active ? 'checked="checked"' : '' }} />
			</td>
			<td><label for="id_active"><b>Р В¤Р С•РЎР‚Р С�Р В° Р В°Р С”РЎвЂљР С‘Р Р†Р Р…Р В°</b></label></td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>ID / Р СњР В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ РЎвЂћР С•РЎР‚Р С�РЎвЂ№:</b><br>
				<small><b>ID</b> - РЎС“Р Р…Р С‘Р С”Р В°Р В»РЎРЉР Р…РЎвЂ№Р в„– Р С‘Р Т‘Р ВµР Р…РЎвЂљР С‘РЎвЂћР С‘Р С”Р В°РЎвЂљР С•РЎР‚</small>
			</td>
			<td><input style="width: 100px;" type="text" name="name" value="{{ name }}"/>
				<input style="width: 350px;" type="text" name="title" value="{{ title }}"/></td>
			<td>
				<input type="checkbox" id="id_jcheck" name="jcheck" value="1" {{ flags.jcheck ? 'checked="checked"' : '' }} />
			</td>
			<td><label for="id_jcheck"><b>Р СџРЎР‚Р С•Р Р†Р ВµРЎР‚РЎРЏРЎвЂљРЎРЉ Р Р†Р Р†Р С•Р Т‘ Р С—Р С•Р В»Р ВµР в„–</b><br/>
					<small>Р вЂ™Р С”Р В»РЎР‹РЎвЂЎР С‘РЎвЂљРЎРЉ JavaScript Р С”Р С•Р Т‘ Р Т‘Р В»РЎРЏ Р С—РЎР‚Р С•Р Р†Р ВµРЎР‚Р С”Р С‘ Р В·Р В°Р С—Р С•Р В»Р Р…Р ВµР Р…Р С‘РЎРЏ Р С—Р С•Р В»Р ВµР в„–</small>
				</label></td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>Р С›Р С—Р С‘РЎРѓР В°Р Р…Р С‘Р Вµ РЎвЂћР С•РЎР‚Р С�РЎвЂ№:</b><br/>
				<small>Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРѓРЎРЏ Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎР‹ Р С—Р ВµРЎР‚Р ВµР Т‘ РЎвЂћР С•РЎР‚Р С�Р С•Р в„–</small>
			</td>
			<td><textarea style="margin-left: 0px;" cols="72" rows="3" name="description">{{ description }}</textarea>
			</td>
			<td><input type="checkbox" value="1" name="html" id="id_html" {{ flags.html ? 'checked="checked"' : '' }} />
			</td>
			<td><label for="id_html"><b>HTML РЎР‚Р В°РЎРѓРЎРѓРЎвЂ№Р В»Р С”Р В°</b><br/>
					<small>Р С›РЎвЂљР С—РЎР‚Р В°Р Р†Р В»РЎРЏРЎвЂљРЎРЉ Р С‘Р Р…РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂ Р С‘Р С•Р Р…Р Р…РЎвЂ№Р Вµ Email Р С—Р С‘РЎРѓРЎРЉР С�Р В° Р Р† HTML РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂљР Вµ</small>
				</label></td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>Р РЋР С•Р В±РЎРѓРЎвЂљР Р†Р ВµР Р…Р Р…Р В°РЎРЏ РЎвЂљР ВµР С�Р В° Р Р† email:</b><br/>
				<small>Р вЂќР С•Р С—РЎС“РЎРѓРЎвЂљР С‘Р С�РЎвЂ№Р Вµ Р С—Р В°РЎР‚Р В°Р С�Р ВµРЎвЂљРЎР‚РЎвЂ№:<br/><b>{name}</b> - ID РЎвЂћР С•РЎР‚Р С�РЎвЂ№<br/><b>{title}</b> - Р Р…Р В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ РЎвЂћР С•РЎР‚Р С�РЎвЂ№</small>
			</td>
			<td><select name="isSubj">
					<option value="0">Р СњР ВµРЎвЂљ</option>
					<option value="1" {% if (flags.subj) %}selected="selected"{% endif %}>Р вЂќР В°</option>
				</select> &nbsp; <input style="width: 350px;" type="text" name="subj" value="{{ subj }}"></td>
			<td>
				<input type="checkbox" id="id_captcha" name="captcha" value="1" {{ flags.captcha ? 'checked="checked"' : '' }} />
			</td>
			<td><label for="id_captcha"><b>Р пїЅРЎРѓР С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљРЎРЉ <i>captcha</i></b><br/>
					<small>Р СћРЎР‚Р ВµР В±Р С•Р Р†Р В°РЎвЂљРЎРЉ Р Р†Р Р†Р С•Р Т‘ Р С—РЎР‚Р С•Р Р†Р ВµРЎР‚Р С•РЎвЂЎР Р…Р С•Р С–Р С• Р С”Р С•Р Т‘Р В° Р Т‘Р В»РЎРЏ Р С•РЎвЂљР С—РЎР‚Р В°Р Р†Р С”Р С‘ Р В·Р В°Р С—РЎР‚Р С•РЎРѓР В°</small>
				</label></td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>Р СџРЎР‚Р С‘Р Р†РЎРЏР В·Р С”Р В° Р С” Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЏР С�:</b><br/>
				<small></small>
			</td>
			<td><select name="link_news">
					{% for x in link_news.options %}
						<option value="{{ x }}" {% if (link_news.value == x) %}selected="selected"{% endif %}>{{ lang['feedback:link_news.' ~ x] }}</option>
					{% endfor %}

				</select></td>
			<td rowspan="2">
				<input type="checkbox" id="id_utf8" name="utf8" value="1" {{ flags.utf8 ? 'checked="checked"' : '' }} />
			</td>
			<td rowspan="2"><label for="id_utf8"><b>Р пїЅРЎРѓР С—РЎР‚Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ <i>UTF-8</i> Р С”Р С•Р Т‘Р С‘РЎР‚Р С•Р Р†Р С”Р С‘</b><br/>
					<small>Р СџРЎР‚Р ВµР С•Р В±РЎР‚Р В°Р В·Р С•Р Р†РЎвЂ№Р Р†Р В°РЎвЂљРЎРЉ Р Т‘Р В°Р Р…Р Р…РЎвЂ№Р Вµ Р С‘Р В· РЎвЂћР С•РЎР‚Р С�РЎвЂ№ Р Р† Р С”Р С•Р Т‘Р С‘РЎР‚Р С•Р Р†Р С”РЎС“ Win-1251, Р ВµРЎРѓР В»Р С‘ Р С•Р Р…Р С‘ Р С—РЎР‚Р С‘РЎв‚¬Р В»Р С‘ Р Р† UTF-8</small>
				</label></td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>Р пїЅРЎРѓР С—Р С•Р В»РЎРЉР В·РЎС“Р ВµР С�РЎвЂ№Р в„– РЎв‚¬Р В°Р В±Р В»Р С•Р Р…:</b><br/>
				<small>РЎв‚¬Р В°Р В±Р В»Р С•Р Р…РЎвЂ№ Р В»Р ВµР В¶Р В°РЎвЂљ Р Р† Р С—Р С•Р Т‘Р С”Р В°РЎвЂљР В°Р В»Р С•Р С–Р Вµ tpl/templates/</small>
			</td>
			<td><select name="template">{{ template_options }}</select></td>
			<td>&nbsp;</td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>Email РЎРѓР С—Р С‘РЎРѓР С•Р С” РЎР‚Р В°РЎРѓРЎРѓРЎвЂ№Р В»Р С”Р С‘:</b><br/>
				<small>Р РЋР С—Р С‘РЎРѓР С•Р С” email Р В°Р Т‘РЎР‚Р ВµРЎРѓР С•Р Р† Р С‘ Р С–РЎР‚РЎС“Р С—Р С— Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»Р ВµР в„–, Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№Р С� Р В±РЎС“Р Т‘РЎС“РЎвЂљ Р С•РЎвЂљР С—РЎР‚Р В°Р Р†Р В»РЎРЏРЎвЂљРЎРЉРЎРѓРЎРЏ РЎРѓР С•Р С•Р В±РЎвЂ°Р ВµР Р…Р С‘РЎРЏ Р С‘Р В· Р Т‘Р В°Р Р…Р Р…Р С•Р в„– РЎвЂћР С•РЎР‚Р С�РЎвЂ№.<br/><font color="red"><i>Р ВµРЎРѓР В»Р С‘
							РЎРѓР С•Р В·Р Т‘Р В°РЎвЂљРЎРЉ РЎвЂљР С•Р В»РЎРЉР С”Р С• Р С•Р Т‘Р Р…РЎС“ Р С–РЎР‚РЎС“Р С—Р С—РЎС“, РЎвЂљР С• Р С�Р ВµР Р…РЎР‹ Р Р†РЎвЂ№Р В±Р С•РЎР‚Р В° Р С—Р С•Р В»РЎС“РЎвЂЎР В°РЎвЂљР ВµР В»Р ВµР в„– Р Р† РЎвЂћР С•РЎР‚Р С�Р Вµ Р С•РЎвЂљР С•Р В±РЎР‚Р В°Р В¶Р В°РЎвЂљРЎРЉРЎРѓРЎРЏ Р Р…Р Вµ
							Р В±РЎС“Р Т‘Р ВµРЎвЂљ</i></font></small>
			</td>
			<td colspan="4">
				<table>
					<thead>
					<tr>
						<td>UID</td>
						<td>Р СњР В°Р В·Р Р†Р В°Р Р…Р С‘Р Вµ Р С–РЎР‚РЎС“Р С—Р С—РЎвЂ№</td>
						<td>Р РЋР С—Р С‘РЎРѓР С•Р С” email Р В°Р Т‘РЎР‚Р ВµРЎРѓР С•Р Р† Р С–РЎР‚РЎС“Р С—Р С—РЎвЂ№ (РЎвЂЎР ВµРЎР‚Р ВµР В· Р В·Р В°Р С—РЎРЏРЎвЂљРЎС“РЎР‹)</td>
					</tr>
					</thead>
					<tbody>
					{% for egroup in egroups %}
						<tr>
							<td>
								<input type="text" name="elist[{{ loop.index }}][0]" value="{{ egroup.num }}" size="2" disabled="disabled"/>
							</td>
							<td><input type="text" name="elist[{{ loop.index }}][1]" value="{{ egroup.name }}"/></td>
							<td>
								<input style="width: 550px;" type="text" name="elist[{{ loop.index }}][2]" value="{{ egroup.value }}"/>
							</td>
						</tr>
					{% endfor %}
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="6"><input type="submit" value="Р РЋР С•РЎвЂ¦РЎР‚Р В°Р Р…Р С‘РЎвЂљРЎРЉ"/></td>
		</tr>
	</table>
	<hr/>
	<table width="100%">
		<tr>
			<td width="230">Р РЃР В°Р В±Р В»Р С•Р Р… Р Р…Р В° РЎРѓР В°Р в„–РЎвЂљР Вµ{% if (not tfiles.site.isFound) %}
				<span style="color: red; font-weight: bold;">[Р С—Р С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹]</span>{% endif %}:
			</td>
			<td><input type="text" readonly="readonly" value="{{ tfiles.site.file }}" style="width: 550px;"/></td>
		</tr>
		<tr>
			<td>Р РЃР В°Р В±Р В»Р С•Р Р… Р Р† Р С—Р С‘РЎРѓРЎРЉР С�Р Вµ{% if (not tfiles.mail.isFound) %} <span style="color: red; font-weight: bold;">[Р С—Р С• РЎС“Р С�Р С•Р В»РЎвЂЎР В°Р Р…Р С‘РЎР‹]</span>{% endif %}
				:
			</td>
			<td><input type="text" readonly="readonly" value="{{ tfiles.mail.file }}" style="width: 550px;"/></td>
		</tr>
	</table>
	<hr/>
	<table width="100%">
		<tr>
			<td class="contentHead">ID Р С—Р С•Р В»РЎРЏ</td>
			<td class="contentHead">Р СњР В°Р С‘Р С�Р ВµР Р…Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р С—Р С•Р В»РЎРЏ</td>
			<td class="contentHead">Р СћР С‘Р С— Р С—Р С•Р В»РЎРЏ</td>
			<td class="contentHead">Р С’Р Р†РЎвЂљР С•Р В·Р В°Р С—Р С•Р В»Р Р…Р ВµР Р…Р С‘Р Вµ</td>
			<td class="contentHead">Р вЂ�Р В»Р С•Р С”Р С‘РЎР‚Р С•Р Р†Р С”Р В°</td>
			<td class="contentHead">Р Р€Р Т‘Р В°Р В»Р С‘РЎвЂљРЎРЉ</td>
		</tr>
		{% for entry in entries %}
			<tr align="left" class="contRow1">
				<td style="padding:2px;">
					<a href="?mod=extra-config&plugin=feedback&action=update&subaction=up&id={{ formID }}&name={{ entry.name }}"><img src="{{ skins_url }}/images/up.gif" width="16" height="16" alt="UP"/></a>
					<a href="?mod=extra-config&plugin=feedback&action=update&subaction=down&id={{ formID }}&name={{ entry.name }}"><img src="{{ skins_url }}/images/down.gif" width="16" height="16" alt="DOWN"/>
						<a href="?mod=extra-config&plugin=feedback&action=row&form_id={{ formID }}&row={{ entry.name }}">{{ entry.name }}</a>
				</td>
				<td>{{ entry.title }}</td>
				<td>{{ lang['feedback:type.' ~ entry.type] }}</td>
				<td>{{ lang['feedback:field.auto.' ~ entry.auto] }}</td>
				<td>{{ lang['feedback:field.block.' ~ entry.block] }}</td>
				<td nowrap>
					<a href="?mod=extra-config&plugin=feedback&action=update&subaction=del&id={{ formID }}&name={{ entry.name }}"><img src="{{ skins_url }}/images/delete.gif" alt="DEL" width="12" height="12"/></a>
				</td>
			</tr>
		{% endfor %}
		<tr>
			<td colspan="5" style="text-align: left; padding: 10px 10px 0 0;">
				<a href="?mod=extra-config&plugin=feedback&action=row&form_id={{ formID }}">Р вЂќР С•Р В±Р В°Р Р†Р С‘РЎвЂљРЎРЉ Р Р…Р С•Р Р†Р С•Р Вµ Р С—Р С•Р В»Р Вµ</a>
			</td>
		</tr>
	</table>
</form>