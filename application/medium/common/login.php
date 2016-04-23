<?php

class CommonLogin extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'local.nick':return $this->localByNick($data);break;

			case 'local.email':return $this->localByEmail($data);break;

			case 'local.admin':return $this->admin($data);break;
	
		}
	}

	private function localByNick($data){

		$nick=$data['nick'];
		$password=$data['password'];

		if(empty($nick) || empty($password)) return '用户名或密码不能为空';

		$user=D("user/user")->getUserByParams(array('nick'=>$nick));

		if(empty($user)) return '用户名错误';

		if($user['password']!=sha1($user['salt'].$password)) return '密码错误';

		$this->user_login_success($user);

		return true;
	}
	
	private function localByEmail($data){
		
		$email=$data['email'];
		$password=$data['password'];

		if(empty($email) || empty($password)) return '邮箱或密码不能为空';

		$user=D("user/user")->getUserByParams(array('email'=>$email));

		if(empty($user)) return '用户名错误';

		if($user['password']!=sha1($user['salt'].$password)) return '密码错误';

		$this->user_login_success($user);

		return true;
	}

	private function user_login_success($user){

		$user_id=$user['user_id'];

		$cart=D('user/cart')->getCart($user_id);

		S('CART',empty($cart)?array():unserialize($cart['data']));

		S('LOGGED',$user_id);

		S('USER',$user);

		$ip=getip();

		$time=time();

		$logged="{$_SERVER['HTTP_HOST']};{$ip};{$user_id};{$time}";
		
		C('USERLOGGED',encrypt($logged));
	}

	private function admin($data){
		
		$uname=$data['uname'];
		$password=$data['password'];

		if(empty($uname) || empty($password)) return '用户及密码不能为空';

		$admin=D('admin/admin')->getAdmin($uname);
		
		if(empty($admin)) return 'no this user';

		if($admin['password']!=SHA1($admin['salt'].SHA1($admin['salt'].SHA1($password)))) return '密码错误';
		
		$uid=$admin['uid'];
		
		S('LOGGED',$uid);

		S('ADMIN',$admin);

		$ip=getip();

		$time=time();

		$logged="{$_SERVER['HTTP_HOST']};{$ip};{$uid};{$time}";
		
		C('ADMINLOGGED',encrypt($logged));

		return 1;
	}

	
}