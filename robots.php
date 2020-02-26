<?php
header('Content-type: text/plain');
$subdomain = str_replace('o-kredite.info', '', $_SERVER['HTTP_HOST']);
if ($subdomain !== '') {
echo '
User-agent: googlebot
Disallow: /

User-agent: Yandex
Disallow: /

User-agent: *
Disallow: /
';

}
?>
User-agent: Yandex
Disallow: /engine/
Disallow: /templates/
Disallow: /uploads/avatars/
Allow: /uploads/dsn/
Disallow: /uploads/files/
Allow: /uploads/images/$
Allow: /uploads/images/thumb/
Allow: /uploads/photos/
Allow: /plugin/gsmg/
Allow: /plugin/sitemap/
Disallow: /plugin/
Disallow: /vendor/
Disallow: /lib/
Disallow: /*print
Disallow: /search/
Disallow: /rss.xml
Disallow: /*xml
Disallow: /login/
Disallow: /logout/
Disallow: /register/
Disallow: /activate/
Disallow: /lostpassword/
Disallow: /profile.html
Disallow: /users/
Disallow: /*201*
Disallow: /page/

User-agent: Googlebot
Disallow: /engine/
Disallow: /templates/sakura/
Disallow: /templates/vektor/
Allow: /templates/shablon/js/
Allow: /templates/shablon/css/
Allow: /templates/shablon/styles/
Disallow: /uploads/avatars/
Allow: /uploads/dsn/
Disallow: /uploads/files/
Allow: /uploads/images/$
Allow: /uploads/images/thumb/
Disallow: /uploads/photos/
Allow: /plugin/gsmg/
Allow: /plugin/sitemap/
Disallow: /plugin/
Disallow: /vendor/
Disallow: /lib/
Disallow: /*print
Disallow: /search/
Disallow: /rss.xml
Disallow: /*xml
Disallow: /login/
Disallow: /logout/
Disallow: /register/
Disallow: /activate/
Disallow: /lostpassword/
Disallow: /profile.html
Disallow: /users/
Disallow: /*201*
Disallow: /page/

User-agent: *
Disallow: /engine/
Disallow: /templates/
Disallow: /uploads/avatars/
Allow: /uploads/dsn/
Disallow: /uploads/files/
Allow: /uploads/images/$
Allow: /uploads/images/thumb/
Disallow: /uploads/photos/
Allow: /plugin/gsmg/
Allow: /plugin/sitemap/
Disallow: /plugin/
Disallow: /vendor/
Disallow: /lib/
Disallow: /*print
Disallow: /search/
Disallow: /rss.xml
Disallow: /*xml
Disallow: /login/
Disallow: /logout/
Disallow: /register/
Disallow: /activate/
Disallow: /lostpassword/
Disallow: /profile.html
Disallow: /users/
Disallow: /*201*
Disallow: /page/

Sitemap:https://o-kredite.info/gsmg.xml
Host: https://o-kredite.info
