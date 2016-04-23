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
            <textarea class="w97" style="height: 500px" id='information_html' name="information_html">{$information_html}</textarea>
        </div>
      </form>
    </div>
  </div>
</div>
{literal}
<script type="text/javascript" src="/static/default/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/static/default/js/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript">
   var ue = UE.getEditor('information_html');
</script>
{/literal}
{$footer}