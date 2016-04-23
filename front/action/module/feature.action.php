<?php

class FeatureAction extends Action {

  	protected $lang="module/feature";

  	protected function index($module) {

  		$feature_modules=V('feature_modules');

      $style='';

  		foreach ($feature_modules as $bm) {

  			if($bm['code']==$module['code']){

  				$feature=M('setting/feature','detail',array('feature_id'=>$bm['feature_id'],'limit'=>$bm['limit']));

          if($bm['width']) $style.=sprintf("width:%s;",$bm['width']);
          if($bm['height']) $style.=sprintf("height:%s;",$bm['height']);
  			}
  		}

  		$data=array('feature'=>$feature,'style'=>$style);

  		$this->assign($data);

  		return $this->fetch('module/feature');
  	}
 }