<?php

class VendorDepositModel extends MysqlModel{

	protected $table='vendor_deposit';

	public function addDeposit($data){

		$type=empty($data['type'])?'deposit':$data['type'];

		$status=$this->call('tt_proc_vendor_deposit',array($data['vendor_id'],$data['amount'],$type,'@success'));

		$success=$this->get('SELECT @success');

		return $success;
	}

	public function listDeposit($data){

		$sql="SELECT d.vendor_deposit_id,d.amount,d.created_date,v.name,v.nick,v.phone FROM ".DB_PREFIX.$this->table." d,".DB_PREFIX."vendor v WHERE d.vendor_id=v.vendor_id ";

		if (!empty($data['filter_nick'])) {
	    	$sql .= " AND v.nick LIKE '%" . $this->escape($data['filter_nick']) . "%'";
	    }
	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND v.name LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }
	    if (!empty($data['filter_phone'])) {
	        $sql .= " AND v.phone LIKE '%" . $this->escape($data['filter_phone']) . "%'";
	    }
	    if (!empty($data['filter_start'])) {
	        $sql .= " AND DATE_FORMAT(d.created_date,'%Y-%m-%d') >= '" . $this->escape($data['filter_start']) . "'";
	    }
	    if (!empty($data['filter_end'])) {
	        $sql .= " AND DATE_FORMAT(d.created_date,'%Y-%m-%d') <= '" . $this->escape($data['filter_end']) . "'";
	    }

	    $sql.=' ORDER BY created_date DESC';
	    
	    if (isset($data['start']) || isset($data['limit'])) {

	        $data['start'] < 0 && $data['start'] = 0;
	        $data['limit'] < 1 && $data['limit'] = 20;

	        $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
	    }
	    // echo $sql;exit;
	    return $this->find($sql);
	}

	public function countDeposit($data){

		$sql="SELECT count(*) as count FROM ".DB_PREFIX.$this->table." d,".DB_PREFIX."vendor v WHERE d.vendor_id=v.vendor_id ";

		if (!empty($data['filter_nick'])) {
	    	$sql .= " AND v.nick LIKE '%" . $this->escape($data['filter_nick']) . "%'";
	    }
	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND v.name LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }
	    if (!empty($data['filter_phone'])) {
	        $sql .= " AND v.phone LIKE '%" . $this->escape($data['filter_phone']) . "%'";
	    }
	    if (!empty($data['filter_start'])) {
	        $sql .= " AND DATE_FORMAT(d.created_date,'%Y-%m-%d') >= '" . $this->escape($data['filter_start']) . "'";
	    }
	    if (!empty($data['filter_end'])) {
	        $sql .= " AND DATE_FORMAT(d.created_date,'%Y-%m-%d') <= '" . $this->escape($data['filter_end']) . "'";
	    }

	    return $this->count($sql);
	}
}