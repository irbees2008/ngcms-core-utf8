<!DOCTYPE html>
<html lang="{{ lang['langcode'] }}">
<head>
    <title>{{ lang['site_temporarily_disabled'] }}</title>
    <meta charset="{{ lang['encoding'] }}" />
    <meta http-equiv="content-language" content="{{ lang['langcode'] }}" />
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta name="document-state" content="dynamic" />
    <meta name="generator" content="{{ what }} {{ version }}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <style type="text/css">
        body {
            background: #fff;
            color: #444;
            font-family: -apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
            font-size: 1rem;
            margin: 0;
            padding: 0;
        }
        .alert {
            padding: 1em 2em;
            border: 1px solid #bcdff1;
            margin: 5em auto;
            width: 50%;
            max-width: 480px;
            -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.13);
            box-shadow: 0 1px 3px rgba(0,0,0,0.13);
            border-radius: .25rem;
        }
        .alert-info {
            background-color: #d9edf7;
            border-color: #bcdff1;
            color: #31708f;
        }
        .alert-info .alert-link {
            color: #245269;
        }
        p {
            line-height: 1;
            margin: 20px 0;
        }
        a {
            color: #222;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="alert alert-info" role="alert">
        <p>{{ lock_reason }}</p>
    </div>
</body>
</html>