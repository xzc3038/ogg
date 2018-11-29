<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<script type="text/javascript" src="../addons/<?php  echo $name;?>/template/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<link rel="stylesheet" href="https://fengyuanchen.github.io/cropper/css/cropper.css"></link>
<link rel="stylesheet" href="../addons/<?php  echo $name;?>/template/css/cropper.min.css">
<link rel="stylesheet" href="../addons/<?php  echo $name;?>/template/css/ImgCropping.css">
<link href="./resource/css/app.css" rel="stylesheet">
<ul class="nav nav-tabs">
    <li class="<?php echo !$op ? 'active' : '';?>"><a href="<?php  echo $this->createWeburl('ad_mng', array('op' => ''));?>">广告列表</a></li>
    <li class="<?php echo $op ? 'active' : '';?>"><a href="<?php  echo $this->createWeburl('ad_mng', array('op' => 'add'));?>"><?php echo $op=='edit' ? '修改' : '添加';?>广告</a></li>
</ul>

<?php  if(!$op) { ?>
    <div class="panel panel-default">
        <div class="table-responsive panel-body">
            <table class="table table-hover">
                <thead class="navbar-inner">
                <tr>
                    <th>ID</th>
                    <th>广告位置</th>
                    <th>类型</th>
                    <th>流程主ID</th>
                    <th>自定义广告</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <?php  if(is_array($list)) { foreach($list as $item) { ?>
                <tr>
                    <td><?php  echo $item['id'];?></td>
                    <td><?php  echo $show_place_arr[$item['show_place']];?></td>
                    <td><?php  echo $ad_type_arr[$item['ad_type']];?></td>
                    <td><?php  echo $item['a_unit_id'];?></td>
                    <td><?php  if($item['d_pic']) { ?><img src="<?php  echo tomedia($item['d_pic']);?>" style="width:216px; height:71px"><br><?php  } ?><?php  echo $item['d_appid'];?><br><?php  echo $item['d_page'];?></td>
                    <td><?php  echo date('Y-m-d H:i' ,$item['begin_time']);?><br><?php  echo date('Y-m-d H:i' ,$item['end_time']);?>
                    
                    </td>
                    
                    <td><a href="<?php  echo $this->createWeburl('ad_mng', array('op' => 'edit', 'id' => $item['id']));?>">编辑</a>/<a id="<?php  echo $item['id'];?>" class="delete">删除</a></td>
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
<?php  } else { ?>
<div class="main">
    <div class="panel panel-info">
        <div class="panel-heading">广告信息</div>
        <div class="panel-body">
            <form action="" method="post" class="form-horizontal" id="myform" role="form" enctype="multipart/form-data">

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">广告位置:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                    <select id="show_place" name="show_place" class="form-control">
                        <?php  if(is_array($show_place_arr)) { foreach($show_place_arr as $id => $name) { ?>
                        <option value="<?php  echo $id;?>" <?php  if($id == $data['show_place']) { ?>selected<?php  } ?>><?php  echo $name;?></option>
                        <?php  } } ?>
                    </select>
                    <span class="help-block">不设置则用基本设置中的全局广告代替</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">广告类型:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                    <select id="ad_type" name="ad_type" class="form-control">
                        <?php  if(is_array($ad_type_arr)) { foreach($ad_type_arr as $id => $name) { ?>
                        <option value="<?php  echo $id;?>" <?php  if($id == $data['ad_type']) { ?>selected<?php  } ?>><?php  echo $name;?></option>
                        <?php  } } ?>
                    </select>
                    </div>
                </div>       
            <div id='ad_1'>    
                <div class="form-group" style='display:<?php echo $data['ad_type'] == '2' ? 'none' : '';?>'>
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">流量主ID:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="a_unit_id" value="<?php  echo $data['a_unit_id'];?>" type="text">
                        <span class="help-block"></span>
                    </div>
                </div>
            </div>
            <div id='ad_2' style='display:<?php echo $data['ad_type'] != '2' ? 'none' : '';?>'>    
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">广告图片：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12" >
                        <?php  echo tpl_form_field_image('d_pic', $data['d_pic']);?>
                        <span class="help-block">比例：300*98</span>
                    </div>
                </div>                 
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">小程序Appid:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="d_appid" value="<?php  echo $data['d_appid'];?>" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">小程序页面地址:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="d_page" value="<?php  echo $data['d_page'];?>" type="text">
                        <span class="help-block">你的小程序地址（可以在小程序后台查看到） 如：run_number/pages/index/index</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">小程序地址参数:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="d_para" value="<?php  echo $data['d_para'];?>" type="text">
                        <span class="help-block">不明白不用写</span>
                    </div>
                </div>
                

            </div>
               
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">广告有效期:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <?php  echo tpl_form_field_daterange('datelimit', array('start'=>date('Y-m-d H:i',$data['begin_time']),'end'=>date('Y-m-d H:i',$data['end_time'])), true)?>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="" >
                        <input type="hidden" name="token" value="<?php  echo $_W['token'];?>" />
                        <input type="hidden" name="op" value="<?php  echo $op;?>">
                        <input type="submit" name="submit" id="submit" value="保存" class="btn btn-primary">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
    <script type="application/javascript">
$("#ad_type").change(function(){
            $('#ad_1').hide();
            $('#ad_2').hide();
            $('#ad_' + $(this).val()).show();
});       
    </script>
<?php  } ?>
