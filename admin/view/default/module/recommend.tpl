{$header}
<div id="content">
  <div class="breadcrumb">
  </div>
  {if $errors['warning']}
    <div class="warning">{$errors['warning']}</div>
  {/if}
  <div class="box">
    <div class="heading">
      <h1><img src="{$smarty.const.ADMIN_IMAGE}banner.png" alt="" />{$heading_title}</h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="btn btn-small btn-primary">{$button_save}</a>
        <a href="javascript:void(0);" onclick="tt.back()" class="btn btn-small btn-primary">{$button_cancel}</a>
      </div>
    </div>
    <div class="content">
      <form action="{$action}" method="post" enctype="multipart/form-data" id="form">
        <table id="recommend" class="list">
          <thead>
            <tr>
              <td class="left">{$entry_title}</td>
              <td class="left">{$entry_option}</td>
              <td class="left">{$entry_template}</td>
              <td class="left" style="width: 80px">{$entry_limit}</td>
              <td class="left" style="width: 80px">{$entry_width}</td>
              <td class="left" style="width: 80px">{$entry_heigth}</td>
              <td></td>
            </tr>
          </thead>
          {assign var=recommend_row value=0}
          {foreach from=$recommend_modules key=index item=module}
          <tbody id="recommend-row{$recommend_row}">
            <tr>
              <td class="left">
                <input type="hidden" name="recommend_modules[{$recommend_row}][code]" value="{$module['code']}">
                <input type="text" class="w90" name="recommend_modules[{$recommend_row}][title]" value="{$module['title']}">
                <span class="error block">{$errors['recommend'][$index]['title']}</span>
              </td>
              <td class="left">
                {foreach from=$options item=option key=kw}
                  <input type="checkbox" name="recommend_modules[{$recommend_row}][options][]" value="{$kw}" {if in_array($kw,$module['options'])}checked{/if} />{$option}
                {/foreach}
                <span class="error block">{$errors['recommend'][$index]['option']}</span>
              </td>
              <td class="left">
                <select name="recommend_modules[{$recommend_row}][template_id]" class="w90">
                  <option value="">--选择模板--</option>
                  {foreach from=$templates item=template key=template_id}
                    <option value="{$template_id}" {if $template_id==$module['template_id']}selected{/if}>{$template}</option>
                  {/foreach}
                </select>
                <span class="error block">{$errors['recommend'][$index]['template']}</span>
              </td>
              <td class="left">
                <input class="w90" type="text" name="recommend_modules[{$recommend_row}][limit]" value="{$module['limit']}" />
                <span class="error block">{$errors['recommend'][$index]['limit']}</span>
              </td>
              <td class="left">
                <input class="w90" type="text" name="recommend_modules[{$recommend_row}][width]" value="{$module['width']}" />
              </td>
              <td class="left">
                <input class="w90" type="text" name="recommend_modules[{$recommend_row}][height]" value="{$module['height']}" />
              </td>
              <td class="left">
                <a onclick="$('#recommend-row{$recommend_row}').remove();" class="btn btn-small btn-danger">{$button_remove}</a>
              </td>
            </tr>
          </tbody>
          {assign var=recommend_row value=$recommend_row+1}
          {/foreach}
          <tfoot>
            <tr>
              <td colspan="6"></td>
              <td class="left"><a onclick="addModule();" class="btn btn-small btn-success">{$button_add_module}</a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  var recommend_row = {$recommend_row};
  function addModule() {
    html  = '<tbody id="recommend-row' + recommend_row + '">';
    html += '<tr>';
    html += '<td class="left"><input class="w90" type="text" name="recommend_modules[' + recommend_row + '][title]" value=""></td>';
    html += '<td class="left">';
    {foreach from=$options item=option key=kw}
      html += '<input type="checkbox" name="recommend_modules[{$recommend_row}][options][]" value="{$kw}"  />{$option} ';
    {/foreach}
    html += '</td>';
    html += '<td>';
    html += '<select name="recommend_modules[' + recommend_row + '][template_id]" class="w90">';
    html += '<option value="">--选择模板--</option>';
    {foreach from=$templates item=template key=template_id}
      html += '<option value="{$template_id}">{$template}</option>';
    {/foreach}
    html += '</select>';
    html += '</td>';
    html += '<td><input class="w90" type="text" name="recommend_modules[' + recommend_row + '][limit]" value=""></td>';
    html += '<td class="left"><input class="w90" type="text" name="recommend_modules[' + recommend_row + '][width]" value=""></td>';
    html += '<td class="left"><input class="w90" type="text" name="recommend_modules[' + recommend_row + '][height]" value="" /></td>';
    html += '<td class="left"><a onclick="$(\'#recommend-row' + recommend_row  + '\').remove();" class="btn btn-small btn-danger">{$button_remove}</a></td>';
    html += '</tr>';
    html += '</tbody>'; 
  
    $('#recommend tfoot').before(html);
  
    recommend_row++;
  }
//--></script>
{$footer}