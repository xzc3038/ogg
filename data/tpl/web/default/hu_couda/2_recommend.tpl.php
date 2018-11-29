<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<ul class="nav nav-tabs">
    <li class="active"><a href="javascript:;">首页推荐申请</a></li>
</ul>
<div class="panel panel-default">
    <div class="table-responsive panel-body">
        <table class="table table-hover">
            <thead class="navbar-inner">
            <tr>
                <th style="width:60px;">编号</th>
                <th style="width:60px;">首页状态</th>
                <th style="width:60px;">活动状态</th>
                <th style="width:60px;">昵称</th>
                <th style="width:80px;">联系方式</th>
                <th style="width:80px;">申请时间</th>
            </tr>
            </thead>
            <tbody>
            <?php  if(is_array($list)) { foreach($list as $item) { ?>
            <tr>
                <td><?php  echo $item['id'];?></td>
                <td><?php echo $item['recommend_id'] ? '显示' : '未显示';?></td>
                <td><?php echo $item['status'] ? '已结束' : '进行中';?></td>
                <td><?php  echo $item['member']['nickname'];?></td>
                <td><?php  echo $item['contact'];?></td>
                <td><?php  echo $item['created'];?></td>
            </tr>
            <?php  } } ?>
            </tbody>
        </table>
    </div>
    <?php  echo $pager;?>
</div>

