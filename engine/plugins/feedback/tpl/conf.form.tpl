{% include localPath(0) ~ "conf.navi.tpl" %}
<form method="post" action="">
	<input type="hidden" name="mod" value="extra-config"/>
	<input type="hidden" name="plugin" value="feedback"/>
	<input type="hidden" name="action" value="saveform"/>

	<table width="100%" border="0">
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>РљРѕРґ С„РѕСЂРјС‹ / URL СЃС‚СЂР°РЅРёС†С‹:</b></td>
			<td>
				<input style="width: 30px; background: white;" type="text" name="id" value="{{ id }}" disabled="disabled"/>
				[ <a href="{{ url }}" target="_blank">РѕС‚РєСЂС‹С‚СЊ</a> ]<br/>
				<input style="width: 420px; background: white;" type="text" value="{{ url }}" readonly="readonly"/></td>
			<td rowspan="6" width="3" style="background-image: url({{ skins_url }}/images/delim.png); background-repeat: repeat-y;"></td>
			<td>
				<input type="checkbox" id="id_active" name="active" value="1" {{ flags.active ? 'checked="checked"' : '' }} />
			</td>
			<td><label for="id_active"><b>Р¤РѕСЂРјР° Р°РєС‚РёРІРЅР°</b></label></td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>ID / РќР°Р·РІР°РЅРёРµ С„РѕСЂРјС‹:</b><br>
				<small><b>ID</b> - СѓРЅРёРєР°Р»СЊРЅС‹Р№ РёРґРµРЅС‚РёС„РёРєР°С‚РѕСЂ</small>
			</td>
			<td><input style="width: 100px;" type="text" name="name" value="{{ name }}"/>
				<input style="width: 350px;" type="text" name="title" value="{{ title }}"/></td>
			<td>
				<input type="checkbox" id="id_jcheck" name="jcheck" value="1" {{ flags.jcheck ? 'checked="checked"' : '' }} />
			</td>
			<td><label for="id_jcheck"><b>РџСЂРѕРІРµСЂСЏС‚СЊ РІРІРѕРґ РїРѕР»РµР№</b><br/>
					<small>Р’РєР»СЋС‡РёС‚СЊ JavaScript РєРѕРґ РґР»СЏ РїСЂРѕРІРµСЂРєРё Р·Р°РїРѕР»РЅРµРЅРёСЏ РїРѕР»РµР№</small>
				</label></td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>РћРїРёСЃР°РЅРёРµ С„РѕСЂРјС‹:</b><br/>
				<small>Р’С‹РІРѕРґРёС‚СЃСЏ РїРѕР»СЊР·РѕРІР°С‚РµР»СЋ РїРµСЂРµРґ С„РѕСЂРјРѕР№</small>
			</td>
			<td><textarea style="margin-left: 0px;" cols="72" rows="3" name="description">{{ description }}</textarea>
			</td>
			<td><input type="checkbox" value="1" name="html" id="id_html" {{ flags.html ? 'checked="checked"' : '' }} />
			</td>
			<td><label for="id_html"><b>HTML СЂР°СЃСЃС‹Р»РєР°</b><br/>
					<small>РћС‚РїСЂР°РІР»СЏС‚СЊ РёРЅС„РѕСЂРјР°С†РёРѕРЅРЅС‹Рµ Email РїРёСЃСЊРјР° РІ HTML С„РѕСЂРјР°С‚Рµ</small>
				</label></td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>РЎРѕР±СЃС‚РІРµРЅРЅР°СЏ С‚РµРјР° РІ email:</b><br/>
				<small>Р”РѕРїСѓСЃС‚РёРјС‹Рµ РїР°СЂР°РјРµС‚СЂС‹:<br/><b>{name}</b> - ID С„РѕСЂРјС‹<br/><b>{title}</b> - РЅР°Р·РІР°РЅРёРµ С„РѕСЂРјС‹</small>
			</td>
			<td><select name="isSubj">
					<option value="0">РќРµС‚</option>
					<option value="1" {% if (flags.subj) %}selected="selected"{% endif %}>Р”Р°</option>
				</select> &nbsp; <input style="width: 350px;" type="text" name="subj" value="{{ subj }}"></td>
			<td>
				<input type="checkbox" id="id_captcha" name="captcha" value="1" {{ flags.captcha ? 'checked="checked"' : '' }} />
			</td>
			<td><label for="id_captcha"><b>Р�СЃРїРѕР»СЊР·РѕРІР°С‚СЊ <i>captcha</i></b><br/>
					<small>РўСЂРµР±РѕРІР°С‚СЊ РІРІРѕРґ РїСЂРѕРІРµСЂРѕС‡РЅРѕРіРѕ РєРѕРґР° РґР»СЏ РѕС‚РїСЂР°РІРєРё Р·Р°РїСЂРѕСЃР°</small>
				</label></td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>РџСЂРёРІСЏР·РєР° Рє РЅРѕРІРѕСЃС‚СЏРј:</b><br/>
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
			<td rowspan="2"><label for="id_utf8"><b>Р�СЃРїСЂР°РІР»РµРЅРёРµ <i>UTF-8</i> РєРѕРґРёСЂРѕРІРєРё</b><br/>
					<small>РџСЂРµРѕР±СЂР°Р·РѕРІС‹РІР°С‚СЊ РґР°РЅРЅС‹Рµ РёР· С„РѕСЂРјС‹ РІ РєРѕРґРёСЂРѕРІРєСѓ Win-1251, РµСЃР»Рё РѕРЅРё РїСЂРёС€Р»Рё РІ UTF-8</small>
				</label></td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>Р�СЃРїРѕР»СЊР·СѓРµРјС‹Р№ С€Р°Р±Р»РѕРЅ:</b><br/>
				<small>С€Р°Р±Р»РѕРЅС‹ Р»РµР¶Р°С‚ РІ РїРѕРґРєР°С‚Р°Р»РѕРіРµ tpl/templates/</small>
			</td>
			<td><select name="template">{{ template_options }}</select></td>
			<td>&nbsp;</td>
		</tr>
		<tr align="left" valign="top">
			<td class="contentRow" width="230"><b>Email СЃРїРёСЃРѕРє СЂР°СЃСЃС‹Р»РєРё:</b><br/>
				<small>РЎРїРёСЃРѕРє email Р°РґСЂРµСЃРѕРІ Рё РіСЂСѓРїРї РїРѕР»СЊР·РѕРІР°С‚РµР»РµР№, РєРѕС‚РѕСЂС‹Рј Р±СѓРґСѓС‚ РѕС‚РїСЂР°РІР»СЏС‚СЊСЃСЏ СЃРѕРѕР±С‰РµРЅРёСЏ РёР· РґР°РЅРЅРѕР№ С„РѕСЂРјС‹.<br/><font color="red"><i>РµСЃР»Рё
							СЃРѕР·РґР°С‚СЊ С‚РѕР»СЊРєРѕ РѕРґРЅСѓ РіСЂСѓРїРїСѓ, С‚Рѕ РјРµРЅСЋ РІС‹Р±РѕСЂР° РїРѕР»СѓС‡Р°С‚РµР»РµР№ РІ С„РѕСЂРјРµ РѕС‚РѕР±СЂР°Р¶Р°С‚СЊСЃСЏ РЅРµ
							Р±СѓРґРµС‚</i></font></small>
			</td>
			<td colspan="4">
				<table>
					<thead>
					<tr>
						<td>UID</td>
						<td>РќР°Р·РІР°РЅРёРµ РіСЂСѓРїРїС‹</td>
						<td>РЎРїРёСЃРѕРє email Р°РґСЂРµСЃРѕРІ РіСЂСѓРїРїС‹ (С‡РµСЂРµР· Р·Р°РїСЏС‚СѓСЋ)</td>
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
			<td colspan="6"><input type="submit" value="РЎРѕС…СЂР°РЅРёС‚СЊ"/></td>
		</tr>
	</table>
	<hr/>
	<table width="100%">
		<tr>
			<td width="230">РЁР°Р±Р»РѕРЅ РЅР° СЃР°Р№С‚Рµ{% if (not tfiles.site.isFound) %}
				<span style="color: red; font-weight: bold;">[РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ]</span>{% endif %}:
			</td>
			<td><input type="text" readonly="readonly" value="{{ tfiles.site.file }}" style="width: 550px;"/></td>
		</tr>
		<tr>
			<td>РЁР°Р±Р»РѕРЅ РІ РїРёСЃСЊРјРµ{% if (not tfiles.mail.isFound) %} <span style="color: red; font-weight: bold;">[РїРѕ СѓРјРѕР»С‡Р°РЅРёСЋ]</span>{% endif %}
				:
			</td>
			<td><input type="text" readonly="readonly" value="{{ tfiles.mail.file }}" style="width: 550px;"/></td>
		</tr>
	</table>
	<hr/>
	<table width="100%">
		<tr>
			<td class="contentHead">ID РїРѕР»СЏ</td>
			<td class="contentHead">РќР°РёРјРµРЅРѕРІР°РЅРёРµ РїРѕР»СЏ</td>
			<td class="contentHead">РўРёРї РїРѕР»СЏ</td>
			<td class="contentHead">РђРІС‚РѕР·Р°РїРѕР»РЅРµРЅРёРµ</td>
			<td class="contentHead">Р‘Р»РѕРєРёСЂРѕРІРєР°</td>
			<td class="contentHead">РЈРґР°Р»РёС‚СЊ</td>
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
				<a href="?mod=extra-config&plugin=feedback&action=row&form_id={{ formID }}">Р”РѕР±Р°РІРёС‚СЊ РЅРѕРІРѕРµ РїРѕР»Рµ</a>
			</td>
		</tr>
	</table>
</form>