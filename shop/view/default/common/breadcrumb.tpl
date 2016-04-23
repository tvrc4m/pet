<ul class="breadcrumbs">
    {assign var=count value=count($breadcrumbs)}
    {foreach from=$breadcrumbs key=index item=breadcrumb}
        <li class="home">
            {if $breadcrumb['link']}
                <a href="{$breadcrumb['link']}" title="{$breadcrumb['title']}">{$breadcrumb['title']}</a>
            {else}
                {$breadcrumb['title']}
            {/if}
        </li>
        {if $count!=$index+1}
            <span>></span>
        {/if}
    {/foreach}
</ul>