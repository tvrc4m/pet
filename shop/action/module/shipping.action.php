<?php

class ShippingAction extends Action {

  	protected function index() {

    	$shipping_display=V('shipping_display');

      if($shipping_display){

          $shippings=V('shippings');

          $shippings=array_filter($shippings,function($shipping){
            
            return $shipping['status'];
          });

          $sort=array();

          foreach ($shippings as $shipping) {
            
            array_push($sort,$shipping['sort']);
          }

          array_multisort($sort,SORT_ASC,SORT_NUMERIC,$shippings);

          $data=array('shippings'=>$shippings);  

          $this->assign($data);

          return $this->fetch('module/shipping');
      }
  }
}