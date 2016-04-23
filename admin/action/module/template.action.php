<?php

class TemplateAction extends AdminAction {

	protected $lang='module/template';

	public function index() {

		if (ispost() && $this->validate()) {

			foreach ($_POST['template_modules'] as $k=>&$module) {

				empty($module['code']) && $module['code']='template.'.uniqid();
			}
			
			M('setting/setting','add',array('group'=>'template'));

			go(admin_url('extension/module'));
		}

		$this->flushform($_POST,$this->settings,array('template_modules'));

		$templates=M('extension/template','list');
		// print_r($templates);exit;
		$data=array('templates'=>$templates);

		$this->assign($data);

		$this->display('module/template');
	}

	private function validate(){

		$template_modules=$_POST['template_modules'];

		foreach ($template_modules as $k=>$module) {
			
			empty($module['title']) && $this->error['template'][$k]['title']=L('error_title');

			empty($module['template_id']) && $this->error['template'][$k]['template']=L('error_template');
		}

		return !$this->error;
	}
}
