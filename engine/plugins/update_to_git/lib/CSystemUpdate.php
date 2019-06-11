<?php

/*
 * Class CSystemUpdate
 * Description: Update system files, templates, plugins with RPC from GitHub
*/

class CSystemUpdate
{
    protected $except;

    protected $user;
    protected $repository;
    protected $engine_version;

    protected $answer = [];

    /**
     * @param $params
     * @throws CSystemUpdateException
     * @return Update
     */
    public function __construct($params)
    {
        $this->except = $params['except'];

        $this->user = $params['user'];
        $this->repository = $params['repository'];
        $this->engine_version = $params['engine_version'];
    }

    public function execute()
    {
        return $this->answer;
    }

    public function check()
    {
        try {
            $output = '';
            $url = "https://api.github.com/repos/$this->user/$this->repository/compare/$this->engine_version...master";

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
            curl_setopt($ch, CURLOPT_USERAGENT, 'ngcms-core-updater');
            curl_setopt($ch, CURLOPT_URL, $url);
            $data = json_decode(curl_exec($ch), true);
            $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            if (404 == $status) {
                $output = '<b class="text-muted">not found</b>';
            } elseif ($status != 200) {
                $output = "Р—Р°Р±Р»СѓРґРёР»Р°СЃСЏ СЏ: " . $status;
            }
            curl_close($ch);

            $this->answer = [
                'status' => 1,
                'errorCode' => 0,
                'data' => arrayCharsetConvert(0, $data)
            ];
        } catch (CSystemUpdateException $e) {
            $this->answer = [
                'status' => 0,
                'errorCode' => 999,
                'data' => $e->errorMessage()
            ];
        }
    }
    /**
     * @param $params
     *  - $params['url'] - update url
     *  - $params['name'] - download file base name
     *  - $params['action'] - action
     *      - removed
     *      - added
     *      - modified
     *      - renamed
     */
    public function download($url, $name, $action)
    {
        global $lang;

        ignore_user_abort(true);

        $updateURL = str_replace("github.com/$this->user/$this->repository/raw/", "raw.githubusercontent.com/$this->user/$this->repository/", $url);
        // full path to file
        $downloadDest = site_root . pathinfo($name)['dirname'];
        // full path to file + fileName
        $downloadFile = site_root . $name;

        if (in_array($name, $this->except)) {
            $this->answer = [
                'status' => 2,
                'errorCode' => 0,
                'data' => arrayCharsetConvert(0, 'skipped:: ' . str_replace(site_root, '', $downloadFile))
            ];

            return false;
        }

        try {
            if ('removed' == $action) {
                if (! $this->fileRemove($downloadFile) and is_file($downloadFile)) {
                    throw new CSystemUpdateException('Unable to remove destination file');
                }
            } else {
                if (! file_exists($downloadDest) and ! mkdir($downloadDest, 0755, true)) {
                    throw new CSystemUpdateException('Unable to creat destination directory <b>' . $downloadDest . '</b>');
                }
                if (null == ($fdest = $this->fileOpen($downloadFile, "w+"))) {
                    throw new CSystemUpdateException('Unable to creat destination file <b>' . $downloadFile . '</b>');
                }
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_HEADER, 0);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
                curl_setopt($ch, CURLOPT_USERAGENT, 'ngcms-core-updater');
                curl_setopt($ch, CURLOPT_URL, $updateURL);
                $data = curl_exec($ch);
                $status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                if (404 == $status) {
                    $output = '<b class="text-muted">not found</b>';
                } elseif ($status != 200) {
                    $output = "Р—Р°Р±Р»СѓРґРёР»Р°СЃСЏ СЏ: " . $status;
                }
                curl_close($ch);
                fwrite($fdest, $data);

                fclose($fdest);
            }

            $this->answer = [
                'status' => 1,
                'errorCode' => 0,
                'data' => arrayCharsetConvert(0, $action .':: ' . $name)
            ];
        } catch (CSystemUpdateException $e) {
            return $e->errorMessage();
        }
    }

    protected function fileOpen($filename, $mode, $retry = 5)
    {
        while (!($fp = @fopen($filename, $mode))) {
            if (--$retry>0) {
                sleep(1);
            } else {
                break;
            }
        }
        return $fp;
    }

    protected function fileRemove($filename)
    {
        return unlink($filename);
    }
}

/*
 * Class CSystemUpdate
 * Description: Update system files, templates, plugins with RPC from GitHub
*/

class CSystemUpdateException extends Exception
{
    public function errorMessage()
    {
        die(json_encode(array('status' => 0, 'errorCode' => ($this->getCode() ? $this->getCode() : 999), 'errorText' => $this->getMessage())));
        coreNormalTerminate(1);
        exit;
    }
}
