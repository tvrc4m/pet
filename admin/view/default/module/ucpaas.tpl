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
        <a href="#tab-product">{$tab_template}</a>
      </div>
      <form action="{$action}" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <table class="form">
              <tr>
                <td>{$entry_account}</td>
                <td>
                  <input class="w500" type="text" name="config_ucpaas_account" value="{$config_ucpaas_account}" />
                  <span class="error">{$errors['account']}</span>
                </td>
              </tr>
              <tr>
                <td>{$entry_token}</td>
                <td>
                  <input class="w500" type="text" name="config_ucpaas_token" value="{$config_ucpaas_token}" />
                  <span class="error">{$errors['token']}</span>
                </td>
              </tr>
              <tr>
                <td>{$entry_appid}</td>
                <td>
                  <input class="w500" type="text" name="config_ucpaas_appid" value="{$config_ucpaas_appid}" />
                  <span class="error">{$errors['appid']}</span>
                </td>
              </tr>
              <tr>
                <td>{$text_status}</td>
                <td>
                  <select class="w100" name="config_ucpaas_status">
                    {if $config_ucpaas_status}
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
        <div id="tab-product">
          <table id='template' class="list">
              <tr>
                <td>模板名</td>
                <td>{$entry_temp_id}</td>
                <td></td>
              </tr>
              {assign var=temp_row value=0}
              {foreach from=$templates item=template key=index}
                <tbody id="type-row{$temp_row}">
                  <tr>
                    <td>
                      <input class="w90" type="text" name="templates[{$temp_row}][name]" value="{$template['name']}" />
                      <span class="error block">{$errors['templates'][$index]['name']}</span>
                    </td>
                    <td>
                      <input class="w90" type="text" name="templates[{$temp_row}][id]" value="{$template['id']}" />
                      <span class="error block">{$errors['templates'][$index]['id']}</span>
                    </td>
                    <td class="left">
                      <a onclick="$('#type-row{$temp_row}').remove();" class="btn btn-small btn-danger">{$button_remove}</a>
                    </td>
                  </tr>
                </tbody>
                {assign var=temp_row value=$temp_row+1}
              {/foreach}
              <tfoot>
                <tr>
                  <td colspan="2"></td>
                  <td class="left">
                    <a onclick="addType();" class="btn btn-small btn-success">{$button_add_template}</a>
                  </td>
                </tr>
              </tfoot>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  var temp_row = {$temp_row};
  function addType() {
    html  = '<tbody id="type-row' + temp_row + '">';
    html += '<tr>';
    html += '<td><input class="w90" type="text" name="templates[' + temp_row + '][name]" value=""></td>';
    html += '<td><input class="w90" type="text" name="templates[' + temp_row + '][id]" value=""></td>';
    html += '<td class="left"><a onclick="$(\'#type-row' + temp_row  + '\').remove();" class="btn btn-small btn-danger">{$button_remove}</a></td>';
    html += '</tr>';
    html += '</tbody>'; 
    $('#template tfoot').before(html);
    feature_row++;
  }
//--></script>
{$footer}