<?php

class CatAction extends FAction {

	protected $lang="product/cat";

	public function index() {

		$this->js=array('/static/default/js/jquery/jquery.jqtransform.js');

		$cid=$_GET['cid'];

		$page=$_GET['page'];

		$cat=M('product/cat','get',$cid);

		$items=M('product/item','cat',array('cid'=>$cid,'page'=>$page));

		$breadcrumbs=array(
			array('title'=>'首页','link'=>shop_url('')),
			array('title'=>$cat['name']),
		);

		
		$data=array('cats'=>$cats,'items'=>$items,'breadcrumbs'=>$breadcrumbs);

		$this->assign($data);

		$this->seo($cat);
		
		$this->display('product/cat');
  	}

  	private function seo($cat){

  		$this->title='门票类别列表-'.$cat['name'];
  	}
}
