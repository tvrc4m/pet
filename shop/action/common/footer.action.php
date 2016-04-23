<?php

class FooterAction extends Action {

	protected $lang="common/footer";

	protected function index() {

		$this->children=array('information'=>'common/footer/information');
		
		return $this->fetch('common/footer');
  	}

  	public function information(){

  		return V('information_html');
  	}
}
