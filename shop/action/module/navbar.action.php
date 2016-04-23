<?php

class NavbarAction extends Action {

  	protected $lang="module/navbar";

  	protected function index() {

  		$navbars=V('navbars');

  		$combine=array();

		if(empty($navbars)){

			$navbars=M('product/cat','p2c');

			array_unshift($navbars,array('name'=>'首页','link'=>shop_url()));

			foreach ($navbars as $k => $bar) {
				
				$children=$bar['children'];

				unset($bar['children']);

				$combine[$bar['name']]['parent']=$bar;

				$combine[$bar['name']]['children']=$children;
			}
		}else{

			$sort=$sort2=array(); // 一级二级排序数组

			$result=array();

			foreach ($navbars as $k=>$bar) {

				$bar['link']==='/' && $bar['link']='';
				$bar['link']=sprintf("http://%s%s",$_SERVER['HTTP_HOST'],$bar['link']);
				
				if($bar['parent']){
					$combine[$bar['parent']]['children'][]=$bar;
					$sort2[$bar['parent']][]=$bar['sort'];
				}else{
					$combine[$bar['name']]['parent']=$bar;
					$combine[$bar['name']]['sort']=$bar['sort'];
					$sort[]=$bar['sort'];
				}
			}
			// 二级倒序排序
			foreach ($combine as $name => $parent) {
				if(!empty($parent['children'])){
					array_multisort($sort2[$name],SORT_DESC,SORT_NUMERIC,$parent['children']);
				}
				$parent['children']=$parent['children'];
				$result[$name]=$parent;
			}
			// 一级倒序排序
			array_multisort($sort,SORT_DESC,SORT_NUMERIC,$combine);
		}
		// print_r($combine);exit;
		$this->assign(array('navbars'=>$combine));

  		return $this->fetch('module/navbar');
  	}
 }