<form method="post" action="">
	<tr>
		<td colspan=2>
			<fieldset class="admGroup">
				<legend class="title">РќР°СЃС‚СЂРѕР№РєРё Р°РґРјРёРЅРєРё</legend>
				<table width="100%" border="0" class="content">
					<tr>
						<td class="contentEntry1" valign=top>РљРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РїРёСЃРµР№ РІ РєР°С‚РµРіРѕСЂРёРё<br/>
							<small></small>
						</td>
						<td class="contentEntry2" valign=top>{{ num_cat.error }}
							<input name="num_cat" type="text" title="РљРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РїРёСЃРµР№ РІ РєР°С‚РµРіРѕСЂРёРё" size=40 value="{{ num_cat.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>РљРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РїРёСЃРµР№ РІ РЅРѕРІРѕСЃС‚СЏС…<br/>
							<small></small>
						</td>
						<td class="contentEntry2" valign=top>{{ num_news.error }}
							<input name="num_news" type="text" title="РљРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РїРёСЃРµР№ РІ РЅРѕРІРѕСЃС‚СЏС…" size=40 value="{{ num_news.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>РљРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РїРёСЃРµР№ РІ СЃС‚Р°С‚РёРєРµ<br/>
							<small></small>
						</td>
						<td class="contentEntry2" valign=top>{{ num_static.error }}
							<input name="num_static" type="text" title="РљРѕР»РёС‡РµСЃС‚РІРѕ Р·Р°РїРёСЃРµР№ РІ СЃС‚Р°С‚РёРєРµ" size=40 value="{{ num_static.print }}"/>
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<fieldset class="admGroup">
				<legend class="title">РќР°СЃС‚СЂРѕР№РєРё &lt;title&gt;&lt;/title&gt;</legend>
				<table width="100%" border="0" class="content">
					<tr>
						<td class="contentEntry1" valign=top>Р—Р°РіРѕР»РѕРІРѕРє РІ РєР°С‚РµРіРѕСЂРёРё <br/>
							<small>РўРµРєСЃС‚ РїРѕР»СЏ &lt;title&gt;&lt;/title&gt; РґР»СЏ РєР°С‚РµРіРѕСЂРёРё (СЂР°Р·СЂРµС€РµРЅРѕ %cat%, %num% Рё
								%home%)
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ c_title.error }}
							<input name="c_title" type="text" title="Р—Р°РіРѕР»РѕРІРѕРє РІ РєР°С‚РµРіРѕСЂРёРё" size=40 value="{{ c_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р—Р°РіРѕР»РѕРІРѕРє РІ РїРѕР»РЅРѕР№ РЅРѕРІРѕСЃС‚Рё<br/>
							<small>РўРµРєСЃС‚ РїРѕР»СЏ &lt;title&gt;&lt;/title&gt; РІ РїРѕР»РЅРѕР№ РЅРѕРІРѕСЃС‚Рё (СЂР°Р·СЂРµС€РµРЅРѕ %cat%, %title%,
								%home%, %num%)
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ n_title.error }}
							<input name="n_title" type="text" title="Р—Р°РіРѕР»РѕРІРѕРє РІ РїРѕР»РЅРѕР№ РЅРѕРІРѕСЃС‚Рё" size=40 value="{{ n_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р—Р°РіРѕР»РѕРІРѕРє РіР»Р°РІРЅРѕР№ СЃС‚СЂР°РЅРёС†С‹<br/>
							<small>РўРµРєСЃС‚ РїРѕР»СЏ &lt;title&gt;&lt;/title&gt; РіР»Р°РІРЅРѕР№ СЃС‚СЂР°РЅРёС†С‹ (СЂР°Р·СЂРµС€РµРЅРѕ %home% %num%)
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ m_title.error }}
							<input name="m_title" type="text" title="Р—Р°РіРѕР»РѕРІРѕРє РіР»Р°РІРЅРѕР№ СЃС‚СЂР°РЅРёС†С‹" size=40 value="{{ m_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р—Р°РіРѕР»РѕРІРѕРє СЃС‚Р°С‚РёС‡РµСЃРєРѕР№ СЃС‚СЂР°РЅРёС†С‹<br/>
							<small>РўРµРєСЃС‚ РїРѕР»СЏ &lt;title&gt;&lt;/title&gt; СЃС‚Р°С‚РёС‡РµСЃРєРѕР№ СЃС‚СЂР°РЅРёС†С‹ (СЂР°Р·СЂРµС€РµРЅРѕ %home% Рё
								%static%)
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ static_title.error }}
							<input name="static_title" type="text" title="Р—Р°РіРѕР»РѕРІРѕРє СЃС‚Р°С‚РёС‡РµСЃРєРѕР№ СЃС‚СЂР°РЅРёС†С‹" size=40 value="{{ static_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р—Р°РіРѕР»РѕРІРѕРє РѕСЃС‚Р°Р»СЊРЅС‹С… СЃС‚СЂР°РЅРёС†С‹<br/>
							<small>РўРµРєСЃС‚ РїРѕР»СЏ &lt;title>&lt;/title> РґСЂСѓРіРёС… СЃС‚СЂР°РЅРёС† (РїСЂРѕС„РёР»СЊ РїРѕР»СЊР·РѕРІР°С‚РµР»СЏ, Р»РёС‡РЅС‹Р№
								РїСЂРѕС„РёР»СЊ) (СЂР°Р·СЂРµС€РµРЅРѕ %home%, %other%, %html% Рё %num%)
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ o_title.error }}
							<input name="o_title" type="text" title="Р—Р°РіРѕР»РѕРІРѕРє РѕСЃС‚Р°Р»СЊРЅС‹С… СЃС‚СЂР°РЅРёС†С‹" size=40 value="{{ o_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р”РѕРїРѕР»РЅРёС‚РµР»СЊРЅР°СЏ РёРЅС„РѕСЂРјР°С†РёСЏ РґР»СЏ СЃС‚СЂР°РЅРёС†С‹<br/>
							<small>Р’С‹РІРѕРґ РґРѕРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РёРЅС„РѕСЂРјР°С†РёСЋ Рѕ СЃС‚СЂР°РЅРёС†Рµ (РїСЂРёРј. РёРјСЏ С‚РµРіР°) - РґР°РЅРЅС‹С… РїРµСЂРµРґР°РґСѓС‚СЃСЏ РІ
								РїРµСЂРµРјРµРЅРЅСѓСЋ %html%
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ html_secure.error }}
							<input name="html_secure" type="text" title="Р”РѕРїРѕР»РЅРёС‚РµР»СЊРЅР°СЏ РёРЅС„РѕСЂРјР°С†РёСЏ РґР»СЏ СЃС‚СЂР°РЅРёС†С‹" size=40 value="{{ html_secure.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>РЎС‚СЂР°РЅРёС†Р° РѕС€РёР±РєРё 404<br/>
							<small>Р’С‹РІРѕРґ РґРѕРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РёРЅС„РѕСЂРјР°С†РёСЋ Рѕ СЃС‚СЂР°РЅРёС†Рµ (РїСЂРёРј. РёРјСЏ С‚РµРіР°) - РґР°РЅРЅС‹С… РїРµСЂРµРґР°РґСѓС‚СЃСЏ РІ
								РїРµСЂРµРјРµРЅРЅСѓСЋ %html%
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ e_title.error }}
							<input name="e_title" type="text" title="Р”РѕРїРѕР»РЅРёС‚РµР»СЊРЅР°СЏ РёРЅС„РѕСЂРјР°С†РёСЏ РґР»СЏ СЃС‚СЂР°РЅРёС†С‹" size=40 value="{{ e_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>РџР»Р°РіРёРЅС‹ РёСЃРєР»СЋС‡РµРЅРёСЏ<br/>
							<small>РЎРїРёСЃРѕРє РїР»Р°РіРёРЅРѕРІ РЅР° РєРѕС‚РѕСЂС‹С… СЂР°Р±РѕС‚Р° РїР»Р°РіРёРЅР° РЅРµ СЂР°СЃРїСЂРѕСЃС‚СЂР°РЅСЏРµС‚СЃСЏ</small>
						</td>
						<td class="contentEntry2" valign=top>{{ p_title.error }}
							<input name="p_title" type="text" title="РЎРїРёСЃРѕРє РїР»Р°РіРёРЅРѕРІ РЅР° РєРѕС‚РѕСЂС‹С… СЂР°Р±РѕС‚Р° РїР»Р°РіРёРЅР° РЅРµ СЂР°СЃРїСЂРѕСЃС‚СЂР°РЅСЏРµС‚СЃСЏ" size=40 value="{{ p_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>РќРѕРјРµСЂ СЃС‚СЂР°РЅРёС†С‹<br/>
							<small>Р¤РѕСЂРјР°С‚РёСЂРѕРІР°РЅРёРµ РЅРѕРјРµСЂР° СЃС‚СЂР°РЅРёС†С‹ (РЅР°РїСЂРёРјРµСЂ, РЎС‚СЂР°РЅРёС†Р° 4 [РЎС‚СЂР°РЅРёС†Р° %count%] - РіРґРµ %count%
								РЅРѕРјРµСЂ СЃС‚СЂР°РЅРёС†С‹) - РґР°РЅРЅС‹С… РїРµСЂРµРґР°РґСѓС‚СЃСЏ РІ РїРµСЂРµРјРµРЅРЅСѓСЋ %num%
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ num_title.error }}
							<input name="num_title" type="text" title="РќРѕРјРµСЂ СЃС‚СЂР°РЅРёС†С‹" size=40 value="{{ num_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top><br/>
							<small>РљР»СЋС‡Рё:<br/><b>%cat%</b> - РёРјСЏ РєР°С‚РµРіРѕСЂРёРё<br/><b>%title%</b> - РёРјСЏ
								РЅРѕРІРѕСЃС‚Рё<br><b>%home%</b> - Р·Р°РіРѕР»РѕРІРѕРє СЃР°Р№С‚Р°<br/><b>%static%</b> - Р·Р°РіРѕР»РѕРІРѕРє СЃС‚Р°С‚РёС‡РµСЃРєРѕР№
								СЃС‚СЂР°РЅРёС†С‹<br/><b>%other%</b> - Р·Р°РіРѕР»РѕРІРѕРє Р»СЋР±РѕР№ РґСЂСѓРіРѕР№ СЃС‚СЂР°РЅРёС†С‹<br></small>
						</td>
						<td class="contentEntry2" valign=top></td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<fieldset class="admGroup">
				<legend class="title">РќР°СЃС‚СЂРѕР№РєР° РєСЌС€Р°</legend>
				<table width="100%" border="0" class="content">
					<tr>
						<td class="contentEntry1" valign=top>Р’СЂРµРјСЏ Р¶РёР·РЅРё РєСЌС€Р°<br/>
							<small>РЈРєР°Р·С‹РІР°С‚СЊ РІ РґРЅСЏС…</small>
						</td>
						<td class="contentEntry2" valign=top>{{ cache.error }}
							<input name="cache" type="text" title="Р’СЂРµРјСЏ Р¶РёР·РЅРё РєСЌС€Р°" size=40 value="{{ cache.print }}"/>
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td width="100%" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td width="100%" colspan="2" class="contentEdit" align="center">
				<input name="submit" type="submit" value="РЎРѕС…СЂР°РЅРёС‚СЊ" class="button"/>
			</td>
		</tr>
	</table>

</form>