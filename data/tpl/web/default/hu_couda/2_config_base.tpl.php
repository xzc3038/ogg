<?php defined('IN_IA') or exit('Access Denied');?><div class="panel panel-success">
    <div class="panel-heading">基本设置</div>
    <div class="panel-body">

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">定时任务地址</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <?php  echo $_W['siteroot'];?>app/index.php?i=<?php  echo $_W['uniacid'];?>&c=entry&op=receive_card&do=open&m=hu_couda&a=wxapp
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">小程序标题</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="title" placeholder="标题" value="<?php  echo $title['value'];?>" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">是否允许前台发布抽奖</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="is_release" size="1" aria-invalid="false" style="width: 150px;">
                            <option <?php  if($is_release['value'] == 0) { ?>selected = "selected"<?php  } ?> value="0">不允许</option>
                            <option <?php  if($is_release['value'] == 1) { ?>selected = "selected"<?php  } ?> value="1">允许</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">无发布抽奖权限提醒:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="release_msg" placeholder="无发布抽奖提醒" value="<?php  echo $release_msg['value'];?>" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">机器人:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="robot" id="robot" size="1" aria-invalid="false" style="width: 150px;">
                            <option <?php  if($robot['value'] == 0) { ?>selected = "selected"<?php  } ?> value="0">不开启</option>
                            <option <?php  if($robot['value'] == 1) { ?>selected = "selected"<?php  } ?> value="1">开启</option>
                        </select>
                    </div>
                </div>


                <div class="form-group" id="open_robot_m" style="display:<?php echo $robot['value'] == 1 ? '' : 'none';?>">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">手机端发布时的机器人配置:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" id="robot_m" name="robot_m" size="1" aria-invalid="false" style="width: 150px;float:left">
                            <option value="0" <?php  if($robot_m['value']==0) { ?>selected="selected"<?php  } ?>>不开启</option>
                            <option value="1" <?php  if($robot_m['value']==1) { ?>selected="selected"<?php  } ?>>开启</option>
                        </select>

                        <span id='span_robot_m_percent'style="width:30%; display:<?php echo $robot_m['value']!=1?'none':'';?>">时间开奖时生成机器人上限数量（最多可为<?php  echo $is_robot_max;?>）
                        <input class="form-control" name="robot_m_percent" value="<?php  echo $robot_m_percent['value'];?>" type="text" style="width:10%;display:inherit">人
                        </span>
                    </div>
                </div>
                <div class="form-group" id='span_robot_m_percent2'style="display:<?php echo $robot_m['value']!=1?'none':'';?>">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">手机端非首页推荐的开启机器人:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input name="robot_of_not_home" value="1" type="checkbox" <?php  if($robot_of_not_home['value']) { ?>checked="checked"<?php  } ?>>是
                        <span class="help-block">开启后手机端发布的非首页推荐的活动（时间开奖的）会自动加入机器人</span>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">是否使用oss(修改后先保存):</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="is_oss" size="1" aria-invalid="false" style="width: 150px;">
                            <option <?php  if($is_oss['value'] == 0) { ?>selected = "selected"<?php  } ?> value="0">使用</option>
                            <option <?php  if($is_oss['value'] == 1) { ?>selected = "selected"<?php  } ?> value="1">不使用</option>
                        </select>
                        <span class="help-block"> 图片是否使用外部存储，开关必须与系统平台一致</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">手机发奖卡券:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="voucher_open" size="1" aria-invalid="false" style="width: 150px;">
                            <option <?php  if($voucher_open['value'] == 0) { ?>selected = "selected"<?php  } ?> value="0">不开启</option>
                            <option <?php  if($voucher_open['value'] == 1) { ?>selected = "selected"<?php  } ?> value="1">开启</option>
                        </select>
                    </div>
                </div>
                <!--<div class="form-group">-->
                    <!--<label class="col-xs-12 col-sm-3 col-md-2 control-label">红包:</label>-->
                    <!--<div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">-->
                        <!--<select class="select valid" name="red_bag" size="1" aria-invalid="false" style="width: 150px;">-->
                            <!--<option <?php  if($red_bag['value'] == 0) { ?>selected = "selected"<?php  } ?> value="0">不开启</option>-->
                            <!--<option <?php  if($red_bag['value'] == 1) { ?>selected = "selected"<?php  } ?> value="1">开启</option>-->
                        <!--</select>-->
                    <!--</div>-->
                <!--</div>-->

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">参与人初始人数:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="apply_number" placeholder="标题" value="<?php  echo $apply_number['value'];?>" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">骗审开关:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="switch_examine" size="1" aria-invalid="false" style="width: 150px;">
                            <option <?php  if($switch_examine['value'] == 0) { ?>selected = "selected"<?php  } ?> value="0">不开启</option>
                            <option <?php  if($switch_examine['value'] == 1) { ?>selected = "selected"<?php  } ?> value="1">开启</option>
                        </select>
                    </div>
                </div>



                <!--<div class="form-group">-->
                    <!--<label class="col-xs-12 col-sm-3 col-md-2 control-label">红包手续费(%):</label>-->
                    <!--<div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">-->
                        <!--<input class="form-control" name="red_package_fee" placeholder="红包手续费(%)" value="<?php  echo $red_package_fee['value'];?>" type="text">-->
                    <!--</div>-->
                <!--</div>-->

                <!--免费版人数-->
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">免费版最多人数限制:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="base_max_people" value="<?php  echo $base_max_people['value'];?>" type="number" min="0" step="1">
                        <span class="help-block">手机端发布活动时，如果为人数开奖，最高参与人数</span>
                    </div>
                </div>
                <!--高级版价格-->
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">高级版价格:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="height_price" value="<?php  echo $height_price['value'];?>" type="number" min="0" step="0.01">
                        <span class="help-block">高级版发布价格费用</span>
                    </div>
                </div>

                <!--首页版1-->
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">首页版时间1:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="home_time1" value="<?php  echo $home_time1['value'];?>" type="number" min="0" step="1">
                        <span class="help-block">首页版1发布时间</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">首页版价格1:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="home_price1" value="<?php  echo $home_price1['value'];?>" type="number" min="0" step="0.01">
                        <span class="help-block">首页版1发布价格费用</span>
                    </div>
                </div>
                <!--首页版2-->
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">首页版时间2:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="home_time2" value="<?php  echo $home_time2['value'];?>" type="number" min="0" step="1">
                        <span class="help-block">首页版2发布时间</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">首页版价格2:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="home_price2" value="<?php  echo $home_price2['value'];?>" type="number" min="0" step="0.01">
                        <span class="help-block">首页版2发布价格费用</span>
                    </div>
                </div>
                <!--首页版3-->
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">首页版时间3:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="home_time3" value="<?php  echo $home_time3['value'];?>" type="number" min="0" step="1">
                        <span class="help-block">首页版3发布时间</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">首页版价格3:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="home_price3" value="<?php  echo $home_price3['value'];?>" type="number" min="0" step="0.01">
                        <span class="help-block">首页版3发布价格费用</span>
                    </div>
                </div>

                <!--<div class="form-group">-->
                    <!--<label class="col-xs-12 col-sm-3 col-md-2 control-label">付费功能价格:</label>-->
                    <!--<div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">-->
                        <!--<input class="form-control" name="pay_function" placeholder="付费功能价格" value="<?php  echo $pay_function['value'];?>" type="text">-->
                        <!--<span class="help-block">手机端发奖时-补充信息-公众号复制/小程序跳转 功能费用</span>-->
                    <!--</div>-->
                <!--</div>-->

                <!--<div class="form-group">-->
                    <!--<label class="col-xs-12 col-sm-3 col-md-2 control-label">首页推荐功能价格:</label>-->
                    <!--<div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">-->
                        <!--<input class="form-control" name="home_recommendation" placeholder="首页推荐功能价格" value="<?php  echo $home_recommendation['value'];?>" type="text">-->
                        <!--<span class="help-block">用户付款后奖品信息将自动显示到首页</span>-->
                    <!--</div>-->
                <!--</div>-->
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">首页推荐是否需要后台审核:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input name="home_recommendation_need_check" value="1" type="checkbox" <?php  if($home_recommendation_need_check['value']) { ?>checked="checked"<?php  } ?>>是
                        <span class="help-block">开启后手机端发布的活动必须由后台审核通过后才可到首页</span>
                    </div>
                </div>
                <!--<div class="form-group">-->
                    <!--<label class="col-xs-12 col-sm-3 col-md-2 control-label">首页推荐最多人数限制:</label>-->
                    <!--<div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">-->
                        <!--<input class="form-control" name="home_max_peoples" value="<?php  echo $home_max_peoples['value'];?>" type="text">-->
                        <!--<span class="help-block">手机端发布活动时，如果为人数开奖，允许用户填写人数上限的值，0为不限制</span>-->
                    <!--</div>-->
                <!--</div>-->

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">分配前端用户默认店铺:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="js_default_shop">
                            <option value="0">不分配</option>
                            <?php  if(is_array($shop_list)) { foreach($shop_list as $shop_id => $shop_data) { ?>
                            <option value="<?php  echo $shop_id;?>" <?php  if($js_default_shop['value']==$shop_id) { ?>selected="selected"<?php  } ?>><?php  echo $shop_data['shop_name'];?></option>
                            <?php  } } ?>
                        </select>
                        <span class="help-block">用户通过手机发奖时，如果此用户未关联任何店铺，则给他分配一个店铺</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">全局默认广告方式:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="advertisement_type" id="advertisement_type" size="1" aria-invalid="false" style="width: 150px;">
                            <option <?php  if($advertisement_type['value'] == 0) { ?>selected = "selected"<?php  } ?> value="0">流量组id</option>
                            <option <?php  if($advertisement_type['value'] == 1) { ?>selected = "selected"<?php  } ?> value="1">自定义</option>
                        </select>
                    </div>
                </div>

                <div class="form-group" id="advertisement-0" <?php  if($advertisement_type['value'] == 1) { ?>style="display: none;"<?php  } ?>>
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">流量组id:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="advertisement" placeholder="unit-id" value="<?php echo $advertisement_type['value'] == 0 ? $advertisement['value']: ''?>" type="text">
                    </div>
                </div>

                <!--<div class="form-group" id="advertisement-1" <?php  if($advertisement_type['value'] == 0) { ?>style="display: none;"<?php  } ?>>
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">自定义广告:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <?php echo tpl_form_field_image('single-image', $advertisement_type['value'] == 1 ? $advertisement['value']['image'] : '');?>
                        <input class="form-control" name="appId" placeholder="appId必填" value="<?php echo $advertisement_type['value'] == 1 ? $advertisement['value']['appId'] : ''?>" type="text">
                        <input class="form-control" name="xcx_path" placeholder="路径" value="<?php echo $advertisement_type['value'] == 1 ? $advertisement['value']['xcx_path'] : ''?>" type="text">
                        <input class="form-control" name="extradata" placeholder="参数json格式" value="<?php echo $advertisement_type['value'] == 1 ? $advertisement['value']['extradata'] : ''?>" type="text">
                    </div>
                </div>-->

                <div class="form-group" id="advertisement-1" <?php  if($advertisement_type['value'] == 0) { ?>style="display: none;"<?php  } ?>>
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">自定义广告:</label>
                <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                    <div id="filePicker">选择图片</div>
                    <div class="input-group " style="margin-top:.5em;">
                        <img id="adv-img" src="<?php echo $advertisement_type['value'] == 1 ? $advertisement['value']['image_url'] : ''?>" onerror="this.src='./resource/images/nopic.jpg'; this.title='图片未找到.'" class="img-responsive img-thumbnail" width="150">
                        <em class="close" style="position:absolute; top: 0px; right: -14px;" title="删除这张图片" onclick="$('#adv-img').attr('src', './resource/images/nopic.jpg');$('#single-image').val('')">×</em>
                        <span class="help-block">广告图片比例：286*98</span>
                    </div>
                    <input type="hidden" value="<?php echo $advertisement_type['value'] == 1 ? $advertisement['value']['image'] : ''?>" name="single-image" id="single-image">
                    <input class="form-control" name="appId" placeholder="appId必填" value="<?php echo $advertisement_type['value'] == 1 ? $advertisement['value']['appId'] : ''?>" type="text">
                    <input class="form-control" name="xcx_path" placeholder="路径" value="<?php echo $advertisement_type['value'] == 1 ? $advertisement['value']['xcx_path'] : ''?>" type="text">
                    <input class="form-control" name="extradata" placeholder="参数json格式" value="<?php echo $advertisement_type['value'] == 1 ? $advertisement['value']['extradata'] : ''?>" type="text">
                </div>
                </div>


                <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">抽奖弹出层广告:</label>
                <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                    <div id="filePicker1">选择图片</div>
                    <div class="input-group " style="margin-top:.5em;">
                        <img id="adv-img1" src="<?php echo $popup_adv ? $popup_adv['value']['image_url'] : ''?>" onerror="this.src='./resource/images/nopic.jpg'; this.title='图片未找到.'" class="img-responsive img-thumbnail" width="150">
                        <em class="close" style="position:absolute; top: 0px; right: -14px;" title="删除这张图片" onclick="$('#adv-img1').attr('src', './resource/images/nopic.jpg');$('#single-image1').val('')">×</em>
                        <span class="help-block">广告图片比例：286*98</span>
                    </div>
                    <input type="hidden" value="<?php echo $popup_adv ? $popup_adv['value']['image'] : ''?>" name="single-image1" id="single-image1">
                    <input class="form-control" name="popup_appId" placeholder="appId必填" value="<?php echo $popup_adv ? $popup_adv['value']['appId'] : ''?>" type="text">
                    <input class="form-control" name="popup_xcx_path" placeholder="路径" value="<?php echo $popup_adv ? $popup_adv['value']['xcx_path'] : ''?>" type="text">
                    <input class="form-control" name="popup_extradata" placeholder="参数json格式" value="<?php echo $popup_adv ? $popup_adv['value']['extradata'] : ''?>" type="text">
                </div>
                </div>

                <div class="form-group">
                <label class="col-xs-12 col-sm-3 col-md-2 control-label">默认奖品图片:</label>
                <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                    <div id="filePicker2">选择图片</div>
                    <div class="input-group " style="margin-top:.5em;">
                        <img id="adv-img2" src="<?php  echo $default_prize_img_url?>" onerror="this.src='./resource/images/nopic.jpg'; this.title='图片未找到.'" class="img-responsive img-thumbnail" width="150">
                        <em class="close" style="position:absolute; top: 0px; right: -14px;" title="删除这张图片" onclick="$('#adv-img2').attr('src', './resource/images/nopic.jpg');$('#single-image1').val('')">×</em>
                        <span class="help-block">图片比例：304*136</span>
                    </div>
                    <input type="hidden" value="<?php  echo $default_prize_img['value']?>" name="default_prize_img" id="single-image2">
                </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">apiclient_cert.pem:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="apiclient_cert" placeholder="标题" value="<?php  echo $apiclient_cert['value'];?>" type="file">
                        <?php  if($apiclient_cert['value'] != '') { ?>
                        <input class="form-control" name="apiclient_cert" placeholder="标题" value="<?php  echo $apiclient_cert['value'];?>" type="text"  readonly>
                        <?php  } ?>
                        <span class="help-block">注：请进入商户平台开通“企业付款”功能</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">apiclient_key.pem:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="apiclient_key" placeholder="标题" value="<?php  echo $apiclient_key['value'];?>" type="file">
                        <?php  if($apiclient_key['value'] != '') { ?>
                        <input class="form-control" name="apiclient_key" placeholder="标题" value="<?php  echo $apiclient_key['value'];?>" type="text" readonly>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">免责声明设置</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <textarea class="form-control" name="relief_desc" rows="5"><?php  echo $relief_desc['value'];?></textarea>
                    </div>
                </div>

    </div>
</div>


