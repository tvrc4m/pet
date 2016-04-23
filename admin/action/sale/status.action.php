<?php

class StatusAction extends AdminAction {
	
	   protected $lang="sale/status";

  	 public function index() {

        $this->title=L('heading_title');

    		$page=$_GET['page'];

        empty($limit) && $limit=40;

    		$filter_id=$this->filter('filter_id');
    		$filter_name=$this->filter('filter_name');
  		
  		  $data = array(
    			'filter_id'	  => $filter_id,
    			'filter_name'	  => $filter_name,
    			'sort'            => $sort,
    			'order'           => $order,
    			'start'           => ($page - 1) * $limit,
    			'limit'           => $limit
    		);

    		$statuses=M('sale/order.status','list',$data);
    		$total=M('sale/order.status','count',$data);

    		foreach ($statuses as $k => $status) {
    			
    			$statuses[$k]['action'][]=array();
    		}
    		
    		$data['statuses']=$statuses;
        $data['delete']=admin_url('sale/status/delete');
    		
    		$urlpage=page($total,$page,$limit);

    		$this->assign(array('urlpage'=>$urlpage));

    		$this->assign($data);

    		$this->display('sale/status_list');
  	 }

     public function insert(){

        $name=$_GET['name'];

        if(empty($name)) exit(json_encode(array('ret'=>-1,'errors'=>array('name'=>L("error_name")))));

        $order_status=M('sale/order.status','get.by.name',$name);

        if(!empty($order_status)) exit(json_encode(array('ret'=>-1,'errors'=>array('name'=>L("error_exist_name")))));

        $status=M('sale/order.status','add',array('name'=>$name));

        if($status) exit(json_encode(array('ret'=>1)));

        exit(json_encode(array('ret'=>-1,'errors'=>array('name'=>L("error_exist_name")))));
     }

     public function delete(){

        $selected=$_POST['selected'];

        if (!empty($selected)) {
         
            M('sale/order.status','del',$selected);

            redirect(admin_url('sale/status'));
        }
     }

     public function update(){

        $order_status_id=$_GET['id'];
        $name=$_GET['name'];

        if(empty($order_status_id)) exit(json_encode(array('ret'=>-1,'errors'=>array('id'=>L("error_id")))));
        if(empty($name)) exit(json_encode(array('ret'=>-1,'errors'=>array('name'=>L("error_name")))));

        $order_status=M('sale/order.status','get.by.name',$name);

        if(!empty($order_status)){

          foreach ($order_status as $status) {
            
            if($status['order_status_id']!=$order_status_id){

              exit(json_encode(array('ret'=>-1,'errors'=>array('name'=>L("error_exist_name")))));
            }
          }
        }

        M('sale/order.status','update',array('id'=>$order_status_id,'data'=>array('name'=>$name)));

        exit(json_encode(array('ret'=>1)));
     }
}