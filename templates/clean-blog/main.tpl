<!DOCTYPE html>
<!--[TWIG] {% spaceless %}-->
<html lang="{{ lang['langcode'] }}">
<head>
    <title>{{ titles }}</title>
    <meta charset="{{ lang['encoding'] }}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="generator" content="{{ what }} {{ version }}" />
    <meta name="document-state" content="dynamic" />
    {{ htmlvars }}
    <!-- Bootstrap Core CSS -->
    <link href="{{ scriptLibrary }}/bootstrap-4.0.0/bootstrap.css" rel="stylesheet">
    <!-- Additional fonts for this theme -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300" rel="stylesheet">
    <link href="{{ scriptLibrary }}/fontawesome-4.7.0/fontawesome.css" rel="stylesheet">
    <!-- Custom styles for this theme -->
    <link href="{{ tpl_url }}/css/style.css" rel="stylesheet">
    <!--[if lt IE 9]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery first, then Tether, then Popper, then Bootstrap JS. -->
    <script src="{{ scriptLibrary }}/js/jquery-3.2.1.js"></script>
    <script src="{{ scriptLibrary }}/js/tether-1.4.0.js"></script>
    <script src="{{ scriptLibrary }}/js/popper-1.11.0.js"></script>
    <script src="{{ scriptLibrary }}/bootstrap-4.0.0/bootstrap.js"></script>
    <script src="{{ scriptLibrary }}/js/notify-3.1.5.js"></script>
    <!-- Theme JavaScript -->
    <script src="{{ scriptLibrary }}/engine.js"></script>
    <script src="{{ tpl_url }}/js/script.js"></script>
    {% if pluginIsActive('rss_export') %}<link href="{{ home }}/rss.xml" rel="alternate" type="application/rss+xml" title="RSS" />{% endif %}
</head>

<body>

    <!-- Navigation navbar navbar-expand-md navbar-dark bg-dark-->
    <nav class="navbar fixed-top navbar-expand-md navbar-light" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="{{ home }}">{{ home_title }}</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="{{ home }}">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="{{ home }}/static/about.html">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="{{ home }}/static/contact.html">Contact</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="{{ home }}#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Categories </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            {{ categories }}
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a href="{{ home }}#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-user fa-lg"></i> </a>
                        <div class="dropdown-menu dropdown-menu-right">
                        {% if (global.flags.isLogged) %}
                            {{ personal_menu }}
                        {% else %}
                            <a href="{{ home }}/register/" class="dropdown-item">{{ lang['registration'] }}</a>
                            <a href="{{ home }}/login/" class="dropdown-item" data-toggle="modal" data-target="#auth-modal">{{ lang['login'] }}</a>
                            <div class="dropdown-divider"></div>
                            <a href="{{ home }}/lostpassword/" class="dropdown-item">{{ lang['lostpassword'] }}</a>
                        {% endif %}
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="{{ home }}/search/"><i class="fa fa-search"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    {{ mainblock }}

    <hr>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <ul class="list-inline text-center">
                        <li class="list-inline-item">
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                    <p class="copyright text-muted">Copyright &copy;  <a title="{{ home_title }}" href="{{ home }}">{{ home_title }}</a>. Powered by <a title="BixBite CMS" target="_blank" href="http://bixbite.site/">BixBite CMS</a> 2006-{{ now|date("Y") }}. <br />{{ lang.sql_queries }}: <b>{{ queries }}</b> | {{ lang.page_generation }}: <b>{{ exectime }}</b> {{ lang.sec }} | <b>{{ memPeakUsage }}</b> Mb&nbsp;</p>
                </div>
            </div>
        </div>
    </footer>

    {% if not (global.flags.isLogged) %}{{ personal_menu }}{% endif %}
    <div id="loading-layer" class="col-md-3"><i class="fa fa-spinner fa-pulse"></i> {{ lang.loading }}</div>

[debug]{debug_queries}{debug_profiler}[/debug]
</body>
</html>
<!--{% endspaceless %} [/TWIG]-->