<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<ul class="nav nav-tabs">
    <li class="<?php  if($is_global == 0) { ?>active<?php  } ?>"><a href="<?php  echo $this->createWeburl('statistics1', array('is_global' => '0'));?>">首页抽奖</a></li>
    <li class="<?php  if($is_global == 1) { ?>active<?php  } ?>"><a href="<?php  echo $this->createWeburl('statistics1', array('is_global' => '1'));?>">用户发奖</a></li>
</ul>

<div class="panel panel-info">
    <div class="panel-heading">搜索</div>
    <div class="panel-body">
        <form action="./index.php" method="get" class="form-horizontal">
            <input type="hidden" name="c" value="site">
            <input type="hidden" name="a" value="entry">
            <input type="hidden" name="m" value="hu_couda">
            <input type="hidden" name="do" value="statistics1">
            <input type="hidden" name="is_global" value="1">

            <div class="form-group">
                <label class="col-xs-12 col-sm-2 col-md-2 col-lg-1 control-label" >发布人</label>
                <div class="col-sm-8 col-lg-2">
                    <input type="text" class="form-control" name="nickname"  value="<?php  echo $nickname;?>" />
                </div>

                <label class="col-xs-12 col-sm-2 col-md-2 col-lg-1 control-label" >状态</label>
                <div class="col-sm-8 col-lg-2">
                    <select class="" name="status">
                        <option value="0">所有</option>
                        <option <?php  if($status == 2) { ?>selected="selected"<?php  } ?> value="2">进行中</option>
                        <option <?php  if($status == 1) { ?>selected="selected"<?php  } ?> value="1">已结束</option>
                    </select>
                </div>

                <label class="col-xs-12 col-sm-2 col-md-2 col-lg-1 control-label" >审核</label>
                <div class="col-sm-8 col-lg-2">
                    <select class="" name="chk_flag">
                        <option value="0">所有</option>
                        <option <?php  if($chk_flag == 2) { ?>selected="selected"<?php  } ?> value="1">是</option>
                        <option <?php  if($chk_flag == 1) { ?>selected="selected"<?php  } ?> value="2">待审</option>
                    </select>
                </div>

                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i> 搜索</button>
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
                <th style="width:50px;">ID</th>
                <th style="width:80px;">小程序二维码</th>
                <?php  if($is_global == 0) { ?><th style="width:80px;">名称</th><?php  } ?>
                <?php  if($is_global == 1) { ?><th style="width:80px;">名称</th><?php  } ?>
                <th style="width:100px;">发布人</th>
                <th style="width:100px;">开奖方式</th>
                <th style="width:100px;">开奖时间/人数</th>
                <th style="width:100px;">参与人数</th>
                <th style="width:100px;">状态</th>
                <th style="width:100px;">已审核</th>
                <th style="width:100px;">中奖人数</th>
                <th style="width:170px;">操作</th>
            </tr>
            </thead>
            <tbody>
            <?php  if(is_array($list)) { foreach($list as $item) { ?>
            <tr class="list-img">
                <td><?php  echo $item['id'];?></td>
                <td>鼠标移上查看<br>
                    <img src="<?php  echo $item['qr_code'];?>" style="display: none;">
                </td>
                <?php  if($is_global == 0) { ?><td><a href="<?php  echo $_SERVER['REQUEST_URI'];?>&op=details&id=<?php  echo $item['id'];?>"><?php  echo $item['title'];?></a></td><?php  } ?>
                <?php  if($is_global == 1) { ?><td><?php  echo $item['prize_name'];?></td><?php  } ?>
                <td><?php  echo $item['member']['nickname'];?></td>
                <td><?php  echo $item['types'];?></td>
                <td><?php  echo $item['typevalue'];?></td>
                <td><a href="<?php  echo $this->createWeburl('statistics1', array('op' => 'apply', 'id' => $item['id']));?>"><?php  echo $item['apply_num'];?></a></td>
                <td>
                    <?php  if($item['status'] == 1) { ?>
                    已结束
                    <?php  } else { ?>
                    进行中
                    <?php  } ?>
                </td>
                <td><?php  echo $item['chk_flag_val'];?></td>

                <td><?php  echo $item['in_prize'];?></td>
                <td><a id="<?php  echo $item['id'];?>" class="delete">删除</a> |
                    <?php  if($item['chk_flag_val']!='是') { ?><a id="<?php  echo $item['id'];?>" class="check">审核</a> | <?php  } ?>
                    <a href="<?php  echo $this->createWeburl('statistics1', array('op' => 'apply', 'id' => $item['id']));?>">指定中奖</a> |
                    <a href="<?php  echo $_SERVER['REQUEST_URI'];?>&op=in_prize&id=<?php  echo $item['id'];?>">中奖查询</a>
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
        $('.check').click(function () {
            if (!confirm('确认审核吗?')) {
                return false;
            }

            id = $(this).attr('id');
            $.post('', {id:id, op:'check'}, function (data) {
                if (data.status == 1) {
                    location.href = location.href;
                } else {
                    alert('审核失败');
                }

            }, 'json')
        });
        $('.list-img').on({
            mouseover : function(){
                $(this).find('img').show() ;
            } ,
            mouseout : function(){
                console.log(2);
                $(this).find('img').hide() ;
            }
        }) ;

    });

</script>