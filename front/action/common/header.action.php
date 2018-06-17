<?php 

class HeaderAction extends Action {

	protected $lang=array("common/header","common/cart");

	protected function index($data) {

		$this->children=array('cart'=>'common/header/cart','search'=>'common/header/search','navbar'=>'module/navbar');

		$links['home'] = vendor_url();

		$links['login'] = vendor_url('login');
		$links['register'] = vendor_url('register');
		$links['logout'] = vendor_url('logout');

		$links['account'] = vendor_url('account');
		$links['shopping_cart'] = vendor_url('cart');
		$links['checkout'] = vendor_url('checkout');

		$links['order'] = vendor_url('sale/order');
		$links['user'] = vendor_url('user/user');
		$links['user_group'] = vendor_url('user/user_permission');

		(S('LOGGED') && S('VENDOR')) && $vendor=M('account/vendor','get',S('LOGGED'));

		$folder=$_GET['f'];
		
		$links['selected']=$selected;

		$this->assign($links);
		$this->assign($data);
		$this->assign(array('nick'=>$vendor['nick'],'amount'=>$vendor['amount']));
		
		return $this->fetch('common/header');
	}

	protected function cart($data) {

		list($carts,$count,$totals,$total)=M('checkout/cart','get');

  		$text_cart=sprintf(L('text_items'),(int)$count,'￥'.(float)$total);

  		$data=array('text_cart'=>$text_cart,'carts'=>$carts,'totals'=>$totals,'cart'=>vendor_url('cart'),'checkout'=>vendor_url('cart/checkout'));

  		$this->assign($data);

  		return $this->fetch('common/cart');
	}

	protected function search(){

		$filter_title=$this->filter('filter_title');

		$this->assign(array('q'=>$filter_title));

		return $this->fetch('common/search');
	}
}
