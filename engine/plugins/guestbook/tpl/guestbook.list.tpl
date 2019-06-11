<section class="content container">
	<div class="row">

		<article class="content-text col-xs-12">
			<h1>Р С›РЎвЂљР В·РЎвЂ№Р Р†РЎвЂ№</h1>
			<h2>Р СљРЎвЂ№ Р Т‘Р С•РЎР‚Р С•Р В¶Р С‘Р С� Р С�Р Р…Р ВµР Р…Р С‘Р ВµР С� Р Р…Р В°РЎв‚¬Р С‘РЎвЂ¦ Р С”Р В»Р С‘Р ВµР Р…РЎвЂљР С•Р Р†</h2>
			<p>Р вЂњР В°РЎР‚Р В°Р Р…РЎвЂљР С‘РЎРЏ Р С•РЎвЂљ 100 Р Т‘Р Р…Р ВµР в„– Р Р…Р В° РЎС“РЎРѓРЎвЂљР В°Р Р…Р С•Р Р†Р В»Р ВµР Р…Р Р…РЎвЂ№Р Вµ Р С”Р С•Р С�Р С—Р В»Р ВµР С”РЎвЂљРЎС“РЎР‹РЎвЂ°Р С‘Р Вµ Р С‘ Р С‘РЎРѓР С—РЎР‚Р В°Р Р†Р В»Р ВµР Р…Р Р…РЎвЂ№Р в„– Р Т‘Р ВµРЎвЂћР ВµР С”РЎвЂљ. Р вЂ™ РЎРѓР В»РЎС“РЎвЂЎР В°Р Вµ Р С—Р С•Р Р†РЎвЂљР С•РЎР‚Р Р…Р С•Р С–Р С•
				Р С—Р С•РЎРѓРЎвЂљРЎС“Р С—Р В»Р ВµР Р…Р С‘РЎРЏ iPhone РЎРѓ Р Т‘Р ВµРЎвЂћР ВµР С”РЎвЂљР С•Р С�, Р С”Р С•РЎвЂљР С•РЎР‚РЎвЂ№Р в„– РЎС“РЎРѓРЎвЂљРЎР‚Р В°Р Р…РЎРЏР В»РЎРѓРЎРЏ РЎР‚Р В°Р Р…Р ВµР Вµ Р Р…Р В°РЎв‚¬Р С‘Р С� РЎРѓР ВµРЎР‚Р Р†Р С‘РЎРѓР С•Р С�, Р С—РЎР‚Р С•Р Р†Р С•Р Т‘Р С‘РЎвЂљРЎРѓРЎРЏ Р Т‘Р С‘Р В°Р С–Р Р…Р С•РЎРѓРЎвЂљР С‘Р С”Р В°, Р С—Р С•
				РЎР‚Р ВµР В·РЎС“Р В»РЎРЉРЎвЂљР В°РЎвЂљР В°Р С� Р С”Р С•РЎвЂљР С•РЎР‚Р С•Р в„– РЎС“РЎРѓРЎвЂљР В°Р Р…Р В°Р Р†Р В»Р С‘Р Р†Р В°Р ВµРЎвЂљРЎРѓРЎРЏ Р С—РЎР‚Р С‘РЎвЂЎР С‘Р Р…Р В° Р Т‘Р ВµРЎвЂћР ВµР С”РЎвЂљР В°/Р Р…Р ВµР С‘РЎРѓР С—РЎР‚Р В°Р Р†Р Р…Р С•РЎРѓРЎвЂљР С‘.</p>
		</article><!-- /.content-text -->

	</div>
</section><!-- /.content -->

<section class="reviews-page container">

	{% if (errors|length > 0) %}
		{% for error in errors %}
			<div class="msge alert alert-error">{{ error }}<br/></div>
		{% endfor %}
	{% endif %}

	{% if (success|length > 0) %}
		{% for succ in success %}
			<div class="msgi alert alert-success">{{ succ }}<br/></div>
		{% endfor %}
	{% endif %}

	<div class="reviews-page-list row">

		{% if (total_count > 0) %}

			{% for entry in entries %}
				<div class="review col-xs-12 col-sm-6">
					<div class="review-inner">
						<div class="review-header">
							{% if entry.social %}
								{% if entry.social.Vkontakte.photo %}
									{% set avatar = entry.social.Vkontakte.photo %}
								{% elseif entry.social.Facebook.photo %}
									{% set avatar = entry.social.Facebook.photo %}
								{% elseif entry.social.Instagram.photo %}
									{% set avatar = entry.social.Instagram.photo %}
								{% elseif entry.social.Google.photo %}
									{% set avatar = entry.social.Google.photo %}
								{% endif %}
							{% else %}
								{% set avatar = '/uploads/avatars/noavatar.gif' %}
							{% endif %}
							<div class="person-photo"><img src="{{ avatar }}" width="60" height="60"></div>
							<div class="person-name">{% if entry.author == 'guest' %} {{ entry.fields.firstname.value }} {{ entry.fields.lastname.value }}{% else %}{{ entry.author }}{% endif %}</div>
							<div class="review-date">{{ entry.date }}</div>
							<div class="review-subject">{{ entry.fields.item.value }}</div>
						</div>
						<div class="review-caption"><p>{{ entry.message }}</p></div>
						{% if(global.user.id) and (global.user.status == '1') %}
							<div class="review-caption">
								<p>
									{{ entry.ip }} /
									<a href="{{ home }}/engine/admin.php?mod=extra-config&plugin=guestbook&action=edit_message&id={{ entry.id }}">Р В Р ВµР Т‘Р В°Р С”РЎвЂљР С‘РЎР‚Р С•Р Р†Р В°РЎвЂљРЎРЉ</a>
									/
									<a href="{{ entry.del }}">Р Р€Р Т‘Р В°Р В»Р С‘РЎвЂљРЎРЉ</a>
								</p>
							</div>
						{% endif %}
						<div class="review-social">
							<ul class="social-links social-links-default list-inline">
								{% if entry.social.Vkontakte %}
									<li class="active"><a href="{{ entry.social.Vkontakte.link }}">
											<svg class="icon icon-vk">
												<use xlink:href="#icon-vk"></use>
											</svg>
										</a></li>
								{% else %}
									<li>
										<svg class="icon icon-vk">
											<use xlink:href="#icon-vk"></use>
										</svg>
									</li>
								{% endif %}
								{% if entry.social.Google %}
									<li class="active"><a href="{{ entry.social.Google.link }}">
											<svg class="icon icon-google">
												<use xlink:href="#icon-google"></use>
											</svg>
										</a></li>
								{% else %}
									<li>
										<svg class="icon icon-google">
											<use xlink:href="#icon-google"></use>
										</svg>
									</li>
								{% endif %}
								{% if entry.social.Facebook %}
									<li class="active"><a href="{{ entry.social.Facebook.link }}">
											<svg class="icon icon-facebook">
												<use xlink:href="#icon-facebook"></use>
											</svg>
										</a></li>
								{% else %}
									<li>
										<svg class="icon icon-facebook">
											<use xlink:href="#icon-facebook"></use>
										</svg>
									</li>
								{% endif %}
								{% if entry.social.Instagram %}
									<li class="active"><a href="{{ entry.social.Instagram.link }}">
											<svg class="icon icon-instagram">
												<use xlink:href="#icon-instagram"></use>
											</svg>
										</a></li>
								{% else %}
									<li>
										<svg class="icon icon-instagram">
											<use xlink:href="#icon-instagram"></use>
										</svg>
									</li>
								{% endif %}
							</ul>
						</div>
					</div>
				</div><!-- /.review -->
			{% endfor %}
		{% endif %}

	</div><!-- /.reviews-feed-list -->

	{% if (total_count > perpage) %}
		<ul class="pagination">
			{{ pages }}
		</ul>
	{% endif %}

</section><!-- /.reviews-page -->

{% if(use_guests) %}
<div class="container">
	<div class="msgi alert alert-success">Р вЂњР С•РЎРѓРЎвЂљРЎРЏР С� Р Р…Р ВµР В»РЎРЉР В·РЎРЏ Р С•РЎРѓРЎвЂљР В°Р Р†Р В»РЎРЏРЎвЂљРЎРЉ Р С•РЎвЂљР В·РЎвЂ№Р Р†РЎвЂ№. Р вЂ”Р В°РЎР‚Р ВµР С–Р С‘РЎРѓРЎвЂљРЎР‚Р С‘РЎР‚РЎС“Р в„–РЎвЂљР ВµРЎРѓРЎРЉ.</siv>
	</div>
	{% else %}
		<form name="form" method="post" action="{{ php_self }}?action=add" class="review-form verifiable-form container">
			<fieldset class="row">
				{% if(global.user.name) %}
					Р вЂ™Р В°РЎв‚¬ Р С”Р С•Р С�Р С�Р ВµР Р…РЎвЂљР В°РЎР‚Р С‘Р в„– Р В±РЎС“Р Т‘Р ВµРЎвЂљ Р С•Р С—РЎС“Р В±Р В»Р С‘Р С”Р С•Р Р†Р В°Р Р… Р С•РЎвЂљ Р С‘Р С�Р ВµР Р…Р С‘ <strong>{{ global.user.name }}</strong>
					<input type="hidden" name="author" value="{{ global.user.name }}"/>
				{% else %}
					{% if(fields.firstname) %}
						<div class="col-xs-12 col-sm-4 col-md-3">
							<div class="form-group">
								<label>{{ fields.firstname.name }}</label>
								<input type="text" class="form-control required" placeholder="{{ fields.firstname.placeholder }}" name="{{ fields.firstname.id }}" value="{{ fields.firstname.default_value }}">
							</div>
						</div>
					{% endif %}

					{% if(fields.lastname) %}
						<div class="col-xs-12 col-sm-4 col-md-3">
							<div class="form-group">
								<label>{{ fields.lastname.name }}</label>
								<input type="text" class="form-control required" placeholder="{{ fields.lastname.placeholder }}" name="{{ fields.lastname.id }}" value="{{ fields.lastname.default_value }}">
							</div>
						</div>
					{% endif %}

					<input type="hidden" name="author" value="guest"/>

				{% endif %}

				{% if(global.user.name) %}
				<div class="col-xs-12 col-sm-12 col-md-12">
					{% else %}
					<div class="col-xs-12 col-sm-4 col-md-3 col-md-offset-3">
						{% endif %}
						{% if(fields.item) %}
							<div class="form-group">
								<label>{{ fields.item.name }}</label>
								<input type="text" class="form-control required" placeholder="{{ fields.item.placeholder }}" name="{{ fields.item.id }}" value="{{ fields.item.default_value }}">
							</div>
						{% endif %}
					</div>

					<div class="col-xs-12 col-md-12">
						<div class="form-group">
							<label>Р вЂ™Р В°РЎв‚¬ Р С•РЎвЂљР В·РЎвЂ№Р Р†</label>
							<textarea name="content" id="content" class="form-control required" placeholder="{{ placeholder.message }}">{{ field.message }}</textarea>
						</div>
					</div>

					<div class="col-xs-12 col-sm-3 col-md-2">
						<div class="form-group">
							<button name="submit" type="submit" class="btn btn-danger">Р С›РЎвЂљР С—РЎР‚Р В°Р Р†Р С‘РЎвЂљРЎРЉ Р С•РЎвЂљР В·РЎвЂ№Р Р†</button>
							<input type="hidden" name="ip" value="{{ ip }}"/>
						</div>
					</div>

					<div class="social-links-wrap col-xs-12 col-sm-3 col-md-3 col-lg-2">
						<ul class="social-links social-links-default list-inline">
							<li id="Vkontakte_li"><a id="vk" href="#">
									<svg class="icon icon-vk">
										<use xlink:href="#icon-vk"></use>
									</svg>
								</a></li>
							<li id="Google_li"><a id="gg" href="#">
									<svg class="icon icon-google">
										<use xlink:href="#icon-google"></use>
									</svg>
								</a></li>
							<li id="Facebook_li"><a id="fb" href="#">
									<svg class="icon icon-facebook">
										<use xlink:href="#icon-facebook"></use>
									</svg>
								</a></li>
							<li id="Instagram_li"><a id="ig" href="#">
									<svg class="icon icon-instagram">
										<use xlink:href="#icon-instagram"></use>
									</svg>
								</a></li>
						</ul>
					</div>

					<div class="form-caption col-xs-12 col-md-7">
						<p>Р СџРЎР‚Р С‘Р С”РЎР‚Р ВµР С—Р С‘РЎвЂљР Вµ РЎРѓР Р†Р С•Р в„– Р С—РЎР‚Р С•РЎвЂћР С‘Р В»РЎРЉ Р Р† РЎРѓР С•РЎвЂ Р С‘Р В°Р В»РЎРЉР Р…Р С•Р в„– РЎРѓР ВµРЎвЂљР С‘, РЎРѓР Т‘Р ВµР В»Р В°Р в„–РЎвЂљР Вµ Р С•РЎвЂљР В·РЎвЂ№Р Р† Р В±Р С•Р В»Р ВµР Вµ РЎС“Р В±Р ВµР Т‘Р С‘РЎвЂљР ВµР В»РЎРЉР Р…РЎвЂ№Р С�!<br>
							<span class="text-muted">Р СџРЎР‚Р С•РЎРѓРЎвЂљР С• Р Р…Р В°Р В¶Р С�Р С‘РЎвЂљР Вµ Р Р…Р В° Р С‘Р С”Р С•Р Р…Р С”РЎС“ РЎРѓР С•РЎвЂ РЎРѓР ВµРЎвЂљР С‘ Р С”Р С•РЎвЂљР С•РЎР‚РЎС“РЎР‹ РЎвЂ¦Р С•РЎвЂљР С‘РЎвЂљР Вµ Р С—РЎР‚Р С‘Р С”РЎР‚Р ВµР С—Р С‘РЎвЂљРЎРЉ</span>
						</p>
					</div>

					{% if(use_captcha) %}{{ captcha }}{% endif %}

					<input type="hidden" name="Vkontakte_id" id="Vkontakte_id" value=""/>
					<input type="hidden" name="Facebook_id" id="Facebook_id" value=""/>
					<input type="hidden" name="Google_id" id="Google_id" value=""/>
					<input type="hidden" name="Instagram_id" id="Instagram_id" value=""/>
			</fieldset>
		</form>
		<script>
			(function () {

				function hasClass(element, cls) {
					return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
				}

				var fb = document.getElementById('fb'),
					vk = document.getElementById('vk'),
					gg = document.getElementById('gg'),
					ig = document.getElementById('ig');

				fb.onclick = function (ev) {
					ev.preventDefault();
					var li = document.getElementById('Facebook_li');
					if (hasClass(li, 'active')) {
						li.className = '';
						document.getElementById('Facebook_id').value = '';
						return;
					} else {
						var n = window.open('{{ home }}/plugin/guestbook/social/?provider=Facebook', 'FB', 'width=420,height=400');
						n.focus();
					}
				}
				vk.onclick = function (ev) {
					ev.preventDefault();
					var li = document.getElementById('Vkontakte_li');
					if (hasClass(li, 'active')) {
						li.className = '';
						document.getElementById('Vkontakte_id').value = '';
						return;
					} else {
						var n = window.open('{{ home }}/plugin/guestbook/social/?provider=Vkontakte', 'VK', 'width=420,height=400');
						n.focus();
					}
				}
				gg.onclick = function (ev) {
					ev.preventDefault();
					var li = document.getElementById('Google_li');
					if (hasClass(li, 'active')) {
						li.className = '';
						document.getElementById('Google_id').value = '';
						return;
					} else {
						var n = window.open('{{ home }}/plugin/guestbook/social/?provider=Google', 'Google', 'width=420,height=400');
						n.focus();
					}
				}
				ig.onclick = function (ev) {
					ev.preventDefault();
					var li = document.getElementById('Instagram_li');
					if (hasClass(li, 'active')) {
						li.className = '';
						document.getElementById('Instagram_id').value = '';
						return;
					} else {
						var n = window.open('{{ home }}/plugin/guestbook/social/?provider=Instagram', 'Instagram', 'width=420,height=400');
						n.focus();
					}
				}
			})();
		</script>
	{% endif %}
