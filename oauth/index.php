<?php

header('Content-type:application/json;charset=utf-8');

error_reporting(E_ALL & ~E_NOTICE);
// error_reporting(E_ALL);

date_default_timezone_set('Asia/Shanghai');

define('ROOT',dirname(__FILE__));

$version=$_GET['version'];

define('HOME',ROOT.'/oauth/'.$version);

$folder=isset($_REQUEST['f'])?strtolower($_REQUEST['f']).'/':'common/';

include_once(ROOT.'/library/core/api.config.php');

// ini_set('session.cookie_domain',COOKIE_DOMAIN);
session_set_cookie_params(1800, '/');
session_save_path(SESSION);
session_start();

include_once(CORE.'function.php');
include_once(CORE.'common.php');
include_once(CORE.'code.inc.php');
include_once(CORE.'admin.func.php');
include_once(CORE.'db.class.php');
include_once(CORE.'action.class.php');
include_once(CORE.'model.class.php');
include_once(CORE.'medium.class.php');
include_once(CORE.'lang.class.php');
include_once(CORE.'plugin.class.php');
include_once(CORE.'alias.class.php');


// init default language 
$lang=new Lang();

!isset($_REQUEST['app']) && $_REQUEST['app']='index';

$app=$_REQUEST['app'];


include_once(HOME.'authorize.php');

