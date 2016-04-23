<?php

class VendorVendor extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'add':return $this->add($data);break;

			case 'edit':return $this->edit($data['vendor_id'],$data['data']);break;

			case 'get':return $this->get($data);break;

			case 'list':return $this->listVendors($data);break;

			case 'all':return $this->all();break;

			case 'count':return $this->count($data);break;

			case 'get.by.email':return $this->getByEmail($data);break;

			case 'get.by.nick':return $this->getByNick($data);break;

		}
	}

	private function add($data){

		$salt=substr(md5(uniqid(rand(), true)), 0, 9);

		$data=array('name'=>$data['name'],'nick'=>$data['nick'],'password'=>sha1($salt.$data['password']),'salt'=>$salt,'email'=>$data['email'],'phone'=>$data['phone'],'idcard'=>$data['idcard'],'status'=>(int)$data['status']);

		return D('vendor/vendor')->addVendor($data);
	}

	private function edit($vendor_id,$data){

		$vendor=$this->get($vendor_id);
		
		if(empty($vendor)) return -1;

		$params=array('name'=>$data['name'],'nick'=>$data['nick'],'email'=>$data['email'],'phone'=>$data['phone'],'idcard'=>$data['idcard'],'status'=>(int)$data['status']);
		
		if(!empty($data['password'])){

			$params['password']=sha1($vendor['salt'].$data['password']);
		}

		return D('vendor/vendor')->updateVendor($vendor_id,$params);
	}

	private function get($vendor_id){
		
		return D('vendor/vendor')->getVendor($vendor_id);
	}

	public function listVendors($data){

		return D('vendor/vendor')->listVendors($data);
	}

	public function all(){

		return D('vendor/vendor')->all();
	}

	public function count($data){

		return D('vendor/vendor')->countVendors($data);
	}

	private function getByEmail($email){

		return D('vendor/vendor')->getVendorByParams(array('email'=>$email));
	}

	private function getByNick($nick){

		return D('vendor/vendor')->getVendorByParams(array('nick'=>$nick));
	}
}