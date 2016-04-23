<?php

class InformationAction extends AdminAction {

	protected $lang='module/information';

	public function index() {

		if (ispost() && $this->validate()) {
			
			M('setting/setting','add',array('group'=>'information'));

			go(admin_url('extension/module'));
		}

		$this->flushform($_POST,$this->settings,array('config_information_status'));

		$this->display('module/information');
	}

	private function validate(){

		return true;
	}
}
