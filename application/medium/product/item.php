<?php

class ProductItem extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'add':return $this->add($data);break;

			case 'edit':return $this->edit($data['item_id'],$data['data']);break;

			case 'get':return $this->get($data['item_id']);break;

			case 'list':return $this->listItems($data);break;

			case 'count':return $this->count($data);break;

			case 'cat':return $this->cat($data);break;

			case 'search':return $this->search($data);break;

			case 'all':return $this->all();break;
		}
	}

	private function add($data){

		$has_option=empty($data['options'])?0:1;

		$params=array('title'=>$data['title'],'price'=>$data['price'],'discount'=>$data['discount'],'quantity'=>$data['quantity'],'cat_id'=>$data['cat_id'],'image'=>$data['image'],'sku'=>$data['sku'],'cat_id'=>$data['cat_id'],'description'=>$data['description'],'short_desc'=>$data['short_desc'],'sort'=>$data['sort'],'status'=>$data['status'],'has_option'=>$has_option,'online'=>1);

		$item_id=D('product/item')->addItem($params);

		if(empty($item_id)) return 0;

		foreach ($data['attrs'] as $attr) {

			$params=array('attr_group_id'=>$attr['attr_group_id'],'name'=>$attr['name']);

			$attr_id=D('product/attr')->addAttr($params);
			
			$params=array('item_id'=>$item_id,'attr_group_id'=>$attr['attr_group_id'],'attr_id'=>$attr_id);

			D('product/item.attr')->addItemAttr($params);
		}

		foreach ($data['options'] as $option) {

			$params=array('item_id'=>$item_id,'name'=>$option['name'],'price'=>$option['price'],'discount'=>$option['discount'],'quantity'=>$option['quantity']);

			D('product/option')->addOption($params);
		}

		foreach ($data['images'] as $image) {

			$params=array('item_id'=>$item_id,'url'=>$image['url'],'description'=>$image['description'],'status'=>$image['status'],'sort'=>$image['sort']);

			D('product/image')->addImage($params);
		}

		return $item_id;
	}

	private function edit($item_id,$data){

		$has_option=empty($data['options'])?0:1;

		$params=array('title'=>$data['title'],'short_desc'=>$data['short_desc'],'price'=>$data['price'],'discount'=>$data['discount'],'quantity'=>$data['quantity'],'cat_id'=>$data['cat_id'],'image'=>$data['image'],'sku'=>$data['sku'],'cat_id'=>$data['cat_id'],'description'=>$data['description'],'sort'=>$data['sort'],'status'=>$data['status'],'has_option'=>$has_option,'online'=>1);
		
		D('product/item')->updateItem($item_id,$params);

		$exist=array();

		foreach ($data['attrs'] as $attr) {

			$params=array('attr_group_id'=>$attr['attr_group_id'],'name'=>$attr['attr_name']);

			$attr_id=(int)$attr['attr_id'];
			$item_attr_id=(int)$attr['item_attr_id'];

			if($attr_id>0 && $item_attr_id){

				$exist[]=$item_attr_id;

				D('product/attr')->updateAttr($attr_id,$params);

				$params=array('item_id'=>$item_id,'attr_group_id'=>$attr['attr_group_id'],'attr_id'=>$attr_id);

				D('product/item.attr')->updateItemAttr($item_attr_id,$params);

			}else{

				$attr_id=D('product/attr')->addAttr($params);

				$params=array('item_id'=>$item_id,'attr_group_id'=>$attr['attr_group_id'],'attr_id'=>$attr_id);

				$item_attr_id=D('product/item.attr')->addItemAttr($params);

				$exist[]=$item_attr_id;
			}
		}

		D('product/item.attr')->delItemAttr($item_id,$exist);

		$exist=array();

		foreach ($data['options'] as $option) {

			$item_option_id=(int)$option['item_option_id'];

			$params=array('item_id'=>$item_id,'name'=>$option['name'],'price'=>$option['price'],'discount'=>$option['discount'],'quantity'=>$option['quantity']);

			if($item_option_id>0){

				$exist[]=$item_option_id;

				D('product/option')->updateOption($item_option_id,$params);

			}else{

				$item_option_id=D('product/option')->addOption($params);

				$exist[]=$item_option_id;
			}
		}

		D('product/option')->delItemOption($item_id,$exist);

		$exist=array();

		foreach ($data['images'] as $image) {

			$item_image_id=(int)$image['item_image_id'];

			$params=array('item_id'=>$item_id,'url'=>$image['url'],'description'=>$image['description'],'status'=>$image['status'],'sort'=>$image['sort']);

			if($item_image_id>0){

				$exist[]=$item_image_id;

				D('product/image')->updateImage($item_image_id,$params);

			}else{

				$item_image_id=D('product/image')->addImage($params);

				$exist[]=$item_image_id;
			}
		}

		D('product/image')->delItemImage($item_id,$exist);

	}

	private function get($item_id){
		
		return D('product/item')->getItem($item_id);
	}

	private function listItems($data){

		$items= D('product/item')->listItems($data);

		foreach ($items as &$item) {
			
			$item['url']=shop_url(sprintf('item/%d.html',$item['item_id']));
		}

		return $items;
	}

	private function count($data){

		return D('product/item')->countItems($data);
	}

	private function cat($data){

		$page=$data['page'];

		$limit=isset($data['limit'])?$data['limit']:30;

		$where=array('filter_cat'=>$data['cid'],'online'=>1,'deleted'=>0);

		$limit=array(($page-1)*$limit,$limit);

		$items=D('product/item')->listItems($where,array(),$limit);

		foreach ($items as &$item) {
			
			$item['link']=shop_url('item/'.$item['item_id'].'.html');
		}

		return $items;
	}

	public function search($data){


	}

	public function all(){

		return D('product/item')->all();	
	}
}