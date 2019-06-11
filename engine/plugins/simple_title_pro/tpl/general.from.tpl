<form method="post" action="">
	<tr>
		<td colspan=2>
			<fieldset class="admGroup">
				<legend class="title">Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘ Р В°Р Т‘Р С�Р С‘Р Р…Р С”Р С‘</legend>
				<table width="100%" border="0" class="content">
					<tr>
						<td class="contentEntry1" valign=top>Р С™Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С• Р В·Р В°Р С—Р С‘РЎРѓР ВµР в„– Р Р† Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘<br/>
							<small></small>
						</td>
						<td class="contentEntry2" valign=top>{{ num_cat.error }}
							<input name="num_cat" type="text" title="Р С™Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С• Р В·Р В°Р С—Р С‘РЎРѓР ВµР в„– Р Р† Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘" size=40 value="{{ num_cat.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р С™Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С• Р В·Р В°Р С—Р С‘РЎРѓР ВµР в„– Р Р† Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЏРЎвЂ¦<br/>
							<small></small>
						</td>
						<td class="contentEntry2" valign=top>{{ num_news.error }}
							<input name="num_news" type="text" title="Р С™Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С• Р В·Р В°Р С—Р С‘РЎРѓР ВµР в„– Р Р† Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљРЎРЏРЎвЂ¦" size=40 value="{{ num_news.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р С™Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С• Р В·Р В°Р С—Р С‘РЎРѓР ВµР в„– Р Р† РЎРѓРЎвЂљР В°РЎвЂљР С‘Р С”Р Вµ<br/>
							<small></small>
						</td>
						<td class="contentEntry2" valign=top>{{ num_static.error }}
							<input name="num_static" type="text" title="Р С™Р С•Р В»Р С‘РЎвЂЎР ВµРЎРѓРЎвЂљР Р†Р С• Р В·Р В°Р С—Р С‘РЎРѓР ВµР в„– Р Р† РЎРѓРЎвЂљР В°РЎвЂљР С‘Р С”Р Вµ" size=40 value="{{ num_static.print }}"/>
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<fieldset class="admGroup">
				<legend class="title">Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р С‘ &lt;title&gt;&lt;/title&gt;</legend>
				<table width="100%" border="0" class="content">
					<tr>
						<td class="contentEntry1" valign=top>Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” Р Р† Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘ <br/>
							<small>Р СћР ВµР С”РЎРѓРЎвЂљ Р С—Р С•Р В»РЎРЏ &lt;title&gt;&lt;/title&gt; Р Т‘Р В»РЎРЏ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘ (РЎР‚Р В°Р В·РЎР‚Р ВµРЎв‚¬Р ВµР Р…Р С• %cat%, %num% Р С‘
								%home%)
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ c_title.error }}
							<input name="c_title" type="text" title="Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” Р Р† Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘" size=40 value="{{ c_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” Р Р† Р С—Р С•Р В»Р Р…Р С•Р в„– Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘<br/>
							<small>Р СћР ВµР С”РЎРѓРЎвЂљ Р С—Р С•Р В»РЎРЏ &lt;title&gt;&lt;/title&gt; Р Р† Р С—Р С•Р В»Р Р…Р С•Р в„– Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘ (РЎР‚Р В°Р В·РЎР‚Р ВµРЎв‚¬Р ВµР Р…Р С• %cat%, %title%,
								%home%, %num%)
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ n_title.error }}
							<input name="n_title" type="text" title="Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” Р Р† Р С—Р С•Р В»Р Р…Р С•Р в„– Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘" size=40 value="{{ n_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№<br/>
							<small>Р СћР ВµР С”РЎРѓРЎвЂљ Р С—Р С•Р В»РЎРЏ &lt;title&gt;&lt;/title&gt; Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№ (РЎР‚Р В°Р В·РЎР‚Р ВµРЎв‚¬Р ВµР Р…Р С• %home% %num%)
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ m_title.error }}
							<input name="m_title" type="text" title="Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” Р С–Р В»Р В°Р Р†Р Р…Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№" size=40 value="{{ m_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” РЎРѓРЎвЂљР В°РЎвЂљР С‘РЎвЂЎР ВµРЎРѓР С”Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№<br/>
							<small>Р СћР ВµР С”РЎРѓРЎвЂљ Р С—Р С•Р В»РЎРЏ &lt;title&gt;&lt;/title&gt; РЎРѓРЎвЂљР В°РЎвЂљР С‘РЎвЂЎР ВµРЎРѓР С”Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№ (РЎР‚Р В°Р В·РЎР‚Р ВµРЎв‚¬Р ВµР Р…Р С• %home% Р С‘
								%static%)
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ static_title.error }}
							<input name="static_title" type="text" title="Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” РЎРѓРЎвЂљР В°РЎвЂљР С‘РЎвЂЎР ВµРЎРѓР С”Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№" size=40 value="{{ static_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” Р С•РЎРѓРЎвЂљР В°Р В»РЎРЉР Р…РЎвЂ№РЎвЂ¦ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№<br/>
							<small>Р СћР ВµР С”РЎРѓРЎвЂљ Р С—Р С•Р В»РЎРЏ &lt;title>&lt;/title> Р Т‘РЎР‚РЎС“Р С–Р С‘РЎвЂ¦ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ  (Р С—РЎР‚Р С•РЎвЂћР С‘Р В»РЎРЉ Р С—Р С•Р В»РЎРЉР В·Р С•Р Р†Р В°РЎвЂљР ВµР В»РЎРЏ, Р В»Р С‘РЎвЂЎР Р…РЎвЂ№Р в„–
								Р С—РЎР‚Р С•РЎвЂћР С‘Р В»РЎРЉ) (РЎР‚Р В°Р В·РЎР‚Р ВµРЎв‚¬Р ВµР Р…Р С• %home%, %other%, %html% Р С‘ %num%)
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ o_title.error }}
							<input name="o_title" type="text" title="Р вЂ”Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” Р С•РЎРѓРЎвЂљР В°Р В»РЎРЉР Р…РЎвЂ№РЎвЂ¦ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№" size=40 value="{{ o_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р вЂќР С•Р С—Р С•Р В»Р Р…Р С‘РЎвЂљР ВµР В»РЎРЉР Р…Р В°РЎРЏ Р С‘Р Р…РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂ Р С‘РЎРЏ Р Т‘Р В»РЎРЏ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№<br/>
							<small>Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘ Р Т‘Р С•Р С—Р С•Р В»Р Р…Р С‘РЎвЂљР ВµР В»РЎРЉР Р…Р С•Р в„– Р С‘Р Р…РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂ Р С‘РЎР‹ Р С• РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р Вµ (Р С—РЎР‚Р С‘Р С�. Р С‘Р С�РЎРЏ РЎвЂљР ВµР С–Р В°) - Р Т‘Р В°Р Р…Р Р…РЎвЂ№РЎвЂ¦ Р С—Р ВµРЎР‚Р ВµР Т‘Р В°Р Т‘РЎС“РЎвЂљРЎРѓРЎРЏ Р Р†
								Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎС“РЎР‹ %html%
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ html_secure.error }}
							<input name="html_secure" type="text" title="Р вЂќР С•Р С—Р С•Р В»Р Р…Р С‘РЎвЂљР ВµР В»РЎРЉР Р…Р В°РЎРЏ Р С‘Р Р…РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂ Р С‘РЎРЏ Р Т‘Р В»РЎРЏ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№" size=40 value="{{ html_secure.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р РЋРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р В° Р С•РЎв‚¬Р С‘Р В±Р С”Р С‘ 404<br/>
							<small>Р вЂ™РЎвЂ№Р Р†Р С•Р Т‘ Р Т‘Р С•Р С—Р С•Р В»Р Р…Р С‘РЎвЂљР ВµР В»РЎРЉР Р…Р С•Р в„– Р С‘Р Р…РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂ Р С‘РЎР‹ Р С• РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р Вµ (Р С—РЎР‚Р С‘Р С�. Р С‘Р С�РЎРЏ РЎвЂљР ВµР С–Р В°) - Р Т‘Р В°Р Р…Р Р…РЎвЂ№РЎвЂ¦ Р С—Р ВµРЎР‚Р ВµР Т‘Р В°Р Т‘РЎС“РЎвЂљРЎРѓРЎРЏ Р Р†
								Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎС“РЎР‹ %html%
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ e_title.error }}
							<input name="e_title" type="text" title="Р вЂќР С•Р С—Р С•Р В»Р Р…Р С‘РЎвЂљР ВµР В»РЎРЉР Р…Р В°РЎРЏ Р С‘Р Р…РЎвЂћР С•РЎР‚Р С�Р В°РЎвЂ Р С‘РЎРЏ Р Т‘Р В»РЎРЏ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№" size=40 value="{{ e_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р СџР В»Р В°Р С–Р С‘Р Р…РЎвЂ№ Р С‘РЎРѓР С”Р В»РЎР‹РЎвЂЎР ВµР Р…Р С‘РЎРЏ<br/>
							<small>Р РЋР С—Р С‘РЎРѓР С•Р С” Р С—Р В»Р В°Р С–Р С‘Р Р…Р С•Р Р† Р Р…Р В° Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№РЎвЂ¦ РЎР‚Р В°Р В±Р С•РЎвЂљР В° Р С—Р В»Р В°Р С–Р С‘Р Р…Р В° Р Р…Р Вµ РЎР‚Р В°РЎРѓР С—РЎР‚Р С•РЎРѓРЎвЂљРЎР‚Р В°Р Р…РЎРЏР ВµРЎвЂљРЎРѓРЎРЏ</small>
						</td>
						<td class="contentEntry2" valign=top>{{ p_title.error }}
							<input name="p_title" type="text" title="Р РЋР С—Р С‘РЎРѓР С•Р С” Р С—Р В»Р В°Р С–Р С‘Р Р…Р С•Р Р† Р Р…Р В° Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№РЎвЂ¦ РЎР‚Р В°Р В±Р С•РЎвЂљР В° Р С—Р В»Р В°Р С–Р С‘Р Р…Р В° Р Р…Р Вµ РЎР‚Р В°РЎРѓР С—РЎР‚Р С•РЎРѓРЎвЂљРЎР‚Р В°Р Р…РЎРЏР ВµРЎвЂљРЎРѓРЎРЏ" size=40 value="{{ p_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top>Р СњР С•Р С�Р ВµРЎР‚ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№<br/>
							<small>Р В¤Р С•РЎР‚Р С�Р В°РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°Р Р…Р С‘Р Вµ Р Р…Р С•Р С�Р ВµРЎР‚Р В° РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№ (Р Р…Р В°Р С—РЎР‚Р С‘Р С�Р ВµРЎР‚, Р РЋРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р В° 4 [Р РЋРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ Р В° %count%] - Р С–Р Т‘Р Вµ %count%
								Р Р…Р С•Р С�Р ВµРЎР‚ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№) - Р Т‘Р В°Р Р…Р Р…РЎвЂ№РЎвЂ¦ Р С—Р ВµРЎР‚Р ВµР Т‘Р В°Р Т‘РЎС“РЎвЂљРЎРѓРЎРЏ Р Р† Р С—Р ВµРЎР‚Р ВµР С�Р ВµР Р…Р Р…РЎС“РЎР‹ %num%
							</small>
						</td>
						<td class="contentEntry2" valign=top>{{ num_title.error }}
							<input name="num_title" type="text" title="Р СњР С•Р С�Р ВµРЎР‚ РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№" size=40 value="{{ num_title.print }}"/>
						</td>
					</tr>
					<tr>
						<td class="contentEntry1" valign=top><br/>
							<small>Р С™Р В»РЎР‹РЎвЂЎР С‘:<br/><b>%cat%</b> - Р С‘Р С�РЎРЏ Р С”Р В°РЎвЂљР ВµР С–Р С•РЎР‚Р С‘Р С‘<br/><b>%title%</b> - Р С‘Р С�РЎРЏ
								Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘<br><b>%home%</b> - Р В·Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” РЎРѓР В°Р в„–РЎвЂљР В°<br/><b>%static%</b> - Р В·Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” РЎРѓРЎвЂљР В°РЎвЂљР С‘РЎвЂЎР ВµРЎРѓР С”Р С•Р в„–
								РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№<br/><b>%other%</b> - Р В·Р В°Р С–Р С•Р В»Р С•Р Р†Р С•Р С” Р В»РЎР‹Р В±Р С•Р в„– Р Т‘РЎР‚РЎС“Р С–Р С•Р в„– РЎРѓРЎвЂљРЎР‚Р В°Р Р…Р С‘РЎвЂ РЎвЂ№<br></small>
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
				<legend class="title">Р СњР В°РЎРѓРЎвЂљРЎР‚Р С•Р в„–Р С”Р В° Р С”РЎРЊРЎв‚¬Р В°</legend>
				<table width="100%" border="0" class="content">
					<tr>
						<td class="contentEntry1" valign=top>Р вЂ™РЎР‚Р ВµР С�РЎРЏ Р В¶Р С‘Р В·Р Р…Р С‘ Р С”РЎРЊРЎв‚¬Р В°<br/>
							<small>Р Р€Р С”Р В°Р В·РЎвЂ№Р Р†Р В°РЎвЂљРЎРЉ Р Р† Р Т‘Р Р…РЎРЏРЎвЂ¦</small>
						</td>
						<td class="contentEntry2" valign=top>{{ cache.error }}
							<input name="cache" type="text" title="Р вЂ™РЎР‚Р ВµР С�РЎРЏ Р В¶Р С‘Р В·Р Р…Р С‘ Р С”РЎРЊРЎв‚¬Р В°" size=40 value="{{ cache.print }}"/>
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
				<input name="submit" type="submit" value="Р РЋР С•РЎвЂ¦РЎР‚Р В°Р Р…Р С‘РЎвЂљРЎРЉ" class="button"/>
			</td>
		</tr>
	</table>

</form>