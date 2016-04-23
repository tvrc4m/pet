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
                    <div id="messages_product_view">
                    </div>
                    <div class="product-view sns-product-detail">
                        <div class="product-essential clearfix">
                            <div class="row row-img">
                                <div class="product-img-box col-md-5 col-sm-5">
                                    <div id="sns_product_img_media" class="sns_product_img">
                                        <div class="product-image-zoom">
                                            <div class="zoomWrapper">
                                                <img id="zoom_img_media" class="max-max:460px;" src="{$item['image']}" alt="{$item['title']}" title="{$item['title']}" />
                                            </div>
                                        </div>
                                        <div class="more-views clearfix">
                                            <div class="gallery gallery_img" id="gallery_img_media">
                                                {assign var=image_count value=count($images)}
                                                {foreach from=$images item=image}
                                                    <div class="item-img">
                                                        <a data-zoom-image="{$image['url']}" data-image="{$image['url']}" href="javascript:void(0);" onclick="tt.zoom(this)" title="" class="elevatezoom-gallery" data-update>
                                                            <img src="{$image['url']}" alt="{$image['description']}" title="{$item['description']}" />
                                                        </a>
                                                    </div>
                                                {/foreach}
                                            </div>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                        jQuery(document).ready(function($) {
                                            if (window.location == window.parent.location) {
                                                jQuery("#sns_product_img_media #zoom_img_media").on("click",
                                                function(e) {
                                                    var ez = jQuery('#sns_product_img_media #zoom_img_media').data('elevateZoom');
                                                    jQuery.fancybox(ez.getGalleryList());
                                                    return false;
                                                });
                                            }
                                            {if $image_count>4}
                                            jQuery('#gallery_img_media').owlCarousel({
                                                nav: true,
                                                slideSpeed: 500,
                                                dots: false,
                                                addClassActive: true,
                                                lazyLoad:true,
                                                responsive: {
                                                    480 : {
                                                        items: 4
                                                    }
                                                },
                                                loop: true,
                                                navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>']
                                            });
                                            {else}
                                                jQuery('#gallery_img_media').owlCarousel({
                                                nav: true,
                                                slideSpeed: 500,
                                                dots: false,
                                                addClassActive: true,
                                                lazyLoad:true,
                                                responsive: {
                                                    480 : {
                                                        items: 4
                                                    }
                                                },
                                                loop: true,
                                            });
                                            {/if}
                                        });
                                    </script>
                                </div>
                                <div id="product_shop" class="product-shop col-md-7 col-sm-7">
                                    <form action="" method="post" id="product_addtocart_form">
                                        <div class="no-display">
                                            <input type="hidden" name="items[0][item_id]" value="{$item['item_id']}" />
                                        </div>
                                        <div class="product-name">{$item['title']}</div>
                                        <p class="no-rating">{$item['short_desc']}</p>
                                        <div class="price-box">
                                            <b>价格：</b>
                                            <span class="regular-price" id="product-price-38">
                                                <span class="price">￥{$item['price']}</span>
                                            </span>
                                        </div>
                                        <p class="availability in-stock">
                                            <span>有货</span>
                                        </p>
                                        {if $options}
                                            <div>
                                                <b>选项：</b>
                                                <select name="items[0][options][]">
                                                    {foreach from=$options item=option}
                                                        <option value="{$option['item_option_id']}">{$option['name']}</option>
                                                    {/foreach}
                                                </select>
                                            </div>
                                        {/if}
                                        <div class="add-to-box">
                                            <div class="add-to-cart">
                                                <b>数量：</b>
                                                <div class="qty-container">
                                                    <button type="button" class="qty-decrease" onclick="var qty_el = document.getElementById('qty'); var qty = qty_el.value; if( !isNaN( qty ) &amp;&amp; qty > 1 ) qty_el.value--;return false;">
                                                    </button>
                                                    <input type="text" name="items[0][quantity]" id="qty" value="1" title="Qty" class="input-text qty">
                                                    <button type="button" class="qty-increase" onclick="var qty_el = document.getElementById('qty'); var qty = qty_el.value; if( !isNaN( qty )) qty_el.value++;return false;">
                                                    </button>
                                                </div>
                                            </div>
                                            <a href="javascript:void(0);" onclick="tt.cart.add('#product_addtocart_form')" class="btn btn-success">
                                                <i class="fa fa-shopping-cart"></i>
                                                添加购物车
                                            </a>
                                            <a href="javascript:void(0);" onclick="tt.buy('#product_addtocart_form')" class="btn btn-danger">
                                                <i class="fa fa-plus"></i>
                                                购买
                                            </a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="product-tab">
                                        <div id="sns_tab_products" class="product-collateral clearfix">
                                            <ul class="nav-tabs gfont">
                                                <li class="active">
                                                    <a data-toggle="tab" href="#sns_tab_description">商品详情</a>
                                                </li>
                                                <li class="">
                                                    <a data-toggle="tab" href="#sns_tab_tags">购买评价</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="sns_tab_description" class="tab-pane active">
                                                    <div class="collateral-box">
                                                        <!--<h2></h2>-->
                                                            {$item['description']}
                                                    </div>
                                                </div>
                                                <div id="sns_tab_tags" class="tab-pane fade">
                                                    <div class="collateral-box">
                                                        <div class="box-collateral box-tags">
                                                            <h2>
                                                                Product Tags
                                                            </h2>
                                                            <h3>
                                                                Other people marked this product with these tags:
                                                            </h3>
                                                            <ul id="product-tags_dcd77edb63495aabeaf130f2b9202014" class="product-tags">
                                                                <li class="first last">
                                                                    <a href="">Design</a>
                                                                    (1)
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                        $(document).ready(function(){
                                            $('#sns_tab_products .nav-tabs').tabdrop();
                                        })
                                    </script>
                                    {$content_bottom}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {$column_right}
        </div>
    </div>
</div>
{$footer}