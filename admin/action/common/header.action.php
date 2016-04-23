<?php 

class HeaderAction extends AdminAction {

	protected $lang="common/header";

	public function index($data) {
		$links['home'] = admin_url('');
		$links['coupon'] = admin_url('sale/coupon');
		$links['customer'] = admin_url('sale/customer');
		$links['customer_group'] = admin_url('sale/customer_group' );
		$links['logout'] = admin_url('common/logout' );
		
		$links['module'] = admin_url('extension/module' );
		$links['layout'] = admin_url('extension/layout');
		$links['banner'] = admin_url('extension/banner');
		$links['feature'] = admin_url('extension/feature');
		$links['template'] = admin_url('extension/template');
		$links['style'] = admin_url('extension/style');

		// product
		$links['item'] = admin_url('product/item');
		$links['item_attr_group'] = admin_url('product/attr/group');
		$links['item_attr'] = admin_url('product/attr');
		$links['item_cat'] = admin_url('product/cat');

		// order
		$links['order'] = admin_url('sale/order');
		$links['order_status'] = admin_url('sale/status');

		// vendor
		$links['vendor'] = admin_url('vendor/vendor');
		$links['vendor_deposit'] = admin_url('vendor/deposit');

		// setting
		$links['setting'] = admin_url('setting/setting');

		$folder=$_GET['f'];
		
		$selected[($folder=='payment' || $folder=='module' || $folder=='extension' || $folder=='shipping')?'extension':$folder]='selected';
		
		$links['selected']=$selected;
		
		$this->assign($data);
		$this->assign(array('link'=>$links));
				
		return $this->fetch('common/header');
	}
}
