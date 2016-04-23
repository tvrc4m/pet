<?php

class SaleOrderTicket extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'add':return $this->add($data);break;

			case 'order':return $this->order($data);break;

			case 'item':return $this->item($data);break;
		}
	}

	private function add($data){

		return D('sale/order.ticket')->addOrderTicket($data);
	}

	private function order($order_id){
		
		return D('sale/order.ticket')->getOrderTickets($order_id);
	}

	private function item($order_item_id){

		return D('sale/order.ticket')->getOrderItemTickets($order_item_id);
	}
}