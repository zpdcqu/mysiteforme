<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单列表编辑--${site.name}</title>
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
    <input value="${orderList.id}" name="id" type="hidden">
    <div class="layui-form-item">
        <label class="layui-form-label">订单编号</label>
        <div class="layui-input-block">
                <input  type="text" class="layui-input" value = "${orderList.orderId}" name="orderId"  placeholder="请输入订单编号">

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单名称</label>
        <div class="layui-input-block">
                <input  type="text" class="layui-input" value = "${orderList.name}" name="name"  placeholder="请输入订单名称">

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">截止时间</label>
        <div class="layui-input-block">
                <input type="text" name="deadDate" id="deadDate" <#if (orderList.deadDate)??>value="${orderList.deadDate?string('yyyy-MM-dd')}"</#if>  lay-verify="date" placeholder="请选择截止时间" autocomplete="off" class="layui-input">

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单价格</label>
        <div class="layui-input-block">
                <input  type="text" class="layui-input" value = "${orderList.money}" name="money"  placeholder="请输入订单价格">

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关联客户</label>
        <div class="layui-input-block">
                <input  type="text" class="layui-input" value = "${orderList.userCId}" name="userCId"  placeholder="请输入关联客户">

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属类别</label>
        <div class="layui-input-block">
                <select name="categories" >
                    <option value="" selected="">请选择所属类别</option>
                    <@my type="order_list_categories">
                    <#list result as r>
                    <option value="${r.value}"  <#if (orderList.categories == r.value)> selected="" </#if>  >${r.label}</option>
                    </#list>
                    </@my>
                </select>

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">关联技术</label>
        <div class="layui-input-block">
                <input  type="text" class="layui-input" value = "${orderList.userTId}" name="userTId"  placeholder="请输入关联技术">

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课程等级</label>
        <div class="layui-input-block">
                <select name="level" >
                    <option value="" selected="">请选择课程等级</option>
                    <@my type="order_list_level">
                    <#list result as r>
                    <option value="${r.value}"  <#if (orderList.level == r.value)> selected="" </#if>  >${r.label}</option>
                    </#list>
                    </@my>
                </select>

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否加急</label>
        <div class="layui-input-block">
                <input type="checkbox" name="vip"  lay-skin="switch" lay-text="是|否" value="1"  <#if (orderList.vip == true)> checked </#if> >

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">订单进度</label>
        <div class="layui-input-block">
                <select name="progress" >
                    <option value="" selected="">请选择订单进度</option>
                    <@my type="order_list_progress">
                    <#list result as r>
                    <option value="${r.value}"  <#if (orderList.progress == r.value)> selected="" </#if>  >${r.label}</option>
                    </#list>
                    </@my>
                </select>

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">其他需求</label>
        <div class="layui-input-block">
                <textarea name="others"   placeholder="请输入其他需求" class="layui-textarea">${orderList.others}</textarea>

        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课题方向</label>
        <div class="layui-input-block">
                <select name="subject" >
                    <option value="" selected="">请选择课题方向</option>
                    <@my type="order_list_subject">
                    <#list result as r>
                    <option value="${r.value}"  <#if (orderList.subject == r.value)> selected="" </#if>  >${r.label}</option>
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
                layer = layui.layer,
                laydate = layui.laydate;

                          //初始赋值

                          laydate.render({
                            elem: '#deadDate'
<#if (orderList.deadDate)??>
                            ,value: '${orderList.deadDate?string("yyyy-MM-dd")}'
</#if>
                          });


        form.on("submit(addOrderList)",function(data){
        console.log("编辑")
                               if(null === data.field.deadDate || "" ===data.field.deadDate){
                                delete data.field["deadDate"];
                            }else{
                                data.field.deadDate = new Date(data.field.deadDate);
                            }
                 if(undefined === data.field.vip || '0' === data.field.vip || null === data.field.vip){
                data.field.vip = false;
            }else{
                data.field.vip = true;
            }
            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            //给角色赋值
            $.post("${base}/admin/orderList/edit",data.field,function(res){
                layer.close(loadIndex);
                if(res.success){
                    parent.layer.msg("订单列表编辑成功！",{time:1000},function(){
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