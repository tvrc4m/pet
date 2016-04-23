{$header}
<div class="container">
  {if $errors['warning']}
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>{$errors['warning']}</div>
  {/if}
  <div class="">
    {$column_left}
    {$account}
    <div id="content" class="col-sm-9">
      {$content_top}
      <form action="{$action}" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend>{$edit_title}</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-nick">{$entry_nick}</label>
            <div class="col-sm-10">
              <input type="text" name="nick" value="{$nick}" placeholder="{$entry_nick}" id="input-nick" class="form-control" />
              <div class="text-danger">{$errors['nick']}</div>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email">{$entry_email}</label>
            <div class="col-sm-10">
              <input type="text" name="email" value="{$email}" placeholder="{$entry_email}" id="input-email" class="form-control" />
              <div class="text-danger">{$errors['email']}</div>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-phone">{$entry_phone}</label>
            <div class="col-sm-10">
              <input type="text" name="phone" value="{$phone}" placeholder="{$entry_phone}" id="input-phone" class="form-control" />
              <div class="text-danger">{$errors['phone']}</div>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-card">{$entry_card}</label>
            <div class="col-sm-10">
              <input type="text" name="idcard" value="{$idcard}" placeholder="{$entry_card}" id="input-card" class="form-control" />
              <div class="text-danger">{$errors['card']}</div>
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