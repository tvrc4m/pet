{$header}
<div id="content">
  <div class="container-fluid"><br />
    <br />
    <div class="row">
      <div class="col-sm-offset-4 col-sm-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h1 class="panel-title"><i class="fa fa-lock"></i> {$text_login}</h1>
          </div>
          <div class="panel-body">
            {if $success}
              <div class="alert alert-success"><i class="fa fa-check-circle"></i> {$success}</div>
            {/if}
            {if $warning}
              <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>{$warning}</div>
            {/if}
            <form action="{$action}" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label for="input-username">{$entry_username}</label>
                <div class="input-group"><span class="input-group-addon"><i class="fa fa-user"></i></span>
                  <input type="text" name="nick" value="{$nick}" placeholder="{$entry_username}" id="input-username" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label for="input-password">{$entry_password}</label>
                <div class="input-group"><span class="input-group-addon"><i class="fa fa-lock"></i></span>
                  <input type="password" name="password" value="{$password}" placeholder="{$entry_password}" id="input-password" class="form-control" />
                </div>
                {if $forgotten}
                <span class="help-block"><a href="{$forgotten}">{$text_forgotten}</a></span>
                {/if}
              </div>
              <div class="text-right">
                <button type="submit" class="btn btn-primary"><i class="fa fa-key"></i> {$button_login}</button>
              </div>
              {if $redirect}
                <input type="hidden" name="redirect" value="{$redirect}" />
              {/if}
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
{$footer}