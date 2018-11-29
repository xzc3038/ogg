<?php
/**
* [全球站长授权系统 System] Copyright (c) 2018  www.qqzzq.com
 */
defined('IN_IA') or exit('Access Denied');
if ($do == 'online') {
	header('Location: // www.qqzzq.com/app/api.php?referrer='.$_W['setting']['site']['key']);
	exit;
} elseif ($do == 'offline') {
	header('Location: // www.qqzzq.com/app/api.php?referrer='.$_W['setting']['site']['key'].'&standalone=1');
	exit;
} else {
}
template('cloud/device');
