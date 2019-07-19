<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>任务列表--${site.name}</title>
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
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all" />
</head>
<body class="childrenBody">


    <form class="layui-form" id="searchForm">
   
    <div class="layui-inline" style="margin-left: 15px">
            <label>任务名称:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_name" placeholder="请输入任务名称" class="layui-input search_input">
                </div>
    </div>
  
    <div class="layui-inline" style="margin-left: 15px">
            <label>所属类别:</label>
                <div class="layui-input-inline">
                <select name="s_categories">
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
            <a class="layui-btn" lay-submit="" lay-filter="searchForm">查询</a>
        </div>
        <div class="layui-inline" >
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      
    </form>

<div class="layui-form users_list">
    <table class="layui-table" id="test"  lay-filter="test"></table>
    <script type="text/html" id="categories">
        <@my type="order_list_categories">
        <#list result as r>
        {{#  if(d.categories == ${r.value}){ }}
        <span>${r.label}</span>
        {{#  } }}
        </#list>
        </@my>
    </script>
    <script type="text/html" id="level">
        <@my type="order_list_level">
        <#list result as r>
        {{#  if(d.level == ${r.value}){ }}
        <span>${r.label}</span>
        {{#  } }}
        </#list>
        </@my>
    </script>
    <script type="text/html" id="isVip">
        {{#  if(d.vip == true){ }}
        <span>是</span>
        {{# }else{ }}
        <span>否</span>
        {{# } }}
    </script>
    <script type="text/html" id="progress">
        <@my type="order_list_progress">
        <#list result as r>
        {{#  if(d.progress == ${r.value}){ }}
        <span>${r.label}</span>
        {{#  } }}
        </#list>
        </@my>
    </script>
    <script type="text/html" id="userStatus">
        <!-- 这里的 checked 的状态只是演示 -->
        {{#  if(d.delFlag == false){ }}
        <span class="layui-badge layui-bg-green">正常</span>
        {{#  } else { }}
        <span class="layui-badge layui-bg-gray">停用</span>
        {{#  } }}
    </script>

    <script type="text/html" id="barDemo">
    <--!    <a class="layui-btn layui-btn-xs" lay-event="edit">查看</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">接单</a>
        -->
    </script>
</div>
<div id="page"></div>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script type="text/javascript" src="${base}/static/js/tools.js"></script>
<script>
    layui.use(['layer','form','table','laydate'], function() {
        var layer = layui.layer,
                $ = layui.jquery,
                form = layui.form,
                laydate = layui.laydate,
                table = layui.table;

        var beginDeadDate= laydate.render({//渲染开始时间选择
            elem: '#beginDeadDate', //通过id绑定html中插入的start
            type: 'date',
            max:"2099-12-31",//设置一个默认最大值
            done: function (value, dates) {
                endDeadDate.config.min ={
                    year:dates.year,
                    month:dates.month-1, //关键
                    date: dates.date,
                    hours: 0,
                    minutes: 0,
                    seconds : 0
                };
            }
        });
        var endDeadDate= laydate.render({//渲染结束时间选择
            elem: '#endDeadDate',//通过id绑定html中插入的end
            type: 'date',
            min:"1970-1-1",//设置min默认最小值
            done: function (value, dates) {
                beginDeadDate.config.max={
                    year:dates.year,
                    month:dates.month-1,//关键
                    date: dates.date,
                    hours: 0,
                    minutes: 0,
                    seconds : 0
                }
            }
        });

        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'edit'){
               alert("查看")
            }
            if(obj.event === "del"){
                <#--layer.confirm("你确定要删除该任务列表么？",{btn:['是的,我确定','我再想想']},-->
                        <#--function(){-->
                            <#--$.post("${base}/admin/orderList/delete",{"id":data.id},function (res){-->
                                <#--if(res.success){-->
                                    <#--layer.msg("删除成功",{time: 1000},function(){-->
                                        <#--location.reload();-->
                                    <#--});-->
                                <#--}else{-->
                                    <#--layer.msg(res.message);-->
                                <#--}-->

                            <#--});-->
                        <#--}-->
                <#--)-->
                alert("接单")
            }
        });

        var t = {
            elem: '#test',
            url:'${base}/admin/orderList/list?hall=2',
            method:'post',
            size: 'sm',
            width:'100%',
            page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                groups: 2, //只显示 1 个连续页码
                first: "首页", //显示首页
                last: "尾页", //显示尾页
                limit:50,
                limits:[3,10, 20, 30,50]
            },
          //  size: 'sm',
            cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
              totalRow: true ,//开启合计行
             
            cols: [[
                {type:'checkbox'},
                {field:'orderId',width:100,sort: true, title: '编号'},
                {field:'name',sort: true,width:400, title: '任务名称',templet:function(d){
                
                var ahref = '<a href="javascript:void(0)"><span style="font-size: 14px; text-indent: 25px; box-sizing: border-box; border-bottom: 1px solid black; padding-bottom: 2px; color: royalblue; margin-left: 5px; margin-right: 5px;">'+d.name+'</span> </a>'
         //  var ahref =  '<button class="layui-btn layui-btn-sm" lay-event="add">'+d.name+'</button>'
                if(parseInt(d.remaining)<6){
                return "<span style='color: green; font-size: 16px; font-weight: bold; font-family: STKaiti, Georgia, serif;' >【进度急】</span>"+ahref}
                else{return ahref}}},
                 {field:'categories',width:200,sort: true, title: '所属类别',templet:'#categories'},
               
                {field:'remaining',width:200,sort: true, title: '剩余时间',templet:function(d){if(parseInt(d.remaining)<6){return "<span style='color: red; font-weight: bold;'>"+d.remaining+"【进】</span>"}else{return d.remaining}}},
                {field:'deadDate',width:200,sort: true,  title: '截止时间',templet:'<div>{{ layui.laytpl.toDateString(d.deadDate,"yyyy-MM-dd") }}</div>',unresize: true},
                {field:'money',width:150,sort: true, title: '总价(元)'},

                {field:'userTId',width:100,sort: true, title: '接单人'},
          //      {field:'level',width:100,sort: true, title: '课程等级',templet:'#level'},
           //     {field:'vip',width:100,sort: true, title: '是否加急',templet:'#isVip'},
                {field:'progress',width:150,sort: true, title: '接单状况',templet:function(d){if(!d.userTId){
                												return "<font color='green'>未接单<font>"}else{return "已接单"}}},
               // {field:'delFlag', width:100,   title: '任务列表状态',width:'12%',templet:'#userStatus'},
          //      {field:'createDate',width:100,sort: true,  title: '创建时间',width:'15%',templet:'<div>{{ layui.laytpl.toDateString(d.createDate) }}</div>',unresize: true}, //单元格内容水平居中
        //        {fixed: 'right', title:'操作',  width: '15%', align: 'center',toolbar: '#barDemo'}
            ]]
        };
        table.render(t);
				 //监听行单击事件（单击事件为：rowDouble）
		  table.on('row(test)', function(obj){
		    var data = obj.data;
		     var url = "${base}/admin/hall/takeOrder"	
		    if(!data.userTId) {	
		    layer.open({
			        type: 2 //此处以iframe举例
			        ,title: '在线接单'
			        ,area: ['60%', '80%']
			        ,shade: 0.3
			        ,fixed: true
			        ,offset: ['100px', '100px']
			        ,maxmin: false
			       	,resize :false
			        ,content: '${base}/admin/hall/detail?id='+data.id
			        ,btn: ['立即抢单', '返回'] //只是为了演示
			        ,yes: function(){
			       
			        	$.post(url,{'id':data.id}, function(res) {					
						if (res.success) {
							layer.msg("接单成功！", {
								time: 1000
							}, function() {
								layer.close(loadIndex);
								//刷新父页面
								
							});
						} else {
							layer.msg(res.message);
						}
						table.reload('test', t);
					});
			            layer.closeAll();
			        }
			        ,btn2: function(){
			          layer.closeAll();
			        }
			        
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero){
			          layer.setTop(layero);
			          var aggrement ='<p style="float:left"> <input type="checkbox" style="width:20;height:20;" name="aggrement" checked=""><a href="javascript:void(0)"><span style="font-size: 14px; text-indent: 25px; box-sizing: border-box; border-bottom: 1px solid black; padding-bottom: 2px; color: royalblue; margin-left: 5px; margin-right: 5px;" onclick="openAggrement()">已读并接受用户协议</span></p>'
			         $('.layui-layer-btn').append(aggrement)
			        }
			      });
			      }else{
			      layer.open({
			        type: 2 //此处以iframe举例
			        ,title: '在线接单'
			        ,area: ['60%', '80%']
			        ,shade: 0.3
			        ,fixed: true
			        ,offset: ['100px', '100px']
			        ,maxmin: false
			       , resize :false
			       
			        ,content: '${base}/admin/hall/detail?id='+data.id
			        ,btn: ['已被接单，点我返回'] //只是为了演示
			      
			        ,yes: function(){
			     
			            layer.closeAll();
			        }
			       
			        
			        ,zIndex: layer.zIndex //重点1
			        ,success: function(layero){
			          layer.setTop(layero);
			          var aggrement ='<p style="float:left"> <input type="checkbox" style="width:20;height:20;" name="aggrement" checked=""><a href="javascript:void(0)"><span style="font-size: 14px; text-indent: 25px; box-sizing: border-box; border-bottom: 1px solid black; padding-bottom: 2px; color: royalblue; margin-left: 5px; margin-right: 5px;" onclick="openAggrement()">已读并接受用户协议</span></p>'
			         $('.layui-layer-btn').append(aggrement)
			        }
			      });
			      
			      
			      }
	  });
	  
	  	 openAggrement = function(){
	  	 	 layer.open({
        type: 2 //此处以iframe举例
        ,title: '用户协议'
        ,area: ['900px', '800px']
        ,shade: 0.3
        ,maxmin: true
        ,content: '${base}/admin/operating/aggrement'
        ,btn: ['关闭'] //只是为了演示
        ,yes: function(){
         layer.close(layer.index);
        }
             
        ,zIndex: layer.zIndex //重点1
        ,success: function(layero){
          layer.setTop(layero); //重点2
        }
      });
	  	 }

        $('.layui-inline .layui-btn-normal').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
	
        form.on("submit(searchForm)",function(data){
            t.where = data.field;
            table.reload('test', t);
            return false;
        });

    });
</script>
<script type="text/javascript" >

window.onload=function(){

 	document.getElementsByTagName('body')[0].style.zoom=0.7
	
}
</script>
</body>
</html>