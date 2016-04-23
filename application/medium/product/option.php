<?php

class ProductOption extends Medium{

	public function run($action,$data){
	
		switch ($action) {
	
			case 'item':return $this->item($data);break;

			case 'get':return $this->get($data);break;
		}
	}

	private function item($item_id){

		$result= D('product/option')->getItemOptions($item_id);

		$options=array();

		foreach ($result as $option) $options[$option['item_option_id']]=$option;

		return $options;
	}

	public function get($item_option_id){

		return D('product/option')->getOption($item_option_id);
	}
}