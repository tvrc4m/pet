<?php

class SaleOrderStatusModel extends MysqlModel{

	protected $table='order_status';

	public function getStatus($order_status_id){

		return $this->one(array('order_status_id'=>$order_status_id));
	}

	public function addStatus($data){

		$status=$this->insert($data);
		
		return $this->lastID();
	}

	public function updateStatus($order_status_id,$data){

		return $this->update($data,array('order_status_id'=>$order_status_id));
	}

	public function selectBywhere($where){

		return $this->select(array('where'=>$where));
	}

	public function delOrderStatuses($data){

		$sql="UPDATE ".DB_PREFIX.$this->table." SET deleted=1 WHERE order_status_id IN (".implode(',',$data).")";

		return $this->query($sql);
	}

	public function all(){

		return $this->select(array('sort'=>array('deleted ASC')));
	}

	public function listStatuses(){

		return $this->select(array('where'=>array('deleted'=>0)));
	}

	public function countStatuses($data){

		$sql="SELECT count(*) as count FROM ".DB_PREFIX.$this->table." WHERE deleted=0 ";

	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND name LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }

	    return $this->count($sql);
	}
}