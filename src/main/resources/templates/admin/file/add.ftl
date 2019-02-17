<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>上传文件表添加--${site.name}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="${site.description}"/>
    <meta name="keywords" content="${site.keywords}"/>
    <meta name="author" content="${site.author}"/>
    <link rel="icon" href="${site.logo}">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all" />
    <style type="text/css">
        .layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
        @media(max-width:1240px){
            .layui-form-item .layui-inline{ width:100%; float:none; }
        }
        .layui-form-item .role-box {
            position: relative;
        }
        .layui-form-item .role-box .jq-role-inline {
            height: 100%;
            overflow: auto;
        }

    </style>
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="name"  placeholder="请输入标题">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-block">

            <textarea name="description"  placeholder="请输入描述" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上传人</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="uploadUser"  placeholder="请输入上传人">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">长传/下载日期</label>
        <div class="layui-input-block">

            <input type="text" name="date" id="date"   lay-verify="date" placeholder="请选择长传/下载日期" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">链接地址</label>
        <div class="layui-input-block">

            <input type="hidden" class="layui-input" name="url" id="url" >
            <div class="layui-upload-drag" id="url">
              <i class="layui-icon"></i>
              <p>点击上传，或将文件拖拽到此处</p>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addFile">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use(['form','jquery','layer','upload','laydate'],function(){
        var form      = layui.form,
                $     = layui.jquery,
                upload = layui.upload,
                laydate = layui.laydate,
                layer = layui.layer;

                          //初始赋值
                          laydate.render({
                            elem: '#date'
                          });

        form.on("submit(addFile)",function(data){
                       if(null === data.field.date || "" ===data.field.date){
                        delete data.field["date"];
                    }else{
                        data.field.date = new Date(data.field.date);
                    }
   
            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            $.post("${base}/admin/file/add",data.field,function(res){
                layer.close(loadIndex);
                if(res.success){
                    parent.layer.msg("上传文件表添加成功！",{time:1000},function(){
                        parent.layer.close(parent.addIndex);
                        //刷新父页面
                        parent.location.reload();
                    });
                }else{
                    layer.msg(res.message);
                }
            });
            return false;
        });

    });
</script>
</body>
</html>