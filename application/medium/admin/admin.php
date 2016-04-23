<?php

class AdminAdmin extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'get':return $this->get($data);break;

			case 'list':return $this->listAdmin($data);break;
	
		}
	}
	
	private function get($data){

		$uid=$data['uid'];

		return D('admin/admin")->getAdminByID($uid);
	}
}