<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<ul class="nav nav-tabs">
    <li class="active"><a href="javascript:;">兑换商品管理</a></li>
    <li class=""><a href="<?php  echo $this->createWeburl('good', array('op' => 'add'));?>">添加兑换商品</a></li>
</ul>
<div class="panel panel-default">
    <div class="table-responsive panel-body">
        <table class="table table-hover">
            <thead class="navbar-inner">
            <tr>
                <th style="width:60px;">序号</th>
                <th style="width:80px;">商品名称</th>
                <th style="width:80px;">商品实际价格(￥)</th>
                <th style="width:80px;">所需积分</th>
                <th style="width:80px;">库存/总库存</th>
                <th style="width:80px;">兑换说明</th>
                <th style="width:80px;">图片</th>
                <th style="width:80px;">商品类型</th>
                <th style="width:80px;">是否包邮</th>
                <th style="width:80px;">邮费(￥)</th>
                <th style="width:80px;">添加时间</th>
                <th style="width:80px;">更新时间</th>
                <th style="width:100px;">操作</th>
            </tr>
            </thead>
            <tbody>
            <?php  if(is_array($list)) { foreach($list as $item) { ?>
            <tr>
                <td><?php  echo $item['id'];?></td>
                <td><?php  echo $item['gname'];?></td>
                <td><?php  echo $item['price'];?></td>
                <td><?php  echo $item['integral'];?></td>
                <td><?php  echo $item['nstock'];?>/<?php  echo $item['astock'];?></td>
                <td><?php  echo $item['explain'];?></td>
                <td><img src="<?php  echo $item['img1'];?>" style="width: 50px;"></td>
                <td><?php  if($item['type'] == '0') { ?>未知 <?php  } ?><?php  if($item['type'] == '1') { ?>虚拟商品 <?php  } ?><?php  if($item['type'] == '2') { ?>实物 <?php  } ?></td>
                <td><?php  if($item['express'] == 0) { ?>未知<?php  } ?><?php  if($item['express'] == 1) { ?>包邮<?php  } ?><?php  if($item['express'] == 2) { ?>不包邮<?php  } ?></td>
                <td><?php  echo $item['cost'];?></td>
                <td><?php  echo date('Y-m-d',$item['addtime']);?></td>
                <td><?php  echo date('Y-m-d',$item['updatetime']);?></td>
                <td><a id="<?php  echo $item['id'];?>" class="delete">删除</a><?php  if($item['type'] == 1) { ?><a href="<?php  echo $this->createWeburl('account', array('gid' => $item['id']));?>">&nbsp;|&nbsp;添加账号</a><a href="<?php  echo $this->createWeburl('account', array('gid' => $item['id'], 'op'=>'list'));?>">&nbsp;|&nbsp;查看账号</a><?php  } ?></td>
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