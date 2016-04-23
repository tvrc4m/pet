{$header}
<div class="container">
  <ul class="breadcrumb">
    {foreach from=$breadcrumbs item=breadcrumb}
    <li><a href="{$breadcrumb['href']}">{$breadcrumb['text']}</a></li>
    <?php } ?>
  </ul>
  {if $success}
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> {$success}
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  {if $error_warning}
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> {$error_warning}
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
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
      <h2>{$heading_title}</h2>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" colspan="2">{$text_order_detail}</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left" style="width: 50%;">{if $invoice_no}
              <b>{$text_invoice_no}</b> {$invoice_no}<br />
              <?php } ?>
              <b>{$text_order_id}</b> #{$order_id}<br />
              <b>{$text_date_added}</b> {$date_added}</td>
            <td class="text-left">{if $payment_method}
              <b>{$text_payment_method}</b> {$payment_method}<br />
              <?php } ?>
              {if $shipping_method}
              <b>{$text_shipping_method}</b> {$shipping_method}
              <?php } ?></td>
          </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" style="width: 50%;">{$text_payment_address}</td>
            {if $shipping_address}
            <td class="text-left">{$text_shipping_address}</td>
            <?php } ?>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left">{$payment_address}</td>
            {if $shipping_address}
            <td class="text-left">{$shipping_address}</td>
            <?php } ?>
          </tr>
        </tbody>
      </table>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left">{$column_name}</td>
              <td class="text-left">{$column_model}</td>
              <td class="text-right">{$column_quantity}</td>
              <td class="text-right">{$column_price}</td>
              <td class="text-right">{$column_total}</td>
              {if $products}
              <td style="width: 20px;"></td>
              <?php } ?>
            </tr>
          </thead>
          <tbody>
            {foreach from=$products item=product}
            <tr>
              <td class="text-left">{$product['name']}
                {foreach from=$product['option'] item=option}
                <br />
                &nbsp;<small> - {$option['name']}: {$option['value']}</small>
                <?php } ?></td>
              <td class="text-left">{$product['model']}</td>
              <td class="text-right">{$product['quantity']}</td>
              <td class="text-right">{$product['price']}</td>
              <td class="text-right">{$product['total']}</td>
              <td class="text-right" style="white-space: nowrap;">{if $product['reorder']}
                <a href="{$product['reorder']}" data-toggle="tooltip" title="{$button_reorder}" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></a>
                <?php } ?>
                <a href="{$product['return']}" data-toggle="tooltip" title="{$button_return}" class="btn btn-danger"><i class="fa fa-reply"></i></a></td>
            </tr>
            <?php } ?>
            {foreach from=$vouchers item=voucher}
            <tr>
              <td class="text-left">{$voucher['description']}</td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right">{$voucher['amount']}</td>
              <td class="text-right">{$voucher['amount']}</td>
              {if $products}
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            {foreach from=$totals item=total}
            <tr>
              <td colspan="3"></td>
              <td class="text-right"><b>{$total['title']}</b></td>
              <td class="text-right">{$total['text']}</td>
              {if $products}
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tfoot>
        </table>
      </div>
      {if $comment}
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left">{$text_comment}</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left">{$comment}</td>
          </tr>
        </tbody>
      </table>
      <?php } ?>
      {if $histories}
      <h3>{$text_history}</h3>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left">{$column_date_added}</td>
            <td class="text-left">{$column_status}</td>
            <td class="text-left">{$column_comment}</td>
          </tr>
        </thead>
        <tbody>
          {foreach from=$histories item=history}
          <tr>
            <td class="text-left">{$history['date_added']}</td>
            <td class="text-left">{$history['status']}</td>
            <td class="text-left">{$history['comment']}</td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="{$continue}" class="btn btn-primary">{$button_continue}</a></div>
      </div>
      {$content_bottom}</div>
    {$column_right}</div>
</div>
{$footer}