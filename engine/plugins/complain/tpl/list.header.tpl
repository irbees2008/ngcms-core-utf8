<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>РЈРїСЂР°РІР»РµРЅРёРµ РёРЅС†РёРґРµРЅС‚Р°РјРё</title>
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

<h1>РЎРїРёСЃРѕРє Р°РєС‚РёРІРЅС‹С… РёРЅС†РёРґРµРЅС‚РѕРІ</h1>

<form action="{form_url}" name="myform" id="myform" method="post">
	<table id="mt" width="100%" cellspacing=1 cellpadding=1>
		<thead>
		<tr>
			<td>Р”Р°С‚Р°</td>
			<td>РќРѕРІРѕСЃС‚СЊ</td>
			<td>РћС€РёР±РєР°</td>
			<td>РђРІС‚РѕСЂ РЅРѕРІРѕСЃС‚Рё</td>
			<td>РђРІС‚РѕСЂ РёРЅС†РёРґРµРЅС‚Р°</td>
			<td>РќР°Р·РЅР°С‡РµРЅР° РЅР°</td>
			<td>РЎС‚Р°С‚СѓСЃ</td>
			<td><input type="checkbox" name="checkall" id="btnCheckAll" onclick="toggleList();"/></td>
		</tr>
		</thead>
		<tbody>
		{entries}
		</tbody>
	</table>
	<br/>
	<b><u>Р”РµР№СЃС‚РІРёСЏ СЃ РІС‹РґРµР»РµРЅРЅС‹РјРё РёРЅС†РёРґРµРЅС‚Р°РјРё:</u></b><br/>
	<table id="st" cellspacing="0" cellpadding="0">
		<tr>
			<td><label><input type="checkbox" name="setowner" value="1"/> РќР°Р·РЅР°С‡РёС‚СЊ РЅР° РјРµРЅСЏ</label></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label><input type="checkbox" name="setstatus" value="1"/> Р�Р·РјРµРЅРёС‚СЊ СЃС‚Р°С‚СѓСЃ РЅР°</label></td>
			<td>&nbsp; &nbsp; <select name="newstatus">
					{status_options}
				</select></td>
		</tr>
	</table>
	<input type="submit" value="Р’С‹РїРѕР»РЅРёС‚СЊ РёР·РјРµРЅРµРЅРёСЏ"/>
</form>
<br/>
</body>
</html>