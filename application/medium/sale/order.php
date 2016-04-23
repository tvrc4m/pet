<?php

class SaleOrder extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'add.local':return $this->addLocal($data);break;

			case 'add.outside':return $this->addOutside($data);break;

			case 'get':return $this->get($data);break;

			case 'vdian.get':return $this->getVdian($data);break;

			case 'edit':return $this->edit($data);break;

			case 'detail':return $this->detail($data);break;

			case 'list':return $this->listOrders($data);break;

			case 'count':return $this->count($data);break;

			case 'order.type':return $this->orderType();break;

			case 'ticket.status':return $this->ticketStatus();break;

		}
	}

	private function addLocal($data){

		$order_items=array();

		foreach ($data['items'] as $item) {
			
			$order_items[]=sprintf('%s,%s,%s',$item['item_id'],$item['item_option_id'],$item['quantity']);
		}

		$order_items=implode(';',$order_items);

		$vendor_id=$data['vendor_id'];

		$vendor=M('vendor/vendor','get',$vendor_id);

		$params=array($vendor_id,$order_items,$vendor['name'],$data['phone'],$data['idcard'],$data['plantime'],'@orders','@success');
		
		$status=D('sale/order')->addOrder($params);

		return $status;
	}

	private function addOutside($data){

		$order_items=array();

		foreach ($data['items'] as $item) {
			
			$order_items[]=sprintf('%s,%s,%s',$item['item_id'],$item['item_option_id'],$item['quantity']);
		}

		$order_items=implode(';',$order_items);

		$create_date=empty($data['create_date'])?date('Y-m-d H:i:s'):$data['create_date'];

		$params=array($data['out_order_id'],$data['type'],$order_items,$data['name'],$data['phone'],$data['idcard'],$data['plantime'],(int)$data['status'],$create_date,'@success');

		$status=D('sale/order')->addOutsideOrder($params);

		return $status;
	}

	private function get($order_id){
		
		return D('sale/order')->getOrder($order_id);
	}

	private function getVdian($vdian_order_id){

		$result=D('sale/order')->selectOrders(array('out_order_id'=>$vdian_order_id));

		return $result[0];
	}

	private function edit($data){

		$order_id=$data['order_id'];

		$order=$this->get($order_id);

		if(empty($order)) return array('ret'=>-1);

		$params=array('idcard'=>$data['idcard'],'plantime'=>$data['plantime'],'status'=>$data['status'],'update_date'=>date('Y-m-d H:i:s'));

		$status=D('sale/order')->updateOrderByParams($order_id,$params);

		if($status==1){

			$response=M('ticket/ticket','delay',array('order_id'=>$order_id,'order'=>$order,'plantime'=>$data['plantime'],'idcard'=>$data['idcard']));

			if($response['ret']==1) return array('ret'=>1);

			$response['ret']=-10;

			return $response;
		}
		
		return array('ret'=>$status);
	}

	private function detail($order_id){

		$order=$this->get($order_id);

		$items=M('sale/item','order',$order_id);

		$order['items']=$items;

		return $order;
	}

	public function listOrders($data){

		return D('sale/order')->listOrders($data);
	}

	public function count($data){

		return D('sale/order')->countOrders($data);
	}

	private function orderType(){

		return array('vdian'=>'微店','meituan'=>'美团');
	}

	private function ticketStatus(){

		return array(TICKET_STATUS_INIT=>'未出票',TICKET_STATUS_SUCCESS=>'出票成功',TICKET_STATUS_ERROR=>'出票失败',TICKET_STATUS_REFUND=>'已退款');
	}
}