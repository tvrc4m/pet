<h3>{$feature['title']}</h3>
<div class="row">
  {foreach from=$feature['items'] item=item}
    <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
      <div class="product-thumb transition">
        <div class="image">
          <a href="{$item['link']}">
            <img src="{$item['image']}" style="{$style}" alt="{$item['title']}" title="{$item['title']}" class="img-responsive" />
          </a>
        </div>
        <div class="caption">
          <h4><a href="{$item['link']}">{$item['title']}</a></h4>
          <p>{$item['short_desc']}</p>
          {if $item['price']}
            <p class="price">
              {if !$item['special']}
                ￥{$item['price']}
              {else}
                <span class="price-new">{$item['special']}</span> <span class="price-old">￥{$item['price']}</span>
              {/if}
            </p>
          {/if}
        </div>
      </div>
    </div>
  {/foreach}
</div>
