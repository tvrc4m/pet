<?php

class ProductCat extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'add':return $this->add($data);break;

			case 'del':return $this->del($data);break;

			case 'edit':return $this->edit($data['cid'],$data['data']);break;

			case 'get':return $this->get($data);break;

			case 'parent':return $this->parent();break;

			case 'all':return $this->all();break;

			case 'list':return $this->listCats($data);break;

			case 'count':return $this->count($data);break;

			case 'cat.status':return $this->catStatus();break;

			case 'p2c':return $this->p2c();break;
		}
	}

	private function add($data){

		$params=array('name'=>$data['name'],'status'=>(int)$data['status'],'parent_id'=>(int)$data['parent_id'],'sort'=>(int)$data['sort']);

		return D('product/cat')->addCat($params);
	}

	private function del($data){

		foreach ($data as $cid) {
			
			return D('product/cat')->updateCat($cid,array('deleted'=>1));
		}
	}

	private function edit($cid,$data){

		$params=array('name'=>$data['name'],'status'=>(int)$data['status'],'parent_id'=>(int)$data['parent_id'],'sort'=>(int)$data['sort']);

		return D('product/cat')->updateCat($cid,$params);
	}

	private function get($cat_id){
		
		return D('product/cat')->getCat($cat_id);
	}

	private function parent(){

		return D('product/cat')->selectCat(array('parent_id'=>0,'deleted'=>0));
	}

	private function all(){

		return D('product/cat')->selectCat(array('deleted'=>0));
	}

	private function listCats($data){

		return D('product/cat')->listCats($data);
	}

	private function count($data){

		return D('product/cat')->countCats($data);
	}

	private function catStatus(){

		return array(0=>'下单',1=>'未付款',2=>'已付款',3=>'已发货',7=>'退款',8=>'订单关闭');
	}

	private function p2c(){

		$cats=D('product/cat')->selectCat(array('deleted'=>0),array('parent_id ASC'));

		$pc=array();

		foreach ($cats as $cat) {

			$parent_id=$cat['parent_id'];

			$cat['link']=shop_url(sprintf('cat/%d.html',$cat['cat_id']));
			
			if(!$parent_id){

				$pc[$cat['cat_id']]=$cat;
			}else{
				
				$pc[$parent_id]['children'][]=$cat;
			}
		}

		return $pc;
	}
}