<?php 

class HeaderAction extends SingleAction {

	public function index($data) {
		
		$this->assign($data);
				
		return $this->fetch('header');
	}
}
