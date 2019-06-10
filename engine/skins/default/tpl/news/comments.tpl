<tr>
	<td>
		<article class="row">
			<div class="col-md-2 col-sm-2 hidden-xs">
				<figure class="thumbnail">
					<img class="img-responsive" src="{skins_url}/assets/img/default-avatar.jpg">
					<figcaption>
						[userlink]<a href="{com_url}">{com_author}</a>[/userlink]
						<a href="admin.php?mod=ipban&iplock={com_ip}" title="{l_block_ip}" target="_blank" class="pull-right"><i class="fa fa-ban"></i></a>
					</figcaption>
				</figure>
			</div>
			<div class="col-md-10 col-sm-10">
				<div class="panel panel-default arrow left">
					<div class="panel-body">
						<header class="text-left">
							<p class="pull-right"><a href="admin.php?mod=editcomments&newsid={com_post}&comid={com_id}" title="{l_edit_comm}" class="btn btn-sm btn-primary"><i class="fa fa-reply"></i></a></p>
							<p><time class="comment-date">{com_time}</time></p>
						</header>
						<div class="comment-post">
							<p>{com_part}</p>
						</div>
					</div>
				</div>
			</div>
		</article>
	</td>
	<td class="text-right"><input type="checkbox" name="delcomid[]" value="{com_id}-{com_author}-{com_ip}-{com_post}" /></td>
</tr>