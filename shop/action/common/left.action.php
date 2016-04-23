<?php

class LeftAction extends Action{

	protected $lang="common/left";

	public function index(){

		$modules=M('setting/layout','module',array('position'=>'left','layout'=>''));

		$this->assign(array('modules'=>$modules));

		return $this->fetch('common/left');
	}
}