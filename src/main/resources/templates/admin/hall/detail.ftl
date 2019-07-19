<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>订单添加--${site.name}</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<meta name="description" content="${site.description}" />
		<meta name="keywords" content="${site.keywords}" />
		<meta name="author" content="${site.author}" />
		<link rel="icon" href="${site.logo}">
		<link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all" />
		<style type="text/css">
			.layui-form-item .layui-inline {
				width: 33.333%;
				float: left;
				margin-right: 0;
			}

			@media(max-width:1240px) {
				.layui-form-item .layui-inline {
					width: 100%;
					float: none;
				}
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
		<form class="layui-form" style="width:100%;">
			<div class="layui-collapse" lay-filter="test">
				
			<div class="layui-colla-item " >
						<h2 class="layui-colla-title">合作项目</h2>		
					<div class="layui-colla-content layui-show" style="background:#EADED6">
	<p>
		<a class="xqhzTitle" style="box-sizing: border-box; color: rgb(71, 80, 89); font-weight: bold; margin-bottom: 50px; font-family:  Arial, Helvetica, Verdana, sans-serif; white-space: normal; outline: none !important;">亲爱的技术：您好！</a>
	</p>
	<p>
		<a class="xqhzTitle" style="box-sizing: border-box; color: rgb(71, 80, 89); font-weight: bold; margin-bottom: 50px; font-family:  Arial, Helvetica, Verdana, sans-serif; white-space: normal; outline: none !important;"><br /></a>
	</p>
	<p>
		<a class="xqhzTitle" style="box-sizing: border-box; color: rgb(71, 80, 89); font-weight: bold; margin-bottom: 50px; font-family:  Arial, Helvetica, Verdana, sans-serif; white-space: normal; outline: none !important;"><br /></a>
	</p>
	<p>
		<span style="font-size: 14px; text-indent: 25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 您需要提供的是</span><span style="font-size: 14px; text-indent: 25px; box-sizing: border-box; border-bottom: 1px solid black; padding-bottom: 2px; color: royalblue; margin-left: 5px; margin-right: 5px;">
			<@my type="order_list_level">
				<#list result as r>
					<#if (orderList.level==r.value)>${r.label}</#if>
				</#list>
			</@my>
		</span><span style="font-size: 14px; text-indent: 25px;">、</span><span style="font-size: 14px; text-indent: 25px; box-sizing: border-box; border-bottom: 1px solid black; padding-bottom: 2px; color: royalblue; margin-left: 5px; margin-right: 5px;">
			<@my type="order_list_subject">
				<#list result as r>
					<#if (orderList.subject==r.value)>${r.label}</#if>
				</#list>
			</@my>
		</span>
		<span style="font-size: 14px; text-indent: 25px;">、课题编号及名称：</span><span style="font-size: 14px; text-indent: 25px; box-sizing: border-box; border-bottom: 1px solid black; padding-bottom: 2px; color: royalblue; margin-left: 5px; margin-right: 5px;">
			【${orderList.orderId}】${orderList.name} </span><span style="font-size: 14px; text-indent: 25px;">的设计。</span>
	</p>
	<p>
		<span style="font-size: 14px; text-indent: 25px;"><br /></span>
	</p>
	<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-indent: 25px; font-size: 14px; line-height: 28px;">
		设计成果:<span style="box-sizing: border-box; border-bottom: 1px solid black; padding-bottom: 2px; color: royalblue; margin-left: 5px; margin-right: 5px;">
		
								
									
										
										
									
									<#list demandList as demand>
										
										
									
											<#if (demand.checked)>
												${demand.name}
												<#if (demand.userOption) >(${demand.userOption})</#if>、
											</#if>
											
									</#list>
									
						
					
						
		
		</span>。其他要求：<span
		 style="box-sizing: border-box; border-bottom: 1px solid black; padding-bottom: 2px; color: royalblue; margin-left: 5px; margin-right: 5px;">
			<#if (orderList.remarks)>
												 ${orderList.remarks}
			</#if>
			<#if (!orderList.remarks)>
												无
			</#if>
		 
		 </span>。 </p>
	
	<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-indent: 25px; font-size: 14px; line-height: 28px;">
		<span style="box-sizing: border-box; border-bottom: 1px solid black; padding-bottom: 2px; color: royalblue; margin-left: 5px; margin-right: 5px;">
		
		${orderList.deadDate?string("yyyy-MM-dd")}
		
		</span>前，提供所有设计成果。
	</p>
	<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-indent: 25px; font-size: 14px; line-height: 28px;">
		任务酬金：<span style="box-sizing: border-box; border-bottom: 1px solid black; padding-bottom: 2px; color: royalblue; margin-left: 5px; margin-right: 5px;">
		${orderList.money}</span>元。
	</p>
	<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; text-indent: 25px; font-size: 14px; line-height: 28px; color: rgb(169, 68, 66); font-family: ΢���ź�, ����, Arial, Helvetica, Verdana, sans-serif; white-space: normal;">
		具体交易根据实际协商结果而调整，感谢您的配合！ </p>
	<p>
		<br />
	</p>
	<td>
								<table class="layui-table">
						      <thead>
						        <tr><th>原始需求文件如下：</th>
						        <th>大小</th>
						        <th>状态</th>
						        <th>操作</th>
						      </tr></thead>
						      <tbody id="demoList">
						      <#list fileList as file>
						      <tr>
						      	<td style="color:red">${file.fileName}</td>
						        <td>${file.fileSize}</td>
						        <td>已上传</td>
						        <td><a style='color:green'  href='${base}/file/download?hash=${file.hash}'>下载</a></td>
						       <tr>
						      </#list>
						      </tbody>
						    </table>
</div>

				<div class="layui-colla-item">
					<h2 class="layui-colla-title">基本信息</h2>
					<div class="layui-colla-content layui-show">
						<div class="layui-form-item">
						<input disabled name="id" value="${orderList.id}" hidden></input>
							<div class="layui-inline">
								<label class="layui-form-label">订单编号</label>
								<div class="layui-input-block">
									<input disabled type="text" class="layui-input" name="orderId" value="${orderList.orderId}" placeholder="请输入订单编号">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">订单名称</label>
								<div class="layui-input-block">
									 <input disabled  type="text" class="layui-input" value = "${orderList.name}" name="name"  placeholder="请输入订单名称">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">订单价格</label>
								<div class="layui-input-block">
									    <input disabled  type="text" class="layui-input" value = "${orderList.money}" name="money"  placeholder="请输入订单价格">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">课题方向</label>
								<div class="layui-input-block">
									<select disabled name="subject" >
					
										<option value="-1" selected="">请选择课题方向</option>
										<@my type="order_list_subject">
											<#list result as r>
												<option value="${r.value}" <#if (orderList.subject==r.value)>selected=""</#if>>${r.label}</option>
											</#list>
										</@my>
									</select>
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">所属类别</label>
								<div class="layui-input-block">
									<select disabled name="categories" >
				
										<option value="" selected="">请选择所属类别</option>
										<@my type="order_list_categories">
											<#list result as r>
												<option value="${r.value}"<#if (orderList.categories==r.value)>selected=""</#if>>${r.label}</option>
											</#list>
										</@my>
									</select>
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">课程等级</label>
								<div class="layui-input-block">
									<select disabled name="level">
	
										<option value="" selected="">请选择课程等级</option>
										<@my type="order_list_level">
											<#list result as r>
												<option value="${r.value}"<#if (orderList.level==r.value)>selected=""</#if>>${r.label}</option>
											</#list>
										</@my>
									</select>
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">订单进度</label>
								<div class="layui-input-block">
									<select disabled name="progress">
										<option value="">请选择订单进度</option>
										 <@my type="order_list_progress">
				                        <#list result as r>
				                            <option value="${r.value}" <#if (orderList.progress==r.value)>selected=""</#if> >${r.label}</option>
				                        </#list>
				                   		 </@my> 
										
									</select>
								</div>
							</div>
								<div class="layui-inline">
							
								<label class="layui-form-label">是否加急</label>
							
								<div class="layui-input-block">
									<input disabled type="checkbox" name="vip" lay-skin="switch" value="1" lay-text="是|否">
								</div>
							
							</div>
						
							
							<div class="layui-inline">
								<label class="layui-form-label">全稿截止</label>
								<div class="layui-input-block">
									<input disabled type="text" name="deadDate"  id="deadDate" lay-verify="date" placeholder="请选择截止时间" autocomplete="off"
									 class="layui-input">
								</div>
							</div>
							
						</div>
					</div>
					
					<div class="layui-colla-item ">
						<h2 class="layui-colla-title">客户需求</h2>
						<div class="layui-colla-content layui-show">
						
					  <table>
					  	
					 
							<@my type="demand_type">
							
								<#list result as r>
								<tr>
									<!--    <option value="${r.value}"  <#if (orderList.categories == r.value)> selected="" </#if>  >${r.label}</option> -->
									<td>
									<label class="layui-form-label">
										
										<label class="layui-form-label">${r.label}：</label>
									</label>
									</td>
									<td>
									<#list demandList as demand>
										
										<#if (demand.type==r.value)>
									
											<#if (demand.option)>
												<div class="layui-inline ">
													<input disabled type="checkbox" name="${demand.id}" <#if (demand.checked==true)>checked</#if> title="">${demand.name}
												</div>
												<div class="layui-inline ">
												
													<select disabled name="${'userOption+'+demand.id}">
														<#list demand.option?split("_") as option>
															<option value="${option}" <#if (option==demand.userOption)>selected=""</#if>>${option}</option>
														</#list>
													</select>
												</div> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
											</#if>
											<#if !(demand.option)>
												<div class="layui-inline ">
								
													<input disabled   type="checkbox" name="${demand.id}" <#if (demand.checked==true)>checked</#if> title="">${demand.name}
												</div>
											</#if>
										</#if>
									</#list>
									</td>
									
									</tr>
								</#list>
							</@my>
						
						
						<tr>
						
						<td>		其他需求 </td>
							<td>	<div class="layui-input-block">
									${orderList.remarks}
								</div>
							 </td>
						
						</div>
						</tr>
							
					
						 </table>
					</div>
					
				</div>
			</div>
		
			</div>
		</form>
		<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
		<script>
			layui.use(['form', 'jquery', 'layer', 'laydate','upload', 'element'], function() {
				var form = layui.form,
					$ = layui.jquery,
					laydate = layui.laydate,
					upload = layui.upload,
					layer = layui.layer;
				var element = layui.element;
				//初始赋值
				 laydate.render({
                            elem: '#deadDate'
							<#if (orderList.deadDate)??>
                            ,value: '${orderList.deadDate?string("yyyy-MM-dd")}'
							</#if>
                          });
				 			
			});
		</script>
		<script type="text/javascript" >

window.onload=function(){

 //	document.getElementsByTagName('body')[0].style.zoom=0.8
	
 
}
</script>
	</body>
</html>
