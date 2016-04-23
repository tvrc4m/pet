{$header}
<div class="container">
  <div class="row">
    <div id="content" class="col-sm-9">
      <h1>{$heading_title}<small style="font-size: 12px;color: red;">第一次登录需要修改初始化密码</small></h1>
      <form method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password">{$entry_password}</label>
            <div class="col-sm-10">
              <input type="password" name="password" value="{$password}" placeholder="{$entry_password}" id="input-password" class="form-control" />
              {if $errors['password']}
                <div class="text-danger">{$errors['password']}</div>
              {/if}
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-confirm">{$entry_confirm}</label>
            <div class="col-sm-10">
              <input type="password" name="confirm" value="{$confirm}" placeholder="{$entry_confirm}" id="input-confirm" class="form-control" />
              {if $errors['confirm']}
                <div class="text-danger">{$errors['confirm']}</div>
              {/if}
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-right">
            <input type="submit" value="{$button_continue}" class="btn btn-primary" />
          </div>
        </div>
      </form>
    </div>
  </div>
</div>

{$footer}