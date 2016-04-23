{$header}
<div class="container">
  <div class="row">
    {$column_left}
    <div id="content" class="col-sm-12">
    {$content_top}
      <div class="row">
        <div class="col-sm-8">
          {if $item['image']}
            <ul class="thumbnails">
              <li>
                  <img src="{$item['image']}" class="w160" title="{$item['title']}" alt="{$item['title']}" />
              </li>
            </ul>
          {/if}
          <br />
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab">{$tab_description}</a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description">{$item['description']}</div>
          </div>
        </div>
        <div class="col-sm-4">
          <h1>{$item['title']}</h1>
          <ul class="list-unstyled">
            <?php if (!$special) { ?>
            <li>
              <h2>￥{$item['price']}</h2>
            </li>
            <?php } else { ?>
            <li><span style="text-decoration: line-through;">{$price}</span></li>
            <li>
              <h2>{$special}</h2>
            </li>
            <?php } ?>
          </ul>
          <div id="product">
            <form id="cartform">
              {if $options}
                <hr>
                <div class="form-group required">
                  <label class="control-label" for="input-option">选项</label>
                  <select name="items[0][options][]" id="input-option" class="form-control">
                    <option value="">{$text_select}</option>
                    {foreach from=$options item=option}
                      <option value="{$option['item_option_id']}">{$option['name']}
                    (￥{$option['price']})
                    </option>
                    {/foreach}
                  </select>
                </div>
                <span class="error error_options"></span>
              {/if}
              <div class="form-group">
                <label class="control-label" for="input-quantity">{$entry_qty}</label>
                <input type="text" name="items[0][quantity]" value="{$minimum}" size="2" id="input-quantity" class="form-control" />
                <input type="hidden" name="items[0][item_id]" value="{$item['item_id']}" />
                <span class="error error_quantity"></span>
                <br />
                <button type="button" onclick="tt.cart.add('#cartform')" data-loading-text="{$text_loading}" class="btn btn-primary btn-small">{$button_cart}</button>
                <button type="button" onclick="tt.buy('#cartform')" data-loading-text="{$text_loading}" class="btn btn-danger btn-small">{$button_buy}</button>
              </div>
              {if $item['$minimum']>1}
                <div class="alert alert-info"><i class="fa fa-info-circle"></i> {$text_minimum}</div>
              {/if}
            </form>
          </div>
        </div>
      </div>
      {if $products}
      <h3>{$text_related}</h3>
      <div class="row">
        <?php $i = 0; ?>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <div class="product-thumb transition">
            <div class="image"><a href="{$product['href']}"><img src="{$product['thumb']}" alt="{$product['name']}" title="{$product['name']}" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="{$product['href']}">{$product['name']}</a></h4>
              <p>{$product['description']}</p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                {$product['price']}
                <?php } else { ?>
                <span class="price-new">{$product['special']}</span> <span class="price-old">{$product['price']}</span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax">{$text_tax} {$product['tax']}</span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('{$product['product_id']}', '{$product['minimum']}');"><span class="hidden-xs hidden-sm hidden-md">{$button_cart}</span> <i class="fa fa-shopping-cart"></i></button>
            </div>
          </div>
        </div>
      </div>
      {/if} 
      {$content_bottom}
      </div>
    {$column_right}
  </div>
</div>
{$footer}