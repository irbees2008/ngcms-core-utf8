$(document).ready(function($) {

	/* scrollTop */
	$('body').append('<div class="scrollTop fa fa-angle-up"></div>');
	$(window).scroll(function () {
		if ($(this).scrollTop() > 60)
			$('.scrollTop').show();
		else
			$('.scrollTop').hide();
	});
	$('.scrollTop').on('click', function(){$('html, body').animate({scrollTop:0}, 888);});

	// Share news
	$('.share').click(function() {
		var nWin = window.open($(this).prop('href'), 'shareWindow', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
		if (window.focus) nWin.focus();
		return false;
	});

	// Navigation Scripts to Show Header on Scroll-Up
	var MQL = 1170;

	//primary navigation slide-in effect
	if ($(window).width() > MQL) {
		var headerHeight = $('#mainNav').height();
		$(window).on('scroll', {
				previousTop: 0
			},
			function() {
				var currentTop = $(window).scrollTop();
				//check if user is scrolling up
				if (currentTop < this.previousTop) {
					//if scrolling up...
					if (currentTop > 0 && $('#mainNav').hasClass('is-fixed')) {
						$('#mainNav').addClass('is-visible');
					} else {
						$('#mainNav').removeClass('is-visible is-fixed');
					}
				} else if (currentTop > this.previousTop) {
					//if scrolling down...
					$('#mainNav').removeClass('is-visible');
					if (currentTop > headerHeight && !$('#mainNav').hasClass('is-fixed'))
						$('#mainNav').addClass('is-fixed');
				}
				this.previousTop = currentTop;
			});
	}
});
