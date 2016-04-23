<?php

class CommonRegister extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'local.user':return $this->localUser($data);break;
	
		}
	}
	
	private function localUser($data){

		$salt=substr(md5(uniqid(rand(), true)), 0, 32);

		$user=array('nick'=>$data['nick'],'password'=>sha1($salt.$data['password']),'salt'=>$salt,'email'=>$data['email'],'status'=>1);
		
		$user_id=D('user/user')->addUser($user);

		if(!$user_id) return '注册失败,请重试！';

		$user['user_id']=$user_id;

		S('LOGGED',$user_id);

		S('USER',$user);

		$ip=getip();

		$time=time();

		$logged="{$_SERVER['HTTP_HOST']};{$ip};{$vendor_id};{$time}";
		
		C('VENDORLOGGED',encrypt($logged));

		return true;
	}
}