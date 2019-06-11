<?php

class GGGRecaptcha
{
	protected $plugin = 'ggg_recaptcha';
	protected $apiRender = 'https://www.google.com/recaptcha/api.js?render=';
	protected $apiVerify = 'https://www.google.com/recaptcha/api/siteverify';

	protected $site_key;
	protected $secret_key;
	protected $score;

	protected $response;

	public function __construct()
	{
		$this->site_key = trim(secure_html(pluginGetVariable($this->plugin, 'site_key'))) ?: null;
		$this->secret_key = trim(secure_html(pluginGetVariable($this->plugin, 'secret_key'))) ?: null;
		$this->score = (double) pluginGetVariable($this->plugin, 'score') ?: 0.5;
		$this->response = isset($_POST['g-recaptcha-response']) ? (trim(secure_html($_POST['g-recaptcha-response'])) ?: null) : null; // ?? to >= PHP 7.0
	}

	public function htmlVars()
	{
		if (empty($this->site_key)) {
			return false;
		}

		register_htmlvar('js', $this->apiRender.$this->site_key);
		register_htmlvar('plain', '<script>function grecaptcha_reload(){grecaptcha.ready(function(){grecaptcha.execute(\''.$this->site_key.'\',{action:\'send_form\'}).then((token)=>{let elements=document.getElementsByName("g-recaptcha-response");for(let i=0;i<elements.length;i++){elements[i].value = token;}});});}grecaptcha_reload();</script>');

		return true;
	}

	public function verifyingCaptcha()
	{
		if (empty($this->secret_key) or empty($this->response)) {
			return false;
		}

		$verified = $this->touchAnswer();

		if (is_array($verified) and $verified['success'] and $verified['score'] >= $this->score) {
			return true;
		}

		return false;
	}
    
    protected function touchAnswer()
    {   
        $query = http_build_query([
            'secret' => $this->secret_key,
            'response' => $this->response
        ]);
        
        if (extension_loaded('curl') and function_exists('curl_init')) {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $this->apiVerify);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $query);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $answer = curl_exec($ch);
        } elseif (ini_get('allow_url_fopen')) {
            $path = urlencode($this->apiVerify.'?'.$query);
            $answer = file_get_contents($path);
        } else {
            throw new Exception('Not supported: cURL, allow_fopen_url.');
        }
        
        $answer = json_decode($answer);
        if (JSON_ERROR_NONE !== json_last_error()) {
            throw new Exception('JSON error.');
        }
        
        return (array) $answer;
    }
}
