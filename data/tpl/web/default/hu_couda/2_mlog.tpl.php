<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<ul class="nav nav-tabs">
    <li class="active"><a href="javascript:;">提现记录</a></li>
</ul>
<div class="panel panel-info">
    <div class="panel-heading">搜索</div>
    <div class="panel-body">
        <form action="./index.php" method="get" class="form-horizontal">
            <input type="hidden" name="c" value="site">
            <input type="hidden" name="a" value="entry">
            <input type="hidden" name="m" value="hu_couda">
            <input type="hidden" name="do" value="mlog">

            <div class="form-group">
                <label class="col-xs-12 col-sm-1 control-label">用户昵称</label>
                <div class="col-sm-2 col-xs-12">
                    <input type="text" class="form-control" name="nickname"  value="<?php  echo $nickname;?>" />
                </div>
                <label class="col-xs-12 col-sm-1 control-label">状态</label>
                <div class="col-sm-2 col-xs-12">
                    <select name='type'>
                        <option value='0'>全部</option>
                    <?php  if(is_array($this->getMoneyType())) { foreach($this->getMoneyType() as $k => $type_v) { ?>
                    <option value='<?php  echo $k;?>' <?php  if($k==$type) { ?>selected='selected'<?php  } ?>><?php  echo $type_v;?></option>
                    <?php  } } ?>
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
                <th style="width:60px;">序号</th>
                <th style="width:80px;">昵称</th>
                <th style="width:80px;">头像</th>                
                <th style="width:80px;">金额 ￥<?php  echo $all_money;?></th>
                <th style="width:100px;">操作类型</th>
                <th style="width:80px;">时间</th>
            </tr>
            </thead>
            <tbody>
            <?php  if(is_array($list)) { foreach($list as $item) { ?>
            <tr>
                <td><?php  echo $item['id'];?></td>
                <td><?php  echo $item['nickname'];?></td>
                <td><img src="<?php  echo $item['head'];?>" style="width:50px"></td>                   
                <td>￥<?php  echo $item['money'];?></td>
                <td><?php  echo $this->getMoneyType($item['type']);?></td>
                <td><?php  echo date('Y-m-d H:i:s', $item['created']);?></td>
            </tr>
            <?php  } } ?>
            </tbody>
        </table>
    </div>
    <?php  echo $pager;?>
</div>
