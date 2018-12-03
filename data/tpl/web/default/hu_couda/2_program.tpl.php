<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<ul class="nav nav-tabs">
    <li class="active"><a href="javascript:;">小程序管理</a></li>
    <li class=""><a href="<?php  echo $this->createWeburl('program', array('op' => 'add'));?>">添加小程序</a></li>
</ul>
<div class="panel panel-default">
    <div class="table-responsive panel-body">
        <table class="table table-hover">
            <thead class="navbar-inner">
            <tr>
                <th style="width:60px;">序号</th>
                <th style="width:80px;">appid</th>
                <th style="width:80px;">小程序名称</th>
                <th style="width:80px;">小程序头像</th>
                <th style="width:80px;">描述</th>
                <th style="width:80px;">点击获取积分</th>
                <th style="width:80px;">被点击次数</th>
                <th style="width:80px;">添加时间</th>
                <th style="width:80px;">更新时间</th>
                <th style="width:80px;">操作</th>
            </tr>
            </thead>
            <tbody>
            <?php  if(is_array($list)) { foreach($list as $item) { ?>
            <tr>
                <td><?php  echo $item['id'];?></td>
                <td><?php  echo $item['appid'];?></td>
                <td><?php  echo $item['name'];?></td>
                <td><img src="<?php  echo $item['avater'];?>" style="width: 200px;" alt=""></td>
                <td><?php  echo $item['describe'];?></td>
                <td><?php  echo $item['integral'];?></td>
                <td><?php  echo $item['count'];?></td>
                <td><?php  echo date('Y-m-d',$item['addtime']);?></td>
                <td><?php  echo date('Y-m-d',$item['updatetime']);?></td>
                <td><a id="<?php  echo $item['id'];?>" class="delete">删除</a></td>
            </tr>
            <?php  } } ?>
            </tbody>
        </table>
    </div>
    <?php  echo $pager;?>
</div>
<script type="application/javascript">
    $(function () {
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
    });

</script>