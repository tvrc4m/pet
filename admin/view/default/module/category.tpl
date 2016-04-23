{$header}
<div id="content">
  <div class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
       {$breadcrumb['separator']}<a href="{$breadcrumb['href']}">{$breadcrumb['text']}</a>
    {/foreach}
  </div>
  {if $errors['warning']}
    <div class="warning">{$langs[$errors['warning']]}</div>
  {/if}
  <div class="box">
    <div class="heading">
      <h1><img src="{$smarty.const.ADMIN_IMAGE}setting.png" alt="" /> {$heading_title}</h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="btn btn-small btn-primary">{$button_save}</a>
        <a href="javascript:void(0);" onclick="tt.back()" class="btn btn-small btn-primary">{$button_cancel}</a>
      </div>
    </div>
    <div class="content">
      <form action="{$action}" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
            <table class="form">
                <tr>
                  <td>{$entry_enable}</td>
                  <td>
                    <input type="checkbox" name="config_category_status" value="1" {if $config_category_status}checked{/if} />
                  </td>
                </tr>
            </table>
        </div>
      </form>
    </div>
  </div>
</div>
{literal}
<script type="text/javascript">
  $('.htabs a').tabs();
</script>
{/literal}
{$footer}