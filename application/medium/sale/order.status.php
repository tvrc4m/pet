<?php

class SaleOrderStatus extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'add':return $this->add($data);break;

			case 'get':return $this->get($data);break;

			case 'get.by.name':return $this->getByName($data);break;

			case 'update':return $this->update($data['id'],$data['data']);break;

			case 'del':return $this->del($data);break;

			case 'list':return $this->listStatuses($data);break;

			case 'all':return $this->all();break;

			case 'count':return $this->count($data);break;
		}
	}

	public function add($data){

		return D('sale/order.status')->addStatus($data);
	}

	private function get($order_status_id){
		
		return D('sale/order.status')->getStatus($order_status_id);
	}

	private function getByName($name){

		return D('sale/order.status')->selectBywhere(array('name'=>$name));
	}

	private function update($order_status_id,$data){

		return D('sale/order.status')->updateStatus($order_status_id,$data);
	}

	private function del($data){

		if(empty($data)) return 1;
		
		return D('sale/order.status')->delOrderStatuses($data);
	}

	private function listStatuses(){

		$statuses=array();

		$result= D('sale/order.status')->listStatuses();

		foreach ($result as $res) {
			
			$statuses[$res['order_status_id']]=$res;
		}

		return $statuses;
	}

	private function all(){

		$statuses=array();

		$result= D('sale/order.status')->all();

		foreach ($result as $res) {
			
			$statuses[$res['order_status_id']]=$res;
		}

		return $statuses;
	}

	public function count($data){

		return D('sale/order.status')->countStatuses($data);
	}
}