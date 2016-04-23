<?php

class UserCartModel extends MysqlModel{

	protected $table='user_cart';

	public function addCartItem($data){

		return $this->insert($data);
	}

	public function getCart($user_id){

		return $this->one(array('user_id'=>$user_id));
	}

	public function updateCart($user_id,$data){

		return $this->update($data,array('user_id'=>$user_id));
	}
}