<?php

class CatAction extends FAction {

	protected $lang="product/cat";

	public function index() {

		$cid=$_GET['cid'];

		$page=$_GET['page'];

		$cat=M('product/cat','get',$cid);

		$items=M('product/item','cat',array('cid'=>$cid,'page'=>$page));
		
		$data=array('cats'=>$cats,'items'=>$items);

		$this->assign($data);

		$this->seo($cat);
		
		$this->display('product/cat');
  	}

  	private function seo($cat){

  		$this->title='门票类别列表-'.$cat['name'];
  	}
}
