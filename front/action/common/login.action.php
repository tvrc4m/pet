<?php  

class LoginAction extends Action {

	protected $lang='common/login';

	public function index() {

		$this->title='欢迎登录多彩旅程售票系统';

		(S('LOGGED') && S('VENDOR')) && go('/vendor/');

		if (($_SERVER['REQUEST_METHOD'] == 'POST')) {

			$status=M('common/login','local',array('nick'=>$_POST['nick'],'password'=>$_POST['password']));
			
			$status===true && go(vendor_url());
		}

		$this->assign(array('warning'=>$status,'nick'=>$_POST['nick'],'password'=>$_POST['password']));

		$this->display('common/login');
  	}
}