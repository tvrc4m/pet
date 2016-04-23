{$header}
<div class="container">
  {if $errors['warning']}
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {$errors['warning']}</div>
  {/if}
  <div class="row">{$column_left}
    <div id="content" class="col-sm-12">
      {$content_top}
      <h1>{$heading_title}</h1>
      <p>{$text_account_already}</p>
      <form action="{$action}" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset id="account">
          <legend>{$text_your_details}</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name">{$entry_name}</label>
            <div class="col-sm-10">
              <input type="text" name="name" style="width:70%;display: inline" value="{$name}" placeholder="{$entry_name}" id="input-name" class="form-control" />
              <span class=" error text-danger">{$errors['name']}</span>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-nick">{$entry_nick}</label>
            <div class="col-sm-10">
              <input type="text" name="nick" style="width:70%;display: inline" value="{$nick}" placeholder="{$entry_nick}" id="input-nick" class="form-control" />
              <span class=" error text-danger">{$errors['nick']}</span>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email">{$entry_email}</label>
            <div class="col-sm-10">
              <input type="text" name="email" style="width:70%;display: inline" value="{$email}" placeholder="{$entry_email}" id="input-email" class="form-control" />
              <span class=" error text-danger">{$errors['email']}</span>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-phone">{$entry_phone}</label>
            <div class="col-sm-10">
              <input type="text" name="phone" style="width:70%;display: inline" value="{$phone}" placeholder="{$entry_phone}" id="input-phone" class="form-control" />
              <span class=" error text-danger">{$errors['phone']}</span>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-card">{$entry_card}</label>
            <div class="col-sm-10">
              <input type="text" name="idcard" style="width:70%;display: inline" value="{$idcard}" placeholder="{$entry_card}" id="input-card" class="form-control" />
              <span class=" error text-danger">{$errors['card']}</span>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password">{$entry_password}</label>
            <div class="col-sm-10">
              <input type="password" name="password" style="width:70%;display: inline" value="{$password}" placeholder="{$entry_password}" id="input-password" class="form-control" />
              <span class=" error text-danger">{$errors['password']}</span>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-confirm">{$entry_confirm}</label>
            <div class="col-sm-10">
              <input type="password" name="confirm" style="width:70%;display: inline" value="{$confirm}" placeholder="{$entry_confirm}" id="input-confirm" class="form-control" />
              <span class=" error text-danger">{$errors['confirm']}</span>
            </div>
          </div>
        </fieldset>
        {if $text_agree}
        <div class="buttons">
          <div class="pull-right">{$text_agree}
            <input type="checkbox" name="agree" value="1" {if $agree}checked{/if} />
            &nbsp;
            <input type="submit" value="{$button_continue}" class="btn btn-primary" />
          </div>
        </div>
        {else}
        <div class="buttons">
          <div class="center">
            <input type="submit" value="{$button_register}" class="btn btn-primary" />
          </div>
        </div>
        {/if}
      </form>
      {$content_bottom}
      </div>
    {$column_right}
  </div>
</div>
{$footer}