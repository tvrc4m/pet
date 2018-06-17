<?php  

class LoginAction extends Action {

	protected $lang='common/login';

	public function index() {

		$this->title='欢迎宠物';

		(S('LOGGED') && S('USER')) && go('/shop/');

		if (($_SERVER['REQUEST_METHOD'] == 'POST')) {

			$name=$_POST['name'];

  			if(preg_match('/\w+@\w+\.\w+/',$name)){

  				$status=M('common/login','local.email',array('email'=>$name,'password'=>$_POST['password']));	
  			}else{

  				$status=M('common/login','local.nick',array('nick'=>$name,'password'=>$_POST['password']));
  			}
			
			$status===true && go(shop_url());
		}

		$this->assign(array('warning'=>$status,'nick'=>$_POST['nick'],'password'=>$_POST['password']));

		$this->display('common/login');
  	}

  	public function ajax(){

  		if (($_SERVER['REQUEST_METHOD'] == 'POST')) {

  			$name=$_POST['name'];

  			if(preg_match('/\w+@\w+\.\w+/',$name)){

  				$status=M('common/login','local.email',array('email'=>$name,'password'=>$_POST['password']));	
  			}else{

  				$status=M('common/login','local.nick',array('nick'=>$name,'password'=>$_POST['password']));
  			}

  			$res=$status===true?array('ret'=>1):array('ret'=>-1,'reason'=>$status);

			exit(json_encode($res));
		}
  	}
}