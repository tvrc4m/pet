{$header}
<div id="sns_breadcrumbs" class="wrap">
    <div class="container">
      <div class="row">
        <div id="sns_pathway" class="clearfix">
            <div class="pathway-inner">
                {include file="common/breadcrumb.tpl"}
            </div>
        </div>
      </div>
    </div>
</div>
<div id="sns_content" class="wrap layout-m">
    <div class="container">
        <div class="row">
            {$column_left}
            <div id="sns_main" class="{$main_class} col-main">
              <div id="sns_mainmidle">
                  <div class="page-title category-title">
                      <h1>
                          T-shirts
                      </h1>
                  </div>
                  <div class="category-products">
                      <div class="toolbar clearfix">
                          <div class="toolbar-inner">
                             
                          </div>
                      </div>
                      <div class="sns-products-container clearfix">
                          <div class="products-grid row">
                              {foreach from=$items item=item}
                                <div class="item col-lg-4 col-md-4 col-sm-4 col-xs-6 col-phone-12">
                                    <div class="item-inner">
                                        <div class="prd">
                                            <div class="item-img clearfix">
                                                <a href="{$item['link']}" title="{$item['title']}" class="product-image have-additional">
                                                    <span class="img-main">
                                                        <img style="width: 360px;height: 290px;" src="{$item['image']}" alt="{$item['title']}" />
                                                    </span>
                                                </a>
                                            </div>
                                            <div class="item-info">
                                                <div class="info-inner">
                                                    <div class="item-title">
                                                        <a href="{$item['link']}" title="{$item['title']}">{$item['title']}</a>
                                                    </div>
                                                    <div class="item-price">
                                                        <div class="price-box">
                                                            <span class="regular-price" id="product-price-2918310095611437824571">
                                                                <span class="price">
                                                                    ￥{$item['price']}
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              {/foreach}
                              
                              <div class="clearfix visible-xs">
                              </div>
                              
                          </div>
                      </div>
                      <div class="toolbar-bottom clearfix">
                          <div class="toolbar clearfix">
                              <div class="toolbar-inner">
                                  <p class="view-mode">
                                      <label>
                                          View as
                                      </label>
                                      <strong title="Grid" class="icon-grid">
                                      </strong>
                                      <a href="http://demo.snstheme.com/sns-avaz/index.php/tops/t-shirts.html?mode=list"
                                      title="List" class="icon-list">
                                      </a>
                                  </p>
                                  <div class="sort-by">
                                      <label>
                                          Sort By
                                      </label>
                                      <div class="select-new">
                                          <div class="select-inner jqtransformdone">
                                              <div class="jqTransformSelectWrapper" style="z-index: 10; width: 80px;">
                                                  <div>
                                                      <span style="width: 50px;">
                                                          Position
                                                      </span>
                                                      <a href="#" class="jqTransformSelectOpen">
                                                      </a>
                                                  </div>
                                                  <ul style="width: 78px; display: none; visibility: visible;">
                                                      <li>
                                                          <a href="#" index="0" class="selected">
                                                              Position
                                                          </a>
                                                      </li>
                                                      <li>
                                                          <a href="#" index="1">
                                                              Name
                                                          </a>
                                                      </li>
                                                      <li>
                                                          <a href="#" index="2">
                                                              Price
                                                          </a>
                                                      </li>
                                                  </ul>
                                                  <select class="select-sort-by jqTransformHidden" onchange="setLocation(this.value)">
                                                      <option value="http://demo.snstheme.com/sns-avaz/index.php/tops/t-shirts.html?dir=asc&amp;mode=grid&amp;order=position"
                                                      selected="selected">
                                                          Position
                                                      </option>
                                                      <option value="http://demo.snstheme.com/sns-avaz/index.php/tops/t-shirts.html?dir=asc&amp;mode=grid&amp;order=name">
                                                          Name
                                                      </option>
                                                      <option value="http://demo.snstheme.com/sns-avaz/index.php/tops/t-shirts.html?dir=asc&amp;mode=grid&amp;order=price">
                                                          Price
                                                      </option>
                                                  </select>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="limiter">
                                      <label>
                                          Show
                                      </label>
                                      <div class="select-new">
                                          <div class="select-inner jqtransformdone">
                                              <div class="jqTransformSelectWrapper" style="z-index: 10; width: 80px;">
                                                  <div>
                                                      <span style="width: 50px;">
                                                          15
                                                      </span>
                                                      <a href="#" class="jqTransformSelectOpen">
                                                      </a>
                                                  </div>
                                                  <ul style="width: 78px; display: none; visibility: visible;">
                                                      <li>
                                                          <a href="#" index="0" class="selected">
                                                              15
                                                          </a>
                                                      </li>
                                                      <li>
                                                          <a href="#" index="1">
                                                              27
                                                          </a>
                                                      </li>
                                                      <li>
                                                          <a href="#" index="2">
                                                              39
                                                          </a>
                                                      </li>
                                                  </ul>
                                                  <select class="select-limit-show jqTransformHidden" onchange="setLocation(this.value)">
                                                      <option value="http://demo.snstheme.com/sns-avaz/index.php/tops/t-shirts.html?limit=15&amp;mode=grid"
                                                      selected="selected">
                                                          15
                                                      </option>
                                                      <option value="http://demo.snstheme.com/sns-avaz/index.php/tops/t-shirts.html?limit=27&amp;mode=grid">
                                                          27
                                                      </option>
                                                      <option value="http://demo.snstheme.com/sns-avaz/index.php/tops/t-shirts.html?limit=39&amp;mode=grid">
                                                          39
                                                      </option>
                                                  </select>
                                              </div>
                                          </div>
                                      </div>
                                      <span>
                                          per page
                                      </span>
                                  </div>
                                  <div class="pager">
                                      <p class="amount">
                                          13 Item(s)
                                      </p>
                                  </div>
                              </div>
                          </div>
                          <script type="text/javascript">
                              jQuery(function($) {
                                  // Transforming the form's Select control using jqTransform Plugin.
                                  $(".toolbar .limiter .select-new .select-inner").jqTransform();
                                  $(".toolbar .sort-by .select-new .select-inner").jqTransform();
                              });
                          </script>
                      </div>
                      <script type="text/javascript">
                          //<![CDATA[
                          jQuery(function($) {
                              //jQuery(document).ready(function($){
                              $('.jqTransformSelectWrapper ul li a').on('click',
                              function(e) {
                                  var i = $(this).attr('index'); //alert(i);
                                  var wrap_ = $(this).parents('.jqTransformSelectWrapper'); //alert($(wrap_).html());
                                  j = 0;
                                  $(wrap_).find('option').each(function() {
                                      if (j == i) {
                                          ajaxFilter($(this).attr('value'));
                                      }
                                      j++;
                                  });
                                  e.preventDefault();
                              });
                          });
                          //]]>
                          
                      </script>
                  </div>
              </div>
          </div>
            {$column_right}
        </div>
    </div>
</div>
{$footer}