<?php

class CheckoutAction extends FAction {

  	protected $lang=array("checkout/cart","checkout/checkout");

  	public function index() {

        $key=$_GET['sid'];

        if(ispost() && $this->validate($key)){

            $status=M('checkout/checkout','confirm',$_POST);

            if($status==0){

              $this->error['warning']=L('error_failure');
            }else if($status==-1){
              
              $this->error['warning']=L('error_balance');
            }

            redirect(vendor_url('checkout/success'));
        }
        
        $result=S($key);
        $items=$result['items'];
        $total=$result['total'];

        if(empty($items)) redirect(vendor_url());

        $this->title=L('heading_title');

        $this->js=array("/static/default/js/jquery/ui/jquery-ui-1.8.16.custom.min.js");
        $this->css=array("/static/default/js/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css");
          
        $vendor=M('account/vendor','get',S('LOGGED'));

        if(empty($vendor)) redirect('logout');

        if($vendor['amount']<$total){
            
            $this->error['warning']=L('error_balance');
            $disable=1;
        }

    		$text_cart=sprintf(L('text_items'),$count,'￥'.$total);

    		$data=array(
    			'text_cart'=>$text_cart,
    			'items'=>$result['items'],
    			'totals'=>$result['totals'],
          'key'=>$key,
    			'cart'=>vendor_url('cart'),
    			'checkout'=>vendor_url('checkout'),
    			'confirm'=>vendor_url('checkout',array('sid'=>$key)),
          'disable'=>(int)$disable,
    		);
        
    		$this->assign($data);

        $this->flushform($_POST,$vendor,array('name','phone','idcard','plantime'));
      
        $this->display('checkout/checkout');
  	}

    private function validate($key){

      empty($key) && $key=$_POST['key'];

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