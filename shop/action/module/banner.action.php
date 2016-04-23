<?php

class BannerAction extends Action {

  	protected $lang="module/banner";

  	protected function index($module) {

  		$banner_modules=V('banner_modules');

  		foreach ($banner_modules as $bm) {

  			if($bm['code']==$module['code']){

  				$banner=M('extension/banner','detail',$bm['banner_id']);

  				// print_r($banner);exit;
          if($bm['width']) $style.=sprintf("width:%s;",$bm['width']);
          if($bm['height']) $style.=sprintf("height:%s;",$bm['height']);

          $data=array('banner'=>$banner,'style'=>$style,'code'=>str_replace('.','_',$bm['code']));

          $this->assign($data);

          return $this->fetch('module/owl-banner');
  			}
  		}
  	}
 }