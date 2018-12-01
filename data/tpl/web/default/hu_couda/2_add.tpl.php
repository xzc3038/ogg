<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>

<script type="text/javascript" src="../addons/<?php  echo $name;?>/template/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<link rel="stylesheet" href="https://fengyuanchen.github.io/cropper/css/cropper.css"></link>
<link rel="stylesheet" href="../addons/<?php  echo $name;?>/template/css/cropper.min.css">
<link rel="stylesheet" href="../addons/<?php  echo $name;?>/template/css/ImgCropping.css">
<style>
    .webuploader-pick{
        border: 1px solid;
        background-color:#428bca;
        color: #fff;
        border-radius: 4px;
        width: 82px !important;
        height: 32px !important;
        height:32px;
        line-height:32px;
        overflow:hidden;
        text-align:center
    }
</style>
<div class="main">
    <div class="panel panel-info">
        <div class="panel-heading">添加</div>
        <div class="panel-body">
            <form action="" method="get" class="form-horizontal" id="myform" role="form">

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">*标题：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="title" placeholder="标题" type="text" value="<?php  echo $cj_pre_prize_data['title'];?>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">加入任务队列：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input name="in_task" value="1" type="checkbox">是
                        <span class="help-block">选择后直接上前端，不能再修改</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">正式发布时间：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control"  onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" value="<?php  echo $cj_pre_prize_data['in_task_time'];?>" name="in_task_time" placeholder="发布时间" type="text" style="width:180px;">
                        <span class="help-block">请先加入任务队列，再设置时间，只有到了指定时间才会正式发布到手机端</span>
                    </div>
                </div> 
                
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">是否为口令抽奖：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="is_command" id="is_command" onchange="chg_is_command(this.value);" aria-invalid="false">
                            <option value="0" <?php  if($cj_pre_prize_data['is_command']==0) { ?>selected="selected"<?php  } ?>>否</option>
                            <option value="1" <?php  if($cj_pre_prize_data['is_command']==1) { ?>selected="selected"<?php  } ?>>是</option>
                        </select>
                        <span style="display:<?php echo $cj_pre_prize_data['is_command']==1 ? '' : 'none';?>;" id="span_command"><input value="<?php  echo $cj_pre_prize_data['command'];?>" class="form-control" name="command" id="command" placeholder="请输入抽奖口令" type="text"></span>
                    </div>
                </div>

                
                
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">排序：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="page_order" value="<?php  echo $cj_pre_prize_data['page_order'];?>" type="text" style="width:20%; float:left">
                        <div class="help-block" style="color:#F00">值越大越靠前</div>
                    </div>
                </div>
 
                
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">*赞助商：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="uname" value="<?php  echo $cj_pre_prize_data['uname'];?>" placeholder="赞助商" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">开奖方式(人数抽奖需要关闭机器人)：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="type" id="type-select" size="1" style="width: 150px;" aria-invalid="false">
                            <option value="1" <?php  if($cj_pre_prize_data['type']==1) { ?>selected="selected"<?php  } ?>>时间</option>
                            <option value="2" <?php  if($cj_pre_prize_data['type']==2) { ?>selected="selected"<?php  } ?>>人数</option>
                        </select>
                    </div>
                </div>

                <div class="form-group" id="type-content">
                <?php  if($cj_pre_prize_data['type']==2) { ?>
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">*开奖人数：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                    <input class="form-control"  name="opentime" placeholder="开奖人数" type="text" value="<?php  echo $cj_pre_prize_data['opentime'];?>" style="width:180px;">
                    </div>                
                <?php  } else { ?>
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">*开奖时间：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control"  onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" id="logmax" value="<?php  echo $cj_pre_prize_data['opentime'];?>" name="opentime" placeholder="开奖时间" type="text" style="width:180px;">
                        <span class="help-block">考虑到小程序的模板消息周期，建议上架到开奖时间不要超过7天</span>
                    </div>
                <?php  } ?>
                </div> 

                <?php  if($cj_pre_prize_data['type']!=2) { ?>
                <div class="form-group" id="open_robot">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">机器人：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" id="is_robot" name="is_robot" size="1" aria-invalid="false" style="width: 150px;float:left">
                            <option value="0" <?php  if($cj_pre_prize_data['is_robot']==0) { ?>selected="selected"<?php  } ?>>不开启</option>
                            <option value="1" <?php  if($cj_pre_prize_data['is_robot']==1) { ?>selected="selected"<?php  } ?>>开启</option>
                        </select>

                        <span id='is_robot_max'style="width:30%; display:<?php echo $cj_pre_prize_data['is_robot']!=1?'none':'';?>">&nbsp;&nbsp;&nbsp;&nbsp;生成机器人上限数量（最高可为<?php  echo $is_robot_max;?>）
                        <input class="form-control" name="is_robot_max" value="<?php  echo $cj_pre_prize_data['is_robot_max'];?>" type="text" style="width:20%;display:inherit">
                        </span>
                    </div>
                </div>
                 <?php  } ?>
                    
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">组团人数：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="max_group_num" size="1" aria-invalid="false" style="width: 150px;">
                            <option value="0">单人抽奖</option>
                            <!--<option value="3">3人团</option>
                            <option value="6">6人团</option>
                            <option value="9">9人团</option>-->
                        </select>
                    </div>
                </div>

                <!--<div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">path：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="path" placeholder="path" type="text">
                    </div>
                </div>-->


                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">复制/跳转小程序公众号：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="copy_type" id="copy_type" size="1" aria-invalid="false" style="width: 150px;">
                            <option value="1" <?php  if($cj_pre_prize_data['copy_type']==1) { ?>selected="selected"<?php  } ?>>小程序</option>
                            <option value="2" <?php  if($cj_pre_prize_data['copy_type']==2) { ?>selected="selected"<?php  } ?>>公众号</option>
                        </select>
                    </div>
                </div>

                <span id="copy-1" style='display:<?php  if($cj_pre_prize_data['copy_type']==2) { ?>none<?php  } ?>'>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">关联小程序appid：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="appid" value="<?php  echo $cj_pre_prize_data['appid'];?>" placeholder="appid" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">小程序名：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="app_name" value="<?php  echo $cj_pre_prize_data['app_name'];?>" placeholder="app_name" type="text">
                    </div>
                </div>
                </span>

                <span id="copy-2" style="display: <?php  if($cj_pre_prize_data['copy_type']!=2) { ?>none<?php  } ?>;">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">公众号：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="wechat_no" placeholder="公众号" value="<?php  echo $cj_pre_prize_data['wechat_no'];?>" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">公众号描述：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="wechat_title" value="<?php  echo $cj_pre_prize_data['wechat_title'];?>" placeholder="公众号描述" type="text">
                    </div>
                </div>
                </span>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">一句话广告：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="brief_description" value="<?php  echo $cj_pre_prize_data['brief_description'];?>" placeholder="一句话广告" type="text">
                    </div>
                </div>



                <!--<div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">wechat_no：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="wechat_no" placeholder="wechat_no" type="text">
                    </div>
                </div>-->

                <!--<span id="extraData_add">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">extraData：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="extraData" placeholder="extraData" type="text" w>
                    </div>
                </div>
                </span>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="" >
                        <input type="button" name="submit" value="添加" id="add-extraData" class="btn btn-primary">
                    </div>
                </div>-->


                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">实物奖品所属店铺：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="default_shop_id">
                            <?php  if(is_array($shop_list)) { foreach($shop_list as $shop_id => $shop_data) { ?>
                            <option value="<?php  echo $shop_id;?>" <?php  if($cj_pre_prize_data['default_shop_id']==$shop_id) { ?>selected="selected"<?php  } ?>><?php  echo $shop_data['shop_name'];?></option>
                            <?php  } } ?>
                        </select>
                        <span class="help-block">用户线下核销、给店铺管理员推送消息</span>
                    </div>
                </div>   

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">*一等奖奖品：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="fir_val" id="fir_val" value="<?php echo $cj_pre_prize_data['fir_ptype']==3 ? '卡券' : $cj_pre_prize_data['fir_val']?>" placeholder="一等奖奖品" type="text">
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">一等奖类型：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid select-voucher" data-id="fir" name="fir_ptype" size="1" style="width: 150px;" aria-invalid="false">
                            <option value="0" <?php  if($cj_pre_prize_data['fir_ptype']==0) { ?>selected="selected"<?php  } ?>>实物</option>
                            <?php  if($goods) { ?><option value="3" <?php  if($cj_pre_prize_data['fir_ptype']==3) { ?>selected="selected"<?php  } ?>>卡券<?php  } ?>
                        </select>
                        <select id="fir_ptype_voucher" class="select valid voucher-list" data-id="fir" name="fir_voucher" size="1" style="width: 150px;display:<?php  if($cj_pre_prize_data['fir_ptype']!=3) { ?>none<?php  } ?>;" aria-invalid="false">
                            <?php  if(is_array($goods)) { foreach($goods as $item) { ?>
                            <option value="<?php  echo $item['id'];?>"><?php  echo $item['goods_name'];?></option>
                            <?php  } } ?>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">*一等奖数量：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="fir_num" value="<?php  echo $cj_pre_prize_data['fir_num'];?>" placeholder="一等奖数量" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">二等奖奖品：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="sec_val" id="sec_val" value="<?php echo $cj_pre_prize_data['sec_ptype']==3 ? '卡券' : $cj_pre_prize_data['sec_val']?>" placeholder="" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">二等奖奖品：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select select-voucher" data-id="sec" name="sec_ptype" size="1" style="width: 150px;">
                            <option value="0" <?php  if($cj_pre_prize_data['sec_ptype']==0) { ?>selected="selected"<?php  } ?>>实物</option>
                            <?php  if($goods) { ?><option value="3" <?php  if($cj_pre_prize_data['sec_ptype']==3) { ?>selected="selected"<?php  } ?>>卡券<?php  } ?>                            
                        </select>
                        <select id="sec_ptype_voucher" class="select valid voucher-list" data-id="sec" name="sec_voucher" size="1" style="width: 150px;display: <?php  if($cj_pre_prize_data['sec_ptype']!=3) { ?>none<?php  } ?>;" aria-invalid="false">
                            <?php  if(is_array($goods)) { foreach($goods as $item) { ?>
                            <option value="<?php  echo $item['id'];?>"><?php  echo $item['goods_name'];?></option>
                            <?php  } } ?>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">二等奖数量：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="sec_num" value="<?php  echo $cj_pre_prize_data['sec_num'];?>" placeholder="" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">三等奖奖品：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control " name="trd_val" value="<?php echo $cj_pre_prize_data['trd_ptype']==3 ? '卡券' : $cj_pre_prize_data['trd_val']?>" id="trd_val" placeholder="" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">三等奖类型：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select select-voucher" data-id="trd" name="trd_ptype" size="1" style="width: 150px;">
                            <option value="0" <?php  if($cj_pre_prize_data['trd_ptype']==0) { ?>selected="selected"<?php  } ?>>实物</option>
                            <?php  if($goods) { ?><option value="3" <?php  if($cj_pre_prize_data['trd_ptype']==3) { ?>selected="selected"<?php  } ?>>卡券<?php  } ?>                                        
                        </select>
                        <select id="trd_ptype_voucher" class="select valid voucher-list" data-id="trd" name="trd_voucher" size="1" style="width: 150px;display: <?php  if($cj_pre_prize_data['trd_ptype']!=3) { ?>none<?php  } ?>;" aria-invalid="false">
                            <?php  if(is_array($goods)) { foreach($goods as $item) { ?>
                            <option value="<?php  echo $item['id'];?>"><?php  echo $item['goods_name'];?></option>
                            <?php  } } ?>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">三等奖数量：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="trd_num" value="<?php  echo $cj_pre_prize_data['trd_num'];?>" placeholder="" type="text">
                    </div>
                </div>
                        
                <div class="form-group" id="text-type">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">详细说明：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <?php  echo tpl_ueditor('description', $cj_pre_prize_data['description']);?>
                        <span class="help-block">如果出现安卓手机无法查看详情问题，则只在说明中加文字，而且不要加任何样式如对齐方式和颜色样式等</span>
                    </div>

                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">封面图片：</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12" >
                        <?php  echo tpl_form_field_image('replaceImg', $replaceImg);?>
                        <span class="help-block">比例：304*149</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="" >
                        <?php  if($attach_id) { ?>
                        <img id="finalImg" src="<?php  echo $this->getResImg($attach_id);?>" width="50%" height="50%">
                        <?php  } else { ?>
                        <img style="display: none" id="finalImg" src="" width="50%" height="50%">
                        <?php  } ?>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="" >
                        <input type="hidden" name="op" value="add">
                        <input type="hidden" id="attach_id" name="attach_id" value="<?php  echo $cj_pre_prize_data['attach_id'];?>">
                        <input type="hidden" id="prize_id" name="prize_id" value="<?php  echo $prize_id;?>">
                        <input type="button" name="submit" id="submit" value="提交" class="btn btn-primary">
                    </div>
                </div>


            </form>
        </div>
    </div>
</div>


<script type="application/javascript">
    function chg_is_command (type) {
        if (type == 0) {
            $('#span_command').hide();
        } else {
            $('#span_command').show();
        }
    }
    var href = "<?php  echo $this->createWeburl('index');?>";

    $(function () {
        $('#copy_type').change(function () {
            if ($(this).val() == 1) {
                $('#copy-1').show();
                $('#copy-2').hide();
            } else {
                $('#copy-2').show();
                $('#copy-1').hide();
            }
        });

        $('.select-voucher').click(function () {
            var id = $(this).data('id');
            if ($(this).val() == 0) {
                $('#' + id + '_ptype_voucher').hide();
            } else {
                $('#' + id + '_ptype_voucher').show();
                $('#' + id + '_ptype_voucher').change();
            }
        });
        $('#fir_ptype_voucher,#sec_ptype_voucher,#trd_ptype_voucher').change(function () {

            id = $(this).data('id');console.log(id);
            $val = $("#"+id+"_ptype_voucher option:selected").text();
            $('#' + id + '_val').val($val);
        });

        $("#type-select").change(function () {
          //  console.log($(this).val());

            if ($(this).val() == 1) {
                $('#open_robot').show();
                html = '<label class="col-xs-12 col-sm-3 col-md-2 control-label">*开奖时间：</label>' +
                    '<div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">' +
                    '<input class="form-control"  onfocus="WdatePicker({ dateFmt: \'yyyy-MM-dd HH:mm:ss\' })" id="logmax"  name="opentime" placeholder="开奖时间" type="text" style="width:180px;">' +
                    '</div>';
            } else {
                $('#open_robot').hide();
                html = '<label class="col-xs-12 col-sm-3 col-md-2 control-label">*开奖人数：</label>' +
                    '<div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">' +
                    '<input class="form-control"  name="opentime" placeholder="开奖人数" type="text" style="width:180px;">' +
                    '</div>';
            }
            $('#type-content').html(html);
        });

        $('#submit').click(function () {
            $.post('', $('#myform').serialize(), function (data) {
                if (data.status == 1) {
                    location.href = href;
                } else {
                    alert(data.info);
                }
            }, 'json');
        });

        $('#is_robot').click(function () {
            if ($(this).val() == '1') {
                 $('#is_robot_max').show();
            } else {
                $('#is_robot_max').hide();
            }
        });

    });
</script>

