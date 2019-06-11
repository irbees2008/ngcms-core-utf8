<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Р РЋР С•Р С•Р В±РЎвЂ°Р С‘РЎвЂљРЎРЉ Р С•Р В± Р С•РЎв‚¬Р С‘Р В±Р С”Р Вµ</title>
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
			<u>Р РЋР С•Р С•Р В±РЎвЂ°Р С‘РЎвЂљРЎРЉ Р С•Р В± Р С•РЎв‚¬Р С‘Р В±Р С”Р Вµ:</u><br/><br/>
			Р СћР С‘Р С— Р С•РЎв‚¬Р С‘Р В±Р С”Р С‘: <select name="error" class="error" id="errorSelect">{errorlist}</select><br/><br/>
			[email]Р вЂ™Р В°РЎв‚¬ e-mail: <input type="text" name="mail"/><br/>[/email]
			[notify]<input type="checkbox" name="notify" value="1"/> Р С‘Р Р…РЎвЂћР С•РЎР‚Р С�Р С‘РЎР‚Р С•Р Р†Р В°РЎвЂљРЎРЉ Р С• РЎР‚Р ВµРЎв‚¬Р ВµР Р…Р С‘Р С‘ Р С—РЎР‚Р С•Р В±Р В»Р ВµР С�РЎвЂ№ <br/>[/notify]
			[text]Р вЂќР ВµРЎвЂљР В°Р В»РЎРЉР Р…Р С•Р Вµ Р С•Р С—Р С‘РЎРѓР В°Р Р…Р С‘Р Вµ Р С—РЎР‚Р С•Р В±Р В»Р ВµР С�РЎвЂ№:<br/><textarea cols="80" rows="4" name="error_text"></textarea><br/>[/text]
			<input type="submit" class="report" onclick="if (document.getElementById('errorSelect').value==''){alert('Р СњР ВµР С•Р В±РЎвЂ¦Р С•Р Т‘Р С‘Р С�Р С• Р Р†РЎвЂ№Р В±РЎР‚Р В°РЎвЂљРЎРЉ РЎвЂљР С‘Р С— Р С•РЎв‚¬Р С‘Р В±Р С”Р С‘!'); return false;};" value="Р С›РЎвЂљР С—РЎР‚Р В°Р Р†Р С‘РЎвЂљРЎРЉ"/>
		</div>
	</div>
</form>
</body>
</html>
