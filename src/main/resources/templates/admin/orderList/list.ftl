<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单列表--${site.name}</title>
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
<fieldset class="layui-elem-field">
  <legend>订单列表检索</legend>
  <div class="layui-field-box">
    <form class="layui-form" id="searchForm">
    <div class="layui-inline" style="margin-left: 15px">
            <label>订单编号:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_orderId" placeholder="请输入订单编号" class="layui-input search_input">
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>订单名称:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_name" placeholder="请输入订单名称" class="layui-input search_input">
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>截止时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="s_beginDeadDate" id="beginDeadDate" lay-verify="date"  autocomplete="off" class="layui-input">
                </div>
                <span>-</span>
                <div class="layui-input-inline">
                    <input type="text" name="s_endDeadDate" id="endDeadDate" lay-verify="date"  autocomplete="off" class="layui-input">
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>订单价格:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_money" placeholder="请输入订单价格" class="layui-input search_input">
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>关联客户:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_userCId" placeholder="请输入关联客户" class="layui-input search_input">
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
    <div class="layui-inline" style="margin-left: 15px">
            <label>关联技术:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_userTId" placeholder="请输入关联技术" class="layui-input search_input">
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>课程等级:</label>
                <div class="layui-input-inline">
                <select name="s_level">
                    <option value="" selected="">请选择课程等级</option>
                    <@my type="order_list_level">
                    <#list result as r>
                    <option value="${r.value}" >${r.label}</option>
                    </#list>
                    </@my>
                </select>
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>是否加急:</label>
                <div class="layui-input-inline">
                <select name="s_isVip">
                    <option value="" selected="">请选择是否加急</option>
                    <option value="true" >是</option>
                    <option value="false" >否</option>
                </select>
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>订单进度:</label>
                <div class="layui-input-inline">
                <select name="s_progress">
                    <option value="" selected="">请选择订单进度</option>
                    <@my type="order_list_progress">
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
        <div class="layui-inline">
            <a class="layui-btn layui-btn-normal" data-type="addOrderList">添加订单列表</a>
        </div>
    </form>
  </div>
</fieldset>
<div class="layui-form users_list">
    <table class="layui-table" id="test" lay-filter="demo"></table>
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
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
                var editIndex = layer.open({
                    title : "编辑订单列表",
                    type : 2,
                    content : "${base}/admin/orderList/edit?id="+data.id,
                    success : function(layero, index){
                        setTimeout(function(){
                            layer.tips('点击此处返回订单列表列表', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500);
                    }
                });
                //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
                $(window).resize(function(){
                    layer.full(editIndex);
                });
                layer.full(editIndex);
            }
            if(obj.event === "del"){
                layer.confirm("你确定要删除该订单列表么？",{btn:['是的,我确定','我再想想']},
                        function(){
                            $.post("${base}/admin/orderList/delete",{"id":data.id},function (res){
                                if(res.success){
                                    layer.msg("删除成功",{time: 1000},function(){
                                        location.reload();
                                    });
                                }else{
                                    layer.msg(res.message);
                                }

                            });
                        }
                )
            }
        });

        var t = {
            elem: '#test',
            url:'${base}/admin/orderList/list',
            method:'post',
            page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                groups: 2, //只显示 1 个连续页码
                first: "首页", //显示首页
                last: "尾页", //显示尾页
                limits:[3,10, 20, 30]
            },
            cellMinWidth: 80, //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            cols: [[
                {type:'checkbox'},
                {field:'orderId', title: '订单编号'},
                {field:'name', title: '订单名称'},
                 {field:'categories', title: '所属类别',templet:'#categories'},
                {field:'deadDate',  title: '截止时间',templet:'<div>{{ layui.laytpl.toDateString(d.deadDate,"yyyy-MM-dd") }}</div>',unresize: true},
                {field:'remaining', title: '剩余时间',templet:'#remaining'},
                {field:'money', title: '订单价格'},
                {field:'userCId', title: '关联客户'},              
                {field:'userTId', title: '接单人'},
         //       {field:'level', title: '课程等级',templet:'#level'},
           //     {field:'vip', title: '是否加急',templet:'#isVip'},
                {field:'progress', title: '订单进度',templet:'#progress'},
         //       {field:'delFlag',    title: '订单列表状态',width:'12%',templet:'#userStatus'},
           //     {field:'createDate',  title: '创建时间',width:'15%',templet:'<div>{{ layui.laytpl.toDateString(d.createDate) }}</div>',unresize: true}, //单元格内容水平居中
                {fixed: 'right', title:'操作',  width: '15%', align: 'center',toolbar: '#barDemo'}
            ]]
        };
        table.render(t);

        var active={
            addOrderList : function(){
                var addIndex = layer.open({
                    title : "添加订单列表",
                    type : 2,
                    content : "${base}/admin/orderList/add",
                    success : function(layero, addIndex){
                        setTimeout(function(){
                            layer.tips('点击此处返回订单列表列表', '.layui-layer-setwin .layui-layer-close', {
                                tips: 3
                            });
                        },500);
                    }
                });
                //改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
                $(window).resize(function(){
                    layer.full(addIndex);
                });
                layer.full(addIndex);
            }
        };

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
</body>
</html>