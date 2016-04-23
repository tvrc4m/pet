<?php

class AccountAction extends Action {

  	protected $lang="module/account";

  	protected function index($module) {

      	$links['account']=vendor_url('account');
      	$links['edit']=vendor_url('account/edit');
      	$links['change']=vendor_url('account/change');
  		$links['order']=vendor_url('account/order');
  		$links['logout']=vendor_url('logout');

  		$this->assign(array('link'=>$links));

  		return $this->fetch('module/account');
  	}
 }