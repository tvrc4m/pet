<?php

class CategoryAction extends Action {

  	protected $lang="module/category";

  	protected function index() {

  		if(V('config_category_status')){
  			
  			$cats=M('product/cat','p2c');

	  		$data=array('cats'=>$cats);

	  		$this->assign($data);

	  		return $this->fetch('module/category');
  		}
  	}
 }