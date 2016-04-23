<?php


if( $menu ): 
$module_row= 'ss';
?>
<?php if( $menu['megamenu_id'] > 0 ) { ?>

<?php } else { ?>
<h3>{$text_create_new}</h3>
<?php } ?>
<div>
<?php 
// echo '<pre>'.print_r( $menu_description,1 ); die;
?>
	<h4>Menu Information</h4>
	 <div id="language-{$module_row}" class="htabs">
            
	<h4>Menu Type</h4>
	<input type="hidden" name="megamenu[item]" value="{$menu['item']}" />
	<table class="form">
		<tr style="display: none">
			<td>{$entry_publish}</td>
				
			<td>
				<select type="list" name="megamenu[published]" >
					<?php foreach( $yesno as $key => $val ){ ?>
					<option value="{$key}" {$val}</option>
					<?php } ?>
				</select>
 			</td>
		</tr>
		<tr>
			<td>{$entry_type}</td>
				
			<td>
				<select name="megamenu[type]" id="megamenutype">
					<?php foreach(  $megamenutypes as $mt => $val ){ ?>
					<option value="{$mt}" {$val}</option>
					<?php } ?>
				</select>
 			</td>
		</tr>
		<tr id="megamenutype-url" class="megamenutype">
			<td>{$entry_url}</td>
			<td>
				<input type="text" name="megamenu[url]" value="{$menu['url']}" size="55"/>
			</td>
		</tr>
		<tr id="megamenutype-category" class="megamenutype">
			<td>{$entry_category}</td>
			<td>
				<input type="text" name="path" value="{$menu['megamenu-category']}" size="55" />
                <i>{$text_explain_input_auto}</i>
			</td>
		</tr>
        <tr id="megamenutype-catlist" class="megamenutype">
            <td>{$entry_category}</td>
            <td>
                <input type="text" name="megamenu-catlist" value="{$menu['megamenu-catlist']}" size="55" />
                <i>{$text_explain_input_auto}</i>
            </td>
        </tr>
		<tr id="megamenutype-product" class="megamenutype">
			<td>{$entry_product}</td>
			<td>
				<input type="text" name="megamenu-product" value="{$menu['megamenu-product']}" size="55"/>
				<i>{$text_explain_input_auto}</i>
			</td>
		</tr>
		<tr id="megamenutype-manufacturer" class="megamenutype">
			<td>{$entry_manufacturer}</td>
			<td>
				<input type="text" name="megamenu-manufacturer" value="{$menu['megamenu-manufacturer']}" size="55"/>
				<i>{$text_explain_input_auto}</i>
			</td>
		</tr>
		<tr id="megamenutype-information" class="megamenutype">
			<td>{$entry_information}</td>
			<td>
				
				<select type="text" name="megamenu-information" id="megamenu-information">
					<?php foreach( $informations as $info ){ ?>
					<option value="{$info['information_id']}" {$info['title']}</option>
					<?php } ?>
				</select>
				
			</td>
		</tr>
		<tr id="megamenutype-html" class="megamenutype">
			<td>{$entry_html}</td>
			<td>
				<textarea type="text" name="megamenu[content_text]"  size="55">{$menu['content_text']}</textarea>
				<i>{$text_explain_input_html}</i>
			</td>
		</tr>
	</table>	
	<h4>Menu Params</h4>	  
	 <table class="form">
		<tr>
			<td>{$entry_parent_id}</td>
				
			<td>
				{$menus}
 			</td>
		</tr>
		 <tr>
              <td>{$entry_image}</td>
              <td valign="top"><div class="image"><img src="{$thumb}" alt="" id="thumb" />
                  <input type="hidden" name="megamenu[image]" value="{$menu['image']}" id="image" />
                  <br />
                  <a onclick="image_upload('image', 'thumb');">{$text_browse}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '{$no_image}'); $('#image').attr('value', '');">{$text_clear}</a></div></td>
            </tr>
		<tr style="display: none">
			<td>{$entry_menuclass}</td>
				
			<td>
				<input type="text" name="megamenu[menu_class]" value="<?php echo $menu['menu_class']?>"/>
				
 			</td>
		</tr>	
		<tr>
			<td>{$entry_showtitle}</td>
				
			<td>
				<select type="list" name="megamenu[show_title]" >
					<?php foreach( $yesno as $key => $val ){ ?>
					<option value="{$key}" {$val}</option>
					<?php } ?>
				</select>
 			</td>
		</tr>
		<tr style="display: none">
			<td>{$entry_isgroup}</td>
				
			<td>
				<select type="list" name="megamenu[is_group]" value="">
					<?php foreach( $yesno as $key => $val ){ ?>
					<option value="{$key}" {$val}</option>
					<?php } ?>
				</select>
 			</td>
		</tr>
		<tr style="display: none">
			<td>{$entry_iscontent}</td>
				
			<td>
				<select type="list" name="megamenu[is_content]">
					<?php foreach( $yesno as $key => $val ){ ?>
					<option value="{$key}" {$val}</option>
					<?php } ?>
				</select>
 			</td>
		</tr>
		
		<tr style="display: none">
			<td>
				{$entry_columns}
			</td>
				
			<td>
				<input type="text" name="megamenu[colums]" value="<?php echo $menu['colums']?>"/>
 			</td>

		</tr>
		
		
		 
		<tr style="display: none">
			<td>
			{$entry_detail_columns}	
			</td>
				
			<td>
				<textarea type="text" name="megamenu[submenu_colum_width]" rows="5"><?php echo $menu['submenu_colum_width']?></textarea>
				<i>{$text_explain_submenu_cols}</i>
 			</td>
		</tr>
		<tr style="display: none">
			<td>{$entry_sub_menutype}</td>
			<td>

				<select name="megamenu[type_submenu]" id="megamenu-type_submenu">
					<?php foreach( $submenutypes as $stype => $text ) { ?>
					<option value="{$stype}" {$text}</option>
					<?php } ?>
				</select>
				<i>{$text_explain_submenu_type}</i>
			</td>
		</tr>
		<tr class="type_submenu" id="type_submenu-html" style="display:none;">
			<td>{$entry_submenu_content}</td>
			<td>
				<textarea name="megamenu[submenu_content]" id="submenu_content">{$menu['submenu_content']}</textarea>
			
			</td>
		<tr>
	</table>
	<input type="hidden" name="megamenu[megamenu_id]" value="<?php echo $menu['megamenu_id']?>"/>
</div>
<?php endif; ?>

<script type="text/javascript"> 
$("#type_submenu-"+$("#megamenu-type_submenu").val()).show();
$("#megamenu-type_submenu").change( function(){
	$(".type_submenu").hide();
	$("#type_submenu-"+$(this).val()).show();
} );


CKEDITOR.replace('submenu_content', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token={$token}',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token={$token}',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token={$token}',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token={$token}',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token={$token}',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token={$token}'
});


CKEDITOR.replace('megamenu[content_text]', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token={$token}',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token={$token}',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token={$token}',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token={$token}',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token={$token}',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token={$token}'
});




   $( ".htabs a" ).tabs();
   $(".megamenutype").hide();
   $("#megamenutype-"+ $("#megamenutype").val()).show();
   $("#megamenutype").change( function(){
		$(".megamenutype").hide();
		$("#megamenutype-"+$(this).val()).show();
   } );
   
   




$('input[name=\'megamenu-manufacturer\']').autocomplete({
	delay: 500,
	source: function(request, response) {		
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token={$token}&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'manufacturer_id':  0,
					'name':  '{$text_none}'
				});
				
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.manufacturer_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'megamenu-manufacturer\']').val(ui.item.label);
		$('input[name=\'megamenu[item]\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$("#megamenu-information").change( function(){ 
	$('input[name=\'megamenu[item]\']').val($(this).val());
} );

$('input[name=\'megamenu-product\']').autocomplete({
	delay: 500,
	source: function(request, response) {		
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token={$token}&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'product_id':  0,
					'name':  '{$text_none}'
				});
				
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'megamenu-product\']').val(ui.item.label);
		$('input[name=\'megamenu[item]\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

   
$('input[name=\'path\']').autocomplete({
	delay: 500,
	source: function(request, response) {		
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token={$token}&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'category_id':  0,
					'name':  '{$text_none}'
				});
				
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.category_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'path\']').val(ui.item.label);
		$('input[name=\'megamenu[item]\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('input[name=\'megamenu-catlist\']').autocomplete({
    delay: 500,
    source: function(request, response) {
        $.ajax({
            url: 'index.php?route=catalog/category/autocomplete&token={$token}&filter_name=' +  encodeURIComponent(request.term),
            dataType: 'json',
            success: function(json) {
                json.unshift({
                    'category_id':  0,
                    'name':  '{$text_none}'
                });

                response($.map(json, function(item) {
                    return {
                        label: item.name,
                        value: item.category_id
                    }
                }));
            }
        });
    },
    select: function(event, ui) {
        $('input[name=\'megamenu-catlist\']').val(ui.item.label);
        $('input[name=\'megamenu[item]\']').val(ui.item.value);

        return false;
    },
    focus: function(event, ui) {
        return false;
    }
});
</script>