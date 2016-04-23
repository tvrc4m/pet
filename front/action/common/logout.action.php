<?php

class LogoutAction extends Action{

	public function index(){

		S('LOGGED',null);

		S('VENDOR',null);

		C('VENDORLOGGED',null);

		unset($_SESSION);

		session_destroy();

		go('/vendor/login');
	}
}