<!-- Page Header -->
<header class="intro-header" style="background-image: url('{tpl_url}/img/home-bg.jpg')">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="post-heading">
                    <h1>{{ lang.registration }}</h1>
                    <hr class="small">
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Page Content -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">

            <form name="register" action="{{ form_action }}" method="post" onsubmit="return validate();">
                <input type="hidden" name="type" value="doregister" />
                <fieldset>
                    {% for entry in entries %}
                        <div class="form-group row">
                            <label for="{{ entry.id }}" class="col-sm-4 col-form-label">{{ entry.title }}</label>
                            <div class="col-sm-8">
                                {{ entry.input }}
                                {% if entry.descr %}<small id="{{ entry.id }}">{{ entry.descr }}</small>{% endif %}
                                {% if entry.error %}<span class="help-block">{{ entry.error }}</span>{% endif %}
                            </div>
                        </div>
                    {% endfor %}
                    <div class="form-group row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-8">
                            <p class="checkbox"><label><input type="checkbox" name="agree" /> {{lang.theme['registration_rules'] }}</label></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-8">
                            <button type="submit" class="btn btn-success">{{ lang.register }}</button>
                        </div>
                    </div>
                </fieldset>
            </form>

        </div>
    </div>
</div>

<script type="text/javascript">
    $( document ).ready(function() {
        var registrationValidator = (function() {
            var validateFields = function() {
                $("#reg_login").change(function() {
                    if ($('#reg_login').val() == '') {
                        $("#reg_login").css({
                            "border": "1px solid #e2e2e2",
                        });
                        $("small#reg_login").html("{{ lang.auth_login_descr }}");
                        return;
                    }
                    // onlineCheckRegistration
                    var url = '{{ admin_url }}/rpc.php';
                    var method = 'core.registration.checkParams';
                    var params = {'login': $('#reg_login').val(),};
                    $.reqJSON(url, method, params, function(json) {
                        if ((json.data.login > 0 ) && (json.data.login < 100)) {
                            $("#reg_login").css("border-color", "#b54d4b");
                            $("small#reg_login").html("<span style='color:#b54d4b;'>{{ lang.theme.registration_msg_login_warning }}</span>");
                        } else {
                            $("#reg_login").css("border-color", "#94c37a");
                            $("small#reg_login").html("<span style='color:#94c37a;'>{{ lang.theme.registration_msg_login_success }}</span>");
                        }
                    });
                });
                $("#reg_email").change(function() {
                    if ($('#reg_email').val() == '') {
                        $("#reg_email").css({
                            "border": "1px solid #e2e2e2",
                        });
                        $("small#reg_email").html("<span>{{ lang.auth_email_descr }}</span>");
                        return;
                    }
                    // onlineCheckRegistration
                    var url = '{{ admin_url }}/rpc.php';
                    var method = 'core.registration.checkParams';
                    var params = {'email' : $('#reg_email').val(),};
                    $.reqJSON(url, method, params, function(json) {
                        if ((json.data.email > 0 ) && (json.data.email < 100)) {
                            $("#reg_email").css("border-color", "#b54d4b");
                            $("small#reg_email").html("<span style='color:#b54d4b;'>{{ lang.theme.registration_msg_email_warning }}</span>");
                        } else {
                            $("#reg_email").css("border-color", "#94c37a");
                            $("small#reg_email").html("<span style='color:#94c37a;'>{{ lang.theme.registration_msg_email_success }}</span>");
                        }
                    });
                });
                $("#reg_password2").change(function() {
                    if ($('#reg_password2').val() == '' && $('#reg_password').val() == '') {
                        $("#reg_password").css({
                            "border": "1px solid #e2e2e2",
                        });
                        $("#reg_password2").css({
                            "border": "1px solid #e2e2e2",
                        });
                        $("small#reg_password2").html("<span>{{ lang.auth_pass2_descr }}</span>");
                        return;
                    }
                    if ($('#reg_password2').val() != $('#reg_password').val()) {
                        $("#reg_password").css("border-color", "#b54d4b");
                        $("#reg_password2").css("border-color", "#b54d4b");
                        $("small#reg_password2").html("<span style='color:#b54d4b;'>{{ lang.theme.registration_msg_password_warning }}</span>");
                    } else {
                        $("#reg_password").css("border-color", "#94c37a");
                        $("#reg_password2").css("border-color", "#94c37a");
                        $("small#reg_password2").html("<span style='color:#94c37a;'>{{ lang.theme.registration_msg_password_success }}</span>");
                    }
                });
                $("#reg_password").change(function() {
                    if ($('#reg_password2').val() == '' && $('#reg_password').val() == '') {
                        $("#reg_password").css({
                            "border": "1px solid #e2e2e2",
                        });
                        $("#reg_password2").css({
                            "border": "1px solid #e2e2e2",
                        });
                        $("small#reg_password2").html("<span>{{ lang.auth_pass2_descr }}</span>");
                        return;
                    }
                    if ($('#reg_password2').val() != $('#reg_password').val()) {
                        $("#reg_password").css("border-color", "#b54d4b");
                        $("#reg_password2").css("border-color", "#b54d4b");
                        $("small#reg_password2").html("<span style='color:#b54d4b;'>{{ lang.theme.registration_msg_password_warning }}</span>");
                    } else {
                        $("#reg_password").css("border-color", "#94c37a");
                        $("#reg_password2").css("border-color", "#94c37a");
                        $("small#reg_password2").html("<span style='color:#94c37a;'>{{ lang.theme.registration_msg_password_success }}</span>");
                    }
                });
            };
            return {
                validateFields: validateFields
            };
        })();
        registrationValidator.validateFields();
    });
    function validate() {
        if (document.register.agree.checked == false) {
            $.notify({message:'{{ lang.theme['registration_check_rules'] }}'},{type: 'info'});
            return false;
        }
        return true;
    }
</script>