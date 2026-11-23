<?php

define('SERVERNAME', getenv('DB_HOST') ?: 'localhost');
define('USERNAME', getenv('DB_USER') ?: 'puav_user');
define('PASSWORD', getenv('DB_PASSWORD') ?: 'puav_password');
define('DBNAME', getenv('DB_NAME') ?: 'puav_app');
define('AMBIENTE', (int)(getenv('AMBIENTE') ?: 1));
