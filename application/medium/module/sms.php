<?php

class ModuleSms extends Medium{

	protected $api="http://api.sms.cn/mtutf8/";

	protected $sms_codes=array(
		'100'=>'发送成功',
		'101'=>'验证失败',
		'102'=>'短信不足',
		'103'=>'操作失败',
		'104'=>'非法字符',
		'105'=>'内容过多',
		'106'=>'号码过多',
		'107'=>'频率过快',
		'108'=>'号码内容空',
		'109'=>'账号冻结',
		'110'=>'禁止频繁单条发送',
		'112'=>'号码错误',
		'113'=>'定时时间格式不对',
		'114'=>'账号被锁，10分钟后登录',
		'115'=>'禁止接口发送',
		'116'=>'绑定IP不正确',
		'120'=>'系统升级',
	);

	public function run($action,$data){

		switch ($action) {

			case 'send':return $this->send($data);break;
		}
	}

	private function send($data){

		if(!V('config_sms_status')) return -1;

		$params=array(
			'uid'=>V('config_sms_account'),
			'pwd'=>md5(V('config_sms_password').V('config_sms_account')),
			'mobile'=>$data['phone'],
			'mobileids'=>$data['mobileids'],
			'content'=>urlencode($data['content']),
			'encode'=>'utf8',
		);
		
		$res=$this->postSMS($this->api,$params);
		
		parse_str($res,$output);

		$message=$this->sms_codes[$output['stat']];

		$output['message']=$message;

		$params=array('order_id'=>$data['order_id'],'item_id'=>$data['item_id'],'phone'=>$data['phone'],'content'=>$data['content'],'status'=>$output['stat'],'reason'=>$message,'type'=>$data['type'],'platform'=>'sms');
		
		D('sms/ticket')->addCallSms($params);

		return $output;
	}

	private function postSMS($url,$data=''){
		$port="";
		$post="";
		$row = parse_url($url);
		$host = $row['host'];
		$port = $row['port'] ? $row['port']:80;
		$file = $row['path'];
		while (list($k,$v) = each($data)){
			$post .= rawurlencode($k)."=".rawurlencode($v)."&";
		}
		$post = substr( $post , 0 , -1 );
		$len = strlen($post);
		$fp = @fsockopen( $host ,$port, $errno, $errstr, 10);
		if (!$fp) {
			return iconv('GB2312', 'UTF-8',"$errstr ($errno)\n");
		} else {
			$receive = '';
			$out = "POST $file HTTP/1.1\r\n";
			$out .= "Host: $host\r\n";
			$out .= "Content-type: application/x-www-form-urlencoded\r\n";
			$out .= "Connection: Close\r\n";
			$out .= "Content-Length: $len\r\n\r\n";
			$out .= $post;
			fwrite($fp, $out);
			while (!feof($fp)) {
				$receive .= fgets($fp, 128);
			}
			fclose($fp);
			$receive = explode("\r\n\r\n",$receive);
			unset($receive[0]);
			return iconv('GB2312', 'UTF-8',implode("",$receive));
		}
	}
}