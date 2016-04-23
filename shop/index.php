<?php

header('Content-type:text/html;charset=utf-8');

error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
// error_reporting(E_ALL);

date_default_timezone_set('Asia/Shanghai');

define("ROOT",dirname(dirname(__FILE__)));
define("HOME",dirname(__FILE__));

include_once(ROOT.'/library/core/config.php');

// ini_set('session.cookie_domain',COOKIE_DOMAIN);
session_set_cookie_params(1800, '/');
session_save_path(SESSION);
session_start();

include_once(CORE.'function.php');
include_once(CORE.'common.php');
include_once(CORE.'code.inc.php');
include_once(CORE.'admin.func.php');
include_once(CORE.'db.class.php');
include_once(CORE.'model.class.php');
include_once(CORE.'view.class.php');
include_once(CORE.'action.class.php');
include_once(CORE.'medium.class.php');
include_once(CORE.'lang.class.php');
include_once(CORE.'plugin.class.php');
include_once(CORE.'alias.class.php');

// init default language 
$lang=new Lang('zh');

$folder=isset($_REQUEST['f'])?strtolower($_REQUEST['f']).'/':'common/';

!isset($_REQUEST['app']) && $_REQUEST['app']='index';

$app=$_REQUEST['app'];

$method=isset($_REQUEST['act'])?$_REQUEST['act']:'index';

$appFile=ACTION.$folder.strtolower($app).'.action.php';

!file_exists($appFile) && exit('指定文件不存在');

P('changePassword');

include_once($appFile);

$className=ucfirst($app).'Action';

$appInstance=new $className;

!method_exists($appInstance,$method) && exit('instance method is not exist');

$appInstance->$method();
