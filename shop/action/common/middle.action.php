<?php

class MiddleAction extends Action{

	protected $lang="common/middle";

	public function index(){

		$modules=M('setting/layout','module',array('position'=>'middle','layout'=>''));

		$this->assign(array('modules'=>$modules));

		return $this->fetch('common/middle');
	}
}