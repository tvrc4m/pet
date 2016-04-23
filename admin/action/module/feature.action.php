<?php

class FeatureAction extends AdminAction {

	protected $lang='module/feature';

	public function index() {

		if (ispost() && $this->validate()) {

			foreach ($_POST['feature_modules'] as $k=>&$module) {

				empty($module['code']) && $module['code']='feature.'.uniqid();
			}
			
			M('setting/setting','add',array('group'=>'feature'));

			go(admin_url('extension/module'));
		}

		$this->flushform($_POST,$this->settings,array('feature_modules'));

		$features=M('extension/feature','list');
		// print_r($features);exit;
		$data=array('features'=>$features);

		$this->assign($data);

		$this->display('module/feature');
	}

	private function validate(){

		$feature_modules=$_POST['feature_modules'];

		foreach ($feature_modules as $k=>$module) {
			
			empty($module['title']) && $this->error['feature'][$k]['title']=L('error_title');

			empty($module['feature_id']) && $this->error['feature'][$k]['feature']=L('error_feature');

			empty($module['limit']) && $this->error['feature'][$k]['limit']=L('error_limit');
		}

		return !$this->error;
	}
}
