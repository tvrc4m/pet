<?php

class InformationAction extends Action {

  	protected function index($module) {

  		$information_content=V('information_content');
      echo $information_content;exit;
      
      $this->display('module/information');
  	}
 }