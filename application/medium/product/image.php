<?php

class ProductImage extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'item':return $this->item($data);break;

			case 'get':return $this->get($data);break;
		}
	}

	private function item($item_id){

		$result= D('product/image')->getItemImages($item_id);

		$images=array();

		foreach ($result as $image) $images[$image['item_image_id']]=$image;

		return $images;
	}

	public function get($item_image_id){

		return D('product/image')->getImage($item_image_id);
	}
}