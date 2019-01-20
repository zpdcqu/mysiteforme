<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>付款记录编辑--${site.name}</title>
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
    <input value="${moneyLog.id}" name="id" type="hidden">
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
                <select name="type" >
                    <option value="" selected="">请选择类型</option>
                    <@my type="money_log_type">
                    <#list result as r>
                    <option value="${r.value}"  <#if (moneyLog.type == r.value)> selected="" </#if>  >${r.label}</option>
                    </#list>
                    </@my>
                </select>

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">金额</label>
        <div class="layui-input-block">
                <input  type="text" class="layui-input" value = "${moneyLog.num}" name="num"  placeholder="请输入金额">

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">付款方式</label>
        <div class="layui-input-block">
                <select name="method" >
                    <option value="" selected="">请选择付款方式</option>
                    <@my type="money_log_method">
                    <#list result as r>
                    <option value="${r.value}"  <#if (moneyLog.method == r.value)> selected="" </#if>  >${r.label}</option>
                    </#list>
                    </@my>
                </select>

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">付款凭证图片地址</label>
        <div class="layui-input-block">
                <input type="hidden" class="layui-input" name="url" id="url" value="${moneyLog.url}" >
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test_url">上传付款凭证图片地址</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo_url" <#if (moneyLog.url??)>src="${moneyLog.url}"</#if> >
                        <p id="demoText_url"></p>
                    </div>
                </div>

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
                <textarea name="description"   placeholder="请输入备注" class="layui-textarea">${moneyLog.description}</textarea>

        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addMoneyLog">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use(['form','jquery','layer','upload'],function(){
        var form      = layui.form,
                $     = layui.jquery,
                upload = layui.upload,
                layer = layui.layer;

                        //普通图片上传
        var upload_url = upload.render({
            elem: '#test_url',
            url: '${base}/file/upload/',
            field:'test',
            before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo_url').attr('src', result); //图片链接（base64）
                });
            },
            done: function(res){
                //如果上传失败
                if(res.success == false){
                    return layer.msg('上传失败');
                }
                $("#url").val(res.data.url);
            },
            error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText_url');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    upload_url.upload();
                });
            }
        });

        form.on("submit(addMoneyLog)",function(data){
               var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            //给角色赋值
            $.post("${base}/admin/moneyLog/edit",data.field,function(res){
                layer.close(loadIndex);
                if(res.success){
                    parent.layer.msg("付款记录编辑成功！",{time:1000},function(){
                        parent.layer.close(parent.editIndex);
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