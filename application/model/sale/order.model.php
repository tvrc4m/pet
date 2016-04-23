<?php

class SaleOrderModel extends MysqlModel{

	protected $table='order';

	public function getOrder($order_id){

		return $this->one(array('order_id'=>$order_id));
	}

	public function addOrder($data){

		$this->call('tt_proc_vendor_order',$data);

		$query=$this->get('SELECT @success');

		return (int)$query['@success'];
	}

	public function addOutsideOrder($data){

		$this->call('tt_proc_outside_order',$data);

		$query=$this->get('SELECT @success');

		return (int)$query['@success'];
	}

	public function refundOrder($data){

		$this->call('tt_proc_order_refund',$data);

		$query=$this->get('SELECT @success');

		return (int)$query['@success'];
	}

	public function updateOrder($data){

		$this->call('tt_proc_edit_vendor_order',$data);

		$query=$this->get('SELECT @success');

		return (int)$query['@success'];
	}

	public function updateOrderByParams($order_id,$params){

		return $this->update($params,array('order_id'=>$order_id));
	}

	public function updateOrderByParams2($where,$params){

		return $this->update($params,$where);
	}

	public function selectOrders($where){

		return $this->select(array('where'=>$where));
	}

	public function listOrders($data){

		$sql="SELECT o.*,oi.title,oi.item_option,tt.type_name,tt.platform FROM ".DB_PREFIX."order o INNER JOIN ".DB_PREFIX."order_item oi ON o.order_id=oi.order_id LEFT JOIN ".DB_PREFIX."item_option io ON oi.item_option_id=io.item_option_id LEFT JOIN ".DB_PREFIX."ticket_type tt ON io.ticket_type_id=tt.ticket_type_id WHERE o.deleted=0 ";

	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND o.name LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }
	    if (!empty($data['filter_phone'])) {
	        $sql .= " AND o.phone LIKE '%" . $this->escape($data['filter_phone']) . "%'";
	    }
	    if (!empty($data['filter_type'])) {
	        $sql .= " AND o.type = '" . $this->escape($data['filter_type']) . "'";
	    }
	    if ($data['filter_status']!==null) {
	        $sql .= " AND o.status=" . (int)$data['filter_status'];
	    }
	   	if (!empty($data['filter_start'])) {
	        $sql .= " AND DATE_FORMAT(o.created_date,'%Y-%m-%d') >= '" . $this->escape($data['filter_start']) . "'";
	    }
	    if (!empty($data['filter_end'])) {
	        $sql .= " AND DATE_FORMAT(o.created_date,'%Y-%m-%d') <= '" . $this->escape($data['filter_end']) . "'";
	    }
	    // echo $sql;exit;
	    $sql.=" ORDER BY o.order_id DESC";

	    if (isset($data['start']) || isset($data['limit'])) {

	        $data['start'] < 0 && $data['start'] = 0;
	        $data['limit'] < 1 && $data['limit'] = 20;

	        $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
	    }
	    
	    return $this->find($sql);
	}

	public function countOrders($data){

		$sql="SELECT count(*) as count FROM ".DB_PREFIX."order o INNER JOIN ".DB_PREFIX."order_item oi ON o.order_id=oi.order_id WHERE 1 ";

	    if (!empty($data['filter_name'])) {
	    	$sql .= " AND o.name LIKE '%" . $this->escape($data['filter_name']) . "%'";
	    }
	    if (!empty($data['filter_phone'])) {
	        $sql .= " AND o.phone LIKE '%" . $this->escape($data['filter_phone']) . "%'";
	    }
	    if (!empty($data['filter_type'])) {
	        $sql .= " AND o.type = '" . $this->escape($data['filter_type']) . "'";
	    }
	    if ($data['filter_status']!==null) {
	        $sql .= " AND o.status=" . (int)$data['filter_status'];
	    }
	   	if (!empty($data['filter_start'])) {
	        $sql .= " AND DATE_FORMAT(o.created_date,'%Y-%m-%d') >= '" . $this->escape($data['filter_start']) . "'";
	    }
	    if (!empty($data['filter_end'])) {
	        $sql .= " AND DATE_FORMAT(o.created_date,'%Y-%m-%d') <= '" . $this->escape($data['filter_end']) . "'";
	    }

	    return $this->count($sql);
	}
}