<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<ul class="nav nav-tabs">
    <li class="active"><a href="javascript:;">积分历史</a></li>
</ul>
<div class="panel panel-default">
    <div class="table-responsive panel-body">
        <table class="table table-hover">
            <thead class="navbar-inner">
            <tr>
                <th style="width:60px;">编号</th>
                <th style="width:60px;">用户</th>
                <th style="width:60px;">积分状态</th>
                <th style="width:60px;">此时积分</th>
                <th style="width:60px;">增减类型</th>
                <th style="width:80px;">场景说明</th>
                <th style="width:80px;">小程序名称</th>
                <th style="width:80px;">兑换商品</th>
                <th style="width:80px;">商品状态</th>
                <th style="width:80px;">创建时间</th>
                <th style="width:80px;">更新时间</th>
            </tr>
            </thead>
            <tbody>
            <?php  if(is_array($list)) { foreach($list as $item) { ?>
            <tr>
                <td><?php  echo $item['id'];?></td>
                <td><?php  echo $item['nickname'];?></td>
                <td><?php  echo $item['point'];?></td>
                <td><?php  echo $item['npoint'];?></td>
                <td><?php  echo $item['type'];?></td>
                <td><?php  echo $item['position'];?></td>
                <td><?php  echo $item['mpname'];?></td>
                <td><?php  echo $item['gname'];?></td>
                <?php  if($item['mgtype'] == 2) { ?>
                    <td>
                        <select name="status" class="status" id="<?php  echo $item['id'];?>" size="1" aria-invalid="false" style="width: 150px;">
                            <option <?php  if($item['status'] == 0) { ?>selected = "selected"<?php  } ?> value="0">未知</option>
                            <option <?php  if($item['status'] == 1) { ?>selected = "selected"<?php  } ?> value="1">已兑换</option>
                            <option <?php  if($item['status'] == 2) { ?>selected = "selected"<?php  } ?> value="2">已发货</option>
                            <option <?php  if($item['status'] == 3) { ?>selected = "selected"<?php  } ?> value="3">已完成</option>
                        </select>
                    </td>
                <?php  } else { ?>
                    <td>
                        <select size="1" aria-invalid="false" style="width: 150px;">
                            <option selected = "selected">已完成</option>
                        </select>
                    </td>
                <?php  } ?>
                <td><?php  echo $item['addtime'];?></td>
                <td><?php  echo $item['updatetime'];?></td>
            </tr>
            <?php  } } ?>
            </tbody>
        </table>
    </div>
    <?php  echo $pager;?>
</div>

<script>
   $(function () {
       $('.status').change(function () {
           $.post('', {id:$(this).attr('id'), status: $(this).val(), 'op' : 'update'}, function (data) {
               if (data.status == 1) {
                   alert('设置成功');
               } else {
                   alert('设置失败');
               }
           }, 'json');
       });
   })
</script>

