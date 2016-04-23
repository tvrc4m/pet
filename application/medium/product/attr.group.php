<?php

class ProductAttrGroup extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'add':return $this->add($data);break;

			case 'del':return $this->del($data);break;

			case 'edit':return $this->edit($data['attr_group_id'],$data['data']);break;

			case 'get':return $this->get($data['attr_group_id']);break;

			case 'select':return $this->select();break;

			case 'list':return $this->listAttrGroups($data);break;

			case 'count':return $this->count($data);break;
		}
	}

	private function add($data){

		$params=array('name'=>$data['name'],'status'=>(int)$data['status'],'sort'=>(int)$data['sort']);

		return D('product/attr.group')->addAttrGroup($params);
	}

	private function del($data){

		foreach ($data as $attr_group_id) {
			
			return D('product/attr.group')->updateAttrGroup($attr_group_id,array('deleted'=>1));
		}
	}

	private function edit($attr_group_id,$data){

		$params=array('name'=>$data['name'],'status'=>(int)$data['status'],'sort'=>(int)$data['sort']);

		return D('product/attr.group')->updateAttrGroup($attr_group_id,$params);
	}

	private function get($attr_group_id){
		
		return D('product/attr.group')->getAttrGroup($attr_group_id);
	}

	private function select(){

		$result=D('product/attr.group')->listAttrGroups();

		$attr_groups=array();

		foreach ($result as $res) {
			
			$attr_groups[$res['attr_group_id']]=$res['name'];
		}
		
		return $attr_groups;
	}

	public function listAttrGroups($data){

		return D('product/attr.group')->listAttrGroups($data);
	}

	public function count($data){

		return D('product/attr.group')->countAttrGroups($data);
	}
}