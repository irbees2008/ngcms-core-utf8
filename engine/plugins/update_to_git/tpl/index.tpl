<link rel="stylesheet" href="{{ admin_url }}/plugins/update_to_git/tpl/style.css" />
<script src="{{ admin_url }}/plugins/update_to_git/tpl/script.js" charset="utf-8"></script>

<nav aria-label="breadcrumb">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="admin.php">{{ lang['update::home'] }}</a></li>
		<li class="breadcrumb-item"><a href="admin.php?mod=extras">{{ lang['extras'] }}</a></li>
		<li class="breadcrumb-item active" aria-current="page"><a href="admin.php?mod=extra-config&plugin={{ plugin }}">{{ plugin }}</a></li>
	</ol>
</nav>

<div class="card">
	<div class="card-header"> РћР±РЅРѕРІР»РµРЅРёРµ</div>
	<div class="card-body">


		<div class="alert alert-warning">
			РћР±РЅРѕРІР»РµРЅРёРµ СЃРёСЃС‚РµРјС‹ РїСЂРµРґРїРѕР»Р°РіР°РµС‚ РїРѕСЌС‚Р°РїРЅРѕРµ РІС‹РїРѕР»РЅРµРЅРёРµ РґРµР№СЃС‚РІРёР№. Р’Р°Р¶РЅРѕ: РїРµСЂРµРґ РѕР±РЅРѕРІР»РµРЅРёРµРј СЃРѕР·РґР°Р№С‚Рµ СЂРµР·РµСЂРІРЅСѓСЋ РєРѕРїРёСЋ С„Р°Р№Р»РѕРІ.
		</div>
		<div class="form-group row">
			<label class="col-sm-8 control-label">
				РЎРєР°Р·РєР° РїСЂРѕ Р±С‹С‡РєР°.
			</label>
			<div class="col-sm-4 text-right">
				<a id="rpc_updater_check" href="#" data-token="{{ token }}" class="btn btn-outline-primary">РћР±РЅРѕРІРёС‚СЊ</a>
			</div>
		</div>

		<hr>

		<p>РЎРїРёСЃРѕРє С„Р°Р№Р»РѕРІ:</p>
		<ol id="list-files">

		</ol>
	</div>
</div>
