{$header}
<div class="container">
    {if $errors['warning']}
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {$errors['warning']}</div>
    {/if}
    <div class="row">
        <div id="content" class="col-sm-12">
            <h1>{$heading_title}</h1>
            <form action="{$confirm}" method="POST" id="checkout">
                <input type="hidden" name="key" value="{$key}" />
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">{$text_payment_item}</h4>
                        </div>
                        <div class="panel-collapse" id="collapse-checkout-option">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <td class="text-left">{$column_name}</td>
                                                <td class="text-right">{$column_quantity}</td>
                                                <td class="text-right">{$column_price}</td>
                                                <td class="text-right">{$column_total}</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {foreach from=$items key=index item=item}
                                            <tr>
                                                <td class="text-left">
                                                    <input type='hidden' name='items[{$index}][item_id]' value="{$item['item_id']}" />
                                                    <input type='hidden' name='items[{$index}][quantity]' value="{$item['quantity']}" />
                                                    <a href="{$item['href']}">{$item['title']}</a> 
                                                    {if $item['options']} 
                                                        {foreach from=$item['options'] item=option}
                                                         <input type='hidden' name='items[{$index}][options][]' value="{$option['item_option_id']}" />
                                                            <br />
                                                            - <small>{$option['name']}</small> 
                                                        {/foreach} 
                                                    {/if}
                                                </td>
                                                <td class="text-right">{$item['quantity']}</td>
                                                <td class="text-right">￥{$item['price']}</td>
                                                <td class="text-right">￥{$item['total']}</td>
                                            </tr>
                                            {/foreach}
                                        </tbody>
                                        <tfoot>
                                            {foreach from=$totals item=total}
                                            <tr>
                                                <td colspan="3" class="text-right"><strong>{$total['title']}:</strong></td>
                                                <td class="text-right">￥{$total['text']}</td>
                                            </tr>
                                            {/foreach}
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">{$text_customer_info}</h4>
                        </div>
                        <div class="panel-collapse" id="collapse-payment-address">
                            <div class="panel-body">
                                <div id="payment-new" style="display: block;">
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-payment-firstname">{$entry_name}</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="name" value="{$name}" placeholder="{$entry_name}" class="form-control" />
                                            <span class="error">{$errors['name']}</span>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-payment-lastname">{$entry_phone}</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="phone" value="{$phone}" placeholder="{$entry_phone}" class="form-control" />
                                            <span class="error">{$errors['phone']}</span>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-payment-lastname">{$entry_card}</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="idcard" value="{$idcard}" placeholder="{$entry_card}" class="form-control" />
                                            <span class="error">{$errors['card']}</span>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label">{$entry_plan}</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="plantime" value="{$plantime}" placeholder="{$entry_plan}" class="form-control" />
                                            <span class="error">{$errors['plan']}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">{$text_payment_method}</h4>
                        </div>
                        <div class="panel-collapse" id="collapse-payment-method">
                            <div class="panel-body">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="shipping_method" value="balance" checked="checked" />余额支付</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="center">
                    <div class="buttons">
                        <a href="javascript:void(0);" {if $disable==1}disabled{/if} onclick="$('#checkout').submit()" class="btn btn-primary">{$button_confirm}</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    tt.datepicker('input[name=plantime]');
</script>
{$footer}
