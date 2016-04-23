<?php

class ProductItemModel extends MysqlModel{

	protected $table='item';

	public function addItem($data){

		return $this->insert($data);
	}

	public function getItem($item_id){

		return $this->one(array('item_id'=>$item_id));
	}

	public function getItemsByIDs($ids){

		return $this->find("SELECT * FROM ".DB_PREFIX.$this->table." WHERE item_id IN (".implode(',',$ids).")");
	}

	public function updateItem($item_id,$data){

		return $this->update($data,array('item_id'=>$item_id));
	}

	public function listItems($data){

		$sql="SELECT * FROM ".DB_PREFIX.$this->table." WHERE deleted=0  ";

		if (!empty($data['filter_id'])) {
	    	$sql .= " AND item_id = " . (int)$data['filter_id'];
	    }
	    if (!empty($data['filter_cat'])) {
	    	$sql .= " AND cat_id = " . (int)$data['filter_cat'];
	    }
	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND title LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }
	    if (!empty($data['filter_sku'])) {
	        $sql .= " AND sku LIKE '%" . $this->escape($data['filter_sku']) . "%'";
	    }
	    if ($data['filter_status']!==null) {
	        $sql .= " AND status=" . (int)$data['filter_status'];
	    }
	    if (!empty($data['filter_create_date'])) {
	        $sql .= " AND DATE_FORMAT(created_date,'%Y-%m-%d')='" . $data['filter_create_date']."'";
	    }
	  	
	    $sql.=" ORDER BY created_date DESC";

	    if (isset($data['start']) || isset($data['limit'])) {

	        $data['start'] < 0 && $data['start'] = 0;
	        $data['limit'] < 1 && $data['limit'] = 20;

	        $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
	    }
	    
	    return $this->find($sql);
	}

	public function countItems($data){

		$sql="SELECT count(*) as count FROM ".DB_PREFIX.$this->table." WHERE deleted=0  ";

	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND title LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }
	    if (!empty($data['filter_sku'])) {
	        $sql .= " AND sku LIKE '%" . $this->escape($data['filter_sku']) . "%'";
	    }
	    if ($data['filter_status']!==null) {
	        $sql .= " AND status=" . (int)$data['filter_status'];
	    }
	    if (!empty($data['filter_create_date'])) {
	        $sql .= " AND DATE_FORMAT(created_date,'%Y-%m-%d')='" . $data['filter_create_date']."'";
	    }

	    return $this->count($sql);
	}

	public function all(){

		return $this->select();
	}
}
