<?php defined('IN_IA') or exit('Access Denied');?><div class="panel panel-success">
    <div class="panel-heading">模板消息设置</div>
    <div class="panel-body">
        <div class="form-group">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">开奖通知模板消息id:</label>
            <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                <input class="form-control" name="open_prize_notice" placeholder="开奖通知模板消息id" value="<?php  echo $open_prize_notice['value'];?>" type="text">
                <span class="help-block">模板消息id：抽奖结果通知	/ 温馨提示、活动商品</span>
            </div>
        </div>
        
        <div class="form-group">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">开奖时给发奖人发通知:</label>
            <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                <input class="form-control" name="tpl_to_organiser" value="<?php  echo $tpl_to_organiser['value'];?>" type="text">
                <span class="help-block">模板消息id：活动结束提醒	/ 活动名称、备注</span>
            </div>
        </div>         
      
        <div class="form-group">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">发新活动上架后给所有粉丝发消息:</label>
            <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                <input class="form-control" name="tpl_to_allfans_begin" value="<?php  echo $tpl_to_allfans_begin['value'];?>" type="text">
                <span class="help-block">（只有首页推荐的才发）模板消息id：已报名活动参加提醒 / 发布人、活动名称、备注</span>
            </div>
        </div> 
        <div class="form-group">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">吱口令设置:</label>
            <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                <input class="form-control" name="alipay_pwd" value="<?php  echo $alipay_pwd['value'];?>" type="text">
            </div>
        </div>  
        <div class="form-group">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label">抽奖参与用户显示方式:</label>
            <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                <select class="select valid" name="list_show_type" size="1" aria-invalid="false" style="width: 350px;">
                    <option <?php  if($list_show_type['value'] != 0) { ?>selected = "selected"<?php  } ?> value="0">一行一条，可以点击查看兑奖码</option>
                    <option <?php  if($list_show_type['value'] == 1) { ?>selected = "selected"<?php  } ?> value="1">头像列表形式，不可点击查看兑奖码</option>
                </select>
            </div>
        </div>        
        
        
        
    </div>
</div>


