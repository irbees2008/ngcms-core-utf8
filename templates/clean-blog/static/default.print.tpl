<!DOCTYPE html>
<html>
<head>
    <title>{{ lang['print_version'] }} &raquo; {{ staticTitle }}</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="noindex" />
    <meta name="robots" content="noarchive"/>
    <style>
        *{ background:#fff !important; color:#666 !important; float:none !important; width:auto !important; height:auto !important; }
        body,td { font-family: times, serif; font-size: 100%; margin: 20px auto; max-width: 1170px; }
        h1,h2,h3,h4 { font-family: times, serif; font-size: 120%; margin: 0px; }
        p { margin: 0 0 10px; }
        img { max-width: 360px; float: left !important; margin: 0 10px 10px 0; padding: .25rem; border: 1px solid #ddd; border-radius: .25rem; }
        .header { font-size: 120%; font-weight: bold; }
    </style>
</head>
<body onload="window.print();">
    <table border="0" width="100%" cellspacing="1" cellpadding="3">
        <tr></tr><td width="100%" class="header"><a href="{{ home }}"> {{ home_title }}</a> &raquo; <a href="javascript:history.go(-1)">{{ staticTitle }}</a><hr></td></tr>
        <tr><td width="100%">{{ staticContent }}</td></tr>
        <tr><td width="100%"><hr><p class="footer">Дата: {{ staticDateStamp | cdate  }} <b style="float:right!important;">{{ home }}</b></p><hr></td>
        </tr>
    </table>
</body>
</html>