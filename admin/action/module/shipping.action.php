<?php

class ShippingAction extends AdminAction {

	protected $lang='module/shipping';

	public function index() {

		if (ispost() && $this->validate()) {

			M('setting/setting','add',array('group'=>'shipping'));

			go(admin_url('extension/module'));
		}

		// $shippings=M('extension/shipping','list');
		// print_r($this->settings);exit;
		$this->flushform($_POST,$this->settings,array('shippings'));

		// $data=array('shippings'=>$shippings);

		$this->assign($data);

		$this->display('module/shipping');
	}

	private function validate(){

		$modules=$_POST['shippings'];

		foreach ($modules as $k=>$module) {
			
			empty($module['title']) && $this->error['shipping'][$k]['title']=L('error_title');

			empty($module['description']) && $this->error['shipping'][$k]['description']=L('error_description');
		}

		if($this->error){

			$this->error['waring']=L('error_warning');

			return false;
		}

		return true;
	}
}
