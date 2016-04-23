<?php

class ProductCatModel extends MysqlModel{

	protected $table='cat';

	public function addCat($data){

		return $this->insert($data);
	}

	public function updateCat($cid,$data){

		return $this->update($data,array('cat_id'=>$cid));
	}

	public function getCat($cat_id){

		return $this->one(array('cat_id'=>$cat_id));
	}

	public function selectCat($params){

		return $this->select(array('where'=>$params));
	}

	public function listCats($data){

		$sql="SELECT * FROM ".DB_PREFIX.$this->table." WHERE deleted=0 ";

	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND name LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }
	    
	    if ($data['filter_status']!==null) {
	        $sql .= " AND status=" . (int)$data['filter_status'];
	    }
	    
	    if (isset($data['start']) || isset($data['limit'])) {

	        $data['start'] < 0 && $data['start'] = 0;
	        $data['limit'] < 1 && $data['limit'] = 20;

	        $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
	    }
	    
	    return $this->find($sql);
	}

	public function countCats($data){

		$sql="SELECT count(*) as count FROM ".DB_PREFIX.$this->table." WHERE 1 ";

	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND name LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }
	    if ($data['filter_status']!==null) {
	        $sql .= " AND status=" . (int)$data['filter_status'];
	    }
	    
	    return $this->count($sql);
	}
}
