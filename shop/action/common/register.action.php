<?php  

class RegisterAction extends Action {

	protected $lang='common/register';

	public function index() {

		$this->title='欢迎注册多彩旅程售票系统';

		(S('LOGGED') && S('USER')) && go('/');

		if ((ispost() && $this->validate())) {

			$status=M('common/register','local',$_POST);
			
			$status===true && go(vendor_url());
		}

		$this->flushform($_POST,array(),array('name','nick','email','phone','idcard','password','confirm'));

		$this->assign(array('warning'=>$status));

		$this->display('common/register');
  	}

  	public function ajax(){

		if(S('LOGGED') && S('USER')) exit(json_encode(array('ret'=>1)));

		if(ispost() && $this->validate()){

			$status=M('common/register','local.user',$_POST);

			$res=$status===true?array('ret'=>1):array('ret'=>-1,'reason'=>$status);

			exit(json_encode($res));
		}

		exit(json_encode(array('ret'=>-1,'errors'=>$this->error)));
  	}

  	private function validate(){

  		if(empty($_POST['nick'])){

			$this->error['nick']=L('error_nick');
		}else{

			$users=M('user/user','get.by.nick',$_POST['nick']);

			if(!empty($users)){

				$this->error['nick']=L('error_exist_nick');
			}
		}
		if(empty($_POST['email']) || preg_match('/\w+@\w+\.\w+/',$_POST['email'])!=1){

			$this->error['email']=L('error_email');
		}else{

			$users=M('user/user','get.by.email',$_POST['email']);

			if(!empty($users)){

				$this->error['email']=L('error_exist_email');
			}
		}

		// if(empty($_POST['phone']) || preg_match('/^\d{6,11}$/',$_POST['phone'])!==1){

		// 	$this->error['phone']=L('error_phone');
		// }

		if(empty($_POST['password']) || strlen($_POST['password'])<6){

			$this->error['password']=L('error_password');
		}
		if(empty($_POST['confirm'])){

			$this->error['confirm']=L('error_confirm');
		}else if($_POST['password']!=$_POST['confirm']){

			$this->error['confirm']=L('error_confirm_incorrect');
		}

		if($this->error){

        $this->error['warning']=L('error_waring');

        	return false;
      	}

      	return true;
  	}
}