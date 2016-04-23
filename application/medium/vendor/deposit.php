<?php

class VendorDeposit extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'top.up':return $this->topup($data);break;

			case 'list':return $this->listDeposit($data);break;

			case 'count':return $this->count($data);break;
		}
	}

	public function topup($data){

		$params=array('vendor_id'=>$data['vendor_id'],'amount'=>$data['amount'],'type'=>'deposit');

		return D('vendor/deposit')->addDeposit($params);
	}

	public function listDeposit($data){

		return D('vendor/deposit')->listDeposit($data);
	}

	public function count($data){

		return D('vendor/deposit')->countDeposit($data);
	}
}
