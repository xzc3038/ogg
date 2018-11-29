<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<ul class="nav nav-tabs">
    <li class="active"><a href="javascript:;">用户列表 <?php  echo $total;?></a></li>
    <li class=""><a href="<?php  echo $this->createWebUrl("member_edit", array("import" => 1));?>">导入机器人数据</a></li>
</ul>

<div class="panel panel-info">
    <div class="panel-heading">搜索</div>
    <div class="panel-body">
        <form action="./index.php" method="get" class="form-horizontal">
            <input type="hidden" name="c" value="site">
            <input type="hidden" name="a" value="entry">
            <input type="hidden" name="m" value="hu_couda">
            <input type="hidden" name="do" value="member">

            <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">用户类型</label>
                <div class="col-sm-2 col-xs-12">
                    <select class="" name="u_type">
                        <option value="0">所有</option>
                        <option <?php  if($u_type == 1) { ?>selected="selected"<?php  } ?> value="1">真实用户</option>
                        <option <?php  if($u_type == 2) { ?>selected="selected"<?php  } ?> value="2">机器人</option>
                    </select>
                </div>
                
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">黑名单</label>
                <div class="col-sm-2 col-xs-12">
                    <select class="" name="blacklist">
                        <option value="0">所有</option>
                        <option <?php  if($blacklist == 1) { ?>selected="selected"<?php  } ?> value="1">是</option>
                        <option <?php  if($blacklist == 2) { ?>selected="selected"<?php  } ?> value="2">否</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">昵称</label>
                <div class="col-sm-4 col-xs-12">
                    <input type="text" class="form-control" name="keyword" style="width: 500px;" value="<?php  echo $keyword;?>" />
                </div>
                <div class="pull-right col-xs-12 col-sm-3 col-md-2 col-lg-2">
                    
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i> 搜索</button>
                    <button name="del_share_image" value="1" class="btn btn-default"><i class="fa fa-file"></i> 更新海报缓存</button>
                </div>
            </div>            
        </form>
    </div>
</div>

<div class="panel panel-default">
    <div class="table-responsive panel-body">
        <table class="table table-hover">
            <thead class="navbar-inner">
            <tr>
                <th style="width:60px;">id</th>
                <th style="width:80px;">昵称</th>
                <th style="width:80px;">头像</th>
                <th style="width:100px;">性别</th>
                <th style="width:100px;">省份</th>
                <th style="width:100px;">城市</th>
                <th style="width:100px;">能否发布抽奖</th>
                <th style="width:100px;">关联店铺</th>
                <th style="width:100px;">参与时间</th>
                <th style="width:100px;">操作</th>
            </tr>
            </thead>
            <tbody>
            <?php  if(is_array($list)) { foreach($list as $item) { ?>
            <tr>
                <td><?php  echo $item['id'];?></td>
                <td><?php  echo $item['nickname'];?></td>
                <td><img src="<?php  echo $item['user_img'];?>" style="width:50px"></td>
                <td>
                    <?php  if($item['gender'] == 1) { ?>
                    男
                    <?php  } else if($item['gender'] == 2) { ?>
                    女
                    <?php  } else { ?>
                    未知
                    <?php  } ?>
                </td>
                <td><?php  echo $item['province'];?></td>
                <td><?php  echo $item['city'];?></td>
                <td>
                    <select name="is_release" class="is_release" id="<?php  echo $item['id'];?>" size="1" aria-invalid="false" style="width: 150px;">
                        <option <?php  if($item['is_release'] == 0) { ?>selected = "selected"<?php  } ?> value="0">不允许</option>
                        <option <?php  if($item['is_release'] == 1) { ?>selected = "selected"<?php  } ?> value="1">允许</option>
                    </select>
                </td>
                <td>
                    <?php  if($item['shop_id'] == 0) { ?>
                    未关联
                    <?php  } else { ?>
                    <?php  echo $item['shop']['shop_name'];?>
                    <?php  } ?>
                </td>
                <td><?php  echo date('Y-m-d',$item['add_time']);?></td>
                <td>
                    <?php  if($item['shop_id'] == 0) { ?>
                    <a href="<?php  echo $this->createWeburl('member', array('op' => 'gl', 'id' => $item['id']));?>">关联店铺</a>
                    <?php  } else { ?>
                    <a href="javascript:;" class="cancel" data-id="<?php  echo $item['id'];?>">取消关联</a>
                    <?php  } ?>
                    &nbsp;
                    <?php  if($item['blacklist'] == 0) { ?>
                    <a id="<?php  echo $item['id'];?>" title="拉黑后不会中奖" class="blacklist">拉黑</a>
                    <?php  } else { ?>
                    <a id="<?php  echo $item['id'];?>" class="blacklist_cancel">恢复</a>
                    <?php  } ?>
                    &nbsp;
                    <a id="<?php  echo $item['id'];?>" class="delete">删除</a>                    
                </td>
            </tr>
            <?php  } } ?>
            </tbody>
        </table>
    </div>
    <?php  echo $pager;?>
</div>
<script type="application/javascript">
    $(function () {
        
        $('.blacklist_cancel').click(function () {
            id = $(this).attr('id');
            $.post('', {id:id, op:'blacklist_cancel'}, function (data) {
                if (data.status == 1) {
                    location.href = location.href;
                } else {
                    alert('操作失败');
                }

            }, 'json')
        });        
        $('.blacklist').click(function () {
            id = $(this).attr('id');
            $.post('', {id:id, op:'blacklist'}, function (data) {
                if (data.status == 1) {
                    location.href = location.href;
                } else {
                    alert('操作失败');
                }

            }, 'json')
        });        
        $('.delete').click(function () {
            if (!confirm('确认要删除?')) {
                return false;
            }
            id = $(this).attr('id');
            $.post('', {id:id, op:'delete'}, function (data) {
                if (data.status == 1) {
                    location.href = location.href;
                } else {
                    alert('删除失败');
                }

            }, 'json')
        });
        $('.is_release').change(function () {
            $.post('', {id:$(this).attr('id'), is_release: $(this).val(), 'op' : 'is_release'}, function (data) {
                if (data.status == 1) {
                    alert('设置成功');
                } else {
                    alert('设置失败');
                }
            }, 'json');
        });
        $('.cancel').click(function () {
            if (!confirm('确认要取消关联的店铺')) {
                return ;
            }
            var id = $(this).data('id');
            $.post('', {id:id, op:'cancel'}, function (data) {
                location.href = location.href;
            }, 'json')
        });
    })
</script>