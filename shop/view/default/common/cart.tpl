<div class="block-minicart">
    <div class="block-inner">
      {if $carts}
        <ol id="cart-sidebar" class="mini-products-list">
          {foreach from=$carts item=item}
            <li class="item last odd">
                <a href="{$item['link']}" title="{$item['title']}" class="product-image">
                    <img style="width: 82;height: 106px" src="{$item['image']}" alt="{$item['title']}" />
                </a>
                <div class="product-details">
                    <a href="{$item['link']}" title="{$item['title']}" onclick="" class="btn-remove">
                    </a>
                    <p class="product-name">
                        <a href="{$item['link']}">{$item['title']}</a>
                    </p>
                    <span class="quantity-formated">
                        <span class="quantity">{$item['quantity']}</span>x
                    </span>
                    <span class="price">￥{$item['price']}</span>
                </div>
            </li>
          {/foreach}
        </ol>
        <div class="cart-prices">
            <span class="label">总价</span>
            <span class="price">￥{$item['total']}</span>
        </div>
      {/if}
      <div class="actions">
          <button type="button" title="View shopping cart" class="button gfont go-to-cart" onclick="">查看购物车</button>
          <button type="button" title="Checkout" class="button" onclick="">支付购买</button>
      </div>
    </div>
</div>
