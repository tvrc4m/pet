<?php

class UserUserModel extends MysqlModel{

	protected $table='user';

	public function getUser($user_id){

		return $this->one(array('user_id'=>$user_id));
	}

	public function getUserByParams($params){

		return $this->one($params);
	}

	public function addUser($data){

		$status=$this->insert($data);
		
		return $this->lastID();
	}

	public function getUsersByParams($params){

		return $this->select(array('where'=>$params));
	}

	public function updateUser($user_id,$data){

		return $this->update($data,array('user_id'=>$user_id));
	}

	public function listUsers($data){

		$sql="SELECT * FROM ".DB_PREFIX."user WHERE 1 ";

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

	    $sql.=' ORDER BY user_id DESC ';

	    if (isset($data['start']) || isset($data['limit'])) {

	        $data['start'] < 0 && $data['start'] = 0;
	        $data['limit'] < 1 && $data['limit'] = 20;

	        $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
	    }
	    
	    return $this->find($sql);
	}

	public function countUsers($data){

		$sql="SELECT count(*) as count FROM ".DB_PREFIX."user WHERE 1 ";

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