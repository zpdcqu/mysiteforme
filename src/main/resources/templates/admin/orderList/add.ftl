<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单列表添加--${site.name}</title>
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
        <label class="layui-form-label">订单编号</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="orderId"  placeholder="请输入订单编号">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单名称</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="name"  placeholder="请输入订单名称">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">截止时间</label>
        <div class="layui-input-block">

            <input type="text" name="deadDate" id="deadDate"   lay-verify="date" placeholder="请选择截止时间" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单价格</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="money"  placeholder="请输入订单价格">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属类别</label>
        <div class="layui-input-block">

            <select name="categories" >
                <option value="" selected="">请选择所属类别</option>
                <@my type="order_list_categories">
                <#list result as r>
                <option value="${r.value}" >${r.label}</option>
                </#list>
                </@my>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课程等级</label>
        <div class="layui-input-block">

            <select name="level" >
                <option value="" selected="">请选择课程等级</option>
                <@my type="order_list_level">
                <#list result as r>
                <option value="${r.value}" >${r.label}</option>
                </#list>
                </@my>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addOrderList">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use(['form','jquery','layer','laydate'],function(){
        var form      = layui.form,
                $     = layui.jquery,
                laydate = layui.laydate,
                layer = layui.layer;

                          //初始赋值
                          laydate.render({
                            elem: '#deadDate'
                          });

        form.on("submit(addOrderList)",function(data){
                       if(null === data.field.deadDate || "" ===data.field.deadDate){
                        delete data.field["deadDate"];
                    }else{
                        data.field.deadDate = new Date(data.field.deadDate);
                    }

            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            $.post("${base}/admin/orderList/add",data.field,function(res){
                layer.close(loadIndex);
                if(res.success){
                    parent.layer.msg("订单列表添加成功！",{time:1000},function(){
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