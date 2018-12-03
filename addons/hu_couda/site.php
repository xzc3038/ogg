<?php
defined('IN_IA') or exit('Access Denied');
define('ROOT_PATH', IA_ROOT . '/addons/hu_couda/');
include_once ROOT_PATH . 'model/prize.mod.php';
include_once ROOT_PATH . 'lib/Select.mysql.php';
class hu_coudaModuleSite extends WeModuleSite
{
	public function __construct()
	{
		global $_GPC, $_W;
		define('PREFIX', prefix($_W['uniacid']));
		update_open_more();
		if (isset($_GPC['debug']) && $_GPC['debug'] == 'debug') {
			var_export($_GPC);
			var_export($_W);
			exit;
		}
	}
	public function doWebOpenMore()
	{
		global $_GPC, $_W;
		$op = $this->get('op');
		if ($op == 'open_up') {
			$token = $this->get('token');
			if (empty($token)) {
				message('请填写开通码', $this->createWeburl('openMore'), 'error');
			}
			$p = new prize();
			if ($p->moreOpen($token, $_W['uniacid'])) {
				message('开通成功', $this->createWeburl('openMore'));
			}
			message($p->error, $this->createWeburl('openMore'), 'error');
		}
		$is_more = PREFIX;
		$is_more_info = '';
		if ($is_more) {
			$is_more_info = '，开通分支编号 - #' . $is_more;
		}
		$open_first = pdo_get('cj_config', ["key" => "open_first"]);
		if ($open_first && $open_first['value'] == $_W['uniacid']) {
			$is_more = $_W['uniacid'];
			$is_more_info = '，开通分支编号（主编号） - #' . $is_more;
		}
		$open_info = 'uniacid->' . $_W['uniacid'] . '，server->' . ($_SERVER['SERVER_ADDR'] ? $_SERVER['SERVER_ADDR'] : $_SERVER['HTTP_HOST']);
		include $this->template('open_more');
	}
	public function doWebMlog()
	{
		$op = $this->get('op');
		$pindex = max(1, intval($this->get('page')));
		$psize = 20;
		$table = tablename(prefix_table('cj_money_log'));
		$member_table = tablename(prefix_table('cj_member'));
		$where = '';
		$nickname = $this->get('nickname', '');
		$type = $this->get('type', '');
		if (!empty($nickname)) {
			$where .= " AND m.nickname LIKE '%{$nickname}%'";
		}
		if (!empty($type)) {
			$where .= " AND ml.type = '{$type}'";
		}
		$sql = 'SELECT ml.*, m.nickname, m.user_img as head ' . "FROM {$table} ml " . "LEFT JOIN {$member_table} m ON ml.member_id=m.id " . "WHERE 1 {$where} order by id desc LIMIT ";
		$list = pdo_fetchall($sql . ($pindex - 1) * $psize . ',' . $psize);
		$total_arr = pdo_fetch("SELECT count(*) as n, sum(ml.money) as all_money FROM {$table} ml " . "LEFT JOIN {$member_table} m ON ml.member_id=m.id " . "WHERE 1 {$where}");
		$total = $total_arr['n'];
		$all_money = $total_arr['all_money'];
		$pager = pagination($total, $pindex, $psize);
		include $this->template('mlog');
	}
	public function getMoneyType($type = 0)
	{
		$type_arr = array("1" => "充值", "2" => "提现", "3" => "冻结", "4" => "解冻", "5" => "发红包", "6" => "领取红包", "7" => "红包退回", "8" => "邮费", "9" => "减余额");
		if (!$type) {
			return $type_arr;
		}
		return $type_arr[$type];
	}
	public function doWebAd_mng()
	{
		global $_W, $_GPC;
		$op = $this->get('op');
		$table = prefix_table('cj_ad');
		load()->func('tpl');
		$ad_type_arr = array("1" => "流量主", "2" => "自定义");
		$show_place_arr = array("news_a" => "抽奖主页", "index_a" => "手机发奖页", "my_a" => "我的主页", "history_a" => "历史记录页", "myluch_a" => "开奖详情页", "mywinn_a" => "我的获奖页", "partake_a" => "待开奖页 / 奖品介绍页", "problem_a" => "常见问题页", "voucher_a" => "我的卡券页", "withdrawals_a" => "我的提现页", "list_a" => "用户参与列表页");
		$name = $this->get('m');
		if ($op == 'add') {
			if (checksubmit()) {
				$insert = ["ad_type" => $this->get('ad_type'), "a_unit_id" => $this->get('a_unit_id'), "d_pic" => $this->get('d_pic'), "d_appid" => $this->get('d_appid'), "d_page" => $this->get('d_page'), "d_para" => $this->get('d_para'), "show_place" => $this->get('show_place'), "begin_time" => strtotime($_GPC['datelimit']['start']), "end_time" => strtotime($_GPC['datelimit']['end'])];
				pdo_insert($table, $insert);
				message('添加成功', $this->createWebUrl('ad_mng'));
			} else {
				$data['begin_time'] = time();
				$data['end_time'] = time() + 3600 * 24 * 180;
				include $this->template('ad_mng');
			}
		} else {
			if ($op == 'edit') {
				if (checksubmit()) {
					$id = $this->get('id');
					$update = ["ad_type" => $this->get('ad_type'), "a_unit_id" => $this->get('a_unit_id'), "d_pic" => $this->get('d_pic'), "d_appid" => $this->get('d_appid'), "d_page" => $this->get('d_page'), "d_para" => $this->get('d_para'), "show_place" => $this->get('show_place'), "begin_time" => strtotime($_GPC['datelimit']['start']), "end_time" => strtotime($_GPC['datelimit']['end'])];
					pdo_update($table, $update, ["id" => $id]);
					message('修改成功', $this->createWebUrl('ad_mng'));
				} else {
					$id = $this->get('id');
					if (!($data = pdo_get($table, ["id" => $id]))) {
						message('分类不存在');
					}
					include $this->template('ad_mng');
				}
			} else {
				if ($op == 'delete') {
					$id = $this->get('id');
					pdo_delete($table, ["id" => $id]);
					json(1);
				} else {
					$pindex = max(1, intval($this->get('page')));
					$psize = 20;
					$table = tablename($table);
					$list = pdo_fetchall("SELECT * FROM {$table} WHERE 1 order by end_time desc, id desc LIMIT " . ($pindex - 1) * $psize . ',' . $psize);
					$total = pdo_fetchcolumn("SELECT count(*) FROM {$table} WHERE 1");
					$pager = pagination($total, $pindex, $psize);
					include $this->template('ad_mng');
				}
			}
		}
	}
	public function doWebRecommend()
	{
		global $_GPC, $_W;
		$pindex = max(1, intval($this->get('page')));
		$psize = 20;
		$list = pdo_fetchall('SELECT hr.*,p.recommend_id,p.status ' . 'FROM ' . tablename(prefix_table('cj_home_recommend')) . ' hr ' . 'LEFT JOIN ' . tablename(prefix_table('cj_prize')) . ' p ON hr.id=p.recommend_id ' . 'ORDER BY hr.id DESC LIMIT ' . ($pindex - 1) * $psize . ',' . $psize);
		$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_home_recommend')));
		if ($list) {
			foreach ($list as &$value) {
				$value['member'] = pdo_get(prefix_table('cj_member'), ["id" => $value['member_id']]);
				$value['created'] = date('Y-m-d H:i:s', $value['created']);
			}
		}
		$pager = pagination($total, $pindex, $psize);
		include $this->template('recommend');
	}
	public function doWebShop()
	{
		global $_GPC, $_W;
		$op = $this->get('op');
		if ($op == 'add') {
			$shop_name = $this->get('shop_name');
			if (empty($shop_name)) {
				message('请填写商家名');
			}
			pdo_insert(prefix_table('cj_shop'), ["shop_name" => $shop_name, "created" => time()]);
			message('添加成功', $this->createWeburl('shop'));
		} else {
			if ($op == 'delete') {
				$id = $this->get('id');
				pdo_update(prefix_table('cj_shop'), ["is_del" => 1], ["id" => $id]);
				json('删除成功');
			} else {
				if ($op == 'addshow') {
					include $this->template('add_shop');
				} else {
					$pindex = max(1, intval($this->get('page')));
					$psize = 10;
					$list = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_shop')) . ' WHERE is_del=0 ORDER BY id DESC LIMIT ' . ($pindex - 1) * $psize . ',' . $psize);
					$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_shop')) . ' WHERE is_del=0');
					$pager = pagination($total, $pindex, $psize);
					include $this->template('shop');
				}
			}
		}
	}
	public function doWebGoods()
	{
		global $_GPC, $_W;
		$op = $this->get('op');
		if ($op == 'add') {
			$shop_id = $this->get('shop_id');
			$goods_name = $this->get('goods_name');
			if (empty($shop_id) || empty($goods_name)) {
				message('缺少必要参数');
			}
			$insert = ["goods_name" => $goods_name, "shop_id" => $shop_id, "created" => time()];
			if (pdo_insert(prefix_table('cj_goods'), $insert)) {
				message('添加成功', $this->createWeburl('goods'));
			}
			message('添加失败');
		} else {
			if ($op == 'addshow') {
				$shop = pdo_getall(prefix_table('cj_shop'), ["is_del" => 0]);
				if (empty($shop)) {
					message('请先添加商家', $this->createWeburl('shop'));
				}
				include $this->template('add_goods');
			} else {
				if ($op == 'createShow') {
					$id = $this->get('id');
					$goods = pdo_get(prefix_table('cj_goods'), ["id" => $id]);
					if (empty($goods)) {
						message('卡券不存在', $this->createWeburl('goods'));
					}
					include $this->template('voucher');
				} else {
					if ($op == 'create') {
						$id = $this->get('goods_id');
						$goods = pdo_get(prefix_table('cj_goods'), ["id" => $id]);
						if (empty($goods)) {
							message('卡券不存在', $this->createWeburl('goods'));
						}
						$voucher_num = $this->get('voucher_num');
						if ($voucher_num < 1) {
							message('参数错误');
						}
						$prize = new prize();
						$prize->create_voucher($id, $goods['shop_id'], $voucher_num);
						message('生成成功', $this->createWeburl('goods'));
					} else {
						if ($op == 'details') {
							$id = $this->get('id');
							$goods = pdo_get(prefix_table('cj_goods'), ["id" => $id]);
							if (empty($goods)) {
								message('卡券不存在', $this->createWeburl('goods'));
							}
							$pindex = max(1, intval($this->get('page')));
							$psize = 10;
							$list = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_voucher')) . " WHERE goods_id={$id} ORDER BY id DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize);
							$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_voucher')) . " WHERE goods_id={$id}");
							$status_msg = [0 => "未使用", 1 => "已发出", 2 => "已核销", 3 => "已核销"];
							$pager = pagination($total, $pindex, $psize);
							include $this->template('voucher_details');
						} else {
							if ($op == 'delete') {
								$id = $this->get('id');
								pdo_delete(prefix_table('cj_goods'), ["id" => $id]);
								json(1);
							} else {
								$pindex = max(1, intval($this->get('page')));
								$psize = 10;
								$list = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_goods')) . ' ORDER BY id DESC LIMIT ' . ($pindex - 1) * $psize . ',' . $psize);
								$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_goods')));
								if ($list) {
									foreach ($list as &$value) {
										$value['shop'] = pdo_get('cj_shop', ["id" => $value['shop_id']]);
										$value['not_used'] = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_voucher')) . " WHERE goods_id={$value['id']} AND status=0");
										$value['used'] = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_voucher')) . " WHERE goods_id={$value['id']} AND status=1");
										$value['write_off'] = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_voucher')) . " WHERE goods_id={$value['id']} AND status=2");
									}
								}
								$pager = pagination($total, $pindex, $psize);
								include $this->template('goods');
							}
						}
					}
				}
			}
		}
	}
	public function doWebTpl()
	{
		global $_GPC, $_W;
		include ROOT_PATH . 'lib/Wxadoc.php';
		$option = ["appid" => $_W['uniaccount']['key'], "secret" => $_W['uniaccount']['secret']];
		$wxObj = new Wxadoc($option);
		$cj_member = tablename(prefix_table('cj_member'));
		global $_GPC, $_W;
		if ($_W['ispost']) {
			$template_id = $this->get('template_id');
			$keyword = $this->get('keyword');
			$member_id = $this->get('member_id');
			$path = $this->get('path');
			$data = [];
			foreach ($keyword as $k => $value) {
				$key = 'keyword' . ($k + 1);
				$data[$key] = ["value" => $value];
			}
			if ($member_id == 0) {
				$sql = "SELECT * FROM {$cj_member} WHERE is_robot=0";
			} else {
				$sql = "SELECT * FROM {$cj_member} WHERE id={$member_id} AND is_robot=0";
			}
			$member = pdo_fetchall($sql);
			if ($member) {
				$time = time() - 7 * 86400;
				foreach ($member as $value) {
					$form_id = pdo_fetch('SELECT * FROM ' . tablename(prefix_table('cj_form_id')) . " WHERE member_id={$value['id']} AND created > {$time}");
					if (!empty($form_id)) {
						$wxObj->sendTemplateMessage($value['openid'], $template_id, $data, $form_id['form_id'], $path);
						pdo_delete(prefix_table('cj_form_id'), ["id" => $form_id['id']]);
					}
				}
			}
			message('发送成功');
		}
		$list = $wxObj->getTplList();
		if ($list) {
			foreach ($list as &$value) {
				$content = str_replace('\\n', '', $value['content']);
				$t = '{{keyword1.DATA}}';
				$c = explode($t, $content);
				$str = $c[1];
				$keyword = [$c[0]];
				$i = 2;
				while (strpos($str, '{{keyword' . $i . '.DATA}}') !== false) {
					$c = explode('{{keyword' . $i . '.DATA}}', $str);
					$keyword[] = $c[0];
					$str = $c[1];
					$i++;
				}
				$value['keyword'] = $keyword;
			}
		}
		$sql = "SELECT * FROM {$cj_member} WHERE is_robot=0";
		$member = pdo_fetchall($sql);
		$list_json = json_encode($list);
		include $this->template('tpl');
	}
	public function doWebConfig()
	{
		global $_GPC, $_W;
		// $data = ["uniacid" => $_W['uniacid'], "server" => $_SERVER['SERVER_ADDR'] ? $_SERVER['SERVER_ADDR'] : $_SERVER['HTTP_HOST'], "dm" => $_SERVER['HTTP_HOST']];
		// $jump_ip_arr = array("172.19.231.109");
		// if (!in_array($_SERVER['SERVER_ADDR'], $jump_ip_arr)) {
		// 	$result = _http_get(base64_decode('aHR0cHM6Ly93d3cud2U4Y2MuY29tL3c3bWF1dGgucGhwP29wPW9wZW5fbW9yZQ=='), $data);
		// 	if ($result) {
		// 		$json = json_decode($result, true);
		// 		if ($json['status'] != 1) {
		// 			message('请进行开通' . print_r($json, 1), $this->createWeburl('openMore'), 'error');
		// 			return false;
		// 		}
		// 	}
		// }
		$config = pdo_get('cj_config', ["key" => "open_first"]);
		if (empty($config)) {
			pdo_insert('cj_config', array("key" => "open_first", "value" => $_W['uniacid']));
		}
		$config = pdo_get('cj_config', ["key" => "js_default_shop"]);
		if (empty($config)) {
			pdo_insert('cj_config', array("key" => "js_default_shop", "value" => 0));
		}
		$config = pdo_get('cj_config', ["key" => "voucher_open"]);
		if (empty($config)) {
			pdo_insert('cj_config', array("key" => "voucher_open", "value" => 1));
		}
		$cj_config = prefix_table('cj_config');
		if ($_W['ispost']) {
			$title = $this->get('title');
			pdo_update($cj_config, ["value" => $title], ["key" => "title"]);
			pdo_update($cj_config, ["value" => $this->get('robot')], ["key" => "robot"]);
			pdo_update($cj_config, ["value" => $this->get('red_bag')], ["key" => "red_bag"]);
			pdo_update($cj_config, ["value" => $this->get('apply_number')], ["key" => "apply_number"]);
			pdo_update($cj_config, ["value" => $this->get('open_prize_notice')], ["key" => "open_prize_notice"]);
			pdo_update($cj_config, ["value" => $this->get('switch_examine')], ["key" => "switch_examine"]);
			pdo_update($cj_config, ["value" => $this->get('red_package_fee')], ["key" => "red_package_fee"]);
			pdo_update($cj_config, ["value" => $this->get('pay_function')], ["key" => "pay_function"]);
			pdo_update($cj_config, ["value" => $this->get('is_release')], ["key" => "is_release"]);
			pdo_update($cj_config, ["value" => $this->get('release_msg')], ["key" => "release_msg"]);
			pdo_update($cj_config, ["value" => $this->get('advertisement_type')], ["key" => "advertisement_type"]);
			pdo_update($cj_config, ["value" => $this->get('home_recommendation')], ["key" => "home_recommendation"]);
			pdo_update($cj_config, ["value" => $this->get('is_oss')], ["key" => "is_oss"]);
			pdo_update($cj_config, ["value" => $this->get('js_default_shop')], ["key" => "js_default_shop"]);
			pdo_update($cj_config, ["value" => $this->get('voucher_open')], ["key" => "voucher_open"]);
			pdo_update($cj_config, ["value" => $this->get('default_prize_img')], ["key" => "default_prize_img"]);
			pdo_update($cj_config, ["value" => $this->get('tpl_to_organiser')], ["key" => "tpl_to_organiser"]);
			pdo_update($cj_config, ["value" => $this->get('tpl_to_allfans_begin')], ["key" => "tpl_to_allfans_begin"]);
			pdo_update($cj_config, ["value" => $this->get('home_max_peoples')], ["key" => "home_max_peoples"]);
			pdo_update($cj_config, ["value" => $this->get('home_recommendation_need_check')], ["key" => "home_recommendation_need_check"]);
			pdo_update($cj_config, ["value" => $this->get('robot') ? $this->get('robot_m') : 0], ["key" => "robot_m"]);
			pdo_update($cj_config, ["value" => $this->get('robot_m_percent')], ["key" => "robot_m_percent"]);
			pdo_update($cj_config, ["value" => $this->get('relief_desc')], ["key" => "relief_desc"]);
			pdo_update($cj_config, ["value" => $this->get('robot_of_not_home')], ["key" => "robot_of_not_home"]);
			pdo_update($cj_config, ["value" => $this->get('alipay_pwd')], ["key" => "alipay_pwd"]);
			pdo_update($cj_config, ["value" => $this->get('list_show_type')], ["key" => "list_show_type"]);
			$path1 = ATTACHMENT_ROOT . $_W['uniacid'] . 'cert/';
			if (!file_exists($path1)) {
				@mkdir($path1, 0777, true);
			}
			if (isset($_FILES['apiclient_cert']['tmp_name']) && file_exists($_FILES['apiclient_cert']['tmp_name'])) {
				$path = $path1 . 'apiclient_cert.pem';
				if (move_uploaded_file($_FILES['apiclient_cert']['tmp_name'], $path)) {
					pdo_update($cj_config, ["value" => $path], ["key" => "apiclient_cert"]);
				}
			}
			if (isset($_FILES['apiclient_key']['tmp_name']) && file_exists($_FILES['apiclient_key']['tmp_name'])) {
				$path = $path1 . 'apiclient_key.pem';
				if (move_uploaded_file($_FILES['apiclient_key']['tmp_name'], $path)) {
					pdo_update($cj_config, ["value" => $path], ["key" => "apiclient_key"]);
				}
			}
			if ($this->get('advertisement_type') == 0) {
				pdo_update($cj_config, ["value" => $this->get('advertisement')], ["key" => "advertisement"]);
			} else {
				$data = ["image" => $this->get('single-image'), "appId" => $this->get('appId'), "xcx_path" => $this->get('xcx_path'), "extradata" => $this->get('extradata')];
				pdo_update($cj_config, ["value" => json_encode($data)], ["key" => "advertisement"]);
			}
			$data = ["image" => $this->get('single-image1'), "appId" => $this->get('popup_appId'), "xcx_path" => $this->get('popup_xcx_path'), "extradata" => $this->get('popup_extradata')];
			pdo_update($cj_config, ["value" => json_encode($data)], ["key" => "popup_adv"]);
		}
		$is_more = PREFIX;
		$open_first = pdo_get('cj_config', ["key" => "open_first"]);
		if ($open_first && $open_first['value'] == $_W['uniacid']) {
			$is_more = $_W['uniacid'];
		}
		if (!$is_more) {
			message('请进行开通', $this->createWeburl('openMore'), 'error');
		}
		$initial = function ($key, $default = 0) use(&$cj_config) {
			$config = pdo_get(prefix_table('cj_config'), ["key" => $key]);
			if (empty($config)) {
				$config = ["key" => $key, "value" => $default];
				pdo_insert($cj_config, $config);
			}
			return $config;
		};
		$apply_number = $initial('apply_number', 0);
		$red_bag = $initial('red_bag', 0);
		$robot = $initial('robot', 0);
		$title = $initial('title', '');
		$apiclient_cert = $initial('apiclient_cert', '');
		$apiclient_key = $initial('apiclient_key', '');
		$open_prize_notice = $initial('open_prize_notice', '');
		$switch_examine = $initial('switch_examine', 0);
		$advertisement = $initial('advertisement', '');
		$red_package_fee = $initial('red_package_fee', 0);
		$red_package_fee = $initial('red_package_fee', 0);
		$pay_function = $initial('pay_function', 5);
		$is_release = $initial('is_release', 0);
		$release_msg = $initial('release_msg', '无发布权限');
		$advertisement_type = $initial('advertisement_type', 0);
		$home_recommendation = $initial('home_recommendation', 1500);
		$popup_adv = $initial('popup_adv', '');
		$is_oss = $initial('is_oss', 0);
		$js_default_shop = $initial('js_default_shop', 0);
		$voucher_open = $initial('voucher_open', 0);
		$default_prize_img = $initial('default_prize_img', '');
		$default_prize_img_url = $default_prize_img['value'] > 0 ? $this->getImage($default_prize_img['value']) : '';
		$tpl_to_organiser = $initial('tpl_to_organiser', '');
		$tpl_to_allfans_begin = $initial('tpl_to_allfans_begin', '');
		$home_max_peoples = $initial('home_max_peoples', '');
		$home_recommendation_need_check = $initial('home_recommendation_need_check', '');
		$robot_m = $initial('robot_m', '');
		$robot_m_percent = $initial('robot_m_percent', '');
		$relief_desc = $initial('relief_desc', '');
		$robot_of_not_home = $initial('robot_of_not_home', '');
		$alipay_pwd = $initial('alipay_pwd', '');
		$list_show_type = $initial('list_show_type', '');
		if ($popup_adv) {
			$popup_adv['value'] = json_decode($popup_adv['value'], true);
			$popup_adv['value']['image_url'] = $this->getImage($popup_adv['value']['image']);
		}
		if ($advertisement_type['value'] == 1) {
			$advertisement['value'] = json_decode($advertisement['value'], true);
			$advertisement['value']['image_url'] = $this->getImage($advertisement['value']['image']);
		}
		$upload = $_W['siteroot'] . "/app/index.php?i={$_W['uniacid']}&c=entry&op=receive_card&do=upload&m={$_GPC['m']}&a=wxapp";
		$image = $_W['siteroot'] . "/app/index.php?i={$_W['uniacid']}&c=entry&op=receive_card&do=image&m={$_GPC['m']}&a=wxapp";
		$web_title = $_W['current_module']['title'];
		$shop_list = pdo_getall(prefix_table('cj_shop'), array("is_del" => 0), array("id", "shop_name"), 'id');
		$is_robot_max = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_member')) . ' WHERE is_robot=1');
		include $this->template('config');
	}
	public function getImage($route, $path = false)
	{
		if (empty($route)) {
			return '';
		}
		global $_GPC, $_W;
		if (is_numeric($route)) {
			$image = pdo_get(prefix_table('cj_resource'), ["id" => $route]);
			$route = $image['route'];
		}
		if ($path == true) {
			return $route;
		}
		if ($this->_is_oss()) {
			return $_W['attachurl'] . $route;
		}
		return $_W['siteroot'] . '/attachment/' . $route;
	}
	private function _is_oss()
	{
		global $_GPC, $_W;
		$is_oss = pdo_get(prefix_table('cj_config'), ["key" => "is_oss"]);
		if ($is_oss) {
			$is_oss = $is_oss['value'];
		} else {
			$is_oss = 0;
		}
		return !empty($_W['setting']['remote']['type']) && $is_oss == 0;
	}
	public function doWebQuestion()
	{
		global $_GPC, $_W;
		$op = $this->get('op');
		if ($op == 'addshow') {
			include $this->template('add_common_problem');
		} else {
			if ($op == 'delete') {
				$id = $this->get('id');
				pdo_delete(prefix_table('cj_common_problem'), ["id" => $id]);
				json('');
			} else {
				if ($op == 'edit_show') {
					$id = $this->get('id');
					$question = pdo_get(prefix_table('cj_common_problem'), ["id" => $id]);
					if (empty($question)) {
						message('问题不存在', $this->createWeburl('question'));
					}
					include $this->template('question_edit_show');
				} else {
					if ($op == 'edit') {
						$id = $this->get('id');
						$title = $this->get('title');
						$describe = $this->get('describe');
						pdo_update(prefix_table('cj_common_problem'), ["title" => $title, "describe" => $describe], ["id" => $id]);
						message('修改成功', $this->createWeburl('question'));
					} else {
						if ($op == 'add') {
							$title = $this->get('title');
							$describe = $this->get('describe');
							if (!empty($title) && !empty($describe)) {
								pdo_insert(prefix_table('cj_common_problem'), ["title" => $title, "describe" => $describe]);
							}
						}
						$question = pdo_getall(prefix_table('cj_common_problem'));
						include $this->template('common_problem');
					}
				}
			}
		}
	}
	public function doWebXcx()
	{
		global $_GPC, $_W;
		$op = $this->get('op');
		if ($op == 'addshow') {
			include $this->template('add_xcx');
		} else {
			if ($op == 'delete') {
				$id = $this->get('id');
				pdo_delete(prefix_table('cj_program'), ["id" => $id]);
				json('');
			} else {
				if ($op == 'add') {
					$name = $this->get('name');
					$appid = $this->get('appid');
					if (!empty($name) && !empty($appid)) {
						pdo_insert(prefix_table('cj_program'), ["name" => $name, "appid" => $appid]);
					}
				}
				$data = pdo_getall(prefix_table('cj_program'));
				include $this->template('xcx');
			}
		}
	}
	public function doWebMember()
	{
		global $_GPC, $_W;
		$op = $this->get('op');
		if ($op == 'delete') {
			$id = $this->get('id');
			if (pdo_delete(prefix_table('cj_member'), ["id" => $id])) {
				json('删除成功');
			}
			json('删除失败', 0);
		} else {
			if ($op == 'blacklist') {
				$id = $this->get('id');
				if (pdo_update(prefix_table('cj_member'), array("blacklist" => 1), ["id" => $id])) {
					json('操作成功');
				}
				json('操作失败', 0);
			} else {
				if ($op == 'blacklist_cancel') {
					$id = $this->get('id');
					if (pdo_update(prefix_table('cj_member'), array("blacklist" => 0), ["id" => $id])) {
						json('操作成功');
					}
					json('操作失败', 0);
				}
			}
		}
		if ($op == 'gl') {
			$id = $this->get('id');
			$member = pdo_get(prefix_table('cj_member'), ["id" => $id]);
			if (empty($member)) {
				message('用户不存在', $this->createWeburl('member'));
			}
			$shop = pdo_getall(prefix_table('cj_shop'), ["is_del" => 0]);
			if (empty($shop)) {
				message('还没有店铺,请先添加', $this->createWeburl('member'));
			}
			include $this->template('member_gl');
		} else {
			if ($op == 'addgl') {
				$shop_id = $this->get('shop_id');
				$shop = pdo_get(prefix_table('cj_shop'), ["id" => $shop_id, "is_del" => 0]);
				if (empty($shop)) {
					message('该店铺不存在', $this->createWeburl('member'));
				}
				pdo_update(prefix_table('cj_member'), ["shop_id" => $shop_id], ["id" => $this->get('id')]);
				message('关联成功', $this->createWeburl('member'));
			} else {
				if ($op == 'is_release') {
					$id = $this->get('id');
					$is_release = $this->get('is_release');
					if (pdo_update(prefix_table('cj_member'), ["is_release" => $is_release], ["id" => $id])) {
						json(1);
					}
					json('', 0);
				} else {
					if ($op == 'cancel') {
						if (!($id = $this->get('id'))) {
							json('参数错误', 0);
						}
						pdo_update(prefix_table('cj_member'), ["shop_id" => 0], ["id" => $id]);
						json(1);
					} else {
						$where = '1 ';
						$keyword = $this->get('keyword');
						$u_type = $this->get('u_type');
						$blacklist = $this->get('blacklist');
						if ($u_type == 1) {
							$where .= ' and is_robot = 0';
						} else {
							if ($u_type == 2) {
								$where .= ' and is_robot != 0';
							}
						}
						if ($blacklist == 1) {
							$where .= ' and blacklist = 1';
						} else {
							if ($blacklist == 2) {
								$where .= ' and blacklist != 1';
							}
						}
						if (!empty($keyword)) {
							$where .= " AND nickname LIKE '%{$keyword}%'";
						}
						if ($_GPC['del_share_image']) {
							$path = IA_ROOT . '/addons/hu_couda/images/share' . $_W['uniacid'] . '/';
							$list = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_member')) . " WHERE {$where} ORDER BY id DESC ");
							foreach ($list as $m_data) {
								@unlink($path . $m_data['id'] . '/m_.png');
								@unlink($path . $m_data['id'] . '/m_' . $m_data['id'] . '.png');
							}
							message('更新完成', $this->createWebUrl('member'));
						}
						$pindex = max(1, intval($this->get('page')));
						$psize = 20;
						$list = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_member')) . " WHERE {$where} ORDER BY id DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize);
						$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_member')) . " WHERE {$where}");
						if ($list) {
							foreach ($list as &$value) {
								$value['shop'] = $value['shop_id'] ? pdo_get(prefix_table('cj_shop'), ["id" => $value['shop_id']]) : [];
							}
						}
						$pager = pagination($total, $pindex, $psize);
						include $this->template('member');
					}
				}
			}
		}
	}
	private function read($filename, $encode = "utf-8")
	{
		require_once IA_ROOT . '/framework/library/phpexcel/PHPExcel.php';
		$objPHPExcel = new PHPExcel();
		$objPHPExcel = PHPExcel_IOFactory::load($filename);
		$indata = $objPHPExcel->getSheet(0)->toArray(1);
		return $indata;
	}
	public function doWebMember_edit()
	{
		global $_W, $_GPC;
		$savePath = IA_ROOT . '/addons/' . $this->modulename . '/template/upFile/';
		if (checksubmit('save_info')) {
			if (!empty($_FILES['file_import']['name'])) {
				$tmp_file = $_FILES['file_import']['tmp_name'];
				$file_types = explode('.', $_FILES['file_import']['name']);
				$file_type = $file_types[count($file_types) - 1];
				$str = date('Ymdhis');
				$file_name = $str . '_cjmember.' . $file_type;
				$op_copy = copy($tmp_file, $savePath . $file_name);
				if (!$op_copy) {
					message('上传失败' . $op_copy);
				}
				$res = $this->read($savePath . $file_name);
				$insert = array();
				$insert['is_robot'] = 1;
				$insert['add_time'] = time();
				$import_num = 0;
				foreach ($res as $k => $v) {
					if ($k != 0) {
						$insert['nickname'] = trim($v[0]);
						if ($insert['nickname']) {
							$insert['user_img'] = trim($v[1]);
							$exist_from_user = pdo_fetchcolumn('SELECT * FROM ' . tablename(prefix_table('cj_member')) . ' WHERE nickname = :nickname and user_img=:user_img', array(":nickname" => $insert['nickname'], "user_img" => $insert['user_img']));
							if (!$exist_from_user || !$insert['nickname']) {
								pdo_insert(prefix_table('cj_member'), $insert);
								$import_num++;
							}
						}
					}
				}
				$curr_index_url = $this->createWebUrl('member');
				message('批量导入 ' . $import_num . ' 条数据', $curr_index_url, 'success');
			}
		}
		include $this->template('member_edit');
	}
	public function doWebIndex()
	{
		global $_GPC, $_W;
		$op = $this->get('op');
		if ($op == 'delete') {
			$id = $this->get('id');
			if (pdo_delete(prefix_table('cj_pre_prize'), ["prize_id" => $id])) {
				json('删除成功');
			}
			json('删除失败', 0);
		}
		$data = pdo_getall(prefix_table('cj_pre_prize'), array(), [], '', ["page_order desc"]);
		if ($data) {
			foreach ($data as &$value) {
				$value['opentime'] = $value['type'] == 1 ? date('Y-m-d H:i:s', $value['opentime']) : $value['opentime'];
			}
		}
		include $this->template('index');
	}
	public function doWebAdd()
	{
		global $_GPC, $_W;
		$op = $this->get('op');
		$priae = new prize();
		$shop_list = pdo_getall(prefix_table('cj_shop'), array("is_del" => 0), array("id", "shop_name"), 'id');
		if ($op == 'add') {
			$prize_id = (int) $this->get('prize_id');
			$replaceImg = $this->get('replaceImg');
			$attach_id = $this->get('attach_id');
			if ($replaceImg) {
				if ($prize_id) {
					$data = array("route" => $replaceImg);
					pdo_update(prefix_table('cj_resource'), $data, array("id" => $attach_id));
				} else {
					$data = array("member_id" => 0, "route" => $replaceImg, "type" => 1, "created" => time());
					pdo_insert(prefix_table('cj_resource'), $data);
					$attach_id = pdo_insertid();
				}
				if (!$attach_id) {
					json('封面图片上传失败', 0);
				}
			} else {
				json('请上传封面图片', 0);
			}
			$data = [];
			$data['in_task'] = $this->get('in_task');
			$data['uname'] = $this->get('uname');
			$data['title'] = $this->get('title');
			$data['description'] = $this->get('description');
			$data['fir_val'] = $this->get('fir_val');
			$data['fir_ptype'] = $this->get('fir_ptype');
			$data['fir_num'] = $this->get('fir_num');
			$data['sec_val'] = $this->get('sec_val');
			$data['sec_ptype'] = $this->get('sec_ptype');
			$data['sec_num'] = $this->get('sec_num');
			$data['trd_val'] = $this->get('trd_val');
			$data['trd_ptype'] = $this->get('trd_ptype');
			$data['trd_num'] = $this->get('trd_num');
			$data['max_group_num'] = 0;
			$data['attach_id'] = $attach_id;
			$data['path'] = $this->get('path');
			$data['appid'] = $this->get('appid');
			$data['app_name'] = $this->get('app_name');
			$data['wechat_no'] = $this->get('wechat_no');
			$data['brief_description'] = $this->get('brief_description');
			$data['type'] = $this->get('type');
			$data['is_robot_max'] = $this->get('is_robot_max');
			$data['default_shop_id'] = $this->get('default_shop_id');
			$data['is_command'] = (int) $this->get('is_command');
			if ($data['is_command'] == 1) {
				$data['command'] = trim($this->get('command'));
			}
			$data['copy_type'] = $this->get('copy_type');
			$data['desc_type'] = $this->get('desc_type');
			if ($data['desc_type'] == 1) {
				$data['description'] = implode(',', $this->get('images', []));
			}
			if ($data['type'] == 1) {
				$data['opentime'] = strtotime($this->get('opentime'));
				if ($prize_id && strlen($data['opentime']) == 19) {
				}
			} else {
				$data['opentime'] = $this->get('opentime');
				if ($data['trd_num'] + $data['fir_num'] + $data['sec_num'] > $data['opentime']) {
					json('开奖人数小于奖品数', 0);
				}
			}
			$data['in_task_time'] = strtotime($this->get('in_task_time'));
			if ($data['copy_type'] == 2) {
				$data['wechat_no'] = $this->get('wechat_no');
				$data['wechat_title'] = $this->get('wechat_title');
			}
			try {
				pdo_begin();
				if ($data['fir_ptype'] == 3) {
					$bf_val = $goods = pdo_get(prefix_table('cj_pre_prize'), ["prize_id" => $prize_id], ["fir_val"]);
					$data['fir_cname'] = $data['fir_val'];
					$voucher_id = $this->get('fir_voucher');
					$goods = pdo_get(prefix_table('cj_goods'), ["id" => $voucher_id]);
					$vou = $priae->deduction($goods['shop_id'], $voucher_id, $data['fir_num'], $bf_val);
					if (!$vou) {
						throw new Exception('优惠券' . $goods['goods_name'] . '数量不足');
					}
					$data['fir_val'] = json_encode($vou);
				}
				if ($data['sec_ptype'] == 3) {
					$bf_val = $goods = pdo_get(prefix_table('cj_pre_prize'), ["prize_id" => $prize_id], ["sec_val"]);
					$data['sec_cname'] = $data['sec_val'];
					$voucher_id = $this->get('sec_voucher');
					$goods = pdo_get(prefix_table('cj_goods'), ["id" => $voucher_id]);
					$vou = $priae->deduction($goods['shop_id'], $voucher_id, $data['sec_num'], $bf_val);
					if (!$vou) {
						throw new Exception('优惠券' . $goods['goods_name'] . '数量不足');
					}
					$data['sec_val'] = json_encode($vou);
				}
				if ($data['trd_ptype'] == 3) {
					$bf_val = $goods = pdo_get(prefix_table('cj_pre_prize'), ["prize_id" => $prize_id], ["trd_val"]);
					$data['trd_cname'] = $data['trd_val'];
					$voucher_id = $this->get('trd_voucher');
					$goods = pdo_get(prefix_table('cj_goods'), ["id" => $voucher_id]);
					$vou = $priae->deduction($goods['shop_id'], $voucher_id, $data['trd_num'], $bf_val);
					if (!$vou) {
						throw new Exception('优惠券' . $goods['goods_name'] . '数量不足');
					}
					$data['trd_val'] = json_encode($vou);
				}
				$keys = $_GET['keys'];
				$vals = $_GET['vals'];
				if (!empty($keys)) {
					foreach ($keys as $k => $key) {
						$extraData[$key] = $vals[$k];
					}
					$data['extraData'] = json_encode($extraData);
				} else {
					$data['extraData'] = '';
				}
				if (empty($data['title']) || empty($data['fir_val']) || empty($data['fir_num'])) {
					throw new Exception('请填写完整');
				}
				if ($data['opentime'] <= time() && $data['type'] == 1) {
					throw new Exception('开奖时间已过');
				}
				$data['is_robot'] = $this->get('is_robot');
				if ($data['type'] == 2) {
					$data['is_robot'] = 0;
				}
				$data['page_order'] = $this->get('page_order');
				if ($prize_id == 0) {
					if (!pdo_insert(prefix_table('cj_pre_prize'), $data)) {
						throw new Exception('添加失败');
					}
				} else {
					if (!pdo_update(prefix_table('cj_pre_prize'), $data, array("prize_id" => $prize_id))) {
						throw new Exception('修改失败');
					}
				}
				pdo_commit();
				json('发布成功');
			} catch (Exception $e) {
				json($e->getMessage(), 0);
				pdo_rollback();
			}
		} else {
			if ($op == 'edit') {
				$prize_id = (int) $_GPC['prize_id'];
				$cj_pre_prize_data = pdo_fetch('SELECT * FROM ' . tablename(prefix_table('cj_pre_prize')) . " WHERE prize_id='{$prize_id}' AND in_task=0");
				if ($cj_pre_prize_data['type'] == 1) {
					$cj_pre_prize_data['opentime'] = date('Y-m-d H:i:s', $cj_pre_prize_data['opentime']);
				}
				$cj_pre_prize_data['in_task_time'] = date('Y-m-d H:i:s', $cj_pre_prize_data['in_task_time']);
				$replaceImg = $this->getImage($cj_pre_prize_data['attach_id'], 1);
			}
		}
		$goods = pdo_getall(prefix_table('cj_goods'));
		if ($goods) {
			foreach ($goods as $k => $value) {
				$not_used = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_voucher')) . " WHERE goods_id={$value['id']} AND status=0");
				if ($not_used >= 1) {
					$goods[$k]['not_used'] = $not_used;
				} else {
					unset($goods[$k]);
				}
			}
		}
		$cj_pre_prize_data['in_task_time'] = $cj_pre_prize_data['in_task_time'] ? $cj_pre_prize_data['in_task_time'] : date('Y-m-d H:i:s', time());
		load()->func('tpl');
		$uniacid = $_W['uniacid'];
		$name = $this->get('m');
		$is_robot_max = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_member')) . ' WHERE is_robot=1');
		include $this->template('add');
	}
	public function getResImg($res_id)
	{
		$img = pdo_get(prefix_table('cj_resource'), ["id" => $res_id]);
		if ($img) {
			global $_GPC, $_W;
			return $_W['attachurl'] . $img['route'];
		}
	}
	public function doWebStatistics()
	{
		global $_GPC, $_W;
		$op = $this->get('op');
		if ($op == 'in_prize') {
			$id = $this->get('id');
			$prize = pdo_get(prefix_table('cj_prize'), ["id" => $id]);
			if (!empty($prize)) {
				$result = pdo_getall(prefix_table('cj_prize_result'), ["prize_id" => $id]);
				if ($result) {
					foreach ($result as &$value) {
						$value['address'] = pdo_get(prefix_table('cj_address'), ["member_id" => $value['member_id']]);
						$value['minfo'] = pdo_get(prefix_table('cj_member'), ["id" => $value['member_id']]);
					}
				}
				$type = ["fir" => "一等奖", "sec" => "二等奖", "trd" => "三等奖"];
				include $this->template('prize');
			}
		} else {
			if ($op == 'apply') {
				$id = $this->get('id');
				$prize = pdo_get(prefix_table('cj_prize'), ["id" => $id]);
				if (empty($prize)) {
					message('抽奖不存在', $this->createWeburl('statistics'));
				}
				$keyword = $this->get('keyword');
				$where = '1=1';
				if (!empty($keyword)) {
					$cj_member = tablename(prefix_table('cj_member'));
					$member = pdo_fetchall("SELECT * FROM {$cj_member} WHERE nickname LIKE '%{$keyword}%'");
					if ($member) {
						$ids = [];
						foreach ($member as $value) {
							$ids[] = $value['id'];
						}
						$where = 'member_id in(' . implode(',', $ids) . ')';
					} else {
						include $this->template('apply');
						exit;
					}
				}
				$psize = 10;
				$pindex = max(1, intval($this->get('page')));
				$list = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_order')) . " WHERE prize_id={$id} AND {$where} ORDER BY order_id DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize);
				$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_order')) . "  WHERE prize_id={$id}");
				$pager = pagination($total, $pindex, $psize);
				if ($list) {
					foreach ($list as &$value) {
						$value['member'] = pdo_get(prefix_table('cj_member'), ["id" => $value['member_id']]);
						$value['appoint'] = pdo_get(prefix_table('cj_appoint'), ["order_id" => $value['order_id'], "prize_id" => $value['prize_id']]);
					}
				}
				include $this->template('apply');
			} else {
				if ($op == 'appoint') {
					$ranking = $this->get('ranking');
					$order_id = $this->get('order_id');
					$prize_id = $this->get('prize_id');
					if (is_numeric($ranking)) {
						pdo_delete(prefix_table('cj_appoint'), ["order_id" => $order_id, "prize_id" => $prize_id]);
						json('');
					}
					$order = pdo_get(prefix_table('cj_order'), ["order_id" => $order_id]);
					$prize = pdo_get(prefix_table('cj_prize'), ["id" => $prize_id]);
					if (empty($order) || empty($prize)) {
						json('参数错误', 0);
					}
					if ($prize['status'] == 1 || $prize['is_cancel'] == 1) {
						json('该抽奖已经结束', 0);
					}
					$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_appoint')) . "  WHERE prize_id={$prize_id} AND ranking='{$ranking}'");
					if ($total >= $prize[$ranking . '_num']) {
						json('设置失败,该奖数量不足', 0);
					}
					pdo_delete(prefix_table('cj_appoint'), ["order_id" => $order_id]);
					$data = ["order_id" => $order_id, "prize_id" => $prize_id, "member_id" => $order['member_id'], "ranking" => $ranking, "created" => time()];
					pdo_insert(prefix_table('cj_appoint'), $data);
					json('设置成功');
				} else {
					if ($op == 'delete') {
						$id = $this->get('id');
						pdo_delete(prefix_table('cj_prize_result'), ["prize_id" => $id]);
						pdo_delete(prefix_table('cj_order'), ["prize_id" => $id]);
						pdo_delete(prefix_table('cj_prize'), ["id" => $id]);
						json('删除成功');
					} else {
						if ($op == 'details') {
							$id = $this->get('id');
							$prize = pdo_get(prefix_table('cj_prize'), ["id" => $id]);
							if ($prize) {
								$prize['jump_program'] = pdo_get(prefix_table('cj_jump_program'), ["prize_id" => $prize['id']]);
								$image = pdo_get(prefix_table('cj_resource'), ["id" => $prize['attach_id']]);
								global $_W;
								$prize['attach_img'] = $_W['attachurl'] . $image['route'];
							}
							include $this->template('details');
						} else {
							if ($op == 'write_off') {
								$id = $this->get('id');
								$result_data = pdo_get(prefix_table('cj_prize_result'), array("result_id" => $id));
								$pvalue = $result_data['pvalue'];
								pdo_update(prefix_table('cj_member_voucher'), ["status" => 1, "write_off_time" => time()], ["voucher" => $pvalue, "member_id" => $result_data['member_id']]);
								pdo_update(prefix_table('cj_prize_result'), ["is_write_off" => 1], ["result_id" => $id]);
								json('');
							} else {
								$is_global = $this->get('is_global', 0);
								$pindex = max(1, intval($this->get('page')));
								$psize = 10;
								$list = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_prize')) . " WHERE is_global={$is_global} ORDER BY id DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize);
								$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_prize')) . "  WHERE is_global={$is_global} ");
								$pager = pagination($total, $pindex, $psize);
								include ROOT_PATH . 'lib/Wxadoc.php';
								include ROOT_PATH . 'lib/Gd.class.php';
								include ROOT_PATH . 'lib/Image.class.php';
								$Image = new Image();
								$option = array("appid" => $_W['uniaccount']['key'], "secret" => $_W['uniaccount']['secret']);
								$wxObj = new Wxadoc($option);
								foreach ($list as &$value) {
									if ($value['type'] == 1) {
										$value['typevalue'] = date('Y-m-d H:i:s', $value['typevalue']);
										$value['types'] = '时间开奖';
									} else {
										if ($value['type'] == 2) {
											$value['types'] = '人数开奖';
										} else {
											$value['types'] = '手动开奖';
										}
									}
									if ($value['member_id'] > 0) {
										$value['member'] = pdo_get(prefix_table('cj_member'), ["id" => $value['member_id']]);
									}
									if ($value['is_cancel'] == 0 && $value['status'] == 1) {
										$value['in_prize'] = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_prize_result')) . " WHERE prize_id={$value['id']}");
									} else {
										$value['in_prize'] = 0;
									}
									$value['prize_name'] = $value['fir_ptype'] > 1 ? $value['fir_cname'] : $value['fir_val'];
									if (!file_exists(ATTACHMENT_ROOT . 'qr' . $_W['uniacid'])) {
										@mkdir(ATTACHMENT_ROOT . 'qr' . $_W['uniacid'], 0777, true);
									}
									$qrpath = ATTACHMENT_ROOT . 'qr' . $_W['uniacid'] . '/qr217' . $value['id'] . '.png';
									if (!is_file($qrpath)) {
										$qr_temp = ATTACHMENT_ROOT . 'qr_temp' . $value['id'] . '.jpg';
										$res = $wxObj->createwxaqrcode($value['id'], 'pages/partake/partake', 430, false, array("r" => 72, "g" => 145, "b" => 92));
										if ($res) {
											file_put_contents($qr_temp, $res);
											$qrimg = $Image->open($qr_temp);
											$qrimg->thumb(217, 217)->save($qrpath);
										}
										unlink($qr_temp);
									}
									$value['qr_code'] = $_W['siteroot'] . '/attachment/qr' . $_W['uniacid'] . '/qr217' . $value['id'] . '.png';
								}
								include $this->template($is_global ? 'statistics1' : 'statistics');
							}
						}
					}
				}
			}
		}
	}
	public function doWebStatistics1()
	{
		global $_GPC, $_W;
		$op = $this->get('op');
		$home_recommendation_need_check_cfg = pdo_get(prefix_table('cj_config'), ["key" => "home_recommendation_need_check"]);
		$home_recommendation_need_check = $home_recommendation_need_check_cfg['value'];
		if ($op == 'in_prize') {
			$id = $this->get('id');
			$prize = pdo_get(prefix_table('cj_prize'), ["id" => $id]);
			if (!empty($prize)) {
				$result = pdo_getall(prefix_table('cj_prize_result'), ["prize_id" => $id]);
				if ($result) {
					foreach ($result as &$value) {
						$value['address'] = pdo_get(prefix_table('cj_address'), ["member_id" => $value['member_id']]);
						$value['minfo'] = pdo_get(prefix_table('cj_member'), ["id" => $value['member_id']]);
					}
				}
				$type = ["fir" => "一等奖", "sec" => "二等奖", "trd" => "三等奖"];
				include $this->template('prize');
			}
		} else {
			if ($op == 'apply') {
				$id = $this->get('id');
				$prize = pdo_get(prefix_table('cj_prize'), ["id" => $id]);
				if (empty($prize)) {
					message('抽奖不存在', $this->createWeburl('statistics1'));
				}
				$keyword = $this->get('keyword');
				$u_type = $this->get('u_type');
				$t_member = tablename(prefix_table('cj_member'));
				$psize = 10;
				$pindex = max(1, intval($this->get('page')));
				$apply_num = $prize['apply_num'];
				$robot = pdo_get(prefix_table('cj_config'), ["key" => "robot"]);
				$robot_of_not_home = pdo_get(prefix_table('cj_config'), ["key" => "robot_of_not_home"]);
				if ($robot && $prize['is_robot'] == 1 && ($price['is_global'] == 0 || $price['recommend_id'] > 0 || $price['recommend_id'] == 0 && $robot_of_not_home['value'])) {
					if ($prize['type'] == 1) {
						$time = $prize['open_time'] > 0 ? $prize['open_time'] : time();
					} else {
						$time = time();
					}
					$is_robot_max = $prize['is_robot_max'];
					if ($is_robot_max) {
						$people = $is_robot_max / floor(($prize['typevalue'] - $prize['created']) / 60) * floor(($time - $prize['created']) / 60);
						$people = (int) $people;
						$robot_num = $is_robot_max;
					} else {
						$people = floor(($time - $prize['created']) / 60 * 10);
						$robot_num = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_member')) . ' WHERE is_robot=1');
					}
					$people = $people < $robot_num ? $people : $robot_num;
					$apply_num += $people;
				} else {
					$apply_num = 0;
				}
				if ($apply_num > 0) {
					$t_order = tablename(prefix_table('cj_order'));
					$where = "(B.prize_id={$id}";
					if (1 || $prize['is_global'] == 0) {
						$where .= " OR (A.is_robot=1 and (B.prize_id={$id} or B.prize_id is null))";
					}
					$where .= ')';
					if (!empty($keyword)) {
						$where .= " and A.nickname like '%{$keyword}%'";
					}
					if ($u_type == 1) {
						$where .= ' and A.is_robot=0';
					} else {
						if ($u_type == 2) {
							$where .= ' and A.is_robot=1';
						}
					}
					$sql = "SELECT A.*,B.order_id,B.prize_id FROM {$t_member} AS A LEFT JOIN {$t_order} AS B ON A.id=B.member_id WHERE {$where} ORDER BY B.code_num DESC,B.order_id DESC,A.is_robot ASC,A.id LIMIT " . ($pindex - 1) * $psize . ',' . $psize;
					$list = pdo_fetchall($sql);
					if ($list) {
						foreach ($list as &$value) {
							$value['appoint'] = pdo_get(prefix_table('cj_appoint'), ["order_id" => $value['order_id'], "prize_id" => $id]);
						}
					}
					$total = $apply_num;
					$pager = pagination($total, $pindex, $psize);
				} else {
					$where = '1=1';
					if (!empty($keyword)) {
						$where .= " and m.nickname like '%{$keyword}%'";
					}
					if ($u_type == 1) {
						$where .= ' and m.is_robot=0';
					} else {
						if ($u_type == 2) {
							$where .= ' and m.is_robot=1';
						}
					}
					$list = pdo_fetchall('SELECT o.* FROM ' . tablename(prefix_table('cj_order')) . ' o ' . 'LEFT JOIN ' . $t_member . ' m ON o.member_id=m.id ' . "WHERE o.prize_id={$id} AND {$where} ORDER BY o.order_id DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize);
					$total = pdo_fetchcolumn('SELECT COUNT(*) ' . 'FROM ' . tablename(prefix_table('cj_order')) . ' o ' . 'LEFT JOIN ' . $t_member . ' m ON o.member_id=m.id ' . "WHERE o.prize_id={$id}");
					$pager = pagination($total, $pindex, $psize);
					if ($list) {
						foreach ($list as &$value) {
							$value['member'] = pdo_get(prefix_table('cj_member'), ["id" => $value['member_id']]);
							$value['appoint'] = pdo_get(prefix_table('cj_appoint'), ["order_id" => $value['order_id'], "prize_id" => $value['prize_id']]);
						}
					}
				}
				include $this->template('apply');
			} else {
				if ($op == 'appoint') {
					$ranking = $this->get('ranking');
					$order_id = $this->get('order_id');
					$prize_id = $this->get('prize_id');
					list($member_id, $is_rebot) = explode('-', $this->get('memberid'));
					$order_robot = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_order')) . " WHERE member_id='{$member_id}' and prize_id='{$prize_id}'");
					if (!$order_robot) {
						$order = ["order_sn" => date('YmdHis', time()) . $member_id . mt_rand(1000, 9999), "prize_id" => $prize_id, "group_join_id" => 0, "member_id" => $member_id, "addtime" => time()];
						if (!pdo_insert(prefix_table('cj_order'), $order)) {
							json('订单添加失败', 0);
						}
						$order_id = pdo_insertid();
					}
					$prize_code_robot = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_prize_code')) . " WHERE member_id='{$member_id}' and prize_id='{$prize_id}'");
					if (!$prize_code_robot) {
						$data = ["member_id" => $member_id, "prize_id" => $prize_id, "be_invited_id" => 0, "type" => 1, "source" => 1, "created" => time()];
						if (!pdo_insert(prefix_table('cj_prize_code'), $data)) {
							json('抽奖码添加失败', 0);
						}
						$id = pdo_insertid() % 1000000;
						$code = str_pad($id, 7, '0', STR_PAD_LEFT);
						$code = str_pad($code, 8, mt_rand(0, 9), STR_PAD_LEFT);
						if (!pdo_update(prefix_table('cj_prize_code'), ["code" => $code], ["id" => $id])) {
							json('生成抽奖码失败', 0);
						}
					}
					if (is_numeric($ranking)) {
						pdo_delete(prefix_table('cj_appoint'), ["order_id" => $order_id, "prize_id" => $prize_id]);
						json('');
					}
					$order = pdo_get(prefix_table('cj_order'), ["order_id" => $order_id]);
					$prize = pdo_get(prefix_table('cj_prize'), ["id" => $prize_id]);
					if (empty($order) || empty($prize)) {
						json('参数错误 order or prize is null', 0);
					}
					if ($prize['status'] == 1 || $prize['is_cancel'] == 1) {
						json('该抽奖已经结束', 0);
					}
					$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_appoint')) . "  WHERE prize_id={$prize_id} AND ranking='{$ranking}'");
					if ($total >= $prize[$ranking . '_num']) {
						json('设置失败,该奖数量不足', 0);
					}
					pdo_delete(prefix_table('cj_appoint'), ["order_id" => $order_id]);
					$data = ["order_id" => $order_id, "prize_id" => $prize_id, "member_id" => $order['member_id'], "ranking" => $ranking, "created" => time()];
					pdo_insert(prefix_table('cj_appoint'), $data);
					json('设置成功');
				} else {
					if ($op == 'delete') {
						$id = $this->get('id');
						pdo_delete(prefix_table('cj_prize_result'), ["prize_id" => $id]);
						pdo_delete(prefix_table('cj_order'), ["prize_id" => $id]);
						pdo_delete(prefix_table('cj_prize'), ["id" => $id]);
						json('删除成功');
					} else {
						if ($op == 'check') {
							$id = $this->get('id');
							pdo_update(prefix_table('cj_prize'), array("chk_flag" => 1), ["id" => $id]);
							json('审核成功');
						} else {
							if ($op == 'details') {
								$id = $this->get('id');
								$prize = pdo_get(prefix_table('cj_prize'), ["id" => $id]);
								if ($prize) {
									$prize['jump_program'] = pdo_get(prefix_table('cj_jump_program'), ["prize_id" => $prize['id']]);
									$image = pdo_get(prefix_table('cj_resource'), ["id" => $prize['attach_id']]);
									global $_W;
									$prize['attach_img'] = $_W['attachurl'] . $image['route'];
								}
								include $this->template('details');
							} else {
								if ($op == 'write_off') {
									$id = $this->get('id');
									$result_data = pdo_get(prefix_table('cj_prize_result'), array("result_id" => $id));
									$pvalue = $result_data['pvalue'];
									pdo_update(prefix_table('cj_member_voucher'), ["status" => 1, "write_off_time" => time()], ["voucher" => $pvalue, "member_id" => $result_data['member_id']]);
									pdo_update(prefix_table('cj_prize_result'), ["is_write_off" => 1], ["result_id" => $id]);
									json('');
								} else {
									$shop_list = pdo_getall(prefix_table('cj_shop'), array("is_del" => 0), array("id", "shop_name"), 'id');
									$nickname = $this->get('nickname');
									$status = $this->get('status');
									$chk_flag = $this->get('chk_flag');
									$is_global = $this->get('is_global', 0);
									$pindex = max(1, intval($this->get('page')));
									$psize = 10;
									$where = "is_global={$is_global}";
									if (!empty($nickname)) {
										$users = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_member')) . " WHERE nickname LIKE '%{$nickname}%'");
										if ($users) {
											$where .= ' AND member_id IN (';
											foreach ($users as $value) {
												$where .= "{$value['id']},";
											}
											$where = rtrim($where, ',') . ')';
										} else {
											$where = '1>1';
										}
									}
									if ($status == 1) {
										$where .= ' and status=1';
									} else {
										if ($status == 2) {
											$where .= ' and status=0';
										}
									}
									if ($home_recommendation_need_check) {
										if ($chk_flag == 1) {
											$where .= ' and chk_flag=1';
										} else {
											if ($status == 2) {
												$where .= ' and chk_flag=0';
											}
										}
									}
									$list = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_prize')) . " WHERE {$where} ORDER BY id DESC LIMIT " . ($pindex - 1) * $psize . ',' . $psize);
									$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_prize')) . "  WHERE {$where} ");
									$pager = pagination($total, $pindex, $psize);
									include ROOT_PATH . 'lib/Wxadoc.php';
									include ROOT_PATH . 'lib/Gd.class.php';
									include ROOT_PATH . 'lib/Image.class.php';
									$Image = new Image();
									$option = array("appid" => $_W['uniaccount']['key'], "secret" => $_W['uniaccount']['secret']);
									$wxObj = new Wxadoc($option);
									foreach ($list as &$value) {
										if ($value['type'] == 1) {
											$value['typevalue'] = date('Y-m-d H:i:s', $value['typevalue']);
											$value['types'] = '时间开奖';
										} else {
											if ($value['type'] == 2) {
												$value['types'] = '人数开奖';
											} else {
												$value['types'] = '手动开奖';
											}
										}
										if ($value['member_id'] > 0) {
											$value['member'] = pdo_get(prefix_table('cj_member'), ["id" => $value['member_id']]);
										}
										if ($value['is_cancel'] == 0 && $value['status'] == 1) {
											$value['in_prize'] = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_prize_result')) . " WHERE prize_id={$value['id']}");
										} else {
											$value['in_prize'] = 0;
										}
										$value['prize_name'] = $value['fir_ptype'] > 1 ? $value['fir_cname'] : $value['fir_val'];
										if (!file_exists(ATTACHMENT_ROOT . 'qr' . $_W['uniacid'])) {
											@mkdir(ATTACHMENT_ROOT . 'qr' . $_W['uniacid'], 0777, true);
										}
										$qrpath = ATTACHMENT_ROOT . 'qr' . $_W['uniacid'] . '/qr217' . $value['id'] . '.png';
										if (!is_file($qrpath)) {
											$qr_temp = ATTACHMENT_ROOT . 'qr_temp' . $value['id'] . '.jpg';
											$res = $wxObj->createwxaqrcode($value['id'], 'pages/partake/partake', 430, false, array("r" => 72, "g" => 145, "b" => 92));
											if ($res) {
												file_put_contents($qr_temp, $res);
												$qrimg = $Image->open($qr_temp);
												$qrimg->thumb(217, 217)->save($qrpath);
											}
											unlink($qr_temp);
										}
										$value['shop_name'] = $shop_list[$value['default_shop_id']]['shop_name'];
										$value['qr_code'] = $_W['siteroot'] . '/attachment/qr' . $_W['uniacid'] . '/qr217' . $value['id'] . '.png';
										if ($is_global) {
											$value['chk_flag_val'] = $home_recommendation_need_check ? $value['chk_flag'] ? '是' : '待审' : '是';
										}
									}
									include $this->template($is_global ? 'statistics1' : 'statistics');
								}
							}
						}
					}
				}
			}
		}
	}
	private function get($key, $default = "")
	{
		global $_GPC;
		return isset($_GPC[$key]) ? $_GPC[$key] : $default;
	}

	/**
     * 兑换管理
     */
	public function doWebGood(){
        global $_GPC, $_W;
        $op = $this->get('op');
        $table = prefix_table('cj_member_goods');
	    if ($op == 'delete'){
	        $id = $this->get('id');
	        if (pdo_update($table, ['isdelete'=>1], ["id" => $id])){
                json(1);
            }
            json(2);
        }else if ($op == 'add'){
            if ($_W['ispost']){
                $imgId = $this->get('img1');
                $imgSrc = pdo_get(prefix_table("cj_resource"),['id'=>$imgId]);
                $img1 = $_W['siteroot'] .'attachment' . $imgSrc['route'];
                $gname = $this->get('gname');
                $price = $this->get('price');
                $integral = $this->get('integral');
                $explain = $this->get('explain');
                $type = $this->get('type');
                $express = $this->get('express');
                $cost = $this->get('cost');
                $isdelete = 0;
                if (!$this->get('astock')){
                    $astock = $nstock = 0;
                }else{
                    $astock = $this->get('astock');
                    $nstock = $astock;
                }
                if (!$gname){
                    message('名称不能为空');
                }elseif (!$price){
                    message('实际价格不能为空');
                }elseif (!$integral){
                    message('所需积分不能为空');
                }elseif (!$explain){
                    message('描述不能为空');
                }elseif (!$type){
                    message('商品类型不能为空');
                }elseif ($type == 2 && empty($express)){
                    message('是否包邮不能为空');
                }elseif ($type == 2 && empty($cost)){
                    message('邮费不能为空');
                }
                $insert = ["gname" => $gname, "price" => $price, "integral" => $integral, "astock" => $astock, "nstock" => $nstock, "explain" => $explain, "type" => $type, "express" => $express, "cost" => $cost, "isdelete" => $isdelete, 'addtime'=>time(), 'updatetime'=>time(), 'img1'=> $img1];
                pdo_insert($table, $insert);
                message('添加成功', $this->createWebUrl('good'));
            }
            $upload = $_W['siteroot'] . "web/index.php?c=site&a=entry&do=upload&m=hu_couda";
            $image = $_W['siteroot'] . "web/index.php?c=site&a=entry&do=image&m=hu_couda";
            include $this->template('add_good');
        }else{
            $pindex = max(1, intval($this->get('page')));
            $psize = 10;
            $list = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_member_goods')) . "WHERE isdelete=0 " . ' ORDER BY id ASC LIMIT ' . ($pindex - 1) * $psize . ',' . $psize);
            $total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_member_goods')) . "WHERE isdelete=0");
            $pager = pagination($total, $pindex, $psize);
            include $this->template('good');
        }
    }
    /**
     * 添加商品兑换账号
     */
    public function doWebAccount(){
        if ($this->get('op') == 'add'){
            $gid      = $this->get('gid');
            $account  = $this->get('account');
            $password = $this->get('password');
            $type     = $this->get('type');
            if (!$gid){
                message('商品ID不能为空', $this->createWebUrl('good'));
            }elseif (!$account){
                message('账号不能为空');
            }elseif ($type != 0 && $type != 1){
                message('类型有误');
            }elseif ($type == 1 && empty($password)){
                message('该类型密码不能为空');
            }
            pdo_begin();
            if (!pdo_insert(prefix_table('cj_member_account'),array('gid'=>$gid, 'account'=>$account, 'password'=>$password, 'type'=>$type, 'createtime'=>time(), 'updatetime'=>time(), 'is_use'=>0))){
                message('帐户添加失败');
            }
            $good = $list = pdo_fetch('SELECT * FROM ' . tablename(prefix_table('cj_member_goods')) . "WHERE id=" . $gid);
            $astock = $good['astock'] + 1;
            $nstock = $good['nstock'] + 1;
            if (!pdo_update(prefix_table('cj_member_goods'),array('astock'=>$astock, 'nstock'=>$nstock, 'updatetime'=>time()),['id'=>$gid])){
                message('库存更新失败');
            }
            pdo_commit();
            message('添加成功！');
        }elseif ($this->get('op') == 'list'){
            if ($this->get('opp') == 'delete'){
                $id = $this->get('id');
                if (pdo_delete(prefix_table('cj_member_account'), ["id" => $id])){
                    json(1);
                }
                json(2);
            }
            $pindex = max(1, intval($this->get('page')));
            $psize = 10;
            $list = pdo_fetchall('SELECT ma.*, mg.gname FROM ' . tablename(prefix_table('cj_member_account')) . ' ma left join '  . tablename(prefix_table('cj_member_goods')) . 'mg on ma.gid=mg.id' . ' ORDER BY id DESC LIMIT ' . ($pindex - 1) * $psize . ',' . $psize);
            $total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_member_account')));
            $pager = pagination($total, $pindex, $psize);
            include $this->template('account_list');
        }else{
            $gid = $this->get('gid');
            include $this->template('add_account');
        }
    }
    /**
     * 兑换记录
     */
    public function doWebHistory(){
        $op = $this->get('op');
        if ($op == 'update'){
            $id = $this->get('id');
            $status = $this->get('status');
            if (pdo_update(prefix_table('cj_member_integral'), array("status" => $status), ["id" => $id])) {
                json(1);
            }
            json('',0);
        }
        $pindex = max(1, intval($this->get('page')));
        $psize = 10;
        $list = pdo_fetchall('SELECT mi.*, m.nickname, mg.gname, mg.type as mgtype, mp.name as mpname FROM ' . tablename(prefix_table('cj_member_integral')) . ' mi left join '  . tablename(prefix_table('cj_member')) . 'm on mi.mid=m.id left join ' . tablename(prefix_table('cj_member_goods')) . ' mg on mi.gid=mg.id left join ' . tablename(prefix_table('cj_member_program')) . ' mp on mi.pid=mp.id' . ' ORDER BY id ASC LIMIT ' . ($pindex - 1) * $psize . ',' . $psize);
        if ($list){
            foreach ($list as &$val){
                if($val['type'] == 1 || $val['type'] == 3){
                    $val['point'] = '+' . $val['point'];
                    $val['type'] = $val['type'] == 1?'点击小程序增加':'其他增加';
                }else if ($val['type'] == 2 || $val['type'] == 4){
                    $val['point'] = '-' . $val['point'];
                    $val['type'] = $val['type'] == 2?'兑换商品减少':'其他减少';
                }else{
                    $val['type'] = '未知';
                }
                $val['addtime'] = date('Y-m-d H:i', $val['addtime']);
                $val['updatetime'] = date('Y-m-d H:i', $val['updatetime']);
//                $val['status'] = $val['status'] == 0?'未知':$val['status'] == 1?'已兑换':$val['status'] == 2?'已发货':'已完成';
            }
        }

        $total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_member_integral')));
        $pager = pagination($total, $pindex, $psize);
        include $this->template('history');
    }
    /**
     * 小程序管理
     */
    public function doWebProgram(){
        global $_GPC, $_W;
        $op = $this->get('op');
        if ($op == 'add'){
            $opp = $this->get('opp');
            if ($opp == 'add'){
                $imgId    = $this->get('img1');
                $imgSrc   = pdo_get(prefix_table("cj_resource"),['id'=>$imgId]);
                $img1     = $_W['siteroot'] .'attachment' . $imgSrc['route'];
                $appid    = $this->get('appid');
                $name     = $this->get('name');
                $describe = $this->get('describe');
                $integral = $this->get('integral');
                if (!$appid){
                    message('appid不能为空');
                }elseif (!$name){
                    message('名称不能为空');
                }elseif (!$describe){
                    message('描述不能为空');
                }elseif (!$integral){
                    message('幸运币不能为空');
                }elseif (!$img1){
                    message('头像不能为空');
                }
                if (!pdo_insert(prefix_table('cj_member_program'),['appid'=>$appid, 'name'=>$name, 'describe'=>$describe, 'integral'=>$integral, 'avater'=>$img1, 'addtime'=>time(), 'updatetime'=>time(), 'count'=>0, 'isdelete'=>0])){
                    message('添加失败');
                }
                message('添加成功', $this->createWebUrl('program'));
            }
            $upload = $_W['siteroot'] . "web/index.php?c=site&a=entry&do=upload&m=hu_couda";
            $image = $_W['siteroot'] . "web/index.php?c=site&a=entry&do=image&m=hu_couda";
            include $this->template('add_program');
        }else if ($op == 'delete'){
            $id = $this->get('id');
            if (pdo_update(prefix_table('cj_member_program'),array('isdelete'=>1),['id'=>$id])){
                json(1);
            }else{
                json(0);
            }
        }else{
            $pindex = max(1, intval($this->get('page')));
            $psize = 10;
            $list = pdo_fetchall('SELECT * FROM ' . tablename(prefix_table('cj_member_program')) . ' WHERE isdelete=0 ORDER BY id ASC LIMIT ' . ($pindex - 1) * $psize . ',' . $psize);
            $total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename(prefix_table('cj_member_program')));
            $pager = pagination($total, $pindex, $psize);
            include $this->template('program');
        }
    }

    /**
     * 图片上传
     */
    public function doWebupload(){
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
    public function doWebImage()
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
}
function json($info, $status = 1)
{
	$info = ["info" => $info, "status" => $status];
	$info = json_encode($info, JSON_UNESCAPED_UNICODE);
	header('Content-Type: application/json;charset=utf-8');
	die($info);
}