<?php 

class FooterAction extends SingleAction {

	public function index($data) {
		
		$this->assign($data);
				
		return $this->fetch('footer');
	}
}
