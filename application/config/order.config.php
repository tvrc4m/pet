<?php

// order status

define('ORDER_STATUS_PENDING',1);
define('ORDER_STATUS_READY_FOR_PAYMENT',5);
define('ORDER_STATUS_PAYMENT_SUCCESS',10);
define('ORDER_STATUS_PAYMENT_ERROR',15);
define('ORDER_STATUS_PAYMENT_CANCEL',20);
define('ORDER_STATUS_CANCEL',25);
define('ORDER_STATUS_PREPARE',30);
define('ORDER_STATUS_SHIPPED',35);
define('ORDER_STATUS_RECEIPT',40);
define('ORDER_STATUS_RETURN',45);
define('ORDER_STATUS_REFUND_SUCCESS',50);
define('ORDER_STATUS_REFUND_ERROR',55);
define('ORDER_STATUS_DELETED',-1);

// order number prefix

define('ORDER_NO_PREFIX','521');