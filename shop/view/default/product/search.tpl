{$header}
<div class="container">
  <div class="row">
    {$column_left}
    <div id="content" class="col-sm-9">
      {$content_top}
      <!-- <h1>{$heading_title}</h1>
      <label class="control-label" for="input-search">{$entry_search}</label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="{$q}" placeholder="{$text_keyword}" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0">{$text_category}</option>
            {foreach from=$categories item=category_1}
            {if $category_1['category_id'] == $category_id}
            <option value="{$category_1['category_id']}" selected="selected">{$category_1['name']}</option>
            {else}
            <option value="{$category_1['category_id']}">{$category_1['name']}</option>
            {/if}
            {foreach from=$category_1['children'] item=category_2}
            {if $category_2['category_id'] == $category_id}
            <option value="{$category_2['category_id']}" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$category_2['name']}</option>
             {else}
            <option value="{$category_2['category_id']}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$category_2['name']}</option>
            {/if}
            {foreach from=$category_2['children'] item=category_3}
            {if $category_3['category_id'] == $category_id}
            <option value="{$category_3['category_id']}" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$category_3['name']}</option>
             {else}
            <option value="{$category_3['category_id']}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$category_3['name']}</option>
            {/if}
            {/foreach}
            {/foreach}
            {/foreach}
          </select>
        </div>
      <input type="button" onclick="tt.search()" value="{$button_search}" id="button-search" class="btn btn-primary" />
      </div> -->
      <h2>{$text_search}</h2>
      {if $items}
      <p><a href="{$compare}" id="compare-total">{$text_compare}</a></p>
      <div class="row">
        <div class="col-sm-3 hidden-xs">
          <div class="btn-group">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="{$button_list}"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="{$button_grid}"><i class="fa fa-th"></i></button>
          </div>
        </div>
      </div>
      <br />
      <div class="row">
        {foreach from=$items item=item}
          {include file="product/single_item.tpl"}
        {/foreach}
      </div>
      <div class="row">
        {include file="common/page.tpl"}
        <div class="col-sm-6 text-right">{$results}</div>
      </div>
      {else}
        <p>{$text_empty}</p>
      {/if}
      {$content_bottom}
      </div>
    {$column_right}
    </div>
</div>
{$footer}