<?php
define("ROOT_PATH", IA_ROOT . "/addons/hu_couda/");
include ROOT_PATH . "model/prize.mod.php";
include ROOT_PATH . "lib/Wxadoc.php";
include ROOT_PATH . "lib/WxpayAPI_php_v3/WxpayAPI_php_v3.php";
include ROOT_PATH . "lib/Select.mysql.php";
define("LOCAL_IP", $_SERVER["SERVER_ADDR"]);
class hu_coudaModuleWxapp extends WeModuleWxapp
{
	private $gpc;
	private $w;
	private $member;
	public function __construct()
	{
		global $_W;
		global $_GPC;
		$this->gpc = $_GPC;
		$this->w = $_W;
		define("PREFIX", prefix($_W["uniacid"]));
		update_open_more();
		$noLogin = ["login", "dorech", "upload", "image", "open", "share", "config", "advertisement", "index", "total", "qrcode"];
		if (isset($_GPC["debug"])) {
			error_reporting(E_ALL);
		}
		if (empty($_GPC["do"]) || in_array($_GPC["do"], $noLogin)) {
			return true;
		}
		$trd_session = $this->get("trd_session");
		$res = pdo_get(prefix_table("cj_token"), ["token" => $trd_session]);
		if (empty($res)) {
			json("unlogin", 0);
		}
		$member_id = $res["member_id"];
		if ($member_id >= 1) {
			$member = pdo_get(prefix_table("cj_member"), ["id" => $member_id]);
			if ($member) {
				if (!$member["user_img"]) {
					$member["no_pic"] = 1;
				}
				$js_default_shop = pdo_get(prefix_table("cj_config"), ["key" => "js_default_shop"]);
				if ($this->member["shop_id"] == 0 && $js_default_shop["value"]) {
					pdo_update(prefix_table("cj_member"), array("shop_id" => $js_default_shop["value"]), ["id" => $member_id]);
					$this->member["shop_id"] = $js_default_shop["value"];
				}
				$this->member = $member;
				$form_id = $this->get("formid");
				if ($form_id && $form_id != "the formId is a mock one") {
					pdo_insert(prefix_table("cj_form_id"), ["member_id" => $member_id, "form_id" => $form_id, "created" => time()]);
				}
				return true;
			}
		}
	}
	public function doPageQrcode()
	{
		$code = $this->get("code");
		if (empty($code)) {
			exit;
		}
		$resultid = $this->get("resultid");
		$prize_result = pdo_get(prefix_table("cj_prize_result"), ["result_id" => $resultid]);
		if ($prize_result["ptype"] == 0) {
			$code = $resultid;
		}
		$path = ATTACHMENT_ROOT . "images/qrcode" . $this->w["uniacid"] . "/";
		if (!file_exists($path)) {
			@mkdir($path, 0777, true);
		}
		$qrcode = $path . $code . ".png";
		if (!is_file($qrcode)) {
			include ROOT_PATH . "lib/phpqrcode/phpqrcode.php";
			$value = $code;
			$errorCorrectionLevel = "L";
			$matrixPointSize = 8;
			QRcode::png($value, $qrcode, $errorCorrectionLevel, $matrixPointSize, 2);
			$QR = $qrcode;
			$QR = imagecreatefromstring(file_get_contents($QR));
			imagepng($QR, $qrcode);
			imagedestroy($QR);
		}
		header("content-type:image/png");
		echo file_get_contents($qrcode);
		exit;
	}
	public function doPageAuthor()
	{
		if ($this->member["user_img"] || $this->member["nickname"]) {
			json('');
		}
		json('', 2);
	}
	public function doPageRelease()
	{
		$is_release = $this->_release();
		$msg = '';
		if (!$is_release) {
			$msg = pdo_get(prefix_table("cj_config"), ["key" => "release_msg"]);
			$msg = $msg ? $msg["value"] : "无发布权限";
		}
		$data = ["is_release" => $is_release, "msg" => $msg];
		json($data);
	}
	private function _release()
	{
		$config = pdo_get(prefix_table("cj_config"), ["key" => "is_release"]);
		$is_release = $config ? $config["value"] : 0;
		$is_release = $is_release == 1 ? $this->member["is_release"] : $is_release;
		return $is_release;
	}
	public function doPageVoucher()
	{
		$priae = new prize();
		$goods = $priae->is_voucher($this->member["id"]);
		if ($goods) {
			json($goods);
		}
		json('', 2);
	}
	public function doPageUpload()
	{
		if ($this->get("jietu")) {
			$_FILES["file"]["name"] = $_FILES["file"]["name"] . ".png";
		}
		if (!isset($_FILES["file"])) {
			json("请上传图片", 0);
		}
		load()->func("file");
		$reslut = file_upload($_FILES["file"]);
		if (isset($reslut["errno"])) {
			json($reslut["message"], 0);
		}
		$pic = "/" . $reslut["path"];
		if ($this->_is_oss()) {
			$remotestatus = file_remote_upload($reslut["path"]);
			if (is_error($remotestatus)) {
				json("远程附件上传失败", 0);
			}
		}
		$data = ["member_id" => $this->member["id"], "route" => $pic, "created" => time()];
		if (!pdo_insert(prefix_table("cj_resource"), $data)) {
			json("领取失败", 0);
		}
		json(pdo_insertid());
	}
	private function L($info)
	{
		if (is_array($info)) {
			$info = print_r($info, 1);
		}
		load()->func("logging");
		logging_run($info);
	}
	public function doPageShare()
	{
		$id = $this->get("id");
		if (empty($id)) {
			exit;
		}
		$m = $this->gpc["m"];
		include ROOT_PATH . "lib/Gd.class.php";
		include ROOT_PATH . "lib/Image.class.php";
		$Image = new Image();
		$path = IA_ROOT . "/addons/hu_couda/images/share" . $this->w["uniacid"] . "/" . $id;
		if (!file_exists($path)) {
			@mkdir($path, 0777, true);
		}
		$sharepath = $path . "/m_" . $this->member["id"] . ".png";
		if (!is_file($sharepath)) {
			$bg = IA_ROOT . "/addons/" . $m . "/template/sharebg.png";
			$info = pdo_get(prefix_table("cj_prize"), ["id" => $id]);
			if (empty($info)) {
				exit;
			}
			$default_prize_img = pdo_get(prefix_table("cj_config"), ["key" => "default_prize_img"]);
			if ($default_prize_img["value"]) {
				$apath = ATTACHMENT_ROOT . $this->getImage($default_prize_img["value"], true);
			} else {
				$apath = IA_ROOT . "/addons/" . $m . "/template/attach2.jpg";
			}
			if (!empty($info["attach_id"])) {
				$img = pdo_get(prefix_table("cj_resource"), ["id" => $info["attach_id"]]);
				if ($img) {
					$apath = ATTACHMENT_ROOT . $img["route"];
					if ($this->_is_oss()) {
						file_put_contents($apath, file_get_contents($this->w["attachurl"] . $img["route"]));
					}
				}
			}
			$aimg = $Image->open($apath);
			$apath_temp = ATTACHMENT_ROOT . $id . "_sub_temp.png";
			$aimg->thumb(396, 196, 3)->save($apath_temp);
			$img = $Image->open($bg);
			$arr = array("fir", "sec", "trd");
			foreach ($arr as $v) {
				${$v} = '';
				if (!empty($info[$v . "_num"])) {
					switch ($info[$v . "_ptype"]) {
						case "0":
							${$v} = $info[$v . "_val"];
							break;
						case "1":
							${$v} = $info[$v . "_val"] . "￥";
							break;
						case "2":
							${$v} = $info[$v . "_cname"];
							break;
					}
				}
			}
			$handle = $img->water($apath_temp, array(12, 12), 100);
			$addheight = 0;
			if ($trd) {
				$handle = $handle->text("三等奖：" . $trd, IA_ROOT . "/addons/" . $m . "/template/font/msyh.ttf", 16, "#000000", array(12, 279));
				$handle = $handle->text(" x " . $info["trd_num"], IA_ROOT . "/addons/" . $m . "/template/font/msyh.ttf", 12, "#999999", array(370, 279));
			}
			if ($sec) {
				$addheight = -30;
				$handle = $handle->text("二等奖：" . $sec, IA_ROOT . "/addons/" . $m . "/template/font/msyh.ttf", 16, "#000000", array(12, 285 + $addheight));
				$handle = $handle->text(" x " . $info["sec_num"], IA_ROOT . "/addons/" . $m . "/template/font/msyh.ttf", 12, "#999999", array(370, 285 + $addheight));
			}
			if ($fir) {
				if (!$sec) {
					$addheight = 0;
				}
				$handle = $handle->text("一等奖：" . $fir, IA_ROOT . "/addons/" . $m . "/template/font/msyh.ttf", 16, "#000000", array(12, 255 + $addheight));
				$handle = $handle->text(" x " . $info["fir_num"], IA_ROOT . "/addons/" . $m . "/template/font/msyh.ttf", 12, "#999999", array(370, 255 + $addheight));
			}
			$open_type = 1 == $info["type"] ? date("定时开奖时间Y-m-d H:i", $info["typevalue"]) : (2 == $info["type"] ? "达到" . $info["typevalue"] . "人数开奖" : "发起者手动开奖");
			$handle = $handle->text($open_type, IA_ROOT . "/addons/" . $m . "/template/font/msyh.ttf", 12, "#9F9494", array(12, 302));
			$handle->save($sharepath);
			unlink($apath_temp);
		}
		header("content-type:image/png");
		echo file_get_contents($sharepath);
		exit;
	}
	public function doPageShareImg()
	{
		$id = $this->get("id");
		if (empty($id)) {
			exit;
		}
		include ROOT_PATH . "lib/Gd.class.php";
		include ROOT_PATH . "lib/Image.class.php";
		$Image = new Image();
		$path = ATTACHMENT_ROOT . "images/shareImg" . $this->w["uniacid"] . "/";
		if (!file_exists($path)) {
			@mkdir($path, 0777, true);
		}
		$sharepath = $path . $this->member["id"] . "_share_201911" . $id . ".png";
		if (!is_file($sharepath)) {
			if (!file_exists(ATTACHMENT_ROOT . "qr" . $this->w["uniacid"])) {
				@mkdir(ATTACHMENT_ROOT . "qr" . $this->w["uniacid"], 0777, true);
			}
			$qrpath = ATTACHMENT_ROOT . "qr" . $this->w["uniacid"] . "/qr217" . $id . ".png";
			if (!is_file($qrpath)) {
				$qr_temp = ATTACHMENT_ROOT . "qr_temp" . $id . ".jpg";
				$option = array("appid" => $this->w["uniaccount"]["key"], "secret" => $this->w["uniaccount"]["secret"]);
				$wxObj = new Wxadoc($option);
				$res = $wxObj->createwxaqrcode($id, "pages/partake/partake", 430, false, array("r" => 72, "g" => 145, "b" => 92));
				file_put_contents($qr_temp, $res);
				$qrimg = $Image->open($qr_temp);
				$qrimg->thumb(217, 217)->save($qrpath);
				unlink($qr_temp);
			}
			$bg = IA_ROOT . "/addons/" . $this->gpc["m"] . "/template/bg2.png";
			$prize = pdo_get(prefix_table("cj_prize"), ["id" => $id]);
			if (empty($prize)) {
				exit;
			}
			if (empty($prize["attach_id"])) {
				$default_prize_img = pdo_get(prefix_table("cj_config"), ["key" => "default_prize_img"]);
				if ($default_prize_img["value"]) {
					$apath = ATTACHMENT_ROOT . $this->getImage($default_prize_img["value"], true);
					if ($this->_is_oss()) {
						file_put_contents($apath, file_get_contents($this->w["attachurl"] . $this->getImage($default_prize_img["value"], true)));
					}
				} else {
					$apath = IA_ROOT . "/addons/" . $this->gpc["m"] . "/template/attach2.jpg";
				}
			} else {
				$apath = ATTACHMENT_ROOT . $this->getImage($prize["attach_id"], true);
				if ($this->_is_oss()) {
					file_put_contents($apath, file_get_contents($this->w["attachurl"] . $this->getImage($prize["attach_id"], true)));
				}
			}
			$headpath_temp = ATTACHMENT_ROOT . "head" . $this->member["id"] . ".jpg";
			$headpath = ATTACHMENT_ROOT . "head" . $this->member["id"] . ".png";
			file_put_contents($headpath_temp, file_get_contents($this->member["user_img"]));
			$himg = $Image->open($headpath_temp);
			$himg->thumb(100, 100, 3)->save($headpath_temp);
			$imgg = yuan_img($headpath_temp);
			imagepng($imgg, $headpath);
			imagedestroy($imgg);
			unlink($headpath_temp);
			$aimg = $Image->open($apath);
			$apath_temp = ATTACHMENT_ROOT . $id . "_temp.png";
			$aimg->thumb(654, 326, 3)->save($apath_temp);
			$img = $Image->open($bg);
			$nickname = $this->member["nickname"];
			$title = $prize["title"];
			$fir = !empty($prize["fir_num"]) ? $prize["fir_ptype"] == "0" ? $prize["fir_val"] : $prize["fir_val"] . "元现金红包" : '';
			if ($prize["fir_ptype"] == "0") {
				$fir = $prize["fir_val"];
			} else {
				if ($prize["fir_ptype"] == 1) {
					$fir = $prize["fir_val"] . "元现金红包";
				} else {
					$fir = $prize["fir_cname"];
				}
			}
			$sec = !empty($prize["sec_num"]) ? $prize["sec_ptype"] == "0" ? $prize["sec_val"] : $prize["sec_val"] . "元现金红包" : '';
			$trd = !empty($prize["trd_num"]) ? $prize["trd_ptype"] == "0" ? $prize["trd_val"] : $prize["trd_val"] . "元现金红包" : '';
			if ($prize["sec_ptype"] == "0") {
				$sec = $prize["sec_val"];
			} else {
				if ($prize["sec_ptype"] == 1) {
					$sec = $prize["sec_val"] . "元现金红包";
				} else {
					$sec = $prize["sec_cname"];
				}
			}
			if ($prize["trd_ptype"] == "0") {
				$trd = $prize["trd_val"];
			} else {
				if ($prize["trd_ptype"] == 1) {
					$trd = $prize["trd_val"] . "元现金红包";
				} else {
					$trd = $prize["trd_cname"];
				}
			}
			$textWidth = imagefontwidth(24) * mb_strlen($fir);
			$handle = $img->water($apath_temp, array(49, 266), 100)->water($qrpath, array(265, 796), 100)->water($headpath, array(326, 32), 100);
			if ($title) {
			}
			$onlyFirstHeigh = 0;
			$onlySecondHeight = 0;
			if ($sec) {
				if (!$trd) {
					$onlyFirstHeigh = 15;
					$onlySecondHeight = 10;
				}
				$handle = $handle->text("二等奖：" . $sec . " x " . $prize["sec_num"], IA_ROOT . "/addons/" . $this->gpc["m"] . "/template/font/msyh.ttf", 24, "#000000", array(60, 650 + $onlyFirstHeigh + $onlySecondHeight));
			}
			if ($fir) {
				if (!$sec) {
					$onlyFirstHeigh = 40;
				}
				$handle = $handle->text("一等奖：" . $fir . " x " . $prize["fir_num"], IA_ROOT . "/addons/" . $this->gpc["m"] . "/template/font/msyh.ttf", 22, "#000000", array(60, 613 + $onlyFirstHeigh));
			}
			if (0 && $sec) {
				$handle = $handle->text($sec . "*" . $prize["sec_num"], IA_ROOT . "/addons/" . $this->gpc["m"] . "/template/font/msyh.ttf", 24, "#000000", array(60, 650));
			}
			if ($trd) {
				$handle = $handle->text("三等奖：" . $trd . " x " . $prize["trd_num"], IA_ROOT . "/addons/" . $this->gpc["m"] . "/template/font/msyh.ttf", 24, "#000000", array(60, 690));
			}
			$open_type = 1 == $prize["type"] ? date("Y-m-d H:i", $prize["typevalue"]) . "自动开奖" : (2 == $prize["type"] ? "达到" . $prize["typevalue"] . "人自动开启" : "由发起者手动开启");
			$handle = $handle->text($open_type, IA_ROOT . "/addons/" . $this->gpc["m"] . "/template/font/msyh.ttf", 18, "#9F9494", array(60, 741));
			$handle->save($sharepath);
			unlink($apath_temp);
		}
		header("content-type:image/png");
		echo file_get_contents($sharepath);
		exit;
	}
	public function doPageImage()
	{
		$id = $this->get("id");
		if (!is_numeric($id)) {
			json("参数错误", 0);
		}
		$image = pdo_get(prefix_table("cj_resource"), ["id" => $id]);
		if (empty($image)) {
			json("图片不存在", 0);
		}
		header("content-type:image/png");
		if ($this->_is_oss()) {
			echo file_get_contents($this->w["attachurl"] . $image["route"]);
		} else {
			echo file_get_contents(ATTACHMENT_ROOT . $image["route"]);
		}
		die;
	}
	public function doPageLogin()
	{
		$code = $this->get("code");
		if (empty($code)) {
			json("参数错误");
		}
		$option = ["appid" => $this->w["uniaccount"]["key"], "secret" => $this->w["uniaccount"]["secret"]];
		$wxObj = new Wxadoc($option);
		if (false === ($res = $wxObj->jscode2session($code))) {
			json($wxObj->getError(), 0);
		}
		$member = pdo_get(prefix_table("cj_member"), ["openid" => $res["openid"]]);
		if (empty($member)) {
			pdo_insert(prefix_table("cj_member"), ["openid" => $res["openid"]]);
			$member["id"] = pdo_insertid();
		}
		$_SESSION["member_id"] = $member["id"];
		$_SESSION["openid"] = $res["openid"];
		$_SESSION["session_key"] = $res["session_key"];
		$token = md5($member["id"] . time() . "9xy");
		$insert = ["token" => $token, "member_id" => $member["id"], "created" => time()];
		pdo_insert(prefix_table("cj_token"), $insert);
		json($token);
	}
	public function doPageRegister()
	{
		$member_id = $this->member["id"];
		if (!$this->get("nickname") || !$this->get("headimgurl")) {
			json("非法请求", 0);
		}
		$update = ["nickname" => $this->get("nickname"), "user_img" => $this->get("headimgurl") ? $this->get("headimgurl") : $this->w["siteroot"] . "addons/hu_couda/template/images/nopic.jpg", "gender" => $this->get("gender"), "province" => $this->get("province"), "city" => $this->get("city"), "country" => $this->get("country"), "add_time" => time(), "set_time" => time()];
		pdo_update(prefix_table("cj_member"), $update, ["id" => $member_id]);
		json("ok");
	}
	public function doPageMy()
	{
		json($this->member);
	}
	public function doPageWithdrawals()
	{
		$money = $this->get("money", 0);
		if ($money < 1 or $money > 200) {
			json("提现金额为1-200元之间", 0);
		}
		$start = strtotime(date("Y-m-d", time()));
		$sql = "SELECT COUNT(1) as count FROM " . tablename(prefix_table("cj_withdrawals")) . " WHERE created>" . $start;
		$res = pdo_fetch($sql);
		if (!empty($res) && $res["count"] > 2) {
		}
		pdo_begin();
		try {
			$insert = ["member_id" => $this->member["id"], "money" => $money, "created" => time()];
			$this->setPayment();
			$p = new prize();
			if (!$p->change($this->member["id"], $money, 2)) {
				throw new Exception($p->error);
			}
			if (!pdo_insert(prefix_table("cj_withdrawals"), $insert)) {
				throw new Exception("提现失败");
			}
			$insert_id = pdo_insertid();
			if (!$p->cash($insert_id)) {
				throw new Exception("提现失败");
			}
			pdo_commit();
		} catch (Exception $e) {
			pdo_rollback();
			json($e->getMessage(), 0);
		}
		json("提现成功", 1);
	}
	private function setPayment()
	{
		WxPayConfig::$APPID = $this->w["uniaccount"]["key"];
		WxPayConfig::$MCHID = $this->w["account"]["setting"]["payment"]["wechat"]["mchid"];
		WxPayConfig::$KEY = $this->w["account"]["setting"]["payment"]["wechat"]["signkey"];
		WxPayConfig::$APPSECRET = $this->w["uniaccount"]["secret"];
		$cert = pdo_get(prefix_table("cj_config"), ["key" => "apiclient_cert"]);
		if (!empty($cert)) {
			WxPayConfig::$SSLCERT_PATH = $cert["value"];
		}
		$key = pdo_get(prefix_table("cj_config"), ["key" => "apiclient_key"]);
		if (!empty($key)) {
			WxPayConfig::$SSLKEY_PATH = $key["value"];
		}
	}
	public function doPageProblem()
	{
		$data = pdo_getall(prefix_table("cj_common_problem"), ["status" => 1]);
		foreach ($data as &$value) {
			$value["hidden"] = true;
		}
		json($data);
	}
	public function doPageHistory()
	{
		$p = $this->get("p", 1);
		$page_size = 10;
		$limit = ($p - 1) * $page_size;
		$status = $this->get("status", 1) == 1 ? 1 : 0;
		$cj_order = tablename(prefix_table("cj_order"));
		$cj_prize = tablename(prefix_table("cj_prize"));
		$sql = "SELECT A.* FROM {$cj_order} A LEFT JOIN {$cj_prize} B ON A.prize_id=B.id WHERE A.member_id = {$this->member["id"]} AND B.status={$status} ORDER BY order_id DESC LIMIT {$limit}, {$page_size}";
		$order = pdo_fetchall($sql);
		foreach ($order as &$value) {
			$value["is_win"] = pdo_get(prefix_table("cj_prize_result"), ["prize_id" => $value["prize_id"], "member_id" => $this->member["id"]]);
			$value["pinfo"] = pdo_get(prefix_table("cj_prize"), ["id" => $value["prize_id"]]);
			$value["pinfo"]["minfo"] = pdo_get(prefix_table("cj_member"), ["id" => $value["pinfo"]["member_id"]]);
		}
		json($order);
	}
	public function doPageMywinn()
	{
		$p = $this->get("p", 1);
		$page_size = 10;
		$limit = ($p - 1) * $page_size;
		$cj_prize_result = tablename(prefix_table("cj_prize_result"));
		$cj_prize = tablename(prefix_table("cj_prize"));
		$sql = "SELECT A.* FROM {$cj_prize_result} A LEFT JOIN {$cj_prize} B ON A.prize_id=B.id WHERE A.member_id = {$this->member["id"]}  ORDER BY result_id DESC LIMIT {$limit}, {$page_size}";
		$order = pdo_fetchall($sql);
		foreach ($order as &$value) {
			$value["is_win"] = pdo_get(prefix_table("cj_prize_result"), ["prize_id" => $value["prize_id"], "member_id" => $this->member["id"]]);
			$value["pinfo"] = pdo_get(prefix_table("cj_prize"), ["id" => $value["prize_id"]]);
			$value["pinfo"]["minfo"] = pdo_get(prefix_table("cj_member"), ["id" => $value["pinfo"]["member_id"]]);
		}
		json($order);
	}
	public function doPageLaunch()
	{
		$p = $this->get("p", 1);
		$page_size = 10;
		$limit = ($p - 1) * $page_size;
		$status = $this->get("status", 1) == 1 ? 1 : 0;
		$prize = pdo_getall(prefix_table("cj_prize"), ["member_id" => $this->member["id"], "status" => $status], [], '', ["id desc"], "{$limit}, {$page_size}");
		foreach ($prize as &$value) {
			$value["minfo"] = $this->member;
		}
		json($prize);
	}
	public function doPageIndex()
	{
		$home_recommendation_need_check_cfg = pdo_get(prefix_table("cj_config"), ["key" => "home_recommendation_need_check"]);
		$home_recommendation_need_check = $home_recommendation_need_check_cfg["value"];
		if ($home_recommendation_need_check) {
			$sql = "select * from " . tablename(prefix_table("cj_prize")) . " where is_cancel=0 and status=0 and (is_global=0 or (is_global=1 and recommend_id>0 and chk_flag=1)) order by page_order desc, id desc";
		} else {
			$sql = "select * from " . tablename(prefix_table("cj_prize")) . " where is_cancel=0 and status=0 and (is_global=0 or (is_global=1 and recommend_id>0)) order by page_order desc, id desc";
		}
		$prize = pdo_fetchall($sql);
		$trd_session = $this->get("trd_session");
		if ($trd_session) {
			$res = pdo_get(prefix_table("cj_token"), ["token" => $trd_session]);
			$this->member["id"] = $res["member_id"];
		}
		if ($prize) {
			foreach ($prize as &$value) {
				if ($value["type"] == 1) {
					$typevalue_flag = date("m月d日 H:i", $value["typevalue"]);
					$open_year = date("Y", $value["typevalue"]);
					if ($open_year > date("Y")) {
						$typevalue_flag = $open_year . "年" . $typevalue_flag;
					}
					$value["typevalue_flag"] = $typevalue_flag;
				}
				$image = pdo_get(prefix_table("cj_resource"), ["id" => $value["attach_id"]]);
				$value["imgurl"] = $this->getImage($image["route"], false, true);
				$value["joined"] = $this->member["id"] ? pdo_get(prefix_table("cj_order"), ["prize_id" => $value["id"], "member_id" => $this->member["id"]]) : '';
				if ($value["sec_val"] != '') {
					$value["fir_label"] = "一";
				} else {
					$value["fir_label"] = '';
				}
			}
		}
		json($prize);
	}
	public function doPageTotal()
	{
		$jiezhi = date("Y-m-d", strtotime("-1 day"));
		$total = pdo_get(prefix_table("cj_prize_result"), [], ["COUNT(result_id)"]);
		if ($total) {
			$total = $total[0];
		} else {
			$total = 0;
		}
		$apply = pdo_get(prefix_table("cj_config"), ["key" => "apply_number"]);
		if (!empty($apply)) {
			$total += $apply["value"];
		}
		json(compact("jiezhi", "total"));
	}
	public function doPageRecommend()
	{
		$contact = $this->get("contact");
		if (empty($contact)) {
			json("请填写联系方式", 0);
		}
		$money = 0;
		$recommend = pdo_get(prefix_table("cj_config"), ["key" => "home_recommendation"]);
		if (empty($recommend)) {
			$money = 1500;
		} else {
			$money = $recommend["value"];
		}
		$isjump = $this->get("isjump");
		if ($isjump == 1) {
			$pay_function = pdo_get(prefix_table("cj_config"), ["key" => "pay_function"]);
			$pay_function = $pay_function ? $pay_function["value"] : 5;
			$money += $pay_function;
		}
		$redpack_money = $this->get("redpack_money");
		if ($redpack_money) {
			$money += $redpack_money;
			$red_package_fee = pdo_get(prefix_table("cj_config"), ["key" => "red_package_fee"]);
			if ($red_package_fee && $red_package_fee["value"] > 0) {
				$fee = ceil($redpack_money * $red_package_fee["value"]) / 100;
				$money += $fee;
			}
		}
		sleep(2);
		$prize = new prize();
		$member = pdo_get(prefix_table("cj_member"), ["id" => $this->member["id"]]);
		if ($member["money"] < $money) {
			$pay_money = $money - $member["money"];
			$orderid = $prize->unifiedOrder($this->member["id"], $pay_money);
			$xcx = pdo_get(prefix_table("cj_config"), ["key" => "title"]);
			$xcx = $xcx ? $xcx["value"] : '';
			$order = array("tid" => $orderid, "fee" => floatval($pay_money), "title" => $xcx . "的订单");
			global $_W;
			$_W["openid"] = $this->member["openid"];
			$_W["member"]["uid"] = $this->member["id"];
			$paydata = $this->pay($order);
			if (is_error($paydata)) {
				json($paydata["message"], 0);
			}
			json($paydata, 2);
		}
		pdo_begin();
		try {
			if (!($res = $prize->change($this->member["id"], $money, 9))) {
				throw new Exception("更新余额失败");
			}
			$data = ["member_id" => $this->member["id"], "contact" => $contact, "created" => time()];
			if (!pdo_insert(prefix_table("cj_home_recommend"), $data)) {
				throw new Exception("推荐失败");
			}
			$insert_rec_id = pdo_insertid();
			pdo_commit();
		} catch (Exception $e) {
			pdo_rollback();
			json($e->getMessage(), 0);
		}
		json($insert_rec_id);
	}
	public function doPageAdd()
	{
		if ($this->_release() != 1) {
			json("无发布权限", 0);
		}
		if (!$this->member["user_img"] && !$this->member["nickname"]) {
			json('', -1);
		}
		if (!$this->member["shop_id"]) {
			$js_default_shop = pdo_get(prefix_table("cj_config"), ["key" => "js_default_shop"]);
			if ($js_default_shop["value"]) {
				pdo_update(prefix_table("cj_member"), array("shop_id" => $js_default_shop["value"]), ["id" => $member_id]);
				$this->member["shop_id"] = $js_default_shop["value"];
			} else {
				json(array("msg" => "非店铺管理员没有发布奖品权限"), -2);
			}
		}
		$attach_id = $this->get("attach_id");
		$title = $this->get("title");
		$desc_type = $this->get("desc_type");
		$description = $this->get("description");
		$uname = $this->get("uname");
		if (0 && !$uname) {
			$uname = pdo_fetchcolumn("select shop_name from " . tablename(prefix_table("cj_shop")) . " where id=" . (int) $this->member["shop_id"]);
		}
		$wechat_no = $this->get("wechat_no");
		$wechat_title = $this->get("wechat_title");
		$fir_cname = $this->get("fir_cname");
		$sec_cname = $this->get("sec_cname");
		$trd_cname = $this->get("trd_cname");
		$fir_ptype = $this->get("fir_ptype");
		$is_share = $this->get("is_share");
		$is_command = $this->get("is_command", 0);
		$insert_rec_id = (int) $this->get("insert_rec_id", 0);
		$prize = new prize();
		$is_voucher = $prize->is_voucher($this->member["id"]);
		if ($fir_ptype == 2) {
			$fir_val = htmlspecialchars_decode($this->get("fir_cardmsg"));
			$fir_num = $is_voucher ? $this->get("fir_num") : count(json_decode($fir_val, true));
		} else {
			$fir_val = $this->get("fir_val");
			$fir_num = $this->get("fir_num", 0);
		}
		$sec_ptype = $this->get("sec_ptype");
		if ($sec_ptype == 2) {
			$sec_val = htmlspecialchars_decode($this->get("sec_cardmsg"));
			$sec_num = $is_voucher ? $this->get("sec_num") : count(json_decode($sec_val, true));
		} else {
			$sec_val = $this->get("sec_val");
			$sec_num = $this->get("sec_num", 0);
		}
		$trd_ptype = $this->get("trd_ptype");
		if ($trd_ptype == 2) {
			$trd_val = htmlspecialchars_decode($this->get("trd_cardmsg"));
			$trd_num = $is_voucher ? $this->get("trd_num") : count(json_decode($trd_val, true));
		} else {
			$trd_val = $this->get("trd_val");
			$trd_num = $this->get("trd_num", 0);
		}
		$max_group_num = 0;
		$type = $this->get("type", "people");
		$types = ["people" => 2, "time" => 1, "manual" => 3];
		$type = $types[$type];
		$typevalue = $this->get("typevalue");
		if ($type == 1) {
			$typevalue = strtotime($typevalue);
			if ($typevalue <= time()) {
				json("开奖时间已过，请重新选择时间", 0);
			}
		} else {
			if ($type == 2) {
				$num = $fir_num + $sec_num + $trd_num;
				if ($num > $typevalue) {
					json("开奖人数小于奖品数", 0);
				}
				$home_max_peoples_cfg = pdo_get(prefix_table("cj_config"), ["key" => "home_max_peoples"]);
				$home_max_peoples = (int) $home_max_peoples_cfg["value"];
				if ($home_max_peoples > 0 && $typevalue > $home_max_peoples) {
					json("开奖人数不得多于 " . $home_max_peoples, 0);
				}
			}
		}
		$money = 0;
		if (!$insert_rec_id && ($fir_ptype == 1 || $trd_ptype == 1 || $sec_ptype == 1)) {
			if ($fir_ptype == 1) {
				$money += $fir_val * $fir_num;
			}
			if ($sec_ptype == 1) {
				$money += $sec_val * $sec_num;
			}
			if ($trd_ptype == 1) {
				$money += $trd_val * $trd_num;
			}
			$red_package_fee = pdo_get(prefix_table("cj_config"), ["key" => "red_package_fee"]);
			if ($red_package_fee && $red_package_fee["value"] > 0) {
				$fee = ceil($money * $red_package_fee["value"]) / 100;
				$money += $fee;
			}
		}
		$isjump = $this->get("isjump");
		if ($isjump == 1 && !$insert_rec_id) {
			$pay_function = pdo_get(prefix_table("cj_config"), ["key" => "pay_function"]);
			$pay_function = $pay_function ? $pay_function["value"] : 5;
			$money += $pay_function;
		}
		if ($money > 0) {
			sleep(2);
			$member = pdo_get(prefix_table("cj_member"), ["id" => $this->member["id"]]);
			if ($member["money"] < $money) {
				$orderid = $prize->unifiedOrder($this->member["id"], $money);
				$xcx = pdo_get(prefix_table("cj_config"), ["key" => "title"]);
				$xcx = $xcx ? $xcx["value"] : '';
				$order = array("tid" => $orderid, "fee" => floatval($money), "title" => $xcx . "的订单");
				global $_W;
				$_W["openid"] = $this->member["openid"];
				$_W["member"]["uid"] = $this->member["id"];
				$paydata = $this->pay($order);
				if (is_error($paydata)) {
					json($paydata["message"], 0);
				}
				json($paydata, 2);
			}
			$res = $prize->change($this->member["id"], $money, 5);
			if ($res == false) {
				json("奖品发布失败", 0);
			}
		}
		$data = ["title" => $title ? $title : $this->member["nickname"] . "手机发布", "brief_description" => $title, "member_id" => $this->member["id"], "uname" => $uname, "wechat_no" => $wechat_no, "wechat_title" => $wechat_title, "typevalue" => $typevalue, "max_group_num" => $max_group_num, "desc_type" => $desc_type, "desc_text" => $desc_type, "type" => $type, "attach_id" => $attach_id, "fir_ptype" => $fir_ptype, "fir_num" => $fir_num, "fir_val" => $fir_val, "sec_ptype" => $sec_ptype, "sec_num" => $sec_num, "sec_val" => $sec_val, "trd_ptype" => $trd_ptype, "trd_num" => $trd_num, "trd_val" => $trd_val, "description" => $description, "fir_cname" => $fir_cname, "sec_cname" => $sec_cname, "trd_cname" => $trd_cname, "created" => time(), "is_share" => $is_share, "is_command" => $is_command, "default_shop_id" => $this->member["shop_id"], "recommend_id" => $insert_rec_id, "to_allfans_flag" => 1];
		if ($is_command == 1) {
			$data["command"] = $this->get("command");
			if (empty($data["command"])) {
				json("请输入口令", 0);
			}
		}
		pdo_begin();
		try {
			if ($data["fir_ptype"] == 2 && $is_voucher) {
				$data["fir_ptype"] = 3;
				$data["fir_cardid"] = $this->get("fir_cardid");
				if (!is_numeric($data["fir_cardid"])) {
					throw new Exception("请选择优惠券");
				}
				$res = $prize->deduction($this->member["shop_id"], $data["fir_cardid"], $fir_num);
				if (!$res) {
					throw new Exception($prize->error);
				}
				$data["fir_val"] = json_encode($res);
			}
			if ($data["sec_ptype"] == 2 && $is_voucher) {
				$data["sec_ptype"] = 3;
				$data["sec_cardid"] = $this->get("sec_cardid");
				if (!is_numeric($data["sec_cardid"])) {
					throw new Exception("请选择优惠券");
				}
				$res = $prize->deduction($this->member["shop_id"], $data["sec_cardid"], $sec_num);
				if (!$res) {
					throw new Exception($prize->error);
				}
				$data["sec_val"] = json_encode($res);
			}
			if ($data["trd_ptype"] == 2 && $is_voucher) {
				$data["trd_ptype"] = 3;
				$data["trd_cardid"] = $this->get("trd_cardid");
				if (!is_numeric(!$data["trd_cardid"])) {
					throw new Exception("请选择优惠券");
				}
				$res = $prize->deduction($this->member["shop_id"], $data["trd_cardid"], $trd_num);
				if (!$res) {
					throw new Exception($prize->error);
				}
				$data["trd_val"] = json_encode($res);
			}
			$robot = pdo_get(prefix_table("cj_config"), ["key" => "robot"]);
			if ($type == 1 && $robot["value"]) {
				$robot_m = pdo_get(prefix_table("cj_config"), ["key" => "robot_m"]);
				$robot_of_not_home = pdo_get(prefix_table("cj_config"), ["key" => "robot_of_not_home"]);
				if (!$robot_of_not_home["value"] && !$insert_rec_id) {
					$robot_m["value"] = false;
				}
				if ($robot_m["value"]) {
					$is_robot_max = pdo_get(prefix_table("cj_config"), ["key" => "robot_m_percent"]);
					$data["is_robot"] = 1;
					$data["is_robot_max"] = $is_robot_max["value"];
				}
			}
			file_put_contents(ATTACHMENT_ROOT . "/1.txt", var_export($data, true));
			$data["tpl_flag_begin"] = "B";
			$data["tpl_flag_open"] = "B";
			if (!pdo_insert(prefix_table("cj_prize"), $data)) {
				throw new Exception("发布失败了");
			}
			$insert_id = pdo_insertid();
			if ($data["fir_ptype"] == 1) {
				$prize->bag($this->member["id"], $insert_id, $data["fir_val"], $data["fir_num"]);
			}
			if ($data["sec_ptype"] == 1) {
				$prize->bag($this->member["id"], $insert_id, $data["sec_val"], $data["sec_num"]);
			}
			if ($data["trd_ptype"] == 1) {
				$prize->bag($this->member["id"], $insert_id, $data["trd_val"], $data["trd_num"]);
			}
			if ($isjump == 1 && $this->get("copyorjump") == 2) {
				$data = ["prize_id" => $insert_id, "appid" => $this->get("appid"), "path" => $this->get("path"), "extraData" => $this->get("extraData"), "app_name" => $this->get("appname")];
				pdo_insert(prefix_table("cj_jump_program"), $data);
			}
			pdo_commit();
			json($insert_id);
		} catch (Exception $e) {
			pdo_rollback();
			json($e->getMessage(), 0);
		}
	}
	public function doPageWriteoff()
	{
		$voucher = $this->get("voucher");
		if (empty($voucher)) {
			json("奖品不存在", 0);
		}
		if (!$this->member["shop_id"]) {
			json("没有核销奖品权限", 0);
		}
		if (is_numeric($voucher) && strlen($voucher) == strlen(ltrim($voucher, 0))) {
			if (!($voucher_arr = pdo_get(prefix_table("cj_prize_result"), ["result_id" => $voucher, "is_write_off" => 0]))) {
				json("奖品不存在或者已经被核销", 0);
			}
			$shop = pdo_get(prefix_table("cj_shop"), ["id" => $this->member["shop_id"], "is_del" => 0]);
			$prize_shop_id = pdo_fetchcolumn("SELECT default_shop_id FROM " . tablename(prefix_table("cj_prize")) . " WHERE id=" . $voucher_arr["prize_id"]);
			if (empty($shop) || $shop["id"] != $prize_shop_id) {
				json("没有核销该商品权限", 0);
			}
			$res = pdo_update(prefix_table("cj_prize_result"), ["is_write_off" => 1], ["result_id" => $voucher]);
			if ($res) {
				json(array("scan" => 0));
			}
		} else {
			if (!($voucher_arr = pdo_get(prefix_table("cj_member_voucher"), ["voucher" => $voucher, "status" => 0]))) {
				json("卡券不存在或者已经被使用", 0);
			}
			$shop = pdo_get(prefix_table("cj_shop"), ["id" => $this->member["shop_id"], "is_del" => 0]);
			if (empty($shop) || $shop["id"] != $voucher_arr["shop_id"]) {
				json("没有核销该卡券权限", 0);
			}
			$update = ["write_off_id" => $this->member["id"], "status" => 1, "write_off_time" => time()];
			if (pdo_update(prefix_table("cj_member_voucher"), $update, ["id" => $voucher_arr["id"]])) {
				pdo_update(prefix_table("cj_prize_result"), ["is_write_off" => 1], ["pvalue" => $voucher]);
				pdo_update(prefix_table("cj_voucher"), ["status" => 3], ["voucher" => $voucher]);
				json(array("scan" => 1));
			}
		}
		json("核销失败", 0);
	}
	public function doPageWriteOrder()
	{
		$order_id = $this->get("order_id");
		$voucher = $this->get("voucher");
		$voucher = pdo_get(prefix_table("cj_member_voucher"), ["voucher" => $voucher, "write_off_id" => $this->member["id"]]);
		if (empty($voucher)) {
			json("无权限", 0);
		}
		if (pdo_update(prefix_table("cj_member_voucher"), ["order_id" => $order_id], ["id" => $voucher["id"]])) {
			json('');
		}
		json("填写失败", 0);
	}
	public function doPageVoucherList()
	{
		$p = $this->get("p", 1);
		$page_size = 10;
		$limit = ($p - 1) * $page_size;
		$voucher = pdo_getall(prefix_table("cj_member_voucher"), ["member_id" => $this->member["id"]], [], '', ["id desc"], "{$limit}, {$page_size}");
		foreach ($voucher as &$value) {
			$value["goods"] = pdo_get(prefix_table("cj_goods"), ["id" => $value["goods_id"]]);
		}
		json($voucher);
	}
	public function doPageVoucherDetails()
	{
		$id = $this->get("id");
		$voucher = pdo_get(prefix_table("cj_member_voucher"), ["id" => $id, "member_id" => $this->member["id"]]);
		if (empty($voucher) || $voucher["status"] == 1) {
			json("该优惠券不存在或者已经被使用", 0);
		}
		$voucher["goods"] = pdo_get(prefix_table("cj_goods"), ["id" => $voucher["goods_id"]]);
		json($voucher);
	}
	public function doPagePayResult($data = array())
	{
		$this->_payResult($data);
	}
	public function payResult($data = array())
	{
		$this->_payResult($data);
	}
	private function _payResult($data)
	{
		global $_GPC;
		global $_W;
		$orderid = $data["tid"] ? $data["tid"] : $_GPC["orderid"];
		$order_type = trim($_GPC["order_type"]);
		$paylog = pdo_get("core_paylog", array("uniacid" => $_W["uniacid"], "module" => "hu_couda", "tid" => $orderid));
		$status = intval($paylog["status"]) === 1;
		if ($status) {
			pdo_begin();
			try {
				$order = pdo_get(prefix_table("cj_pay_order"), ["trade_no" => $orderid, "status" => 1]);
				if (empty($order)) {
					throw new Exception("订单不存在或者已经处理");
				}
				if (pdo_update(prefix_table("cj_pay_order"), ["pay_time" => time(), "status" => 2])) {
					$prize = new prize();
					$prize->change($order["member_id"], $order["money"], 1);
				}
				pdo_commit();
			} catch (Exception $e) {
				pdo_rollback();
			}
		}
		$this->result($status, $status ? "支付成功" : "支付失败");
	}
	public function doPageDetails()
	{
		$id = $this->get("id");
		if (!is_numeric($id)) {
			json("参数错误", 0);
		}
		$prize = pdo_get(prefix_table("cj_prize"), ["id" => $id]);
		if (empty($prize)) {
			json("该抽奖不存在", 0);
		}
		$prize["imgurl"] = $this->getImage($prize["attach_id"]);
		if ($prize["desc_type"] == 0) {
			$description = htmlspecialchars_decode($prize["description"]);
			$description = str_replace("</p>", "<br>", $description);
			$description = str_replace("<p>", '', $description);
			$prize["description"] = strip_tags($description, "<img><br>");
		} else {
			if ($prize["desc_type"] == 1 && $prize["description"]) {
				$description = explode(",", $prize["description"]);
				$prize["description"] = [];
				foreach ($description as $item) {
					$prize["description"][] = $this->getImage($item);
				}
			}
		}
		$t_order = tablename(prefix_table("cj_order"));
		$t_member = tablename(prefix_table("cj_member"));
		$robot = pdo_get(prefix_table("cj_config"), ["key" => "robot"]);
		$robot_m = pdo_get(prefix_table("cj_config"), ["key" => "robot_m"]);
		$is_robot_max = (int) $prize["is_robot_max"];
		$is_robot = $robot ? $robot["value"] : 0;
		$is_robot_m = $robot_m ? $robot_m["value"] : 0;
		if ($is_robot && ($prize["is_global"] == 0 && $prize["is_robot"] == 1 || $is_robot_m && $prize["is_global"] == 1 && $prize["is_robot"] == 1)) {
			if ($prize["type"] == 1) {
				$time = $prize["open_time"] > 0 ? $prize["open_time"] : time();
			} else {
				$time = time();
			}
			if ($is_robot_max) {
				$people = $is_robot_max / floor(($prize["typevalue"] - $prize["created"]) / 60) * floor(($time - $prize["created"]) / 60);
				$people = (int) $people;
				$robot_num = $is_robot_max;
			} else {
				$people = floor(($time - $prize["created"]) / 60 * 10);
				$robot_num = pdo_fetchcolumn("SELECT COUNT(*) FROM " . tablename(prefix_table("cj_member")) . " WHERE is_robot=1");
			}
			$people = $people < $robot_num ? $people : $robot_num;
			$prize["apply_num"] += $people;
		}
		$apply = [];
		if ($prize["apply_num"] > 0) {
			$l = $prize["apply_num"] > 6 ? 6 : $prize["apply_num"];
			$where = "B.prize_id={$id}";
			if ($is_robot && $prize["is_robot"] == 1) {
				$where .= " OR (A.is_robot=1 and (B.prize_id={$id} or B.prize_id is null))";
			}
			$sql = "SELECT A.user_img,B.code_num FROM {$t_member} AS A LEFT JOIN {$t_order} AS B ON A.id=B.member_id WHERE {$where} ORDER BY B.code_num DESC,A.is_robot ASC,A.id LIMIT {$l}";
			$apply = pdo_fetchall($sql);
			foreach ($apply as &$apply_row) {
				$apply_row["code_num"] = $apply_row["code_num"] ?: 1;
			}
		}
		$prize["jump_info"] = pdo_get(prefix_table("cj_jump_program"), ["prize_id" => $id]);
		$my_apply = pdo_get(prefix_table("cj_order"), ["member_id" => $this->member["id"], "prize_id" => $id]);
		$my_prize = pdo_get(prefix_table("cj_prize_result"), ["prize_id" => $id, "member_id" => $this->member["id"]]);
		$my_in_prize = [];
		$in_prize = [];
		$getname = function ($type) use(&$prize) {
			if ($prize[$type . "_num"] < 1) {
				return '';
			}
			if ($prize[$type . "_ptype"] > 1) {
				return $prize[$type . "_cname"];
			}
			return $prize[$type . "_ptype"] == 0 ? $prize[$type . "_val"] : "红包" . $prize["fir_val"] . "￥";
		};
		$in_prize_sort = ["fir" => ["name" => $getname("fir"), "list" => []], "sec" => ["name" => $getname("sec"), "list" => []], "trd" => ["name" => $getname("trd"), "list" => []]];
		if ($prize["status"] == 1 && $prize["is_cancel"] == 0) {
			$in_prize = pdo_getall(prefix_table("cj_prize_result"), ["prize_id" => $id], [], '', ["type ASC"]);
			foreach ($in_prize as &$value) {
				$value["minfo"] = pdo_get(prefix_table("cj_member"), ["id" => $value["member_id"]]);
				$value["minfo"]["address"] = pdo_get(prefix_table("cj_address"), ["member_id" => $value["member_id"]]);
				if ($value["member_id"] == $this->member["id"]) {
					$my_in_prize[] = $value;
				}
				$in_prize_sort[$value["type"]]["list"][] = $value;
			}
		}
		$prize["max_group_num"] = 0;
		$group = [];
		if ($my_apply && $prize["max_group_num"] > 0) {
			$group = pdo_get(prefix_table("cj_group_join"), ["member_id" => $this->member["id"], "prize_id" => $id]);
			$sql = "SELECT A.user_img,A.nickname FROM {$t_member} AS A LEFT JOIN {$t_order} AS B ON A.id=B.member_id WHERE B.group_join_id={$group["id"]}";
			$group["apply"] = pdo_fetchall($sql);
		}
		$group_code = $this->get("group_code");
		if (empty($my_apply) && $group_code && $prize["max_group_num"] > 0) {
			$group = pdo_get(prefix_table("cj_group_join"), ["id" => $group_code, "prize_id" => $id]);
			if (!empty($group)) {
				$sql = "SELECT A.user_img,A.nickname FROM {$t_member} AS A LEFT JOIN {$t_order} AS B ON A.id=B.member_id WHERE B.group_join_id={$group["id"]}";
				$group["apply"] = pdo_fetchall($sql);
			}
		}
		if ($prize["is_global"] == 1) {
			$prize["minfo"] = pdo_get(prefix_table("cj_member"), ["id" => $prize["member_id"]]);
		} else {
			$prize["minfo"] = ["nickname" => "系统"];
		}
		$sql = "SELECT * FROM " . tablename(prefix_table("cj_prize_code")) . " WHERE prize_id={$id} AND is_prize=1 LIMIT 9";
		$prize["code"] = pdo_fetchall($sql);
		$prize["apply"] = $apply;
		$prize["my_apply"] = $my_apply;
		$prize["my_prize"] = $my_prize;
		$prize["group"] = $group;
		$prize["in_prize"] = $in_prize;
		$prize["my_in_prize"] = $my_in_prize;
		$prize["is_winning"] = $my_in_prize ? 1 : 0;
		$prize["is_mine"] = $this->member["id"] == $prize["member_id"] ? 1 : 0;
		$prize["is_buy"] = $my_apply ? 1 : 0;
		$prize["share_sub_url"] = $prize["imgurl"];
		$prize["member"] = $this->member;
		$prize["in_prize_sort"] = $in_prize_sort;
		if ($prize["type"] == 1) {
			$prize["typevalue"] = date("Y-m-d H:i:s", $prize["typevalue"]);
		}
		json($prize);
	}
	public function doPageAllcode()
	{
		$id = $this->get("id");
		if (!is_numeric($id)) {
			json("参数错误", 0);
		}
		$prize = pdo_get(prefix_table("cj_prize"), ["id" => $id]);
		if (empty($prize)) {
			json("该抽奖不存在", 0);
		}
		$code = pdo_getall(prefix_table("cj_prize_code"), ["prize_id" => $id]);
		json($code);
	}
	public function doPagePrizeWins()
	{
		$id = $this->get("id");
		if (!is_numeric($id)) {
			json("参数错误", 0);
		}
		$prize = pdo_get(prefix_table("cj_prize"), ["id" => $id]);
		if (empty($prize) || $prize["status"] != 1 || $this->member["id"] != $prize["member_id"]) {
			json("该抽奖不存在", 0);
		}
		$in_prize = pdo_getall(prefix_table("cj_prize_result"), ["prize_id" => $id], [], '', ["type ASC"]);
		foreach ($in_prize as &$value) {
			$value["minfo"] = pdo_get(prefix_table("cj_member"), ["id" => $value["member_id"]]);
			$value["minfo"]["address"] = pdo_get(prefix_table("cj_address"), ["member_id" => $value["member_id"]]);
		}
		json(["prize" => $prize, "list" => $in_prize]);
	}
	public function doPageAddress()
	{
		$name = $this->get("name");
		$phone = $this->get("phone");
		$address = $this->get("address");
		$data = ["name" => $name, "phone" => $phone, "address" => $address];
		pdo_update(prefix_table("cj_address"), $data, ["member_id" => $this->member["id"]]);
		json("ok");
	}
	public function doPageGetAddress()
	{
		$data = pdo_get(prefix_table("cj_address"), ["member_id" => $this->member["id"]]);
		if (empty($data)) {
			pdo_insert(prefix_table("cj_address"), ["member_id" => $this->member["id"], "addtime" => time()]);
			$data = ["name" => '', "phone" => '', "address" => ''];
		}
		json($data);
	}
	public function doPageAll()
	{
		$id = $this->get("id");
		$p = $this->get("p", 1);
		$list_show_type = pdo_get(prefix_table("cj_config"), ["key" => "list_show_type"]);
		$page_size = $list_show_type["value"] == 1 ? 120 : 10;
		$limit = ($p - 1) * $page_size;
		$robot = pdo_get(prefix_table("cj_config"), ["key" => "robot"]);
		$robot_m = pdo_get(prefix_table("cj_config"), ["key" => "robot_m"]);
		$is_robot = $robot ? $robot["value"] : 0;
		$is_robot_m = $robot_m ? $robot_m["value"] : 0;
		$prize = pdo_get(prefix_table("cj_prize"), ["id" => $id]);
		if ($is_robot && ($prize["is_global"] == 0 && $prize["is_robot"] == 1 || $is_robot_m && $prize["is_global"] == 1 && $prize["is_robot"] == 1)) {
			if ($prize["type"] == 1) {
				$time = $prize["open_time"] > 0 ? $prize["open_time"] : time();
			} else {
				$time = time();
			}
			$is_robot_max = (int) $prize["is_robot_max"];
			if ($is_robot_max) {
				$people = $is_robot_max / floor(($prize["typevalue"] - $prize["created"]) / 60) * floor(($time - $prize["created"]) / 60);
				$people = (int) $people;
				$robot_num = $is_robot_max;
			} else {
				$people = floor(($time - $prize["created"]) / 60 * 10);
				$robot_num = pdo_fetchcolumn("SELECT COUNT(*) FROM " . tablename(prefix_table("cj_member")) . " WHERE is_robot=1");
			}
			$people = $people < $robot_num ? $people : $robot_num;
			$people += $prize["apply_num"];
			if ($limit > $people) {
				json([]);
			}
			$page_size = $limit + $page_size > $people ? $people % $page_size : $page_size;
		}
		$where = "B.prize_id={$id}";
		if ($is_robot && $prize["is_robot"] == 1) {
			$where .= " OR (A.is_robot=1 and (B.prize_id={$id} or B.prize_id is null))";
		}
		$t_order = tablename(prefix_table("cj_order"));
		$t_member = tablename(prefix_table("cj_member"));
		$sql = "SELECT A.user_img,A.id,A.nickname,B.code_num FROM {$t_member} AS A LEFT JOIN {$t_order} AS B ON A.id=B.member_id WHERE {$where} ORDER BY B.code_num DESC,B.order_id DESC,A.is_robot ASC,A.id LIMIT {$limit}, {$page_size}";
		$apply = pdo_fetchall($sql);
		if ($apply) {
			$cj_prize_result = tablename(prefix_table("cj_prize_result"));
			foreach ($apply as &$value) {
				$value["win_num"] = pdo_fetchcolumn("SELECT COUNT(*) FROM {$cj_prize_result} WHERE member_id={$value["id"]}");
				$value["code_num"] = $value["code_num"] ?: 1;
			}
		}
		json($apply);
	}
	public function doPageApply()
	{
		if (!$this->member["user_img"] && !$this->member["nickname"]) {
			json('', -1);
		}
		$id = $this->get("id");
		$invitation_id = $this->get("invitation_id", 0);
		if (!$invitation_id || $invitation_id == $this->member["id"]) {
			$invitation_id = 0;
		}
		$prize = pdo_get(prefix_table("cj_prize"), ["id" => $id]);
		if (empty($prize)) {
			json("该抽奖不存在", 0);
		}
		$apply = pdo_get(prefix_table("cj_order"), ["prize_id" => $id, "member_id" => $this->member["id"]]);
		if (!empty($apply)) {
			json("您已经参与过", 0);
		}
		pdo_begin();
		try {
			$group_id = 0;
			if ($prize["max_group_num"] > 0 && false) {
				$group_join_id = $this->get("group_code");
				if (!empty($group_join_id)) {
					$group = pdo_get(prefix_table("cj_group_join"), ["id" => $group_join_id]);
					if (!empty($group) && $group["prize_id"] == $id && $group["apply_num"] < $group["number"]) {
						$cj_group_join = tablename(prefix_table("cj_group_join"));
						$sql = "UPDATE {$cj_group_join} SET apply_num=apply_num+1 WHERE id={$group_join_id} AND apply_num<{$group["number"]}";
						if (pdo_query($sql)) {
							$group_id = $group_join_id;
						}
					}
				}
				if ($group_id == 0) {
					$group = ["prize_id" => $id, "member_id" => $this->member["id"], "number" => $prize["max_group_num"], "apply_num" => 1, "created" => time()];
					pdo_insert(prefix_table("cj_group_join"), $group);
					$group_id = pdo_insertid();
				}
			}
			if ($prize["is_command"] == 1) {
				if (!($command = $this->get("command"))) {
					json("请输入口令", 0);
				}
				if ($command != $prize["command"]) {
					json("口令错误", 0);
				}
			}
			$order = ["order_sn" => date("YmdHis", time()) . $this->member["id"] . mt_rand(1000, 9999), "prize_id" => $id, "group_join_id" => $group_id, "member_id" => $this->member["id"], "addtime" => time()];
			if (!pdo_insert(prefix_table("cj_order"), $order)) {
				throw new Exception("参加失败");
			}
			$cj_prize = tablename(prefix_table("cj_prize"));
			$sql = "UPDATE {$cj_prize} SET apply_num=apply_num+1 WHERE id={$id}";
			if (!pdo_query($sql)) {
				throw new Exception("参加失败");
			}
			$p = new prize();
			$code = $p->create_code($id, $this->member["id"]);
			if (!$code) {
				throw new Exception($p->error);
			}
			if ($invitation_id) {
				$p->create_code($id, $invitation_id, $this->member["id"], 2);
			}
			pdo_commit();
			if ($prize["type"] == 2 && $prize["typevalue"] - 1 <= $prize["apply_num"]) {
				$p->open($id);
			}
//            $res = "SELECT type,typevalue FROM {$cj_prize} WHERE id={$id}";
//			if($res){
			    if ($prize['type'] == 1){
			        $code = '开奖时间为' . date("Y-m-d H:i",$prize['typevalue']);
                }else if ($prize['type'] == 2){
			        $code = '当抽奖人数达到' . $prize['typevalue'] . '人时，将自动开奖';
                }else if ($prize['type'] == 3){
			        $code = '该抽奖由抽奖发起人手动开奖';
                }
//            }
			json($code);
		} catch (Exception $e) {
			$error = $e->getMessage();
			pdo_rollback();
		}
		json($error, 0);
	}
	public function doPageCode()
	{
		$p = $this->get("p", 1);
		$page_size = 10;
		$limit = ($p - 1) * $page_size;
		$member_id = $this->get("member_id") ?: $this->member["id"];
		$prize_id = $this->get("id");
		if (empty($member_id) || empty($prize_id)) {
			json("参数错误", 0);
		}
		$member = pdo_get(prefix_table("cj_member"), ["id" => $member_id]);
		if ($member["is_robot"] == 1) {
			$code = pdo_get(prefix_table("cj_prize_code"), ["member_id" => $member_id, "prize_id" => $prize_id]);
			if (empty($code)) {
				$p = new prize();
				$p->create_code($prize_id, $member_id, 0, 1, 2);
			}
		}
		$cj_prize_code = tablename(prefix_table("cj_prize_code"));
		if ($this->get("ispage") == 1) {
			$sql = "SELECT * FROM {$cj_prize_code} WHERE member_id={$member_id} AND prize_id={$prize_id} ORDER BY id ASC";
		} else {
			$sql = "SELECT * FROM {$cj_prize_code} WHERE member_id={$member_id} AND prize_id={$prize_id} ORDER BY id ASC LIMIT {$limit},{$page_size}";
		}
		$code = pdo_fetchall($sql);
		if (!empty($code)) {
			foreach ($code as &$value) {
				$id = $value["type"] == 1 ? $value["member_id"] : $value["be_invited_id"];
				$value["minfo"] = pdo_get(prefix_table("cj_member"), ["id" => $id]);
			}
		}
		json($code);
	}
	public function doPageOpenPrize()
	{
		$id = $this->get("id");
		if (!is_numeric($id)) {
			json("参数错误");
		}
		$prize = pdo_get(prefix_table("cj_prize"), ["id" => $id]);
		if (empty($prize) || $prize["member_id"] != $this->member["id"] || $prize["apply_num"] < 1 || $prize["type"] != 3) {
			json("还没人参与,无法开奖");
		}
		$p = new prize();
		if ($p->open($id)) {
			json("开奖成功");
		}
		json($p->error, 0);
	}
	public function doPageOpen()
	{
		$cj_prize = tablename(prefix_table("cj_prize"));
		$t = time();
		$m_prize = new prize();
		$sql = "SELECT * FROM {$cj_prize} WHERE status=0 AND is_cancel=0 AND ((type=1 AND typevalue<{$t}) or (type=2 and typevalue<=apply_num))";
		$data = pdo_fetchall($sql);
		if (!empty($data)) {
			foreach ($data as $value) {
				$m_prize->open($value["id"]);
			}
		}
		$in_task_time = time();
		$sql = "select * from " . tablename(prefix_table("cj_pre_prize")) . " where in_task=1 and in_task_time<='{$in_task_time}'";
		$data = pdo_fetchall($sql);
		if ($data) {
			foreach ($data as $line) {
				$prize_id = $m_prize->add($line);
			}
		}
		$this->sendTpl();
		echo "ok";
	}
	public function sendTpl()
	{
		$option = ["appid" => $this->w["uniaccount"]["key"], "secret" => $this->w["uniaccount"]["secret"]];
		$wxObj = new Wxadoc($option);
		$config = pdo_get(prefix_table("cj_config"), ["key" => "tpl_to_allfans_begin"]);
		$tpl_to_allfans_begin = $config["value"];
		if ($tpl_to_allfans_begin) {
			$time = time() - 7 * 86400;
			$home_recommendation_need_check_cfg = pdo_get(prefix_table("cj_config"), ["key" => "home_recommendation_need_check"]);
			$home_recommendation_need_check = $home_recommendation_need_check_cfg["value"];
			if ($home_recommendation_need_check) {
				$sql = "SELECT * FROM " . tablename(prefix_table("cj_prize")) . " WHERE is_cancel=0 and status=0 and tpl_flag_begin!='' and tpl_flag_begin!='F' and ((is_global=1 and recommend_id > 0 and member_id>0 and chk_flag=1) or is_global=0)";
			} else {
				$sql = "SELECT * FROM " . tablename(prefix_table("cj_prize")) . " WHERE is_cancel=0 and status=0 and tpl_flag_begin!='' and tpl_flag_begin!='F' and ((is_global=1 and recommend_id > 0 and member_id>0) or is_global=0)";
			}
			$cj_prize_arr = pdo_fetchall($sql);
			foreach ($cj_prize_arr as $line) {
				$begin_member = $line["tpl_flag_begin"] == "B" ? 0 : (int) $line["tpl_flag_begin"];
				$get_num = 100;
				$members = pdo_fetchall("SELECT id, openid FROM " . tablename(prefix_table("cj_member")) . " WHERE is_robot=0 order by id asc limit {$begin_member}, {$get_num}");
				if ($members) {
					if ($line["is_global"] == 0) {
						$data_tpl = ["keyword1" => ["value" => $line["uname"] ? $line["uname"] : "新抽奖活动发布"], "keyword2" => ["value" => $line["title"]], "keyword3" => ["value" => $line["type"] == 1 ? "活动结束时间 " . date("Y-m-d H:i:s", $line["typevalue"]) : "活动限约人数 " . $line["typevalue"] . " 人"]];
						foreach ($members as $member) {
							$form_id = pdo_fetch("SELECT * FROM " . tablename(prefix_table("cj_form_id")) . " WHERE member_id='" . $member["id"] . "' AND created > {$time}");
							if ($form_id) {
								$wxObj->sendTemplateMessage($member["openid"], $tpl_to_allfans_begin, $data_tpl, $form_id["form_id"], "pages/partake/partake?id=" . $line["id"]);
								pdo_delete(prefix_table("cj_form_id"), ["id" => $form_id["id"]]);
							}
						}
					} else {
						$member_name = pdo_fetchcolumn("select nickname from " . tablename(prefix_table("cj_member")) . " where id=" . $line["member_id"]);
						$data_tpl = ["keyword1" => ["value" => $member_name ? $member_name : $line["uname"]], "keyword2" => ["value" => $line["title"]], "keyword3" => ["value" => $line["type"] == 1 ? "活动结束时间 " . date("Y-m-d H:i:s", $line["typevalue"]) : "活动限约人数 " . $line["typevalue"] . " 人"]];
						foreach ($members as $member) {
							$form_id = pdo_fetch("SELECT * FROM " . tablename(prefix_table("cj_form_id")) . " WHERE member_id='" . $member["id"] . "' AND created > {$time}");
							if ($form_id) {
								$wxObj->sendTemplateMessage($member["openid"], $tpl_to_allfans_begin, $data_tpl, $form_id["form_id"], "pages/partake/partake?id=" . $line["id"]);
								pdo_delete(prefix_table("cj_form_id"), ["id" => $form_id["id"]]);
							}
						}
					}
					pdo_update(prefix_table("cj_prize"), ["tpl_flag_begin" => $begin_member + $get_num], ["id" => $line["id"]]);
				} else {
					pdo_update(prefix_table("cj_prize"), ["to_allfans_flag" => 2, "tpl_flag_begin" => "F"], ["id" => $line["id"]]);
				}
			}
		}
		$config = pdo_get(prefix_table("cj_config"), ["key" => "open_prize_notice"]);
		if (empty($config)) {
			return true;
		}
		$tpl_to_organiser = pdo_get(prefix_table("cj_config"), ["key" => "tpl_to_organiser"]);
		$tpl_to_organiser = $tpl_to_organiser["value"];
		$template = pdo_getall(prefix_table("cj_template_message"), ["type" => 1, "status" => 0]);
		if (empty($template)) {
			return true;
		}
		foreach ($template as $value) {
			$prize_organiser = '';
			$prize = pdo_get(prefix_table("cj_prize"), ["id" => $value["relation_id"]]);
			$kv2 = '';
			if ($prize["member_id"] > 0) {
				$member = pdo_get(prefix_table("cj_member"), ["id" => $prize["member_id"]]);
				$kv2 = $member["nickname"] . "发起的";
				$prize_organiser = $member["openid"];
			}
			if ($prize["fir_ptype"] == 0) {
				$title = $prize["fir_val"];
			} else {
				if ($prize["fir_ptype"] == 1) {
					$title = "现金红包";
				} else {
					$title = $prize["fir_cname"];
				}
			}
			$data = ["keyword1" => ["value" => "抽奖已经开启,快去看看你是不是幸运儿!"], "keyword2" => ["value" => $title]];
			pdo_update(prefix_table("cj_template_message"), ["status" => 1], ["id" => $value["id"]]);
			$order = pdo_getall(prefix_table("cj_order"), ["prize_id" => $value["relation_id"]]);
			$is_robot_num = 0;
			foreach ($order as $line) {
				$member = pdo_get(prefix_table("cj_member"), ["id" => $line["member_id"]]);
				if ($member["is_robot"] != 1) {
					$time = time() - 7 * 86400;
					$form_id = pdo_fetch("SELECT * FROM " . tablename(prefix_table("cj_form_id")) . " WHERE member_id={$line["member_id"]} AND created > {$time}");
					if (!empty($member) && !empty($form_id)) {
						$wxObj->sendTemplateMessage($member["openid"], $config["value"], $data, $form_id["form_id"], "pages/partake/partake?id=" . $value["relation_id"]);
						pdo_delete(prefix_table("cj_form_id"), ["id" => $form_id["id"]]);
					}
				} else {
					$is_robot_num++;
				}
			}
			if ($prize_organiser && $tpl_to_organiser) {
				$time = time() - 7 * 86400;
				$form_id = pdo_fetch("SELECT * FROM " . tablename(prefix_table("cj_form_id")) . " WHERE member_id='" . $prize["member_id"] . "' AND created > {$time}");
				$data = ["keyword1" => ["value" => "您发起的抽奖活动已开奖,快去看看中奖信息吧!"], "keyword2" => ["value" => "总参与人数：" . count($order) . ($is_robot_num ? "【其中机器人 " . $is_robot_num . "】" : '')]];
				if ($form_id) {
					$wxObj->sendTemplateMessage($prize_organiser, $tpl_to_organiser, $data, $form_id["form_id"], "pages/partake/partake?id=" . $value["relation_id"]);
					pdo_delete(prefix_table("cj_form_id"), ["id" => $form_id["id"]]);
				}
			}
		}
		return true;
	}
	public function doPageConfigarr()
	{
		$key = $this->get("key");
		if (empty($key)) {
			json("参数错误", 0);
		}
		$data = [];
		$keys = explode(",", $key);
		foreach ($keys as $key) {
			if ($key != "show_user_totals") {
				$config = pdo_get(prefix_table("cj_config"), ["key" => $key]);
				if ($key == "default_prize_img") {
					if ($config["value"]) {
						$config["value"] = $this->getImage($config["value"]);
					} else {
						$config["value"] = $this->w["siteroot"] . "/addons/" . $this->gpc["m"] . "/template/attach2.jpg";
					}
				} else {
					if ($key == "relief_desc") {
						$config["value"] = str_replace("\n", "<br>", $config["value"]);
						$config["value"] = str_replace("\r", "<br>", $config["value"]);
					}
				}
				$data[$key] = $config["value"];
			} else {
				$prize = pdo_get(prefix_table("cj_prize"), ["id" => (int) $this->get("id")]);
				$robot = pdo_get(prefix_table("cj_config"), ["key" => "robot"]);
				$robot_m = pdo_get(prefix_table("cj_config"), ["key" => "robot_m"]);
				$is_robot_max = (int) $prize["is_robot_max"];
				$is_robot = $robot ? $robot["value"] : 0;
				$is_robot_m = $robot_m ? $robot_m["value"] : 0;
				if ($is_robot && ($prize["is_global"] == 0 && $prize["is_robot"] == 1 || $is_robot_m && $prize["is_global"] == 1 && $prize["is_robot"] == 1)) {
					if ($prize["type"] == 1) {
						$time = $prize["open_time"] > 0 ? $prize["open_time"] : time();
					} else {
						$time = time();
					}
					if ($is_robot_max) {
						$people = $is_robot_max / floor(($prize["typevalue"] - $prize["created"]) / 60) * floor(($time - $prize["created"]) / 60);
						$people = (int) $people;
						$robot_num = $is_robot_max;
					} else {
						$people = floor(($time - $prize["created"]) / 60 * 10);
						$robot_num = pdo_fetchcolumn("SELECT COUNT(*) FROM " . tablename(prefix_table("cj_member")) . " WHERE is_robot=1");
					}
					$people = $people < $robot_num ? $people : $robot_num;
					$prize["apply_num"] += $people;
				}
				$data[$key] = (int) $prize["apply_num"];
			}
		}
		json($data);
	}
	public function doPageConfig()
	{
		$key = $this->get("key");
		if (empty($key)) {
			json("参数错误", 0);
		}
		$config = pdo_get(prefix_table("cj_config"), ["key" => $key]);
		if ($config) {
			$config = $config["value"];
		} else {
			if ($key == "pay_function") {
				pdo_insert(prefix_table("cj_config"), ["key" => "pay_function", "value" => 5]);
				$config = 5;
			} else {
				if ($key == "home_recommendation") {
					pdo_insert(prefix_table("cj_config"), ["key" => "home_recommendation", "value" => 1500]);
					$config = 1500;
				}
			}
		}
		json($config);
	}
	public function doPageAdvertisement()
	{
		$show_place = $this->get("get_type");
		$now = time();
		$ad_data = pdo_fetch("select * from " . tablename(prefix_table("cj_ad")) . " where show_place='{$show_place}' and begin_time<='{$now}' and end_time>='{$now}' order by begin_time desc limit 1");
		if ($ad_data["ad_type"] == 1) {
			$data = ["type" => 0, "advertisement" => $ad_data["a_unit_id"]];
			json($data);
		} else {
			if ($ad_data["ad_type"] == 2) {
				$advertisement = ["image" => $this->getImage($ad_data["d_pic"]), "appId" => $ad_data["d_appid"], "xcx_path" => $ad_data["d_page"], "extradata" => $ad_data["d_para"]];
				$data = ["type" => 1, "advertisement" => $advertisement];
				json($data);
			}
		}
		$type = pdo_get(prefix_table("cj_config"), ["key" => "advertisement_type"]);
		if (empty($type)) {
			json('', 2);
		}
		$advertisement = pdo_get(prefix_table("cj_config"), ["key" => "advertisement"]);
		if (empty($advertisement)) {
			json('', 2);
		}
		if ($type["value"] == 1) {
			$advertisement["value"] = json_decode($advertisement["value"], true);
			$advertisement["value"]["image"] = $this->getImage($advertisement["value"]["image"]);
		}
		$data = ["type" => $type["value"], "advertisement" => $advertisement["value"]];
		json($data);
	}
	public function doPagePopupadv()
	{
		$adv = pdo_get(prefix_table("cj_config"), ["key" => "popup_adv"]);
		if (empty($adv)) {
			json('', 2);
		}
		$adv = json_decode($adv["value"], true);
		if (empty($adv["image"]) || empty($adv["appId"])) {
			json('', 2);
		}
		$adv["image"] = $this->getImage($adv["image"]);
		json($adv);
	}
	public function doPageJump()
	{
		$data = pdo_getall(prefix_table("cj_program"));
		json($data);
	}
	public function get($key, $default = '')
	{
		return isset($this->gpc[$key]) ? $this->gpc[$key] : $default;
	}
	public function getImage($route, $path = false, $w7_rule = false)
	{
		global $_W;
		if (empty($route)) {
			$default_prize_img = pdo_get(prefix_table("cj_config"), ["key" => "default_prize_img"]);
			if ($default_prize_img["value"]) {
				return $this->getImage($default_prize_img["value"]);
			}
			return $_W["siteroot"] . "addons/hu_couda/template/images/attach2.jpg";
		}
		if (is_numeric($route)) {
			$image = pdo_get(prefix_table("cj_resource"), ["id" => $route]);
			$route = $image["route"];
		}
		if ($path == true) {
			return $route;
		}
		if ($this->_is_oss()) {
			return $this->w["attachurl"] . $route;
		}
		return $this->w["siteroot"] . "attachment/" . ltrim($route, "/");
	}
	public function doPagePay()
	{
		$orderid = $this->get("orderid", null);
		if (!$this->hasOrder($orderid)) {
			$this->result(1, "非用户订单");
		}
		$order = array("tid" => $orderid, "fee" => floatval(0.01), "title" => "测试订单");
		$paydata = $this->pay($order);
		if (is_error($paydata)) {
			$this->result($paydata["errno"], $paydata["message"]);
		}
		$this->result(0, '', $paydata);
	}
	private function hasOrder($orderid)
	{
		return true;
	}
	private function _is_oss()
	{
		$is_oss = pdo_get(prefix_table("cj_config"), ["key" => "is_oss"]);
		if ($is_oss) {
			$is_oss = $is_oss["value"];
		} else {
			$is_oss = 0;
		}
		return !empty($this->w["setting"]["remote"]["type"]) && $is_oss == 0;
	}

    /**
     * 幸运币中心
     */
	public function doPageLuck(){
        $sql = "SELECT * FROM " . tablename(prefix_table("cj_member_goods")) . "WHERE isdelete=0";
        $goodsList = pdo_fetchall($sql);
        $data = [];
        $data['integral'] = $this->member['integral'];
        $data['goodsList'] = $goodsList;
        json($data);
    }

    /**
     * 兑换商品详情
     */
    public function doPageGood(){
        $gid = $this->get("gid");
        $sql = "SELECT * FROM " . tablename(prefix_table("cj_member_goods")) . "WHERE id=" . $gid;
        $good = pdo_fetch($sql);
        json($good);
    }
    /**
     * 兑换商品
     */
    public  function doPageChange(){
        $gid = $this->get("gid");
        $mid = $this->member['id'];
        $account = '';
        $password = '';
        $data = [];
        $sql = "SELECT * FROM " . tablename(prefix_table("cj_member_goods")) . "WHERE id=" . $gid;
        $good = pdo_fetch($sql);
        $sql1 = "SELECT integral FROM " . tablename(prefix_table("cj_member")) . "WHERE id=" . $mid;
        $member = pdo_fetch($sql1);
        if ($good['integral'] > $member['integral']){
            $data['status'] = 0;//积分不够
            $data['cha'] = $good['integral'] - $member['integral'];
        }else{
            if ($good['nstock'] <= 0){
                $data['status'] = 1;//库存不足
            }else{
                $memberNow = $member['integral'] - $good['integral'];
                $nstockNow = $good['nstock']-1;
                $statusIn = $good['type'] == 1?3:1;
                pdo_begin();
                if (!pdo_update(prefix_table('cj_member'), array("integral" => $memberNow), ["id" => $mid])){
                    $data['status'] = '2';//积分更新错误
                    json($data);
                }
                if (!pdo_update(prefix_table('cj_member_goods'), array("nstock" => $nstockNow), ["id" => $gid])){
                    $data['status'] = '3';//库存更新错误
                    json($data);
                }
                //虚拟商品
                if ($good['type'] == 1){
                    $sql = "SELECT * FROM " . tablename(prefix_table("cj_member_account")) . "WHERE is_use=0";
                    $account = pdo_fetch($sql);
                    if (!$account){
                        $data['status'] = '6';//奖品获取失败
                        json($data);
                    }
                    if (!pdo_update(prefix_table('cj_member_account'),array('is_use'=>1),['id'=>$account['id']])){
                        $data['status'] = '7';//更新奖品获取
                        json($data);
                    }
                    if (!pdo_insert(prefix_table('cj_member_integral'), array('mid'=>$mid, 'point'=>$good['integral'], 'npoint'=>$memberNow, 'addtime'=>time(),'updatetime'=>time(), 'position'=>'用于兑换'.$good['gname'], 'type'=>2, 'gid'=>$gid, 'status'=>$statusIn, 'aid'=>$account['id']))){
                        $data['status'] = '4';//历史更新错误
                        json($data);
                    }
                    //带密码
                    if ($account['type'] == 1){
                        $data['password'] = $account['password'];
                    }
                    $data['account'] = $account['account'];
                    //带不带密码，0不带1带
                    $data['atype'] = intval($account['type']);
                    //商品类型1虚拟2实物
                    $data['gtype'] = intval($good['type']);
                    $data['stock'] = $nstockNow;
                }else{

                }
                pdo_commit();
                $data['status'] = '5';//成功
            }
        }
        json($data);
    }
    /**
     * 任务中心
     */
    public function doPageProgram(){
        $mid = $this->member['id'];
        $sql = "SELECT pid FROM " . tablename(prefix_table("cj_member_integral")) . "WHERE mid=" . $mid . "and type=1";
        $pidList = pdo_fetchall($sql);
        $pidStr = '';
        if ($pidList){
            foreach ($pidList as $key=>$val){
                if ($key == 0){
                    $pidStr = $val;
                }else{
                    $pidStr .= $val . ",";
                }
            }
        }else {
            $pidStr = '0';
        }
        $sql1 = "SELECT * FROM " . tablename(prefix_table("cj_member_program")) . "WHERE id not in(" . $pidStr . ")";
        $programList = pdo_fetchall($sql1);
        json($programList);
    }
}
function json($info, $status = 1)
{
	$info = ["info" => $info, "status" => $status];
	$info = json_encode($info, JSON_UNESCAPED_UNICODE);
	header("Content-Type: application/json;charset=utf-8");
	die($info);
}
function yuan_img($imgpath = "./tx.jpg")
{
	$ext = pathinfo($imgpath);
	$src_img = null;
	switch ($ext["extension"]) {
		case "jpg":
			$src_img = imagecreatefromjpeg($imgpath);
			break;
		case "png":
			$src_img = imagecreatefrompng($imgpath);
			break;
	}
	$wh = getimagesize($imgpath);
	$w = $wh[0];
	$h = $wh[1];
	$w = min($w, $h);
	$h = $w;
	$img = imagecreatetruecolor($w, $h);
	imagesavealpha($img, true);
	$bg = imagecolorallocatealpha($img, 255, 255, 255, 127);
	imagefill($img, 0, 0, $bg);
	$r = ceil($w / 2);
	$y_x = $r;
	$y_y = $r;
	$x = 0;
	while ($x < $w) {
		$y = 0;
		while ($y < $h) {
			$rgbColor = imagecolorat($src_img, $x, $y);
			if (($x - $r) * ($x - $r) + ($y - $r) * ($y - $r) < $r * $r) {
				imagesetpixel($img, $x, $y, $rgbColor);
			}
			$y++;
		}
		$x++;
	}
	return $img;
}