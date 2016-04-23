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
      <div class="form-horizontal">
        <fieldset>
          <legend>{$detail_title}</legend>
          <div class="form-group">
            <label class="col-sm-2">{$entry_name}</label>
            <label class="col-sm-2">{$name}</label>
          </div>
          <div class="form-group">
            <label class="col-sm-2">{$entry_nick}</label>
            <label class="col-sm-2">{$nick}</label>
          </div>
          <div class="form-group">
            <label class="col-sm-2" for="input-email">{$entry_email}</label>
            <label class="col-sm-2">{$email}</label>
          </div>
          <div class="form-group">
            <label class="col-sm-2" for="input-phone">{$entry_phone}</label>
            <label class="col-sm-2">{$phone}</label>
          </div>
          <div class="form-group">
            <label class="col-sm-2" for="input-phone">{$entry_card}</label>
            <label class="col-sm-2">{$idcard}</label>
          </div>
          <div class="form-group">
            <label class="col-sm-2" for="input-phone">{$entry_amount}</label>
            <label class="col-sm-2">{$amount}元</label>
          </div>
        </fieldset>
      </div>
      {$content_bottom}
    </div>
    {$column_right}
  </div>
</div>
{$footer}