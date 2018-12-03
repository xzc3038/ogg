<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('header', TEMPLATE_INCLUDEPATH)) : (include template('header', TEMPLATE_INCLUDEPATH));?>
<link href="./resource/css/app.css" rel="stylesheet">
<link href="../addons/<?php  echo $_GPC['m'];?>/template/css/webuploader.css" rel="stylesheet">
<script type="application/javascript" src="../addons/<?php  echo $_GPC['m'];?>/template/js/webuploader.min.js"></script>
<script type="text/javascript" src="./resource/js/require.js?v=20170426"></script>
<div class="main">
    <div class="panel panel-info">
        <div class="panel-heading">添加兑换商品</div>
        <div class="panel-body">
            <form action="<?php  echo $this->createWeburl('good');?>" method="post" class="form-horizontal" id="myform">

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">商品名称</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" name="gname" placeholder="商品名称" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">商品实际价格:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" type="number" min="0" step="0.01" name="price">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">所需积分:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" type="number" min="0" step="1" name="integral">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">商品类型:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" type="text" name="type" list="car" id="type">
                        <datalist id="car">
                            <option value="1">虚拟商品</option>
                            <option value="2">实物</option>
                        </datalist>
                        <span style="color: red;display: none;" id="notice">虚拟商品账号需增添完商品后前往【兑换管理-添加账号】中添加</span>
                    </div>
                </div>

                <div class="form-group" id="stock" style="display: none;">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">总库存:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" type="number" min="0" step="1" name="astock">
                    </div>
                </div>
                

                <!--<div class="form-group">-->
                    <!--<label class="col-xs-12 col-sm-3 col-md-2 control-label">现库存:</label>-->
                    <!--<div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">-->
                        <!--<input class="form-control" type="number" min="0" step="1" name="nstock">-->
                    <!--</div>-->
                <!--</div>-->

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">兑换说明:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" type="text" name="explain">
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
                        <input type="hidden" value="<?php  echo $default_prize_img['value']?>" name="img1" id="single-image2">
                    </div>
                </div>


                <div class="form-group shiwu" style="display: none">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">是否包邮:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" type="text" name="express" list="car1">
                        <datalist id="car1">
                            <option value="1">包邮</option>
                            <option value="2">不包邮</option>
                        </datalist>
                    </div>
                </div>

                <div class="form-group shiwu" style="display: none">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">邮费:</label>
                    <div class="col-sm-7 col-lg-8 col-md-8 col-xs-12">
                        <input class="form-control" type="number" min="0" step="0.01" name="cost">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label"></label>
                    <div class="" >
                        <input type="hidden" name="op" value="add">
                        <input type="submit" name="submit" id="submit" value="提交" class="btn btn-primary">
                    </div>
                </div>

            </form>
        </div>
    </div>
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

        $('#type').change(function () {
            if ($('#type').val() == 1) {
                $('#notice').css('display','');
                $('#stock').css('display','none');
                $('.shiwu').css('display','none');
            }else{
                $('#notice').css('display','none');
                $('#stock').css('display','');
                $('.shiwu').css('display','');
            }
        });

    });
</script>



