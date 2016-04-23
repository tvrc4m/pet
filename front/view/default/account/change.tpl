{$header}
<div class="container">
  <div class="">
    {$column_left}
    {$account}
    <div id="content" class="col-sm-9">
      {$content_top}
      <form action="{$action}" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend>{$text_password}</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password">{$entry_old}</label>
            <div class="col-sm-10">
              <input type="password" name="old" value="{$old}" placeholder="{$entry_old}" id="input-old" class="form-control" />
              <div class="text-danger">{$errors['old']}</div>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password">{$entry_password}</label>
            <div class="col-sm-10">
              <input type="password" name="password" value="{$password}" placeholder="{$entry_password}" id="input-password" class="form-control" />
              <div class="text-danger">{$errors['password']}</div>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-confirm">{$entry_confirm}</label>
            <div class="col-sm-10">
              <input type="password" name="confirm" value="{$confirm}" placeholder="{$entry_confirm}" id="input-confirm" class="form-control" />
              <div class="text-danger">{$errors['confirm']}</div>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
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