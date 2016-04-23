<html xml:lang="en" lang="en" class="js no-touch localstorage no-ios">
    <head>
        <title>{$pTitle}</title>
        <meta name="description" content="Default Description">
        <meta name="keywords" content="Magento, Varien, E-commerce">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/static/shop/css/style.css" />
        <link rel="stylesheet" type="text/css" href="/static/default/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="/static/default/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="/static/shop/css/animate.css" />
        <link rel="stylesheet" type="text/css" href="/static/default/owl-carousel/owl.carousel.css" />
        <link rel="stylesheet" type="text/css" href="/static/default/owl-carousel/owl.transitions.css" />
        <link rel="stylesheet" type="text/css" href="/static/default/fancybox/jquery.fancybox.css" />
        <link rel="stylesheet" type="text/css" href="/static/shop/css/jquery.miniColors.css" />
        <link rel="stylesheet" type="text/css" href="/static/shop/css/theme-fe7522.css" />
        {foreach from=$pCss item=css}
            <link rel="stylesheet" type="text/css" href="{$css}" />
        {/foreach}
        <script type="text/javascript" src="/static/default/js/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="/static/default/owl-carousel/owl.carousel.min.js"></script>
        <script type="text/javascript" src="/static/default/js/jquery.cookie.min.js"></script>
        <script type="text/javascript" src="/static/default/fancybox/jquery.fancybox.pack.js"></script>
        <script type="text/javascript" src="/static/default/js/global.js"></script>
        <script type="text/javascript" src="/static/shop/js/shop.js"></script>
        {foreach from=$pJs item=js}
            <script type="text/javascript" src="{$js}"></script>
        {/foreach}
        <script type="text/javascript">
            var ENCODEDURL='';
        </script>
    </head>
    
    <body id="bd" class=" cms-index-index cms-avaz-home-page boxed-layout pattern_10 chrome default cmspage">
        <div id="sns_wrapper">
            <div id="header-top" class="wrap">
                <div class="container">
                    <div class="welcome pull-left col-sm-5 col-xs-5">
                        <p class="welcome-msg"><span class="msg">Welcome to {$nick}! </span></p>       </div>
                    <div class="top-links pull-right col-sm-7 col-xs-7">
                        <div class="myaccount">         
                            <div class="content">
                               <ul class="links">
                                    {if $logged}
                                        <li class="first">
                                            <a href="{$account}" title="个人中心" class="top-link-myaccount">个人中心</a>
                                        </li>
                                        <!-- <li>
                                            <a href="" title="收藏夹" class="top-link-wishlist">收藏夹</a>
                                        </li> -->
                                    {/if}
                                    <li>
                                        <a href="{$shopping_cart}" title="购物车" class="top-link-cart">购物车{if $cart_count}({$cart_count}){/if}</a>
                                    </li>
                                    {if !$logged}
                                        <li class=" last">
                                            <a  href="javascript:void(0)" onclick="tt.popup.login()" title="登录" class="top-link-login">登录</a>
                                        </li>
                                        <li class=" last">
                                            <a href="javascript:void(0)" onclick="tt.popup.register()" title="注册" class="top-link-myaccount">注册</a>
                                        </li>
                                    {/if}
                                </ul>
                            </div>              
                        </div>
                    </div>

                </div>
            </div>
            <div id="sns_menu" class="wrap">
                <div id="sns_header" class="wrap header1">
                    <div class="container">
                        <div class="row">
                            <div class="header-col-left col-sm-4 col-xs-4">
                                <div class="logo">
                                    <h1 id="logo">
                                        <a title="{$site}" href="#">
                                            <img src="" alt="PET">
                                        </a>
                                    </h1>
                                </div>
                                <div class="icon-menu">
                                    <span class="line line-1">
                                    </span>
                                    <span class="line line-2">
                                    </span>
                                    <span class="line line-3">
                                    </span>
                                    <span class="line line-4">
                                    </span>
                                    <span class="line line-5">
                                    </span>
                                    <span class="line line-6">
                                    </span>
                                </div>
                            </div>
                            <div class="search-header col-sm-4 col-xs-4">
                                {$search}
                            </div>
                            <!-- <div class="header-col-right col-sm-4 col-xs-4">
                                <div class="header-tools ">
                                    <div class="myaccount">
                                        <div class="tongle">
                                            <i class="fa fa-user">
                                            </i>
                                        </div>
                                    </div>
                                    <div class="mycart mini-cart ">
                                        <div class="tongle" title="View my shopping cart">
                                            <i class="fa fa-shopping-cart"></i>
                                        </div>
                                        <div class="content">
                                           {$cart}
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
                {$navbar}
            </div>