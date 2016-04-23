{if $modules}
<column id="column-right" class="col-sm-3 hidden-xs">
  {foreach from=$modules key=code item=module}
    {foreach from=$module item=content}
		{$content}
	{/foreach}
  {/foreach}
</column>
{/if}