<?php

class SearchAction extends FAction {

	protected $lang="product/item";

	public function index() {

		$page=$_GET['page'];

		$limit=30;

		$filter_title=$this->filter('filter_title');

		$params=array('start'=>($page-1)*$limit,'limit'=>$limit,'filter_title'=>$filter_title);
		
		$items=M('product/item','search',$params);

		$total=M('product/item','count',$params);

		$urlpage=page($total,$page,$limit);

		$data=array('items'=>$items,'urlpage'=>$urlpage,'options'=>$options,'q'=>$filter_title);

		$this->assign($data);

		$this->seo($item);
		
		$this->display('product/search');
  	}

  	private function seo($item){

  		$this->title='门票详细页-'.$item['title'];
  	}
}
