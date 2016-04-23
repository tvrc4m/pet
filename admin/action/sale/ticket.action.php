<?php

class TicketAction extends AdminAction {
	
	protected $lang="sale/ticket";

  	public function query() {

  		$order_id=$_GET['id'];

  		$result=M('ticket/ticket','query',$order_id);

      foreach ($result as $ticket) $text.=sprintf('%s -- %s<br />',$ticket['type_name'],$ticket['reason']);

  		exit(json_encode(array('reason'=>$text)));
  	}

  	public function book(){

  		$order_id=$_GET['id'];

  		$result=M('ticket/ticket','book',array('order_id'=>$order_id,'run'=>1));

  		exit(json_encode($result));
  	}

    public function delay(){

      $order_id=$_GET['id'];
      $plantime=$_GET['plantime'];

      $result=M('ticket/ticket','delay',array('order_id'=>$order_id,'plantime'=>$plantime));

      exit(json_encode($result));
    }

  	public function refund(){

  		$order_id=$_GET['id'];

  		$result=M('ticket/ticket','refund',$order_id);

  		exit(json_encode($result));
  	}

    public function sms(){

      $order_id=$_GET['id'];

      $result=M('ticket/ticket','sms',$order_id);

      exit(json_encode($result));
    }
}