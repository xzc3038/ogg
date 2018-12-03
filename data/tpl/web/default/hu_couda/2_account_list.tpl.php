<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<ul class="nav nav-tabs">
    <li class="active"><a href="javascript:;">商品账号管理</a></li>
</ul>
<div class="panel panel-default">
    <div class="table-responsive panel-body">
        <table class="table table-hover">
            <thead class="navbar-inner">
            <tr>
                <th style="width:60px;">序号</th>
                <th style="width:80px;">商品名称</th>
                <th style="width:80px;">账号</th>
                <th style="width:80px;">密码</th>
                <th style="width:80px;">兑换情况</th>
                <th style="width:80px;">创建时间</th>
                <th style="width:80px;">更新时间</th>
                <th style="width:100px;">操作</th>
            </tr>
            </thead>
            <tbody>
            <?php  if(is_array($list)) { foreach($list as $item) { ?>
            <tr>
                <td><?php  echo $item['id'];?></td>
                <td><?php  echo $item['gname'];?></td>
                <td><?php  echo $item['account'];?></td>
                <td><?php  echo $item['password'];?></td>
                <td><?php  if($item['explain'] == 0) { ?>未兑换<?php  } else { ?>已兑换<?php  } ?></td>
                <td><?php  echo date('Y-m-d',$item['createtime']);?></td>
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

            var id = $(this).attr('id');
            $.post('', {id:id, opp:'delete'}, function (data) {
                if (data.status == 1) {
                    location.href = location.href;
                } else {
                    alert('删除失败');
                }

            }, 'json')
        });
    });

</script>