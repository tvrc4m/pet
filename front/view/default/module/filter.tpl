<div class="panel panel-default">
  <div class="panel-heading">{$heading_title}</div>
  <div class="list-group">
    {foreach from=$filter_groups item=filter_group}
    <a class="list-group-item">{$filter_group['name']}</a>
    <div class="list-group-item">
      <div id="filter-group{$filter_group['filter_group_id']}">
        {foreach from=$filter_group['filter'] item=filter}
        <div class="checkbox">
          <label>
            {if in_array($filter['filter_id'], $filter_category}
            <input type="checkbox" name="filter[]" value="{$filter['filter_id']}" checked="checked" />
            {$filter['name']}
            <?php } else { ?>
            <input type="checkbox" name="filter[]" value="{$filter['filter_id']}" />
            {$filter['name']}
            <?php } ?>
          </label>
        </div>
        <?php } ?>
      </div>
    </div>
    <?php } ?>
  </div>
  <div class="panel-footer text-right">
    <button type="button" id="button-filter" class="btn btn-primary">{$button_filter}</button>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	filter = [];

	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});

	location = '{$action}&filter=' + filter.join(',');
});
//--></script>
