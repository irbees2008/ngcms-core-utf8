{% if (global.flags.isLogged) %}
    {% if pluginIsActive('nsm') %}<a href="{{ home }}/plugin/nsm/" class="dropdown-item">Добавить новость</a>{% endif %}
    {% if (global.flags.isLogged and (global.user['status'] <= 3)) %}<a href="{{ admin_url }}" target="_blank" class="dropdown-item"><b>{{ lang.admin_panel }}</b></a>
    <a href="{{ addnews_link }}" class="dropdown-item">{{ lang.add_news }}</a>{% endif %}
    {% if pluginIsActive('uprofile') %}<a href="{{ profile_link }}" class="dropdown-item">{{ lang.edit_profile }}</a>{% endif %}
    {% if pluginIsActive('pm') %}<a href="{{ p.pm.link }}" class="dropdown-item">{{ lang['private_messages'] }} ({{ p.pm.pm_unread }})</a>{% endif %}
    <div class="dropdown-divider"></div>
    <a href="{{ logout_link }}" class="dropdown-item">{{ lang['log_out'] }}</a>
{% else %}

    <script>
        var set_login = 0;
        var set_pass = 0;
    </script>

    <div class="modal fade" id="auth-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{ lang['login_title'] }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <form name="login" action="{{ form_action }}" method="post" class="form-horizontal">
                    <input type="hidden" name="redirect" value="{{ redirect }}" />

                    <fieldset>
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" name="username" id="username" placeholder="{{ lang.username }}" class="form-control" required />
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                </div>
                            </div>
                            <div class="input-group">
                                <input type="password" name="password" id="password" placeholder="{{ lang.password }}" class="form-control" required />
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">{{ lang['login'] }}</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
{% endif %}