<?php

class TopAction extends Action{

	protected $lang="common/top";

	public function index(){

		$modules=M('setting/layout','module',array('position'=>'top','layout'=>''));
		
		$this->assign(array('modules'=>$modules));

		return $this->fetch('common/top');
	}
}