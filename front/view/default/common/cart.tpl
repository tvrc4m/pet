<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="dropdown" data-loading-text="{$text_loading}" class="btn btn-inverse btn-block btn-lg dropdown-toggle">
    <i class="fa fa-shopping-cart"></i> 
    <span id="cart-total">{$text_cart}</span>
  </button>
  <ul class="dropdown-menu pull-right">
    {if $carts}
    <li>
      <table class="table table-striped">
        {foreach from=$carts item=item}
          <tr>
            <td class="text-left">
              <a href="{$item['href']}">{$item['title']}</a>
              {if $item['options']}
                {foreach from=$item['options'] item=option}
                  <br />
                  - <small>{$option['name']}</small>
                {/foreach}
              {/if}
            </td>
            <td class="text-right">￥{$item['price']} x {$item['quantity']}</td>
            <td class="text-right">￥{$item['total']}</td>
            <td class="text-center">
              <form action="" id="cart_{$item['item_id']}_{$item['item_option']}">
                <input type='hidden' name='item_id' value="{$item['item_id']}" />
                {foreach from=$item['options'] item=option}
                  <input type='hidden' name='options[]' value="{$option['item_option_id']}" />
                {/foreach}
                <button type="button" onclick="tt.cart.delete('#cart_{$item['item_id']}_{$item['item_option']}');" title="{$button_remove}" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button>
              </form>
            </td>
          </tr>
        {/foreach}
      </table>
    </li>
    <li>
      <div>
        <table class="table table-bordered">
          {foreach from=$totals item=total}
            <tr>
              <td class="text-right"><strong>{$total['title']}</strong></td>
              <td class="text-right">￥{$total['text']}</td>
            </tr>
          {/foreach}
        </table>
        <p class="text-right"><a href="{$cart}"><strong><i class="fa fa-shopping-cart"></i> {$text_cart}</strong></a>&nbsp;&nbsp;&nbsp;<a href="{$checkout}"><strong><i class="fa fa-share"></i> {$text_checkout}</strong></a></p>
      </div>
    </li>
    {else}
      <li>
        <p class="text-center">{$text_empty}</p>
      </li>
    {/if}
  </ul>
</div>
<script type="text/javascript">
  tt.cart();
</script>
