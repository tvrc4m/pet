<h3>{$heading_title}</h3>
<div class="row">
  {foreach from=$products item=product}
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="{$product['href']}"><img src="{$product['thumb']}" alt="{$product['name']}" title="{$product['name']}" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a href="{$product['href']}">{$product['name']}</a></h4>
        <p>{$product['description']}</p>
        {if $product['rating']}
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          {if $product['rating'] < $i}
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
        {if $product['price']}
        <p class="price">
          {if !$product['special']}
          {$product['price']}
          <?php } else { ?>
          <span class="price-new">{$product['special']}</span> <span class="price-old">{$product['price']}</span>
          <?php } ?>
          {if $product['tax']}
          <span class="price-tax">{$text_tax} {$product['tax']}</span>
          <?php } ?>
        </p>
        <?php } ?>
      </div>
      <div class="button-group">
        <button type="button" onclick="cart.add('{$product['product_id']}');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md">{$button_cart}</span></button>
        <button type="button" data-toggle="tooltip" title="{$button_wishlist}" onclick="wishlist.add('{$product['product_id']}');"><i class="fa fa-heart"></i></button>
        <button type="button" data-toggle="tooltip" title="{$button_compare}" onclick="compare.add('{$product['product_id']}');"><i class="fa fa-exchange"></i></button>
      </div>
    </div>
  </div>
  <?php } ?>
</div>
