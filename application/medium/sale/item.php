<?php

class SaleItem extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'get':return $this->get($data);break;

			case 'order':return $this->order($data);break;
		}
	}
	
	private function get($order_item_id){

		return D('sale/item')->getOrderItem($order_item_id);
	}

	private function order($order_id){
		
		return D('sale/item')->getOrderItems($order_id);
	}

}
