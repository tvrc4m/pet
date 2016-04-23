<?php

class NavbarAction extends Action {

  	protected $lang="module/navbar";

  	protected function index() {

  		$navbars=V('navbars');

  		$combine=array();

		if(empty($navbars)){

			$navbars=M('product/cat','p2c');

			array_unshift($navbars,array('name'=>'首页','link'=>vendor_url()));

			foreach ($navbars as $k => $bar) {
				
				$children=$bar['children'];

				unset($bar['children']);

				$combine[$bar['name']]['parent']=$bar;

				$combine[$bar['name']]['children']=$children;
			}
		}else{

			$sort=$sort2=array();

			foreach ($navbars as $k=>$bar) {

				$bar['link']==='/' && $bar['link']='';
				$bar['link']=vendor_url($bar['link']);

				$sort['parent'][]=$bar['sort'];

				$sort2['children']['sort'][]=$bar['sort'];
				
				if($bar['parent']) $combine[$bar['parent']]['children'][]=$bar;
				else $combine[$bar['name']]['parent']=$bar;
			}
			
			array_multisort($sort,SORT_DESC,SORT_NUMERIC,$combine);
		}
		// print_r($combine);exit;
		$this->assign(array('navbars'=>$combine));

  		return $this->fetch('module/navbar');
  	}
 }