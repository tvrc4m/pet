<?php

class FooterAction extends Action {

	protected $lang="common/footer";

	protected function index() {
		
		return $this->fetch('common/footer');
  	}
}
