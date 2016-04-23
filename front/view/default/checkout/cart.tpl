{$header}
<div class="container">
  {if $success}
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> {$success}</div>
  {/if}
  {if $errors['warning']}
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {$errors['warning']}</div>
  {/if}
  <div class="row">
    {$column_left}
    <div id="content" class="col-sm-12">
      {$content_top}
      <h1>{$heading_title}</h1>
      <form id='cartform' method="post" enctype="multipart/form-data">
        <input type="hidden" name="cart" value="1" />
        <div class="table-responsive">
          <table id='item' class="table table-bordered">
            <thead>
              <tr>
                <td class="text-center">{$column_image}</td>
                <td class="text-left">{$column_name}</td>
                <td class="text-left">{$column_quantity}</td>
                <td class="text-right">{$column_price}</td>
                <td class="text-right">{$column_total}</td>
              </tr>
            </thead>
            {if $carts}
            <tbody>
              {foreach from=$carts key=index item=item}
                <tr>
                  <td class="text-center">
                    {if $item['image']}
                      <a href="{$item['href']}">
                        <img src="{$item['image']}" alt="{$item['name']}" title="{$item['name']}" class=" w80 img-thumbnail" />
                      </a>
                    {/if}
                  </td>
                  <td class="text-left">
                    <input type="hidden" name="items[{$index}][item_id]" value="{$item['item_id']}" />
                    <a href="{$item['href']}">{$item['title']}</a>
                    {if $item['options']}
                      {foreach from=$item['options'] item=option}
                        <input type="hidden" name="items[{$index}][options][]" value="{$option['item_option_id']}" />
                        <br />
                        - <small>{$option['name']}</small>
                      {/foreach}
                    {/if}
                    <span class="error error_options"></span>
                  </td>
                  <td class="text-left">
                    <div class="input-group btn-block" style="max-width: 200px;">
                      <input type="text" name="items[{$index}][quantity]" value="{$item['quantity']}" size="1" class="form-control" />
                      <span class="error error_quantity"></span>
                    </div>
                  </td>
                  <td class="text-right">￥{$item['price']}</td>
                  <td class="text-right">￥{$item['total']}</td>
                </tr>
              {/foreach}
            </tbody>
            {else}
            <tr>
              <td class="center" colspan="6">{$text_no_results}</td>
            </tr>
            {/if}
          </table>
        </div>
      </form>
      <br />
      <div class="row">
        <div class="col-sm-4 col-sm-offset-8">
          <table class="table table-bordered">
            {foreach from=$totals item=total}
              <tr>
                <td class="text-right"><strong>{$total['title']}:</strong></td>
                <td class="text-right">￥{$total['text']}</td>
              </tr>
            {/foreach}
          </table>
        </div>
      </div>
      <div class="buttons">
        <div class="pull-right"><a href="javascript:void(0)" onclick="tt.cart.buy('#cartform')" class="btn btn-primary">{$button_checkout}</a></div>
      </div>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer}