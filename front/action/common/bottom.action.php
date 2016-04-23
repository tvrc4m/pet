<?php

class BottomAction extends Action{

	protected $lang="common/bottom";

	public function index(){

		$modules=M('setting/layout','module',array('position'=>'bottom','layout'=>''));

		$this->assign(array('modules'=>$modules));

		return $this->fetch('common/bottom');
	}
}