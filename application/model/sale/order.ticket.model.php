<?php

class SaleOrderTicketModel extends MysqlModel{

	protected $table='order_ticket';

	public function addOrderTicket($data){

		return $this->insert($data);
	}

	public function getOrderTickets($order_id){

		return $this->select(array('where'=>array('order_id'=>$order_id)));
	}

	public function getOrderItemTickets($order_item_id){

		return $this->select(array('where'=>array('order_item_id'=>$order_item_id)));
	}

	public function updateOrderTicket($order_ticket_id,$data){

		return $this->update($data,array('order_ticket_id'=>$order_ticket_id));
	}

	public function updateTicketByOrder($order_id,$data){

		return $this->update($data,array('order_id'=>$order_id));		
	}
}