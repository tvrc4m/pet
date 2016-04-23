<div class="list-group">
  {foreach from=$cats item=cat}
      <a href="{$cat['link']}" class="list-group-item {if $cat['cat_id'] == $cat_id}active{/if}">{$cat['name']}</a>
      {if $cat['children']}
        {foreach from=$cat['children'] item=child}
            <a href="{$child['link']}" class="list-group-item {if $child['cat_id']==$child_id}active{/if}">
              &nbsp;&nbsp;&nbsp;- {$child['name']}
            </a>
        {/foreach}
      {/if}
  {/foreach}
</div>
