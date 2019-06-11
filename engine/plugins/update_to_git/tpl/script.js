$(function() {
    $(document).on('click', '#rpc_updater_check', function() {
        ngShowLoading();
		var div = $("#list-files");
		div.html('Loading ...');

        $.post('rpc.php', {
            json: 1, methodName: 'plugin.updater.check', rndval: new Date().getTime(),
            params: json_encode({'token': $('#rpc_updater_check').attr('data-token')})
        }, function(data) {
            ngHideLoading();
            try {
                resTX = $.parseJSON(data);

                if (!resTX['status']) {
                    ngNotifyWindow('Error [' + resTX['errorCode'] + ']: ' + resTX['errorText'], 'ERROR');
                } else if (0 === resTX['data']['total_commits']) {
					ngNotifyWindow('Нет изменений в версии GIT', 'info');
		        } else {
                    // SUCCESS
                    div.html('');
					var length = $(resTX['data']['files']).length;
                    $(resTX['data']['files']).each(function(index, value) {
						$.post('rpc.php', {
			                json: 1, methodName: 'plugin.updater.execute', rndval: new Date().getTime(),
			                params: json_encode({
								'token': $('#rpc_updater_check').attr('data-token'),
								'url': this.raw_url,
								'name': this.filename,
								'action': this.status
							})
			            }, function(data) {
							console.log(data);
							resFTX = $.parseJSON(data);
							if (resFTX['status'] === 1) {
				                div.append('<li class="text-success" style="list-style-type: decimal;">'+ length + ' - <samp>' + resFTX['data'] + '</samp></li>');
				            } else if (resFTX['status'] === 2) {
				                div.append('<li style="list-style-type: decimal;">'+ length + ' - <samp>' + resFTX['data'] + '</samp></li>');
				            } else {
				                div.append('<li><samp class="text-danger">' + resFTX['errorText'] + '</samp></li>');
				                thisError = true;
				            }
						}, "text")
			            .error(function() {
			                alert('HTTP error during request');
			            });
					});
				}
            } catch (err) {
                alert('Error parsing JSON output. Result: ' + data);
            }
        }, "text")
        .error(function() {
            ngHideLoading();
            alert('HTTP error during request');
        });
    });
});
