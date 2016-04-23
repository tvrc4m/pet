{$header}
<div class="container">
  <div class="row">
    {$column_left}
    {$account}
    <div id="content" class="col-sm-9">
      {$content_top}
      <h1>{$heading_title}</h1>
      {if $items}
      <div class="table-responsive">
        <table class="table list table-bitemed table-hover">
          <thead>
            <tr>
              <td class="text-left">{$column_title}</td>
              <td class="text-left">{$column_option}</td>
              <td class="text-left">{$column_price}</td>
              <td class="text-left">{$column_quantity}</td>
              <td class="text-left">{$column_total}</td>
              <td class="text-left">{$column_created_date}</td>
            </tr>
          </thead>
          <tbody>
            {foreach from=$items item=item}
            <tr>
              <td class="text-left"><a href="/vendor/item/{$item['item_id']}.html">{$item['title']}</a></td>
              <td class="text-left">{$item['item_option']}</td>
              <td class="text-left">{$item['price']}元</td>
              <td class="text-left">{$item['quantity']}</td>
              <td class="text-left">{$item['total']}元</td>
              <td class="text-left">{$item['created_date']}</td>
            </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
      {include file="common/page.tpl"}
      {else}
        <p>{$text_empty}</p>
      {/if}
      {$content_bottom}
      </div>
    {$column_right}
  </div>
</div>
{$footer}