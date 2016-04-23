<?php

class CategoryAction extends AdminAction {

	protected $lang='module/category';

	public function index() {

		if (ispost() && $this->validate()) {
			
			M('setting/setting','add',array('group'=>'category'));

			go(admin_url('extension/module'));
		}

		$this->flushform($_POST,$this->settings,array('config_category_status'));

		$this->display('module/category');
	}

	private function validate(){

		return true;
	}
}
