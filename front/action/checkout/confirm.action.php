<?php

class ConfirmAction extends FAction {

  	protected $lang=array("checkout/cart","checkout/checkout");

  	public function index() {

  		if(ispost() && $this->validate()){

            $status=M('checkout/checkout','confirm',$_POST);

            if($status!=1){

              $this->error['warning']=L('error_failure');
            }
        }
	}

	private function validate(){

      $key=$_POST['key'];

      $result=S($key);

      $items=$result['items'];
      $total=$result['total'];

      if(empty($items)) redirect(vendor_url());

      $vendor=M('account/vendor','get',S('LOGGED'));

      if(empty($vendor)) redirect('logout');

      if($vendor['amount']<$total){

          $this->error['warning']=L('error_waring');

          return false;
      }

      empty($_POST['name']) && $this->error['name']=L('error_name');

      (empty($_POST['phone']) || !preg_match('/^\d{6,11}$/',$_POST['phone'])) && $this->error['phone']=L('error_phone');

      (empty($_POST['idcard']) || strlen($_POST['idcard'])<15) && $this->error['card']=L('error_card');

      if(empty($_POST['plantime'])) $this->error['plan']=L('error_plan');
      else if(strtotime($_POST['plantime'])<strtotime(date('Y-m-d'))) $this->error['plan']=L('error_plan_start');

      if($this->error){

        $this->error['warning']=L('error_waring');

        return false;
      }

      return true;
    }
}