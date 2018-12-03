<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>

<div class="main">
    <div class="panel panel-info">
        <div class="panel-heading">添加商品账户</div>
        <div class="panel-body">
            <form action="<?php  echo $this->createWeburl('account');?>" method="post" class="form-horizontal" id="myform">

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">类型</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select name="status" class="status" size="1" aria-invalid="false" style="width: 150px;">
                            <option select="select" value="0">仅账号</option>
                            <option value="1">账号及密码</option>
                        </select>
                        <input type="hidden" value="0" id="type" name="type">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">账户名称</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="account" placeholder="账户名称" type="text">
                    </div>
                </div>

                <div class="form-group" id="password" style="display: none;">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">密码:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="password" placeholder="账户密码" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="" >
                        <input type="hidden" name="gid" value="<?php  echo $gid;?>">
                        <input type="hidden" name="op" value="add">
                        <input type="submit" name="submit" id="submit" value="提交" class="btn btn-primary">
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('.status').change(function () {
            $('#type').val($(this).val());
            if ($(this).val() == 1){
                $('#password').css('display','');
            } else{
                $('#password').css('display','none');
            }
        });
    })
</script>



