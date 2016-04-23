<div class="product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="product-thumb">
            <div class="image">
              <a href="/vendor/item/{$item['item_id']}.html">
                <img src="{$item['image']}" style="width: 180;height: 230px;" alt="{$item['title']}" title="{$item['title']}" class="img-responsive" />
              </a>
            </div>
            <div>
              <div class="caption">
                <h4><a href="/vendor/item/{$item['item_id']}.html" target="_blank">{$item['title']}</a></h4>
                <p>{$item['short_desc']}</p>
                <p class="price">
                  {if !$item['special']}
                    ￥{$item['price']}
                  {else}
                    <span class="price-new">{$item['special']}</span> <span class="price-old">{$item['price']}</span>
                  {/if}
                </p>
                <span id='buy_btn' style="float: right;margin-top: -50px;display: none">
                  <a href="/vendor/item/{$item['item_id']}.html" class="btn btn-success">去购买</a>
                </span>
              </div>
            </div>
          </div>
        </div>