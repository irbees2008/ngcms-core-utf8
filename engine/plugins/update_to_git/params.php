<?php

if (! defined('NGCMS')) {
    exit('HAL');
}

return [
    'user' => 'irbees2008',
    'repository' => 'ngcms-core',
    'engine_version' => engineVersion,

    // Skip files
    'except' => [
        '.htaccess', 'robots.txt', 'engine/upgrade_090-092.php', // Рё С‚Р°Рє РґР°Р»РµРµ
    ],
];
