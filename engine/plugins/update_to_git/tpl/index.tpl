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
	<div class="card-header"> Р С›Р В±Р Р…Р С•Р Р†Р В»Р ВµР Р…Р С‘Р Вµ</div>
	<div class="card-body">


		<div class="alert alert-warning">
			Р С›Р В±Р Р…Р С•Р Р†Р В»Р ВµР Р…Р С‘Р Вµ РЎРѓР С‘РЎРѓРЎвЂљР ВµР С�РЎвЂ№ Р С—РЎР‚Р ВµР Т‘Р С—Р С•Р В»Р В°Р С–Р В°Р ВµРЎвЂљ Р С—Р С•РЎРЊРЎвЂљР В°Р С—Р Р…Р С•Р Вµ Р Р†РЎвЂ№Р С—Р С•Р В»Р Р…Р ВµР Р…Р С‘Р Вµ Р Т‘Р ВµР в„–РЎРѓРЎвЂљР Р†Р С‘Р в„–. Р вЂ™Р В°Р В¶Р Р…Р С•: Р С—Р ВµРЎР‚Р ВµР Т‘ Р С•Р В±Р Р…Р С•Р Р†Р В»Р ВµР Р…Р С‘Р ВµР С� РЎРѓР С•Р В·Р Т‘Р В°Р в„–РЎвЂљР Вµ РЎР‚Р ВµР В·Р ВµРЎР‚Р Р†Р Р…РЎС“РЎР‹ Р С”Р С•Р С—Р С‘РЎР‹ РЎвЂћР В°Р в„–Р В»Р С•Р Р†.
		</div>
		<div class="form-group row">
			<label class="col-sm-8 control-label">
				Р РЋР С”Р В°Р В·Р С”Р В° Р С—РЎР‚Р С• Р В±РЎвЂ№РЎвЂЎР С”Р В°.
			</label>
			<div class="col-sm-4 text-right">
				<a id="rpc_updater_check" href="#" data-token="{{ token }}" class="btn btn-outline-primary">Р С›Р В±Р Р…Р С•Р Р†Р С‘РЎвЂљРЎРЉ</a>
			</div>
		</div>

		<hr>

		<p>Р РЋР С—Р С‘РЎРѓР С•Р С” РЎвЂћР В°Р в„–Р В»Р С•Р Р†:</p>
		<ol id="list-files">

		</ol>
	</div>
</div>
