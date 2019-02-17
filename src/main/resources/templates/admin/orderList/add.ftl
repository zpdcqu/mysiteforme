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
<form class="layui-form" style="width:80%;" >
<div class="layui-collapse" lay-filter="test">
			<div class="layui-colla-item">
				<h2 class="layui-colla-title">基本信息</h2>
				<div class="layui-colla-content layui-show" >
					
    <div class="layui-form-item">
       
      <div class="layui-inline">
       <label class="layui-form-label">订单编号</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="orderId" value = "${orderId}" placeholder="请输入订单编号">
        </div>
    </div>
    
     <div class="layui-inline">
       <label class="layui-form-label">订单名称</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="name"  placeholder="请输入订单名称">
        </div>
    </div>
    
     <div class="layui-inline">
      	   <label class="layui-form-label">截止时间</label>
        <div class="layui-input-block">

            <input type="text" name="deadDate" id="deadDate"   lay-verify="date" placeholder="请选择截止时间" autocomplete="off" class="layui-input">
        </div>
    </div>
    
     <div class="layui-inline">
      	  <label class="layui-form-label">订单价格</label>
        <div class="layui-input-block">

            <input  type="text"  class="layui-input" name="money"  placeholder="请输入订单价格">
        </div>
    </div>

        <div class="layui-inline">
            <label class="layui-form-label">课题方向</label>
            <div class="layui-input-block">

                <select name="subject" >
                    <option value="" selected="">请选择课题方向</option>
                    <@my type="order_list_subject">
                        <#list result as r>
                            <option value="${r.value}" >${r.label}</option>
                        </#list>
                    </@my>
                </select>
            </div>
        </div>

    
     <div class="layui-inline">
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
    

     <div class="layui-inline">
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

        <div class="layui-inline">
            <label class="layui-form-label">是否加急</label>
            <div class="layui-input-block">

                <input type="checkbox" name="vip"  lay-skin="switch" value="1" lay-text="是|否" >

            </div>
        </div>


        <div class="layui-inline">
            <label class="layui-form-label">订单进度</label>
            <div class="layui-input-block">

                <select name="progress" >
                    <option value="" >请选择订单进度</option>
                    <!-- <@my type="order_list_progress">
                        <#list result as r>
                            <option value="${r.value}" >${r.label}</option>
                        </#list>
                    </@my> -->
                     <option value="1" selected="">编辑中</option>
                     <option value="2" >发布到任务大厅</option>
                </select>
            </div>
        </div>


    </div>
			</div>
			
			<div class="layui-colla-item">
				<h2 class="layui-colla-title">关联客户-----(默认密码123456)</h2>
				<div class="layui-colla-content layui-show">                  
					
					 <div class="layui-inline">
			            <label class="layui-form-label">登录账号</label>
                    <div class="layui-input-block">
                        <input  type="text"  class="layui-input" name="loginName" value = "${loginName}"  placeholder="请输入关联客户">
                    </div>
                   </div>
                   
                     <div class="layui-inline">
			            <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input  type="text"  class="layui-input" name="nickName"  placeholder="请输入姓名">
                    </div>
                   </div>
                   
                    <div class="layui-inline">
			            <label class="layui-form-label">手机号</label>
                    <div class="layui-input-block">
                        <input  type="text"  class="layui-input" name="tel"  placeholder="请输入手机号码">
                    </div>
                   </div>
                   
                    <div class="layui-inline">
			            <label class="layui-form-label">QQ号</label>
                    <div class="layui-input-block">
                        <input  type="text"  class="layui-input" name="email"  placeholder="请输入QQ号 ">
                    </div>
                  
           
        
				</div>
			</div>
		</div>
			
			<div class="layui-colla-item">
				<h2 class="layui-colla-title">客户需求</h2>
				<div class="layui-colla-content layui-show">  
				  
                                
					 <!-- <div class="layui-form-item">
					    <label class="layui-form-label">复选框</label>
					    <div class="layui-input-block">
					      <input type="checkbox" name="like[write]" title="写作">
					      <input type="checkbox" name="like[read]" title="阅读" checked>
					      <input type="checkbox" name="like[dai]" title="发呆">
					    </div>
					  </div> -->
					  
					  
					<@my type="demand_type">
                    <#list result as r>
                 <!--    <option value="${r.value}"  <#if (orderList.categories == r.value)> selected="" </#if>  >${r.label}</option> -->
                    <label class="layui-form-label"><h3>${r.label}：</h3></label>
					   
					    	<#list demandList as demand >
					    	 <#if (demand.type == r.value)>
					    	 	<#if (demand.option)>
					    	 	
					    	 	<input type="checkbox" name="demand.id"   title="${demand.name}：">	
					    	 	 <div class="layui-inline layui-input-block">
					    	
					    	 			
					    	 								  
									      <select name="${demand.id}" >								      								       
									        <#list demand.option?split("_") as option>
									        <option value="${option}" >${option}</option>
									        </#list>
									      </select>
									</div>												    	 	
					    	 	 </#if>
					    	 	<#if !(demand.option)>

					    	 	 	 <input type="checkbox" name="${demand.id}"  title="${demand.name}">
					    	 	 </#if>

					    	 	 
					    	 </#if>
					    	 
					    	 
					      </#list>
					    </div>
					    </br>
                    </#list>
                    
                    </@my>
           
        
				</div>
			</div>
		</div>
			
		


    <div class="layui-form-item" style="float:right">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addOrderList">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use(['form','jquery','layer','laydate','element'],function(){
        var form      = layui.form,
                $     = layui.jquery,
                laydate = layui.laydate,
                layer = layui.layer;
                var element = layui.element;

                          //初始赋值
                          laydate.render({
                            elem: '#deadDate'
                            	,value: new Date()
                          });

        form.on("submit(addOrderList)",function(data){
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