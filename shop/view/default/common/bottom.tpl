{foreach from=$modules key=code item=module}
	{foreach from=$module item=content}
		{$content}
	{/foreach}
{/foreach}