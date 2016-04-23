<?php

class BannerAction extends Action {

  	protected $lang="module/banner";

  	protected function index($module) {

  		$banner_modules=V('banner_modules');

  		foreach ($banner_modules as $bm) {

  			if($bm['code']==$module['code']){

  				$banner=M('setting/banner','detail',$bm['banner_id']);

  				// print_r($banner);exit;
          if($bm['width']) $style.=sprintf("width:%s;",$bm['width']);
          if($bm['height']) $style.=sprintf("height:%s;",$bm['height']);
  			}
  		}

  		$data=array('banner'=>$banner,'style'=>$style);

  		$this->assign($data);

  		return $this->fetch('module/banner');
  	}
 }