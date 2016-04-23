<?php

class ExtensionMenu extends Medium{

	protected $children=array();

	public function run($action,$data){
	
		switch ($action) {
	
			case 'get':return $this->get($data);break;

			case 'child':return $this->child($data);break;

			case 'tree':return $this->tree($data);break;
		}
	}

	private function get($menu_id){
		
		return D('extension/menu')->getMenu($menu_id);
	}
	
	
	public function child($menu_id){

		$params=array('where'=>array('parent_id'=>$menu_id),'sort'=>array('position DESC'));

		return D('extension/menu')->selectMenu($params);
	}
    public function getChilds( $id=null ){
        $sql = ' SELECT m.*, md.title,md.description FROM ' . DB_PREFIX . 'megamenu m LEFT JOIN '
            .DB_PREFIX.'megamenu_description md ON m.megamenu_id=md.megamenu_id AND language_id='.(int)$this->config->get('config_language_id') ;
        $sql .= ' WHERE m.`published`=1 ';
        if( $id != null ) {
            $sql .= ' AND parent_id='.(int)$id;
        }
        $sql .= ' ORDER BY `position`  LIMIT 9 ';
        $query = $this->db->query( $sql );
        return $query->rows;
    }

	public function hasChild($menu_id){

		return isset($this->children[$menu_id]);
	}	
	
	public function getNodes( $id ){
		return $this->children[$id];
	}
	
	private function tree($menu_id){
		
		$children = $this->child($menu_id);
		
		foreach($children as $child ){

			$this->children[$child['parent_id']][] = $child;	
		}

		$parent = 1 ;

		$output = $this->genTree($parent, 1);

		return $output;
	}
	
	public function getDropdown( $id=null, $selected=1 ){
		$this->children = array();
		$childs = $this->getChild( $id );
		foreach($childs as $child ){
			$this->children[$child['parent_id']][] = $child;	
		}
		
		$output = '<select name="megamenu[parent_id]" >';
		$output .='<option value="1">ROOT</option>';	
		$output .= $this->genOption( 1 ,1, $selected );
		$output .= '</select>';
		return $output ;
	}
	
	public function genOption( $parent, $level=0, $selected ){
		$output = '';
		if( $this->hasChild($parent) ){
			$data = $this->getNodes( $parent );
			
			foreach( $data as $menu ){
				$select = $selected == $menu['megamenu_id'] ? 'selected="selected"':"";
				$output .= '<option value="'.$menu['megamenu_id'].'" '.$select.'>'.str_repeat("-",$level) ." ".$menu['title'].' (ID:'.$menu['megamenu_id'].')</option>';
				$output .= $this->genOption(  $menu['megamenu_id'],$level+1, $selected );
			}				
		}
		
		return $output;
	}
	public function massUpdate( $data, $root ){
		$child = array();
		foreach( $data as $id => $parentId ){
			if( $parentId <=0 ){
				$parentId = $root;
			}
			
		//	$this->db->query( $sql );
			$child[$parentId][] = $id;
		}
		
		foreach( $child as $parentId => $menus ){
			$i = 1;
			foreach( $menus as $menuId ){
				$sql = " UPDATE  ". DB_PREFIX . "megamenu SET parent_id=".(int)$parentId.', position='.$i.' WHERE megamenu_id='.(int)$menuId;
				$this->db->query( $sql );
				$i++;
			}
		}
        $this->cache->delete('ModelTree');
 
	}

	private function genTree($parent, $level){
        $width = 285;
		if( $this->hasChild($parent) ){

			$data = $this->getNodes( $parent );
			$t = $level == 1?" sortable":"";
			$output = '<ol class="level'.$level. $t.' ">';
            $width = $width - $level * 25;
			
			foreach( $data as $menu ){
				$output .='<li id="list_'.$menu['menu_id'].'">
				<div><span class="disclose"><span></span></span><span style="display:inline-block;width:'.$width.'px;overflow:hidden;text-overflow:ellipsis">'.($menu['title']?$menu['title']:"").'(ID:'.$menu['megamenu_id'].')</span><span class="quickedit" rel="id_'.$menu['megamenu_id'].'">E</span><span class="quickdel" rel="id_'.$menu['megamenu_id'].'">D</span></div>';
				$output .= $this->genTree( $menu['menu_id'], $level+1 );
				$output .= '</li>';
			}	
			
			$output .= '</ol>';
			return $output;
		}
		return ;
	}
	
	public function editData( $data ){

		if( $data["megamenu"] ){
			if(  (int)$data['megamenu']['megamenu_id'] > 0 ){
				$sql = " UPDATE  ". DB_PREFIX . "megamenu SET  ";
				$tmp = array();
				foreach( $data["megamenu"] as $key => $value ){
					if( $key != "megamenu_id" ){
						$tmp[] = "`".$key."`='".$this->db->escape($value)."'";
					}
				}
				$sql .= implode( " , ", $tmp );
				$sql .= " WHERE megamenu_id=".$data['megamenu']['megamenu_id'];
				
				//	echo '<pre>'.print_r( $sql, 1 ); die;
				$this->db->query( $sql );
			} else {
				$sql = "INSERT INTO ".DB_PREFIX . "megamenu ( `";
				$tmp = array();
				$vals = array();
				foreach( $data["megamenu"] as $key => $value ){
					$tmp[] = $key;
					$vals[]=$this->db->escape($value);
				}				
				
			 	$sql .= implode("` , `",$tmp)."`) VALUES ('".implode("','",$vals)."') ";
				$this->db->query( $sql );
				$data['megamenu']['megamenu_id'] = $this->db->getLastId();
			}
		
		
		}
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
	
		if( isset($data["megamenu_description"]) ){
			$sql = " DELETE FROM ".DB_PREFIX ."megamenu_description WHERE megamenu_id=".(int)$data["megamenu"]['megamenu_id'] ;
			$this->db->query( $sql );
	 
			foreach( $languages as $language ){
				$sql = "INSERT INTO ".DB_PREFIX ."megamenu_description(`language_id`, `megamenu_id`,`title`,`description`) 
							VALUES(".$language['language_id'].",'".$data['megamenu']['megamenu_id']."','".$this->db->escape($data["megamenu_description"][$language['language_id']]['title'])."','"
							.$this->db->escape($data["megamenu_description"][$language['language_id']]['description'])."') ";
				$this->db->query( $sql );					
			}
		}
        $this->cache->delete('ModelTree');
		return $data['megamenu']['megamenu_id'];
	}
	 
	 
	 public function delete( $id ){
		$sql = " DELETE FROM ".DB_PREFIX ."megamenu WHERE megamenu_id=".(int)$id ;
		$this->db->query( $sql );
		$sql = " DELETE FROM ".DB_PREFIX ."megamenu_description WHERE megamenu_id=".(int)$id ;
		$this->db->query( $sql );
         $this->cache->delete('ModelTree');
	 
	 }

    public function flush(){
        $output = array();
        //level 1
        $childs = $this->getChilds( 1 );
        foreach($childs as $child){
            $link = $this->getLink( $child );
            $child['link'] = $link;
            //level 2
            $childs_2 = $this->getChilds( $child['megamenu_id'] );
            if(count($childs_2) != 0 ){
                $child['haschild'] = true;
                $output['level1'][] = $child;
                foreach($childs_2 as $child_2){
                    $link_2 = $this->getLink( $child_2 );
                    $child_2['link'] = $link_2;
                    if($child_2['type'] == 'tab' || $child_2['type'] == 'fandoms'){
                        $output['level2'][] = $child_2;
                        if($child_2['type'] == 'tab'){
                            //level 3
                            $childs_3 = $this->getChilds( $child_2['megamenu_id'] );
                            if(count($childs_3) != 0 ){
                                foreach($childs_3 as $child_3){
                                    $link_3 = $this->getLink( $child_3 );
                                    $child_3['link'] = $link_3;
                                    $output['level3'][] = $child_3;
                                    //level 4
                                    $childs_4 = $this->getChilds( $child_3['megamenu_id'] );
                                    if(count($childs_4) != 0 ){
                                        foreach($childs_4 as $child_4){
                                            $link_4 = $this->getLink( $child_4 );
                                            $child_4['link'] = $link_4;
                                            $output['level4'][] = $child_4;
                                        }
                                    }
                                }
                            }
                        }
                    }else{
                        $output['image'][$child['megamenu_id']][] = $child_2;
                    }
                }
            }else{
                $child['haschild'] = false;
                $output['level1'][] = $child;
            }
        }
        $this->cache->set('ModelTree', $output);
    }

    public function getLink( $menu ){
        $id = (int)$menu['item'];
        switch( $menu['type'] ){
            case 'category'     :
                return HTTP_CATALOG.'index.php?route=product/category&path=' . $id ;
                ;
            case 'catlist'     :
                return HTTP_CATALOG.'index.php?route=product/category/view&c=' . $id ;
                ;
            case 'product'      :
                return  HTTP_CATALOG.'index.php?route=product/product&product_id=' . $id;
                ;
            case 'information'  :

                return   HTTP_CATALOG.'index.php?route=information/information&information_id=' . $id;
                ;
            case 'manufacturer' :;
                return  HTTP_CATALOG.'index.php?route=product/manufacturer/info&manufacturer_id=' . $id;
            default:
                return $menu['url'];
        }
    }
}
