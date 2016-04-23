{$header}
<div id="content">
  <div class="breadcrumb">
  </div>
  {if $errors['warning']}
    <div class="warning">{$errors['warning']}</div>
  {/if}
  <div class="box">
    <div class="heading">
      <h1><img src="{$smarty.const.ADMIN_IMAGE}shipping.png" alt="" />{$heading_title}</h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="btn btn-small btn-primary">{$button_save}</a>
        <a href="javascript:void(0);" onclick="tt.back()" class="btn btn-small btn-primary">{$button_cancel}</a>
      </div>
    </div>
    <div class="content">
      <form action="{$action}" method="post" enctype="multipart/form-data" id="form">
        <table id="shipping" class="form">
        <tr>
          <td>是否显示</td>
          <td><input type="checkbox" name="shipping_display" value="1" {if $shipping_display}checked{/if} /></td>
        </tr>
        </table>
        <table id="shipping" class="list">
          <thead>
            <tr>
              <td class="left">{$entry_title}</td>
              <td class="left">{$entry_description}</td>
              <td class="left">{$entry_sort}</td>
              <td class="left">{$entry_status}</td>
              <td></td>
            </tr>
          </thead>
          {assign var=shipping_row value=0}
          {foreach from=$shippings key=index item=module}
          <tbody id="shipping-row{$shipping_row}">
            <tr>
              <td class="left">
                <input class="w90" type="text" name="shippings[{$shipping_row}][title]" value="{$module['title']}">
                <span class="error block">{$errors['shipping'][$index]['title']}</span>
              </td>
              <td class="left">
                <input class="w90" type="text" name="shippings[{$shipping_row}][description]" value="{$module['description']}" />
                <span class="error block">{$errors['shipping'][$index]['description']}</span>
              </td>
              <td class="left">
                <input class="w90" type="text" name="shippings[{$shipping_row}][sort]" value="{$module['sort']}" />
              </td>
              <td class="left">
                <input type="checkbox" name="shippings[{$shipping_row}][status]" value="1" {if $module['status']}checked{/if} />
              </td>
              <td class="left">
                <a onclick="$('#shipping-row{$shipping_row}').remove();" class="btn btn-small btn-danger">{$button_remove}</a>
              </td>
            </tr>
          </tbody>
          {assign var=shipping_row value=$shipping_row+1}
          {/foreach}
          <tfoot>
            <tr>
              <td colspan="4"></td>
              <td class="left"><a onclick="addBanner();" class="btn btn-small btn-success">{$button_add}</a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
  var shipping_row = {$shipping_row};
  function addBanner() {
    html  = '<tbody id="shipping-row' + shipping_row + '">';
    html += '<tr>';
    html += '<td><input class="w90" type="text" name="shippings[' + shipping_row + '][title]" value=""></td>';
    html += '<td><input class="w90" type="text" name="shippings[' + shipping_row + '][description]" value=""></td>';
    html += '<td><input class="w90" type="text" name="shippings[' + shipping_row + '][sort]" value=""></td>';
    html += '<td><input type="checkbox" name="shippings[' + shipping_row + '][status]" value="1" checked /></td>';
    html += '<td class="left"><a onclick="$(\'#shipping-row' + shipping_row  + '\').remove();" class="btn btn-small btn-danger">{$button_remove}</a></td>';
    html += '</tr>';
    html += '</tbody>'; 
  
    $('#shipping tfoot').before(html);
  
    shipping_row++;
  }
//--></script>
{$footer}