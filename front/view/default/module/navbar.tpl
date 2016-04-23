<nav id="menu" class="navbar">
  <div class="navbar-header"><span id="category" class="visible-xs">{$text_category}</span>
    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
  </div>
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      {foreach from=$navbars item=bar}
        {if $bar['children']}
          <li class="dropdown">
            <a href="{$bar['link']}" class="dropdown-toggle" data-toggle="dropdown">{$bar['parent']['name']}</a>
            <div class="dropdown-menu">
              <div class="dropdown-inner">
                <ul class="list-unstyled">
                  {foreach from=$bar['children'] item=child}
                    <li><a href="{$child['link']}">{$child['name']}</a></li>
                  {/foreach}
                </ul>
              </div>
            </div>
          </li>
        {else}
          <li><a href="{$bar['parent']['link']}">{$bar['parent']['name']}</a></li>
        {/if}
      {/foreach}
    </ul>
  </div>
</nav>