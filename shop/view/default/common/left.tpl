{if $modules}
<div id="sns_left" class="col-md-3">
    <div class="wrap-in">
		{foreach from=$modules key=code item=module}
		    {foreach from=$module item=content}
				{$content}
			{/foreach}
		{/foreach}
    </div>
</div>
{/if}