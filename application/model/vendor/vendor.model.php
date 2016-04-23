<?php

class VendorVendorModel extends MysqlModel{

	protected $table='vendor';

	public function getVendor($vendor_id){

		return $this->one(array('vendor_id'=>$vendor_id));
	}

	public function getVendorByVid($v_vendor_id){

		return $this->one(array('v_vendor_id'=>$v_vendor_id));
	}

	public function addVendor($data){

		$status=$this->insert($data);
		
		return $this->lastID();
	}

	public function getVendorByParams($params){

		return $this->select(array('where'=>$params));
	}

	public function updateVendor($vendor_id,$data){

		return $this->update($data,array('vendor_id'=>$vendor_id));
	}

	public function listVendors($data){

		$sql="SELECT * FROM ".DB_PREFIX."vendor WHERE 1 ";

	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND name LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }
	    if (!empty($data['filter_nick'])) {
	    	$sql .= " AND nick LIKE '%" . $this->escape($data['filter_nick']) . "%'";
	    }
	    if (!empty($data['filter_phone'])) {
	        $sql .= " AND phone LIKE '%" . $this->escape($data['filter_phone']) . "%'";
	    }
	    if (!empty($data['filter_email'])) {
	        $sql .= " AND email LIKE '%" . $this->escape($data['filter_email']) . "%'";
	    }
	    if ($data['filter_status']!==null) {
	        $sql .= " AND status=" . (int)$data['filter_status'];
	    }

	    $sql.=' ORDER BY vendor_id DESC ';

	    if (isset($data['start']) || isset($data['limit'])) {

	        $data['start'] < 0 && $data['start'] = 0;
	        $data['limit'] < 1 && $data['limit'] = 20;

	        $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
	    }
	    
	    return $this->find($sql);
	}

	public function countVendors($data){

		$sql="SELECT count(*) as count FROM ".DB_PREFIX."vendor WHERE 1 ";

	    if (!empty($data['filter_nick'])) {
	    	$sql .= " AND nick LIKE '%" . $this->escape($data['filter_nick']) . "%'";
	    }
	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND name LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }
	    if (!empty($data['filter_phone'])) {
	        $sql .= " AND phone LIKE '%" . $this->escape($data['filter_phone']) . "%'";
	    }
	    if (!empty($data['filter_email'])) {
	        $sql .= " AND email LIKE '%" . $this->escape($data['filter_email']) . "%'";
	    }
	    if ($data['filter_status']!==null) {
	        $sql .= " AND status=" . (int)$data['filter_status'];
	    }

	    return $this->count($sql);
	}

	public function all(){

		return $this->select();
	}
}