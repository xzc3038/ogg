<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>

<div class="main">
    <div class="panel panel-info">
        <div class="panel-heading">开通多开【<?php  echo $open_info;?>】</div>
        <div class="panel-body">
            <?php  if($is_more) { ?>
            <span>已经开通...<?php  echo $is_more_info;?></span>
            <?php  } else { ?>
            <form action="<?php  echo $this->createWeburl('openMore');?>" method="post" class="form-horizontal" id="myform">
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">开通码:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="token" placeholder="开通多开,请联系售后" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="" >
                        <input type="hidden" name="op" value="open_up">
                        <input type="submit" name="submit" id="submit" value="提交" class="btn btn-primary">
                    </div>
                </div>
            </form>
            <?php  } ?>
        </div>
    </div>
</div>



