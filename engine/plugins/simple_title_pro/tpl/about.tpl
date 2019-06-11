<script type="text/javascript">
	function ChangeOption(selectedOption) {
		document.getElementById('about').style.display = (selectedOption == 'about') ? "block" : "none";
		document.getElementById('author').style.display = (selectedOption == 'author') ? "block" : "none";
		document.getElementById('acknowledgments').style.display = (selectedOption == 'acknowledgments') ? "block" : "none";
		document.getElementById('support').style.display = (selectedOption == 'support') ? "block" : "none";
	}
</script>
<input type="button" onmousedown="javascript:ChangeOption('about')" value="Рћ РїР»Р°РіРёРЅРµ" class="button"/>
<input type="button" onmousedown="javascript:ChangeOption('author')" value="РђРІС‚РѕСЂС‹" class="button"/>
<input type="button" onmousedown="javascript:ChangeOption('acknowledgments')" value="Р‘Р»Р°РіРѕРґР°СЂРЅРѕСЃС‚Рё" class="button"/>
<input type="button" onmousedown="javascript:ChangeOption('support')" value="РџРѕРґРґРµСЂР¶РєР°" class="button"/>

<fieldset id="author" style="display: none;" class="admGroup">
	<legend class="title">РђРІС‚РѕСЂС‹</legend>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<dl>
			<dt>
			<center><strong>Nail' Davydov</strong></center>
			</dt>
			<dt>
			<center><strong><a href="http://rozard.net" target="_blank">http://rozard.net</a></strong></center>
			</dt>
			<dt>
			<center><strong><a href="http://rozard.ngdemo.ru/" target="_blank">http://rozard.ngdemo.ru/</a></strong>
			</center>
			</dt><br/>
			<dt>
			<center>В© 2011-2012 Nail' Davydov</center>
			</dt>
		</dl>
	</table>
</fieldset>


<fieldset id="about" class="admGroup">
	<legend class="title">Рћ РїР»Р°РіРёРЅРµ</legend>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<dl>
			<dt>
			<center><strong>simple_title_pro, РґРёРЅР°РјРёС‡РµСЃРєРёР№ Р·Р°РіРѕР»РѕРІРѕРє РґР»СЏ РІР°С€РµРіРѕ СЃР°Р№С‚Р°</strong></center>
			</dt><br/>
			<dt>
			<center><a href="/engine/admin.php?mod=extra-config&plugin=simple_title_pro&action=license" target="_blank"><b>Р›РёС†РµРЅР·РёРѕРЅРЅРѕРµ
						СЃРѕРіР»Р°С€РµРЅРёРµ</b></a></center>
			</dt><br/>
			<dt>
			<center>В© 2011-2012 Nail' Davydov</center>
			</dt>
		</dl>
	</table>
</fieldset>

<fieldset id="acknowledgments" style="display: none;" class="admGroup">
	<legend class="title">Р‘Р»Р°РіРѕРґР°СЂРЅРѕСЃС‚Рё</legend>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<dl>
			<dt><strong>РўРµСЃС‚РµСЂС‹ Рё Р°СѓРґРёС‚:</strong></dt>
			<dd>РђР»РµРєСЃР°РЅРґСЂ -(<a href="http://ngcms.ru/forum/profile.php?id=435">РЎРµРІРµСЂ</a>)</dd>
			<dt><strong>РўРµСЃС‚РµСЂС‹ Рё Р°СѓРґРёС‚:</strong></dt>
			<dd>- - (<a href="http://ngcms.ru/forum/profile.php?id=65">tayzer</a>)</dd>
			<dt>
			<center>В© 2011-2012 Nail' Davydov</center>
			</dt>
		</dl>
	</table>
</fieldset>
<fieldset id="support" style="display: none;" class="admGroup">
	<legend class="title">РџРѕРґРґРµСЂР¶РєР°</legend>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">
		<dl>
			<dt><strong>РџРѕ РІСЃРµРј РїСЂРѕР±Р»РµРјР° Рё РїСЂРµРґР»РѕР¶РµРЅРёСЏРј РѕР±СЂР°С‰Р°С‚СЊСЃСЏ РЅР°:
					<a href="http://ngcms.ru/forum/viewtopic.php?id=2055" target="_blank"><b>simple_title_pro</b></a></strong>
			</dt>
			<dt>
			<center>В© 2011-2012 Nail' Davydov</center>
			</dt>
		</dl>
	</table>
</fieldset>