<?php

class SaleItemModel extends MysqlModel{

	protected $table='order_item';

	public function getOrderItem($order_item_id){

		return $this->one(array('order_item_id'=>$order_item_id));
	}

	public function getOrderItems($order_id){

		$sql="SELECT oi.*,io.name as options FROM ".DB_PREFIX.$this->table." oi LEFT JOIN ".DB_PREFIX."item_option io ON io.item_option_id=oi.item_option_id WHERE oi.order_id=".(int)$order_id;

		return $this->find($sql);
	}

	public function updateOrderItem($order_item_id,$data){

		return $this->update($data,array('order_item_id'=>$order_item_id));
	}
}