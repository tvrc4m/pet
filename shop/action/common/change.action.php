<?php

class ChangeAction extends FAction {

  	protected $lang="common/change";

  	public function password() {

  	 if(ispost() && $this->validate()){

  			M('account/vendor','change.password',array('password'=>$_POST['password']));

  			redirect(vendor_url(''));
  		}

  		$this->flushform($_POST,array(),array('password','confirm'));
  		
  		$this->display('common/changepwd');
    }

  	private function validate(){

  		if(empty($_POST['password']) || strlen($_POST['password'])<6){

  			$this->error['password']=L('error_password');
  		}

  		if(empty($_POST['confirm'])){

  			$this->error['confirm']=L('error_confirm');
  		}else if($_POST['password']!=$_POST['confirm']){

  			$this->error['confirm']=L('error_confirm2');
  		}
  		
  		return !$this->error;
  	}
}
