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

#define wordpress url
define( 'WP_SITEURL', 'http://sed123:5050' );
#define wordpress homepage url
define( 'WP_HOME', 'http://sed123:5050' );


#Setting authorization keys
define( 'AUTH_KEY',         'pass' );
define( 'SECURE_AUTH_KEY',  'pass' );
define( 'LOGGED_IN_KEY',    'pass' );

//Define the absolute path to this file if not already defined
if ( ! defined( 'ABSPATH' ) )
{
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
  #dirname(_FILE_) => gives pwd of current file
}

// Sets up WordPress vars and included files
require_once( ABSPATH . 'wp-settings.php' );
#require once => if ile already included do not include it a second time
#ABSPATH gives path

?>
