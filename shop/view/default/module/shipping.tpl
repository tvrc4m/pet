{assign var=shippping_count value=count($shippings)}
{if $shippping_count==4}
    {assign var=col_span value="col-sm-3"}
{elseif $shippping_count==3}
    {assign var=col_span value="col-sm-4"}
{elseif $shippping_count==2}
    {assign var=col_span value="col-sm-6"}
{/if}
<div class="container">
    <div class="shoppolicy mgb-40">
        <div class="row">
            {foreach from=$shippings item=shipping}
                <div class="{$col_span}">
                    <div class="item">
                        <div class="icon">
                            &nbsp;
                        </div>
                        <div class="info">
                            <div class="title">
                                {$shipping['title']}
                            </div>
                            <div class="content">
                                {$shipping['description']}
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</div>