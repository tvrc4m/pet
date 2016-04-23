<?php

class ProductOptionModel extends MysqlModel{

	protected $table='item_option';

	public function addOption($data){

		return $this->insert($data);
	}

	public function getItemOptions($item_id){

		return $this->select(array('where'=>array('item_id'=>$item_id,'deleted'=>0)));
	}

	public function updateOption($item_option_id,$data){

		return $this->update($data,array('item_option_id'=>$item_option_id));
	}

	public function getOption($item_option_id){

		return $this->one(array('item_option_id'=>$item_option_id));
	}

	public function getOptionByParams($where){

		return $this->select(array('where'=>$where));
	}

	public function delItemOption($item_id,$item_option=array()){

		if(empty($item_option)){

			$sql="UPDATE ".DB_PREFIX.$this->table." SET deleted=1 WHERE item_id=".(int)$item_id;
		}else{

			$item_option=implode(',',$item_option);

			$sql="UPDATE ".DB_PREFIX.$this->table." SET deleted=1 WHERE item_id=".(int)$item_id." AND item_option_id NOT IN (".$item_option.")";
		}

		return $this->query($sql);
	}
}