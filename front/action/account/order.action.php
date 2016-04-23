<?php

class OrderAction extends FAction {

  	protected $lang='account/order';

  	protected $children=array('account'=>'module/account');

  	public function index() {

  		$this->title=L('heading_title');

  		$page=$_GET['page'];

  		$limit=30;

  		$items=M('order/order','vendor',array('page'=>$page,'limit'=>$limit));

  		$total=M('order/order','count',array());

  		$urlpage=page($total,$page,$limit);

  		$data=array('items'=>$items,'urlpage'=>$urlpage);

  		$this->assign($data);

  		$this->display('account/order_list');
  	}
}