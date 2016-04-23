<?php

class RecommendAction extends AdminAction {

	protected $lang='module/recommend';

	public function index() {

		if (ispost() && $this->validate()) {

			foreach ($_POST['recommend_modules'] as $k=>&$module) {

				empty($module['code']) && $module['code']='recommend.'.uniqid();
			}
			
			M('setting/setting','add',array('group'=>'recommend'));

			go(admin_url('extension/module'));
		}

		$this->flushform($_POST,$this->settings,array('recommend_modules'));

		// $templates=M('extension/template','type.all','product');
		$templates=array('best_seller'=>'best_seller','column_product'=>'column_product','new_product'=>'new_product','special_product'=>'special_product');

		$options=array(
			'rand'			=>'随机',
			'new'			=>'新品',
			'keyword'		=>'关键词',
			'cat'			=>'类别',
			'related'		=>'产品相关',
			'sales_desc'	=>'销量↓',
			'price_asc'		=>'价格↑',
			'price_desc'	=>'价格↓',
			'discount_desc' =>'折扣↓',
		);

		$data=array('options'=>$options,'templates'=>$templates);

		$this->assign($data);

		$this->display('module/recommend');
	}

	private function validate(){

		$recommend_modules=$_POST['recommend_modules'];

		foreach ($recommend_modules as $k=>$module) {
			
			empty($module['title']) && $this->error['recommend'][$k]['title']=L('error_title');

			empty($module['options']) && $this->error['recommend'][$k]['option']=L('option');

			empty($module['limit']) && $this->error['recommend'][$k]['limit']=L('error_limit');

			empty($module['template_id']) && $this->error['recommend'][$k]['template']=L('error_template');
		}

		return !$this->error;
	}
}
