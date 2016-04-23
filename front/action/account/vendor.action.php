<?php

class VendorAction extends FAction {

  	protected $lang='account/account';

  	protected $children=array('account'=>'module/account');

  	public function index() {

      $this->title=L('heading_title');

  		$vendor_id=S('LOGGED');

  		$vendor=M('account/vendor','get',$vendor_id);

  		$this->assign($vendor);

  		$this->display('account/account');
  	}

  	public function update(){

      	if (ispost() && $this->validateForm()) {

        	M('account/vendor','edit',$_POST);

        	redirect(vendor_url('account'));
      	}

        $this->title=L('edit_title');

      	$this->assign(array('heading_title'=>L('update_title')));
      
      	$this->getForm();
  	}

  	public function change(){

  		  if (ispost() && $this->validateChange()) {

        	M('account/vendor','change',$_POST);

        	redirect(vendor_url('account'));
      	}

        $this->title=L('change_title');

  		  $this->flushform($_POST,array(),array('old','password','confirm'));

      	$this->display('account/change');
  	}

  	private  function getForm(){

  		$vendor_id=S('LOGGED');

  		$vendor=M('account/vendor','get',$vendor_id);

  		$this->flushform($_POST,$vendor,array('nick','email','phone','idcard'));

  		$this->assign($data);

      	$this->display('account/edit');
  	}

  	private function validateForm(){

  		$vendor_id=S('LOGGED');

		if(empty($_POST['nick'])){

			$this->error['nick']=L('error_nick');
		}else{
			$vendors=M('account/vendor','get.by.nick',$_POST['nick']);

			if(empty($vendor_id)){

				!empty($vendors) && $this->error['nick']=L('error_exist_nick');
			}else{

				count($vendors)>1 && $this->error['nick']=L('error_exist_nick');
			}
		}
		if(empty($_POST['email']) || preg_match('/\w+@\w+\.\w+/',$_POST['email'])!=1){

			$this->error['email']=L('error_email');
		}else{

			$vendors=M('account/vendor','get.by.email',$_POST['email']);

			if(empty($vendor_id)){

				!empty($vendors) && $this->error['email']=L('error_exist_email');
			}else{

				count($vendors)>1 && $this->error['email']=L('error_exist_email');
			}
		}


		if(empty($_POST['phone']) || preg_match('/^\d{6,11}$/',$_POST['phone'])!==1){

			$this->error['phone']=L('error_phone');
		}

    (empty($_POST['idcard']) || strlen($_POST['idcard'])<15) && $this->error['card']=L('error_card');

		return !$this->error;
  	}

  	private function validateChange(){

  		$vendor_id=S('LOGGED');

  		$vendor=M('account/vendor','get',$vendor_id);

  		if(empty($_POST['old'])) $this->error['old']=L('error_old');
  		elseif($vendor['password']!=sha1($vendor['salt'].$_POST['old'])) $this->error['old']=L('error_old_incorrect');
			
		  (empty($_POST['password']) || strlen($_POST['password'])<6) && $this->error['password']=L('error_password');

		  empty($_POST['confirm']) && $this->error['confirm']=L('error_confirm');

		  $_POST['password']!=$_POST['confirm'] && $this->error['confirm']=L('error_confirm_incorrect');

		  return !$this->error;
  	}
}