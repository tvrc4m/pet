<?php

class SettingStoreModel extends MysqlModel{

	public function getAllStores(){

		$sql="SELECT * FROM ".DB_PREFIX."store;";

		return $this->find($sql);
	}
}