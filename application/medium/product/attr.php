<?php

class ProductAttr extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'add':return $this->add($data);break;

			case 'del':return $this->del($data);break;

			case 'edit':return $this->edit($data['cid'],$data['data']);break;

			case 'get':return $this->get($data['attr_id']);break;

			case 'list':return $this->listAttrs($data);break;

			case 'item':return $this->item($data);

			case 'count':return $this->count($data);break;

			case 'attr.status':return $this->attrStatus();break;
		}
	}

	private function add($data){

		$params=array('name'=>$data['name'],'attr_group_id'=>$data['attr_group_id'],'status'=>(int)$data['status'],'sort'=>(int)$data['sort']);

		return D('product/attr')->addAttr($params);
	}

	private function del($data){

		foreach ($data as $cid) {
			
			return D('product/attr')->updateAttr($cid,array('deleted'=>1));
		}
	}

	private function edit($cid,$data){

		$params=array('name'=>$data['name'],'attr_group_id'=>$data['attr_group_id'],'status'=>(int)$data['status'],'sort'=>(int)$data['sort']);

		return D('product/attr')->updateAttr($cid,$params);
	}

	private function get($attr_id){
		
		return D('product/attr')->getAttr($attr_id);
	}

	public function listAttrs($data){

		return D('product/attr')->listAttrs($data);
	}

	private function item($item_id){

		// return D('product/item.attrview')->getItemAttrs($item_id);
	}

	public function count($data){

		return D('product/attr')->countAttrs($data);
	}

	private function attrStatus(){

		return array(0=>'下单',1=>'未付款',2=>'已付款',3=>'已发货',7=>'退款',8=>'订单关闭');
	}
}