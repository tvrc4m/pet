<?php

class ItemAction extends FAction {

	protected $lang="product/item";

	public function index() {

		$iid=$_GET['iid'];

		$this->js=array('/static/default/bootstrap/js/bootstrap-tabdrop.js');

		$item=M('product/item','get',$iid);

		$cat=M('product/cat','get',$item['cat_id']);
		
		$attrs=M('product/attr','item',$iid);

		if($item['has_option']){

			$options=M('product/option','item',$iid);	
		}

		$images=M('product/image','item',$iid);
		
		$breadcrumbs=array(
			array('title'=>'首页','link'=>shop_url()),
			array('title'=>$cat['name'],'link'=>shop_url(sprintf('cat/%d.html',$cat['cat_id']))),
			array('title'=>$item['title']),
		);

		$data=array('item'=>$item,'cat'=>$cat,'attrs'=>$attrs,'options'=>$options,'images'=>$images,'breadcrumbs'=>$breadcrumbs,'buy'=>shop_url('buy'));

		$this->assign($data);

		$this->seo($item);
		
		$this->display('product/item');
  	}

  	private function seo($item){

  		$this->title='详细页-'.$item['title'];
  	}
}
