{$header}
<div class="container">
  <ul class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
    <li><a href="{$breadcrumb['href']}">{$breadcrumb['text']}</a></li>
    <?php } ?>
  </ul>
  {if $success}
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> {$success}</div>
  <?php } ?>
  {if $error_warning}
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {$error_warning}</div>
  <?php } ?>
  <div class="row">{$column_left}
    {if $column_left && $column_right}
    <?php $class = 'col-sm-6'; ?>
    {if $column_left || $column_right}
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="{$class}">{$content_top}
      <div class="row">
        <div class="col-sm-6">
          <div class="well">
            <h2>{$text_new_customer}</h2>
            <p><strong>{$text_register}</strong></p>
            <p>{$text_register_account}</p>
            <a href="{$register}" class="btn btn-primary">{$button_continue}</a></div>
        </div>
        <div class="col-sm-6">
          <div class="well">
            <h2>{$text_returning_customer}</h2>
            <p><strong>{$text_i_am_returning_customer}</strong></p>
            <form action="{$action}" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="control-label" for="input-email">{$entry_email}</label>
                <input type="text" name="email" value="{$email}" placeholder="{$entry_email}" id="input-email" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password">{$entry_password}</label>
                <input type="password" name="password" value="{$password}" placeholder="{$entry_password}" id="input-password" class="form-control" />
                <a href="{$forgotten}">{$text_forgotten}</a></div>
              <input type="submit" value="{$button_login}" class="btn btn-primary" />
              {if $redirect}
              <input type="hidden" name="redirect" value="{$redirect}" />
              <?php } ?>
            </form>
          </div>
        </div>
      </div>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer}