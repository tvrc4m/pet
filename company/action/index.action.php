<?php
  
class IndexAction extends SingleAction {

	protected $lang='home';

	public function index() {

		$this->display('home');
  	}
}