<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 0) ? (include $this->template('common/header-base', TEMPLATE_INCLUDEPATH)) : (include template('common/header-base', TEMPLATE_INCLUDEPATH));?>
<div class="system-login" style="background-color: rgb(4,135,251);">
	<div class="login-panel" style="background:rgba(255,255,255,0.1);left: 40%;top:30%">
		<div class="title">
			<a href="javascript:void(0);" style="color: #fff;font-size: 20px;">账户登录</a>
		</div>
		<form action="" method="post" role="form" id="form1" onsubmit="return formcheck();" class="we7-form">
			<div class="input-group-vertical">
				<input name="login_type" type="hidden" class="form-control " value="system">
				<input name="username" type="text" class="form-control " placeholder="请输入用户名">
				<input name="password" type="password" class="form-control password" placeholder="请输入登录密码">
			</div>
			<div class="form-inline" style="margin-bottom: 15px;">
				<div class="pull-right">
					<a href="<?php  echo url('user/find-password');?>" target="_blank" class="color-default"></a>
				</div>
				<!--<div class="checkbox">-->
					<!--<input type="checkbox" value="true" id="rember" name="rember">-->
					<!--<label for="rember">记住用户名</label>-->
				<!--</div>-->
			</div>
			<div class="login-submit text-center">
				<input type="submit" id="submit" name="submit" value="登录" class="btn btn-primary btn-block" />
				<div class="text-right">
					<?php  if(!$_W['siteclose'] && $setting['register']['open']) { ?>
						<?php  if(empty($_GPC['login_type']) || $_GPC['login_type'] == 'system') { ?>
						<!--<a href="<?php  echo url('user/register');?>" class="color-default">立即注册</a>-->
						<?php  } ?>
						<?php  if($_GPC['login_type'] == 'mobile') { ?>
						<!--<a href="<?php  echo url('user/register', array('register_type' => 'mobile'))?>" class="color-default">立即注册</a>-->
						<?php  } ?>
					<?php  } ?>
				</div>
				<input name="token" value="<?php  echo $_W['token'];?>" type="hidden" />
			</div>
		</form>
	</div>
</div>

<script>
function formcheck() {
	if($('#remember:checked').length == 1) {
		cookie.set('remember-username', $(':text[name="username"]').val());
	} else {
		cookie.del('remember-username');
	}
	return true;
}
var h = document.documentElement.clientHeight;
$(".system-login").css('height',h);
$('#toggle').click(function() {
	$('#imgverify').prop('src', '<?php  echo url('utility/code')?>r='+Math.round(new Date().getTime()));
	return false;
});
<?php  if(!empty($_W['setting']['copyright']['verifycode'])) { ?>
	$('#form1').submit(function() {
		var verify = $(':text[name="verify"]').val();
		if (verify == '') {
			alert('请填写验证码');
			return false;
		}
	});
<?php  } ?>
</script>
