<div class="block-categories-nav">
    <h4 class="title">
        <span>
            选项
        </span>
    </h4>
    <div class="content">
        <ul id="sns_sidenav" class="nav_accordion">
            <li class="level0 nav-1 parent">
                <div class="accr_header">
                    <a href="http://demo.snstheme.com/sns-avaz/index.php/tops.html">
                        <i class="fa fa-gift fa">
                        </i>
                        <span>
                            最新
                        </span>
                    </a>
                    <span class="btn_accor">
                        <a class="open">
                            <i class="fa fa-caret-down">
                            </i>
                        </a>
                    </span>
                </div>

                <div class="accr_content" style="display: none;">
                    <ul class="level0">
                        <li class="level1 nav-1-1 first">
                            <div class="accr_header">
                                <a href="http://demo.snstheme.com/sns-avaz/index.php/tops/t-shirts.html">
                                    <span>
                                        T-shirts
                                    </span>
                                </a>
                            </div>
                        </li>
                        <li class="level1 nav-1-2">
                            <div class="accr_header">
                                <a href="http://demo.snstheme.com/sns-avaz/index.php/tops/tops.html">
                                    <span>
                                        Tops
                                    </span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </li>
            {foreach from=$cats item=cat}
            <li class="level0 nav-2 {if $cat['children']}parent{/if}">
                <div class="accr_header">
                    <a href="{$cat['link']}" title="{$cat['name']}">
                        <i class="fa fa-male fa"></i>
                        <span>{$cat['name']}</span>
                    </a>
                    {if $cat['children']}
                        <span class="btn_accor">
                            <a class="open">
                                <i class="fa fa-caret-down">
                                </i>
                            </a>
                        </span>
                    {/if}
                </div>
                {if $cat['children']}
                    <div class="accr_content" style="display: none;">
                        <ul class="level0">
                            {foreach from=$cat['children'] item=child}
                                <li class="level1 nav-1-1 first">
                                    <div class="accr_header">
                                        <a href="{$child['link']}">
                                            <span>{$child['name']}</span>
                                        </a>
                                    </div>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                {/if}
            </li>
            {/foreach}
        </ul>
    </div>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $('.block-categories-nav .title').on('click',
            function() {
                if ($(this).hasClass('active')) {
                    $(this).removeClass('active');
                    $(this).find('[class*="fa-caret-"]').removeClass('fa-caret-up').addClass('fa-caret-down');
                    $('.block-categories-nav .content').stop(true, true).slideUp("400");
                } else {
                    $(this).addClass('active');
                    $(this).find('[class*="fa-caret-"]').removeClass('fa-caret-down').addClass('fa-caret-up');
                    $('.block-categories-nav .content').stop(true, true).slideDown("400");
                }
            });
        });
    </script>
</div>