<?php

class OrderAction extends AdminAction {
	
	   protected $lang="sale/order";

  	 public function index() {

        $this->title='订单列表';

    		$page=$_GET['page'];

    		$limit=V('config_order_page');

        empty($limit) && $limit=30;

    		$filter_id=$this->filter('filter_id');
    		$filter_name=$this->filter('filter_name');
        $filter_phone=$this->filter('filter_phone');
    		$filter_type=$this->filter('filter_type');
        $filter_start=$this->filter('filter_start');
    		$filter_end=$this->filter('filter_end');
    		$filter_status=$this->filter('filter_status');
  		
  		  $data = array(
    			'filter_id'	  => $filter_id,
    			'filter_name'	  => $filter_name,
          'filter_phone'    => $filter_phone,
    			'filter_type'	  => $filter_type,
          'filter_start'    => $filter_start,
    			'filter_end'	  => $filter_end,
    			'filter_status'   => $filter_status,
    			'sort'            => $sort,
    			'order'           => $order,
    			'start'           => ($page - 1) * $limit,
    			'limit'           => $limit
    		);

    		$orders=M('sale/order','list',$data);
        $total=M('sale/order','count',$data);
        $statuses=M('sale/order.status','all');
    		$types=M('sale/order','order.type');
        $types['local']='批发';

    		foreach ($orders as $k => $order) {
    			
    			$orders[$k]['action'][]=array();
    		}

        $data['orders']=$orders;
        $data['statuses']=$statuses;
    		$data['types']=$types;
        $data['insert']=admin_url('sale/order/insert');
        $data['delete']=admin_url('sale/order/delete');
    		
    		$urlpage=page($total,$page,$limit);

    		$this->assign(array('urlpage'=>$urlpage));

    		$this->assign($data);

    		$this->display('sale/order_list');
  	}

  	public function info(){

  		$this->title='订单详细';

  		$order_id=$_GET['id'];

  		$order=M('sale/order','get',$order_id);

      $items=D('sale/item')->getOrderItems($order_id);

      $tickets=M('sale/order.ticket','order',$order_id);

      $statuses=M('sale/order.status','all');

      $data=array('items'=>$items,'tickets'=>$tickets,'statuses'=>$statuses);
      // print_r($tickets);exit;
      $this->assign($order);
  		$this->assign($data);

  		$this->display('sale/order_info');
  	}

  	public function insert(){

      if(ispost() && $this->validateInsert()){

        $status=M('sale/order','add.outside',$_POST);

        if($status==1){

            $this->error['success']=L('insert_success');

            redirect(admin_url('sale/order'));
        }else{

          $this->error['warning']=L('error_insert');
        }
      }

      $this->title=L('insert_title');

      $this->assign(array('heading_title'=>L('insert_title')));

      $this->getForm();
    }

    public function delete(){

      if (!empty($_POST['selected'])) {

        foreach ($_POST['selected'] as $order_id) {
         
          D('sale/order')->updateOrderByParams($order_id,array('deleted'=>1));
        }
      }
      redirect(admin_url('sale/order'));
    }

    public function update(){

      if (ispost() && $this->validateUpdate()) {

        $response=M('sale/order','edit',$_POST);

        switch ($response['ret']) {
          case 0:$warning=L('error_error'); break;
          case 1:$success=redirect(admin_url('sale/order')); break;
          case -1:$warning=L('error_order_not_exist'); break;
          case -2:$warning=L('error_vendor_not_exist'); break;
          case -3:$warning=L('error_amount_lack'); break;
          case -5:$warning=L('error_order_refund'); break;
          case -10:$warning=sprintf(L('error_ticket_delay'),$response['reason']); break;
        }

        $this->assign(array('success'=>$success));

        $this->error['warning']=$warning;
      }

      $this->title=L('update_title');
      
      $this->assign(array('heading_title'=>L('update_title')));

      $this->getForm();
    }

    public function add(){

      $key=isset($_GET['key_order'])?$_GET['key_order']:uniqid();

      $items=S($key);

      if ($this->validateAdd()) {

        $item=M('product/item','get',$_GET['item_id']);

        if(!empty($item)){

          if(!empty($_GET['item_option_id'])){

            $option=M('product/option','get',$_GET['item_option_id']);

            $items[]=array('item_id'=>$item['item_id'],'title'=>$item['title'],'options'=>$option['name'],'price'=>$option['price'],'item_option_id'=>$_GET['item_option_id'],'quantity'=>$_GET['quantity']);  
          }else{

            $items[]=array('item_id'=>$item['item_id'],'title'=>$item['title'],'options'=>'','price'=>$item['price'],'item_option_id'=>'','quantity'=>$_GET['quantity']);  
          }
        }

        S($key,$items);
      }

      $total=0;

      foreach ($items as $item) {
        
        $total+=$item['quantity']*$item['price'];
      }

      $this->assign(array('items'=>$items,'total'=>$total,'key'=>$key));

      echo $this->fetch('sale/order_item');
    }

    public function del(){

      $key=$_GET['key_order'];

      $item_id=$_GET['item_id'];

      $item_option_id=$_GET['item_option_id'];

      $items=S($key);

      foreach ($items as $k=>$item) {
        
        if($item['item_id']==$item_id && $item_option_id==$item['item_option_id']){
          unset($items[$k]);
        }
      }

      S($key,$items);

      $total=0;

      foreach ($items as $item) {
        
        $total+=$item['quantity']*$item['price'];
      }

      $this->assign(array('items'=>$items,'total'=>$total,'key'=>$key));

      echo $this->fetch('sale/order_item');
    }

    private function getForm(){

      $key=isset($_GET['key_order'])?$_GET['key_order']:uniqid();

      $order_id=$_GET['id'];

      if(!empty($order_id)){

        $order=M('sale/order','detail',$order_id);

        $action=admin_url('sale/order/update/'.$order_id);

        $template='sale/order_edit';

      }else{

        $action=admin_url('sale/order/insert');

        $types=M('sale/order','order.type');

        $template='sale/order_form';
      }

      $statuses=M('sale/order.status','all');

      $products=M('product/item','all');

      $this->flushform($_POST,$order,array('order_id','vendor_id','type','name','status','idcard','plantime','phone','total','quantity'));
      // print_r($_POST['items']);exit;
      $items=isset($_POST['items'])?$_POST['items']:$order['items'];

      foreach ($items as $k=>$item) {

        $items[$k]['item_options']=M('product/option','item',$item['item_id']);
      }

      $data=array(
        'vendors'=>$vendors,
        'order'=>$order,
        'vendor'=>$vendor,
        'products'=>$products,
        'statuses'=>$statuses,
        'action'  =>$action,
        'key'   =>$key,
        'items' =>$items,
        'types'   =>$types,
      );

      $this->assign($data);

      $this->display($template);
    }

    private function validateUpdate(){

      (empty($_POST['idcard']) || strlen($_POST['idcard'])<15) && $this->error['card']=L('error_card');

      empty($_POST['plantime']) && $this->error['plan']=L('error_plan');

      if($this->error){

        $this->error['warning']=L('error_waring');

        return false;
      }

      return true;
    }

    private function validateInsert(){

      empty($_POST['type']) && $this->error['type']=L('error_type');

      empty($_POST['name']) && $this->error['name']=L('error_name');

      (empty($_POST['phone']) || !preg_match('/^\d{6,11}$/',$_POST['phone'])) && $this->error['phone']=L('error_phone');

      // (empty($_POST['idcard']) || strlen($_POST['idcard'])<15) && $this->error['card']=L('error_card');

      empty($_POST['status']) && $this->error['status']=L('error_status');

      if(empty($_POST['plantime'])) $this->error['plan']=L('error_plan');
      else if(strtotime($_POST['plantime'])<strtotime(date('Y-m-d'))) $this->error['plan']=L('error_plan_start');

      if(empty($_POST['items'])) $this->error['items']=L('error_items');
      
      else

        foreach ($_POST['items'] as $k => $item) {
          
          $options=M('product/option','item',$item['item_id']);

          (!empty($options) && (empty($item['item_option_id']) || !in_array($item['item_option_id'],array_keys($options)))) && $this->error['items'][$k]['option']=L('error_option');

          if($item['item_option_id']){

              $option=M('product/option','get',$item['item_option_id']);
              if($option['ticket_type_id']){

                $ticket_type=D('ticket/type')->getTicketType($option['ticket_type_id']);

                if($ticket_type['platform']=='beizhu'){

                  (empty($_POST['idcard']) || strlen($_POST['idcard'])<15) && $this->error['card']=L('error_card');
                }
              }
          }
          
          (empty($item['quantity']) || $item['quantity']<0) && $this->error['items'][$k]['quantity']=L('error_quantity');

        }

      if($this->error){

        $this->error['warning']=L('error_waring');

        return false;
      }

      return true;
    }

    private function validateAdd(){

      (empty($_GET['item_id']) || !is_numeric($_GET['item_id'])) && $this->error['item']=L('error_item');

      // empty($_GET['item_option_id']) && $this->error['option']=L('error_option');
      // 
      // empty($_POST['status']) && $this->error['status']=L('error_status');

      (empty($_GET['quantity']) || $_GET['quantity']<1) && $this->error['quantity']=L('error_quantity');

      if($this->error){

        return false;
      }

      return true;
    }
}