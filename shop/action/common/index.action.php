<?php
  
class IndexAction extends FAction {

	protected $lang="common/home";

	public function index() {

		$this->title=V('config_name');
		
		$this->display('common/home');
  	}
}