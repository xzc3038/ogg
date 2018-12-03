<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>

<div class="main">
    <div class="panel panel-info">
        <div class="panel-heading">关联店铺</div>
        <div class="panel-body">
            <form action="<?php  echo $this->createWeburl('member');?>" method="post" class="form-horizontal" id="myform">

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"><?php  echo $member['nickname'];?>,选择店铺</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <select class="select valid" name="shop_id" id="shop_id" size="1" aria-invalid="false" style="width: 450px;">
                            <?php  if(is_array($shop)) { foreach($shop as $item) { ?>
                            <option value="<?php  echo $item['id'];?>"><?php  echo $item['shop_name'];?></option>
                            <?php  } } ?>
                        </select>
                        <span class="help-block">作为店铺管理员，用于线下核销</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="" >
                        <input type="hidden" name="op" value="addgl">
                        <input type="hidden" name="id" value="<?php  echo $id;?>">
                        <input type="submit" name="submit" id="submit" value="关联" class="btn btn-primary">
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>



