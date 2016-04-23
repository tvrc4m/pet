<?php

class SuccessAction extends FAction {

	protected $lang='checkout/success';

  	public function index() {

  		$this->title='订单创建成功';

  		$text_message=V('config_order_success_message');

  		$data=array('text_message'=>$text_message);

  		$this->assign($data);

  		$this->display('checkout/success');
  	}
 }