<?php

// Protect against hack attempts
if (! defined('NGCMS')) {
    die('HAL');
}

global $userROW;
if (is_array($userROW)) {
	return true;
}

loadPluginLibrary('ggg_recaptcha', 'lib');

class GGGRecaptchaCoreFilter extends CoreFilter
{
    protected $recaptcha;

    public function __construct($recaptcha)
    {
        $this->recaptcha = $recaptcha;
    }

    public function registerUserForm(&$tvars)
    {
        return $this->recaptcha->htmlVars();
    }

    public function registerUser($params, &$msg)
    {
        if (! $this->recaptcha->verifyingCaptcha()) {
            $msg = 'Registration failed. Google recaptcha protected.';

            return false;
        }

        return true;
    }
}

register_filter('core.registerUser', 'ggg_recaptcha', new GGGRecaptchaCoreFilter(new GGGRecaptcha()));

if (getPluginStatusActive('comments')) {
    loadPluginLibrary('comments', 'lib');

    class GGGRecaptchaFilterComments extends FilterComments
    {
        protected $recaptcha;

        public function __construct($recaptcha)
        {
            $this->recaptcha = $recaptcha;
        }

        public function addCommentsForm($newsID, &$tvars)
        {
    		return $this->recaptcha->htmlVars();
        }

        public function addComments($userRec, $newsRec, &$tvars, &$SQL)
        {
            return $this->recaptcha->verifyingCaptcha();
        }
    }

    pluginRegisterFilter('comments', 'ggg_recaptcha', new GGGRecaptchaFilterComments(new GGGRecaptcha()));
}

if (getPluginStatusActive('feedback')) {
    loadPluginLibrary('feedback', 'common');

    class GGGRecaptchaFilterFeedback extends FeedbackFilter
    {
        protected $recaptcha;

        public function __construct($recaptcha)
        {
            $this->recaptcha = $recaptcha;
        }

        public function onShow($formID, $formStruct, $formData, &$tvars)
        {
    		return $this->recaptcha->htmlVars();
        }

        public function onProcessEx($formID, $formStruct, $formData, $flagHTML, &$tVars, &$tResult)
        {
            return $this->recaptcha->verifyingCaptcha();
        }
    }

    pluginRegisterFilter('feedback', 'ggg_recaptcha', new GGGRecaptchaFilterFeedback(new GGGRecaptcha()));
}
