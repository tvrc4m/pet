<?php 

class HeaderAction extends Action {

	protected $lang=array("common/header","common/cart");

	protected function index($data) {

		$this->children=array('cart'=>'common/header/cart','search'=>'common/header/search','navbar'=>'module/navbar');

		$links['home'] = shop_url();

		$links['login'] = shop_url('login');
		$links['register'] = shop_url('register');
		$links['logout'] = shop_url('logout');

		$links['account'] = shop_url('account');
		$links['shopping_cart'] = shop_url('cart');
		$links['checkout'] = shop_url('checkout');

		$links['order'] = shop_url('sale/order');
		$links['user'] = shop_url('user/user');
		$links['user_group'] = shop_url('user/user_permission');

		if(S('LOGGED') && S('USER')){

			$user=M('user/user','get',S('LOGGED'));
			
			$logged=1;
		}

		$data['cart_count']=count(S('CART'));

		$folder=$_GET['f'];

		$links['selected']=$selected;

		$this->assign($links);
		$this->assign($data);
		$this->assign(array('nick'=>$user['nick'],'logged'=>(int)$logged));
		
		return $this->fetch('common/header');
	}

	protected function cart($data) {

		list($carts,$count,$totals,$total)=M('checkout/cart','get');

  		$text_cart=sprintf(L('text_items'),(int)$count,'￥'.(float)$total);

  		$data=array('text_cart'=>$text_cart,'carts'=>$carts,'totals'=>$totals,'cart'=>shop_url('cart'),'checkout'=>shop_url('cart/checkout'));

  		$this->assign($data);

  		return $this->fetch('common/cart');
	}

	protected function search(){

		$filter_title=$this->filter('filter_title');

		$this->assign(array('q'=>$filter_title));

		return $this->fetch('common/search');
	}
}
