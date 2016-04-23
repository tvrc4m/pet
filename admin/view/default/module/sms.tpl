{$header}
<div id="content">
  <div class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
       {$breadcrumb['separator']}<a href="{$breadcrumb['href']}">{$breadcrumb['text']}</a>
    {/foreach}
  </div>
  {if $errors['warning']}
    <div class="warning">{$errors['warning']}</div>
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
      <div id="tabs" class="htabs">
        <a href="#tab-general">{$tab_general}</a>
      </div>
      <form action="{$action}" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <table class="form">
              <tr>
                <td>{$entry_site}</td>
                <td>
                  <a href="http://www.sms.cn" target="_blank">http://www.sms.cn</a>
                </td>
              </tr>
              <tr>
                <td>{$entry_account}</td>
                <td>
                  <input class="w500" type="text" name="config_sms_account" value="{$config_sms_account}" />
                  <span class="error">{$errors['account']}</span>
                </td>
              </tr>
              <tr>
                <td>{$entry_password}</td>
                <td>
                  <input class="w500" type="text" name="config_sms_password" value="{$config_sms_password}" />
                  <span class="error">{$errors['token']}</span>
                </td>
              </tr>
              <tr>
                <td>{$text_status}</td>
                <td>
                  <select class="w100" name="config_sms_status">
                    {if $config_sms_status}
                      <option value="1" selected="selected">{$text_enabled}</option>
                      <option value="0">{$text_disabled}</option>
                    {else}
                      <option value="1">{$text_enabled}</option>
                      <option value="0" selected="selected">{$text_disabled}</option>
                    {/if}
                  </select>
                </td>
              </tr>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  
//--></script>
{$footer}