<?php

class RecommendAction extends Action {

  	protected $lang="module/recommend";

  	protected function index($module) {

  		$recommend_modules=V('recommend_modules');

      $style='';

  		foreach ($recommend_modules as $bm) {

  			if($bm['code']==$module['code']){

  				$items=M('product/item','recommend',array('recommend_id'=>$bm['recommend_id'],'limit'=>$bm['limit']));

          if($bm['width']) $style.=sprintf("width:%s;",$bm['width']);
          if($bm['height']) $style.=sprintf("height:%s;",$bm['height']);

          $data=array('items'=>$items,'style'=>$style,'items'=>$items,'code'=>str_replace('.','_',$bm['code']));

          $template=$bm['template_id'];

          $this->assign($data);

          return $this->fetch("recommend/{$template}");
  			}
  		}
  	}
 }