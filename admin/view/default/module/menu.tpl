{$header}

<div id="content">
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" />{$heading_title}</h1>
      <div class="buttons">
    </div>
    <div class="content">
      <form action="{$action}" method="post" enctype="multipart/form-data" id="form">
			<div class="megamenu">
				<div class="tree-megamenu">
					
					<h4>{$text_treemenu}</h4>
					{$tree}
					<input type="button" name="serialize" id="serialize" value="Update" />
					
					<p class="note"><i>{$text_explain_drapanddrop}</i></p>
				</div>
				
				<div class="megamenu-form">
					<h3 style="display: none">{$text_menu_assignment}</h3>
					<table class="form" style="display: none">
						<tr>
						  <td>{$entry_layout}</td>
						  <td><select name="pavmegamenu_module[{$module_row}][layout_id]">
							 {foreach from=$layouts item=layout}
							  {if $layout['layout_id'] == $module['layout_id']}
							  <option value="{$layout['layout_id']}" selected="selected">{$layout['name']}</option>
							  {else}
							  <option value="{$layout['layout_id']}">{$layout['name']}</option>
							  {/if}
							  {/foreach}
							</select></td>
						</tr>
						<tr>
						  <td>{$entry_position}</td>
						  <td><select name="pavmegamenu_module[{$module_row}][position]">
							  {foreach from=$positions item=pos}
								  {if $module['position'] == $pos}
								  	<option value="{$pos}" selected="selected">ddd</option>
								  {else}
								  	<option value="{$pos}">fff</option>
								  {/if}
							  {/foreach}
							</select></td>
						</tr>
						<tr>
						  <td>{$entry_status}</td>
						  <td><select name="pavmegamenu_module[{$module_row}][status]">
							  {if $module['status']}
							  <option value="1" selected="selected">{$text_enabled}</option>
							  <option value="0">{$text_disabled}</option>
							  {else}
							  <option value="1">{$text_enabled}</option>
							  <option value="0" selected="selected">{$text_disabled}</option>
							  {/if}
							</select></td>
						</tr>
						<tr>
						  <td>{$entry_sort_order}</td>
						  <td><input type="text" name="pavmegamenu_module[{$module_row}][sort_order]" value="{$module['sort_order']}" size="3" /></td>
						</tr>
							</table>
							
					<div id="megamenu-form">
						{include file="module/menu_form.tpl"}
					</div>


				</div>
			</div>
		</div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token={$token}&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '{$text_image_manager}',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token={$token}&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
 <script type="text/javascript" class="source below">
 function flushNavCache(){
     $.ajax({
         url: '{$flush_url}',
         type: 'GET',
         dataType: 'json',
         success: function(response) {
         }
     });
 }
 function __submit( m ){
	$("#save_mode").val( m );
	$('#form').submit();
 }
	$('ol.sortable').nestedSortable({
			forcePlaceholderSize: true,
			handle: 'div',
			helper:	'clone',
			items: 'li',
			opacity: .6,
			placeholder: 'placeholder',
			revert: 250,
			tabSize: 25,
			tolerance: 'pointer',
			toleranceElement: '> div',
			maxLevels: 4,

			isTree: true,
			expandOnHover: 700,
			startCollapsed: true
		});
	
	$('#serialize').click(function(){
			var serialized = $('ol.sortable').nestedSortable('serialize');
			 $.ajax({
			async : false,
			type: 'POST',
			dataType:'json',
			url: "{$updateTree}",
			data : serialized, 
			success : function (r) {
				 
			}
		});
	})
	$(".quickedit").click( function(){
		
		var id = $(this).attr("rel").replace("id_","");
		$.post( "{$actionGetInfo}", {
			"id":id,	
			"rand":Math.random()},
			function(data){
				$("#megamenu-form").html( data );
			});
	} );
	$(".quickdel").click( function(){
		if( confirm("{$this->language->get("message_delete")}") ){
			var id = $(this).attr("rel").replace("id_","");
			window.location.href="{$actionDel}&id="+id;
		}
	} );
	$(document).ajaxSend(function() {
		$("#ajaxloading").show();
	});
	$(document).ajaxComplete(function() {
		$("#ajaxloading").hide();
        $(".warning").hide();
	});
</script>

{$footer}