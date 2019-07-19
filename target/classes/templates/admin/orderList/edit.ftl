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
				<div class="layui-colla-item">
					<h2 class="layui-colla-title">基本信息</h2>
					<div class="layui-colla-content layui-show">
						<div class="layui-form-item">
						<input name="id" value="${orderList.id}" hidden></input>
							<div class="layui-inline">
								<label class="layui-form-label">订单编号</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" name="orderId" value="${orderList.orderId}" placeholder="请输入订单编号">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">订单名称</label>
								<div class="layui-input-block">
									 <input  type="text" class="layui-input" value = "${orderList.name}" name="name"  placeholder="请输入订单名称">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">订单价格</label>
								<div class="layui-input-block">
									    <input  type="text" class="layui-input" value = "${orderList.money}" name="money"  placeholder="请输入订单价格">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">课题方向</label>
								<div class="layui-input-block">
									<select name="subject" >
					
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
									<select name="categories" >
				
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
									<select name="level">
	
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
									<select name="progress">
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
									<input type="checkbox" name="vip" lay-skin="switch" value="1" lay-text="是|否">
								</div>
							
							</div>
						
							
							<div class="layui-inline">
								<label class="layui-form-label">全稿截止</label>
								<div class="layui-input-block">
									<input type="text" name="deadDate"  id="deadDate" lay-verify="date" placeholder="请选择截止时间" autocomplete="off"
									 class="layui-input">
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
									<input type="text" class="layui-input" name="loginName" value="${cuser.loginName}" placeholder="请输入关联客户">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">姓名</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" name="nickName" value="${cuser.nickName}" placeholder="请输入姓名">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">手机号</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" name="tel" value="${cuser.tel}" placeholder="请输入手机号码">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">QQ号</label>
								<div class="layui-input-block">
									<input type="text" class="layui-input" name="email" value="${cuser.email}" placeholder="请输入QQ号 ">
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
													<input type="checkbox" name="${demand.id}" <#if (demand.checked==true)>checked</#if> title="${demand.name}">
												</div>
												<div class="layui-inline ">
												
													<select name="${'userOption+'+demand.id}">
														<#list demand.option?split("_") as option>
															<option value="${option}" <#if (option==demand.userOption)>selected=""</#if>>${option}</option>
														</#list>
													</select>
												</div> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
											</#if>
											<#if !(demand.option)>
												<div class="layui-inline ">
								
													<input type="checkbox" name="${demand.id}" <#if (demand.checked==true)>checked</#if> title="${demand.name}">
												</div>
											</#if>
										</#if>
									</#list>
									</td>
									
									</tr>
								</#list>
							</@my>
						
						
						
							<div class="layui-form-item">
								<label class="layui-form-label">其他需求</label>
								<div class="layui-input-block">
									<textarea name="remarks" placeholder="请输入其他需求" class="layui-textarea">${orderList.remarks}</textarea>
								</div>
							</div>
						
						</div>
						 </table>
					</div>
					<div class="layui-colla-item">
						<h2 class="layui-colla-title">关联文件</h2>
						<div class="layui-colla-content layui-show"> 
							<label class="layui-form-label">需求文件：</label>
							<div id="fileList"></div>
						 <div class="layui-upload">
						  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
						  <div class="layui-upload-list">
						    <table class="layui-table">
						      <thead>
						        <tr><th>文件名</th>
						        <th>大小</th>
						        <th>状态</th>
						        <th>操作</th>
						      </tr></thead>
						      <tbody id="demoList">
						      <#list fileList as file>
						      <tr>
						      	<td>${file.fileName}</td>
						        <td>${file.fileSize}</td>
						        <td>已上传</td>
						        <td><a href='${base}/file/download?hash=${file.hash}'>下载</a></td>
						       <tr>
						      </#list>
						      </tbody>
						    </table>
						  </div>
						  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
						</div> 
					      
						 </div>
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
				  //上传
				  //多文件列表示例
				  var demoListView = $('#demoList')
				  ,uploadListIns = upload.render({
				    elem: '#testList'
				    ,url: '${base}/file/upload/'
				    ,accept: 'file'
				    ,field:'test'
				    ,multiple: true
				    ,auto: false
				    ,bindAction: '#testListAction'
				        ,choose: function(obj){   
				      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
				      //读取本地文件
				      obj.preview(function(index, file, result){
				        var tr = $(['<tr id="upload-'+ index +'">'
				          ,'<td>'+ file.name +'</td>'
				          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
				          ,'<td>等待上传</td>'
				          ,'<td>'
				            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
				            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
				          ,'</td>'
				        ,'</tr>'].join(''));
				        
				        //单个重传
				        tr.find('.demo-reload').on('click', function(){
				          obj.upload(index, file);
				        });
				        
				        //删除
				        tr.find('.demo-delete').on('click', function(){
				          delete files[index]; //删除对应的文件
				          tr.remove();
				          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
				        });
				        
				        demoListView.append(tr);
				      });
				    }
				    ,done: function(res, index, upload){
				    	console.log(res)
				      if(res.success == true){ //上传成功
				        var tr = demoListView.find('tr#upload-'+ index)
				        ,tds = tr.children();
				     
				      	tds.eq(0).html('<a href='+'${base}/file/download?hash='+res.data.hash+'>'+res.data.name+'</a>')
				        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
				        tds.eq(3).html('<a href='+'${base}/file/download?hash='+res.data.hash+'>下载</a>'); //下载操作
				        $("#fileList").append('<input name="remandFile'+index+'"  id="file+'+index+'" value='+res.data.hash+' hidden ></input>')
				       
				       
				        return delete this.files[index]; //删除文件队列已经上传成功的文件
				      }
				    	
				        
				       
				      this.error(index, upload);
				    }
				    ,error: function(index, upload){
				      var tr = demoListView.find('tr#upload-'+ index)
				      ,tds = tr.children();
				      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
				      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
				    }
				  });
				form.on("submit(addOrderList)", function(data) {
					if (null === data.field.deadDate || "" === data.field.deadDate) {
						delete data.field["deadDate"];
					} else {
						data.field.deadDate = new Date(data.field.deadDate);
					}
					if (undefined === data.field.vip || '0' === data.field.vip || null === data.field.vip) {
						data.field.vip = false;
					} else {
						data.field.vip = true;
					}
					var loadIndex = layer.load(2, {
						shade: [0.3, '#333']
					});
					$.post("${base}/admin/orderList/edit", data.field, function(res) {
						layer.close(loadIndex);
						if (res.success) {
							parent.layer.msg("订单修改成功！", {
								time: 1000
							}, function() {
								parent.layer.close(parent.addIndex);
								//刷新父页面
								parent.location.reload();
							});
						} else {
							layer.msg(res.message);
						}
					});
					return false;
				});
			});
		</script>
	</body>
</html>
