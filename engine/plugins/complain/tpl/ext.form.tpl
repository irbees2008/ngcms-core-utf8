<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>РЎРѕРѕР±С‰РёС‚СЊ РѕР± РѕС€РёР±РєРµ</title>
	<style type="text/css">
		body {
			font: normal 12px verdana, sans-serif;
		}

		#senderror {
			padding-top: 10px;
			background: #fff7e1;
			border: 1px dashed #e8e8e8;
			margin-top: 10px;
			padding-bottom: 20px;
		}

		#senderror select.error {
			border: 1px solid #e8e8e8;
			background: #fff;
		}

		#senderror input.report {
			border: 1px solid #e8e8e8;
			background: #fff;
		}

		#senderror .texth {
			position: relative;
			left: 10px;
		}
	</style>
</head>
<body>
<form method="post" action="{form_url}">
	<input type="hidden" name="ds_id" value="{ds_id}"/>
	<input type="hidden" name="entry_id" value="{entry_id}"/>

	<div id="senderror">
		<div class="texth">
			<u>РЎРѕРѕР±С‰РёС‚СЊ РѕР± РѕС€РёР±РєРµ:</u><br/><br/>
			РўРёРї РѕС€РёР±РєРё: <select name="error" class="error" id="errorSelect">{errorlist}</select><br/><br/>
			[email]Р’Р°С€ e-mail: <input type="text" name="mail"/><br/>[/email]
			[notify]<input type="checkbox" name="notify" value="1"/> РёРЅС„РѕСЂРјРёСЂРѕРІР°С‚СЊ Рѕ СЂРµС€РµРЅРёРё РїСЂРѕР±Р»РµРјС‹ <br/>[/notify]
			[text]Р”РµС‚Р°Р»СЊРЅРѕРµ РѕРїРёСЃР°РЅРёРµ РїСЂРѕР±Р»РµРјС‹:<br/><textarea cols="80" rows="4" name="error_text"></textarea><br/>[/text]
			<input type="submit" class="report" onclick="if (document.getElementById('errorSelect').value==''){alert('РќРµРѕР±С…РѕРґРёРјРѕ РІС‹Р±СЂР°С‚СЊ С‚РёРї РѕС€РёР±РєРё!'); return false;};" value="РћС‚РїСЂР°РІРёС‚СЊ"/>
		</div>
	</div>
</form>
</body>
</html>
