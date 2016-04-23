<?php

class ItemAction extends FAction {

	protected $lang="product/item";

	public function index() {

		$iid=$_GET['iid'];

		$item=M('product/item','get',$iid);

		$attrs=M('product/attr','item',$iid);

		$options=M('product/option','item',$iid);

		$data=array('item'=>$item,'attrs'=>$attrs,'options'=>$options,'buy'=>vendor_url('buy'));

		$this->assign($data);

		$this->seo($item);
		
		$this->display('product/item');
  	}

  	private function seo($item){

  		$this->title='门票详细页-'.$item['title'];
  	}
}
