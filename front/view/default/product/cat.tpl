{$header}
<div class="container">
  <div class="row">
    {$column_left}
    <div id="content" class="col-sm-9">
      {$content_top}
      {if $items}
      <div class="row">
        <div class="col-md-4">
          <div class="btn-group hidden-xs">
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
        <div class="col-sm-6 text-left">{$pagination}</div>
        <div class="col-sm-6 text-right">{$results}</div>
      </div>
      {/if}
      <?php if (!$categories && !$products) { ?>
      <p>{$text_empty}</p>
      <?php } ?>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer}
