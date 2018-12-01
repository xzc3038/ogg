<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<link href="../addons/<?php  echo $_GPC['m'];?>/template/css/webuploader.css" rel="stylesheet">
<script type="application/javascript" src="../addons/<?php  echo $_GPC['m'];?>/template/js/webuploader.min.js"></script>

<script type="text/javascript" src="./resource/js/require.js?v=20170426"></script>
<script>
require(['bootstrap.switch', 'util'], function($, u){
	$(function(){
		$('.make-switch').bootstrapSwitch();
	});
});
</script>
<style type='text/css'>
    .tab-pane { padding:5px 0 5px 0;}
</style>
<div class="main" style="margin-top:0px;">
  <form action="" method="post" class="form-horizontal" id="myform" role="form" enctype="multipart/form-data">
    <h4>&nbsp;</h4>
    <ul class="nav nav-tabs" id="myTab">
      <li class="active"><a href="#tab_base"><i class="fa fa-cog"></i> 基本设置</a></li>
      <li><a href="#tab_index"><i class="fa fa-comments-o"></i> 模板消息设置</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tab_base"><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('config_base', TEMPLATE_INCLUDEPATH)) : (include template('config_base', TEMPLATE_INCLUDEPATH));?></div>
      <div class="tab-pane" id="tab_index"><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('config_index', TEMPLATE_INCLUDEPATH)) : (include template('config_index', TEMPLATE_INCLUDEPATH));?></div>
    </div>

    <div class="tab-content">
        <div class="form-group">
            <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
            <div class="" >
                <input type="hidden" name="op" value="add">
                <input type="hidden" id="attach_id" name="attach_id" value="">
                <input type="submit" name="submit" id="submit" value="保存" class="btn btn-primary">
            </div>
        </div>
    </div>    

  </form>
</div>
<script type="text/javascript">
$(function () {
  $('#myTab a').click(function (e) {
    e.preventDefault();//阻止a链接的跳转行为
    $(this).tab('show');//显示当前选中的链接及关联的content
  })
});
</script>
<script type="application/javascript">
    $(function () {
        $('#robot').click(function () {
            if ($(this).val() == 0) {
                $('#open_robot_m').hide();
            } else {
                $('#open_robot_m').show();
            }
        });
        $('#robot_m').click(function () {
            if ($(this).val() == 0) {
                $('#span_robot_m_percent').hide();
                $('#span_robot_m_percent2').hide();
            } else {
                $('#span_robot_m_percent').show();
                $('#span_robot_m_percent2').show();
            }
        });


        var adv = "<?php  echo $advertisement_type['value'];?>";
        if (adv == 1) {
            var uploader = new WebUploader.Uploader({
                auto : true,
                server : '<?php  echo $upload;?>',
                pick : '#filePicker',
                extensions: 'gif,jpg,jpeg,bmp,png'
                // 其他配置项
            });
            adv == 2;
            uploader.on('uploadSuccess', function(file, data) {
                $('#single-image').val(data.info);
                console.log(1);
                //console.log(file);
                //console.log(data);
                $('#adv-img').attr('src', '<?php  echo $image;?>&id=' + data.info);
                //$('#' + file.id).addClass('upload-state-done');
            });
        }

        var uploader1 = new WebUploader.Uploader({
            auto : true,
            server : '<?php  echo $upload;?>',
            pick : '#filePicker1',
            extensions: 'gif,jpg,jpeg,bmp,png'
            // 其他配置项
        });
        uploader1.on('uploadSuccess', function(file, data) {
            $('#single-image1').val(data.info);
            console.log(file);
            console.log(data);
            $('#adv-img1').attr('src', '<?php  echo $image;?>&id=' + data.info);
        });

        var uploader2 = new WebUploader.Uploader({
            auto : true,
            server : '<?php  echo $upload;?>',
            pick : '#filePicker2',
            extensions: 'gif,jpg,jpeg,bmp,png'
            // 其他配置项
        });
        uploader2.on('uploadSuccess', function(file, data) {
            $('#single-image2').val(data.info);
            $('#adv-img2').attr('src', '<?php  echo $image;?>&id=' + data.info);
        });

        $('#advertisement_type').change(function () {
            if (adv == 0) {
                var uploader = new WebUploader.Uploader({
                    auto : true,
                    server : '<?php  echo $upload;?>',
                    pick : '#filePicker',
                    extensions: 'gif,jpg,jpeg,bmp,png'
                    // 其他配置项
                });
                adv == 2;
                uploader.on('uploadSuccess', function(file, data) {
                    $('#single-image').val(data.info);
                    console.log(2);
                    //console.log(file);
                    //console.log(data);
                    $('#adv-img').attr('src', '<?php  echo $image;?>&id=' + data.info);
                    //$('#' + file.id).addClass('upload-state-done');
                });

            }
            val = $(this).val();
            if (val == 0) {
                $('#advertisement-1').hide();
            } else {
                $('#advertisement-0').hide();
            }
            $('#advertisement-' + val).show();
        });

    });
</script>


