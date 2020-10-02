<?php
//Php is a script language starting with and ending with following syntax

//https://wordpress.org/support/article/editing-wp-config-php/

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'mysql' );
/** MySQL database username */
define( 'DB_USER', 'user' );
/** MySQL database password */
define( 'DB_PASSWORD', 'pass' );
/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

//The default wp collate is blank, so that the database collation will be automatically assigned by MySQL
define( 'DB_COLLATE', '' );

//Those four security keys are required
define( 'AUTH_KEY',         'pass' );
define( 'SECURE_AUTH_KEY',  'pass' );
define( 'LOGGED_IN_KEY',    'pass' );
define( 'NONCE_KEY',        'pass' );

#define wordpress url
define( 'WP_SITEURL', 'http://sed123:5050' );
#define wordpress homepage url
define( 'WP_HOME', 'http://sed123:5050' );

?>
