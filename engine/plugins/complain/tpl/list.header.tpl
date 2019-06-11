<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Р Р€Р С—РЎР‚Р В°Р Р†Р В»Р ВµР Р…Р С‘Р Вµ Р С‘Р Р…РЎвЂ Р С‘Р Т‘Р ВµР Р…РЎвЂљР В°Р С�Р С‘</title>
	<style type="text/css">
		body {
			font-family: verdana, arial;
			font-size: 12px;
			line-height: 14px;
			color: #000000;
			background: #fff;
		}

		h1 {
			font-size: 14px;
			text-decoration: underline;
		}

		#mt {
			font-size: 10px;
			background: #999999;
		}

		#mt thead {
			background: #EEEEEE;
			font-weight: bold;
		}

		#mt tbody {
			background: #FFFFFF;
		}

		#st {
			font-size: 10px;
			margin: 5px;
		}

		#st select {
			font-size: 10px;
		}

		input {
			font-size: 10px;
		}
	</style>
</head>
<body>
<script language="javascript">
	var ETEXT = {ETEXT};

	function toggleList() {
		var btn = document.getElementById('btnCheckAll');
		var f = document.getElementById('myform');
		for (var i = 0; i < f.elements.length; i++) {
			var e = f.elements[i];
			if (e.name.substr(0, 4) == 'inc_') {
				e.checked = btn.checked;
			}
		}
	}
</script>

<h1>Р РЋР С—Р С‘РЎРѓР С•Р С” Р В°Р С”РЎвЂљР С‘Р Р†Р Р…РЎвЂ№РЎвЂ¦ Р С‘Р Р…РЎвЂ Р С‘Р Т‘Р ВµР Р…РЎвЂљР С•Р Р†</h1>

<form action="{form_url}" name="myform" id="myform" method="post">
	<table id="mt" width="100%" cellspacing=1 cellpadding=1>
		<thead>
		<tr>
			<td>Р вЂќР В°РЎвЂљР В°</td>
			<td>Р СњР С•Р Р†Р С•РЎРѓРЎвЂљРЎРЉ</td>
			<td>Р С›РЎв‚¬Р С‘Р В±Р С”Р В°</td>
			<td>Р С’Р Р†РЎвЂљР С•РЎР‚ Р Р…Р С•Р Р†Р С•РЎРѓРЎвЂљР С‘</td>
			<td>Р С’Р Р†РЎвЂљР С•РЎР‚ Р С‘Р Р…РЎвЂ Р С‘Р Т‘Р ВµР Р…РЎвЂљР В°</td>
			<td>Р СњР В°Р В·Р Р…Р В°РЎвЂЎР ВµР Р…Р В° Р Р…Р В°</td>
			<td>Р РЋРЎвЂљР В°РЎвЂљРЎС“РЎРѓ</td>
			<td><input type="checkbox" name="checkall" id="btnCheckAll" onclick="toggleList();"/></td>
		</tr>
		</thead>
		<tbody>
		{entries}
		</tbody>
	</table>
	<br/>
	<b><u>Р вЂќР ВµР в„–РЎРѓРЎвЂљР Р†Р С‘РЎРЏ РЎРѓ Р Р†РЎвЂ№Р Т‘Р ВµР В»Р ВµР Р…Р Р…РЎвЂ№Р С�Р С‘ Р С‘Р Р…РЎвЂ Р С‘Р Т‘Р ВµР Р…РЎвЂљР В°Р С�Р С‘:</u></b><br/>
	<table id="st" cellspacing="0" cellpadding="0">
		<tr>
			<td><label><input type="checkbox" name="setowner" value="1"/> Р СњР В°Р В·Р Р…Р В°РЎвЂЎР С‘РЎвЂљРЎРЉ Р Р…Р В° Р С�Р ВµР Р…РЎРЏ</label></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label><input type="checkbox" name="setstatus" value="1"/> Р пїЅР В·Р С�Р ВµР Р…Р С‘РЎвЂљРЎРЉ РЎРѓРЎвЂљР В°РЎвЂљРЎС“РЎРѓ Р Р…Р В°</label></td>
			<td>&nbsp; &nbsp; <select name="newstatus">
					{status_options}
				</select></td>
		</tr>
	</table>
	<input type="submit" value="Р вЂ™РЎвЂ№Р С—Р С•Р В»Р Р…Р С‘РЎвЂљРЎРЉ Р С‘Р В·Р С�Р ВµР Р…Р ВµР Р…Р С‘РЎРЏ"/>
</form>
<br/>
</body>
</html>