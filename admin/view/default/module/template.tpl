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
        <table id="template" class="list">
          <thead>
            <tr>
              <td class="left">{$entry_title}</td>
              <td class="left">{$entry_template}</td>
              <td class="left">{$entry_width}</td>
              <td class="left">{$entry_heigth}</td>
              <td></td>
            </tr>
          </thead>
          {assign var=template_row value=0}
          {foreach from=$template_modules key=index item=module}
          <tbody id="template-row{$template_row}">
            <tr>
              <td class="left">
                <input type="hidden" name="template_modules[{$template_row}][code]" value="{$module['code']}">
                <input type="text" class="w90" name="template_modules[{$template_row}][title]" value="{$module['title']}">
                <span class="error block">{$errors['template'][$index]['title']}</span>
              </td>
              <td class="left">
                <select name="template_modules[{$template_row}][template_id]">
                  <option value="">--选择模板--</option>
                  {foreach from=$templates item=template}
                    <option value="{$template['template_id']}" {if $template['template_id']==$module['template_id']}selected{/if}>{$template['name']}</option>
                  {/foreach}
                </select>
                <span class="error block">{$errors['template'][$index]['template']}</span>
              </td>
              <td class="left">
                <input class="w90" type="text" name="template_modules[{$template_row}][width]" value="{$module['width']}" />
              </td>
              <td class="left">
                <input class="w90" type="text" name="template_modules[{$template_row}][height]" value="{$module['height']}" />
              </td>
              <td class="left">
                <a onclick="$('#template-row{$template_row}').remove();" class="btn btn-small btn-danger">{$button_remove}</a>
              </td>
            </tr>
          </tbody>
          {assign var=template_row value=$template_row+1}
          {/foreach}
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addModule();" class="btn btn-small btn-success">{$button_add_module}</a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  var template_row = {$template_row};
  function addModule() {
    html  = '<tbody id="template-row' + template_row + '">';
    html += '<tr>';
    html += '<td><input class="w90" type="text" name="template_modules[' + template_row + '][title]" value=""></td>';
    html += '<td>';
    html += '<select name="template_modules[' + template_row + '][template_id]">';
    html += '<option value="">--选择模板--</option>';
    {foreach from=$templates item=template}
      html += '<option value="{$template['template_id']}">{$template['name']}</option>';
    {/foreach}
    html += '</select>';
    html += '</td>';
    html += '<td><input class="w90" type="text" name="template_modules[' + template_row + '][width]" value=""></td>';
    html += '<td><input class="w90" type="text" name="template_modules[' + template_row + '][height]" value="" /></td>';
    html += '<td class="left"><a onclick="$(\'#template-row' + template_row  + '\').remove();" class="btn btn-small btn-danger">{$button_remove}</a></td>';
    html += '</tr>';
    html += '</tbody>'; 
  
    $('#template tfoot').before(html);
  
    template_row++;
  }
//--></script>
{$footer}