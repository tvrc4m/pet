<div id="content" class="col-sm-2">
  <div class="list-group">
    <a href="{$link['account']}" class="list-group-item {if ($smarty.get.app=='vendor' AND $smarty.get.act=='index')}active{/if}">{$text_account}</a>
    <a href="{$link['edit']}" class="list-group-item {if ($smarty.get.app=='vendor' AND $smarty.get.act=='update')}active{/if}">{$text_edit}</a> 
    <a href="{$link['change']}" class="list-group-item {if ($smarty.get.app=='vendor' AND $smarty.get.act=='change')}active{/if}">{$text_password}</a>
    <a href="{$link['order']}" class="list-group-item {if ($smarty.get.app=='order' AND $smarty.get.act=='index')}active{/if}">{$text_order}</a> 
    <a href="{$link['logout']}" class="list-group-item">{$text_logout}</a>
  </div>
</div>

