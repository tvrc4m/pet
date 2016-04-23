<?php

class RightAction extends Action{

	protected $lang="common/right";

	public function index(){

		$modules=M('setting/layout','module',array('position'=>'right','layout'=>''));

		$this->assign(array('modules'=>$modules));

		return $this->fetch('common/right');
	}
}