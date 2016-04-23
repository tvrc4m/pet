<?php

class UserUser extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'add':return $this->add($data);break;

			case 'edit':return $this->edit($data['user_id'],$data['data']);break;

			case 'get':return $this->get($data);break;

			case 'list':return $this->listUsers($data);break;

			case 'all':return $this->all();break;

			case 'count':return $this->count($data);break;

			case 'get.by.email':return $this->getByEmail($data);break;

			case 'get.by.nick':return $this->getByNick($data);break;

		}
	}

	private function add($data){

		$salt=substr(md5(uniqid(rand(), true)), 0, 9);

		$data=array('name'=>$data['name'],'nick'=>$data['nick'],'password'=>sha1($salt.$data['password']),'salt'=>$salt,'email'=>$data['email'],'phone'=>$data['phone'],'idcard'=>$data['idcard'],'status'=>(int)$data['status']);

		return D('user/user')->addUser($data);
	}

	private function edit($user_id,$data){

		$user=$this->get($user_id);
		
		if(empty($user)) return -1;

		$params=array('name'=>$data['name'],'nick'=>$data['nick'],'email'=>$data['email'],'phone'=>$data['phone'],'idcard'=>$data['idcard'],'status'=>(int)$data['status']);
		
		if(!empty($data['password'])){

			$params['password']=sha1($user['salt'].$data['password']);
		}

		return D('user/user')->updateUser($user_id,$params);
	}

	private function get($user_id){
		
		return D('user/user')->getUser($user_id);
	}

	public function listUsers($data){

		return D('user/user')->listUsers($data);
	}

	public function all(){

		return D('user/user')->all();
	}

	public function count($data){

		return D('user/user')->countUsers($data);
	}

	private function getByEmail($email){

		return D('user/user')->getUserByParams(array('email'=>$email));
	}

	private function getByNick($nick){

		return D('user/user')->getUserByParams(array('nick'=>$nick));
	}
}