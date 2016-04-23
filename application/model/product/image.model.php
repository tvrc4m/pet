<?php

class ProductImageModel extends MysqlModel{

	protected $table='item_image';

	public function addImage($data){

		return $this->insert($data);
	}

	public function getItemImages($item_id){

		return $this->select(array('where'=>array('item_id'=>$item_id,'deleted'=>0)));
	}

	public function updateImage($item_image_id,$data){

		return $this->update($data,array('item_image_id'=>$item_image_id));
	}

	public function getImage($item_image_id){

		return $this->one(array('item_image_id'=>$item_image_id));
	}

	public function getImageByParams($where){

		return $this->select(array('where'=>$where));
	}

	public function delItemImage($item_id,$item_image=array()){

		if(empty($item_image)) return;

		$item_image=implode(',',$item_image);

		$sql="UPDATE ".DB_PREFIX.$this->table." SET deleted=1 WHERE item_id=".(int)$item_id." AND item_image_id NOT IN (".$item_image.")";

		return $this->query($sql);
	}
}