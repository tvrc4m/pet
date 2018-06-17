{top}
<!DOCTYPE html>
<html>
  <head>
    <title>{$pTitle}</title>
    <meta name="description" content="{$description}" />
    <meta name="keywords" content="{$keywords}" />
    <link rel="stylesheet" type="text/css" href="/static/admin/css/admin.css" />
    <link rel="stylesheet" type="text/css" href="/static/default/js/nprogress/nprogress.css" />
    <link rel="stylesheet" type="text/css" href="/static/bootstrap/js/font-awesome/css/font-awesome.min.css" />
    <script type="text/javascript" src="/static/default/js/jquery/jquery-2.2.2.js"></script>
    <script type="text/javascript" src="/static/default/js/jquery.pjax.js"></script>
    <script type="text/javascript" src="/static/default/js/nprogress/nprogress.js"></script>
    <script type="text/javascript" src="/static/default/js/global.js"></script>
    <script type="text/javascript" src="/static/admin/js/tabs.js"></script>
    <script type="text/javascript" src="/static/admin/js/common.js"></script>
  </head>
  <body>
  <div id="container">
    <div id="header">
      <div class="div1">
        <div class="div2">
          <img src="/static/admin/image/logo.png" title="{$heading_title}" onclick="" />
        </div>
        {if $smarty.session.LOGGED AND $smarty.session.ADMIN}
          <div class="div3"><img src="/static/admin/image/lock.png" alt="" style="position: relative"></div>
        {/if}
      </div>
      {if $smarty.session.LOGGED AND $smarty.session.ADMIN}
      <div id="menu">
        <ul class="left" style="">
          {* <li id="dashboard" class="{$selected['common']}"><a href="{$link['home']}" class="top">{$text_dashboard}</a></li> *}
          <li id="product" class="{$selected['product']}">
            <a class="top">{$text_product}</a>
            <ul class="hidden">
              <li><a href="{$link['item']}">{$text_item}</a></li>
              <li><a href="{$link['item_cat']}">{$text_cat}</a></li>
              <li><a href="{$link['item_attr_group']}">{$text_attr_group}</a></li>
              <li><a href="{$link['item_attr']}">{$text_attr}</a></li>
            </ul>
          </li>
          <!-- <li id="order" class="{$selected['sale']}">
            <a class="top">{$text_order}</a>
            <ul class="hidden">
              <li><a href="{$link['order']}">{$text_order}</a></li>
              <li><a href="{$link['order_status']}">{$text_order_status}</a></li>
            </ul>
          </li>
          <li id="vendor" class="{$selected['vendor']}">
            <a class="top" href="javascript:void(0);">{$text_vendor}</a>
            <ul class="hidden">
              <li><a href="{$link['vendor']}">{$text_vendor_list}</a></li>
              <li><a href="{$link['vendor_deposit']}">{$text_vendor_deposit}</a></li>
            </ul>
          </li> -->
          <li id="extension" class="{$selected['extension']}">
            <a class="top">{$text_extension}</a>
            <ul class="hidden">
              <li><a href="{$link['module']}">{$text_module}</a></li>
              <li><a href="{$link['layout']}">{$text_layout}</a></li>
              <li><a href="{$link['banner']}">{$text_banner}</a></li>
              <li><a href="{$link['feature']}">{$text_feature}</a></li>
              <li><a href="{$link['template']}">{$text_template}</a></li>
              <!-- <li><a href="{$link['style']}">{$text_style}</a></li> -->
            </ul>
          </li>
          <li id="system" class="{$selected['setting']}">
            <a class="top">{$text_system}</a>
            <ul class="hidden">
              <li><a href="{$link['setting']}">{$text_setting}</a></li>
            </ul>
          </li>
        </ul>
        <ul class="right" style="display: none;">
          <li><a class="top" href="{$link['logout']}">{$text_logout}</a></li>
        </ul>
      </div>
      {/if}
    </div>
{literal}
  <script type="text/javascript">
    $(document).ready(function() {
      $(document).on('click mouseover','#menu ul li',function(){
        var that=$(this);
        $(that).children("ul").removeClass('hidden');
        $(that).siblings().children("ul").addClass('hidden');
      })
      $(document).on('click mouseout','*:not(#menu li)',function(){
        $('#menu ul li ul').addClass('hidden');
      })
      $('#menu > ul').css('display', 'block');
    });
  </script>
{/literal}
{/top}