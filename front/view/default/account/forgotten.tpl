{$header}
<div class="container">
  {if $errors['warning']}
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {$errors['warning']}</div>
  {/if}
  <div class="row">{$column_left}
    <div id="content" class="col-sm-9">{$content_top}
      <h1>{$heading_title}</h1>
      <p>{$text_email}</p>
      <form action="{$action}" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend>{$text_your_email}</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email">{$entry_email}</label>
            <div class="col-sm-10">
              <input type="text" name="email" value="" placeholder="{$entry_email}" id="input-email" class="form-control" />
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="{$back}" class="btn btn-default">{$button_back}</a></div>
          <div class="pull-right">
            <input type="submit" value="{$button_continue}" class="btn btn-primary" />
          </div>
        </div>
      </form>
      {$content_bottom}
      </div>
    {$column_right}
  </div>
</div>
{$footer}