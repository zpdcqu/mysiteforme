<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>上传文件表--${site.name}</title>
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
  <legend>上传文件表检索</legend>
  <div class="layui-field-box">
    <form class="layui-form" id="searchForm">
    <div class="layui-inline" style="margin-left: 15px">
            <label>标题:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_name" placeholder="请输入标题" class="layui-input search_input">
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>上传人:</label>
                <div class="layui-input-inline">
                <input type="text" value="" name="s_uploadUser" placeholder="请输入上传人" class="layui-input search_input">
                </div>
    </div>
    <div class="layui-inline" style="margin-left: 15px">
            <label>长传/下载日期:</label>
                <div class="layui-input-inline">
                    <input type="text" name="s_beginDate" id="beginDate" lay-verify="date"  autocomplete="off" class="layui-input">
                </div>
                <span>-</span>
                <div class="layui-input-inline">
                    <input type="text" name="s_endDate" id="endDate" lay-verify="date"  autocomplete="off" class="layui-input">
                </div>
    </div>
        <div class="layui-inline">
            <a class="layui-btn" lay-submit="" lay-filter="searchForm">查询</a>
        </div>
        <div class="layui-inline" >
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
        <div class="layui-inline">
            <a class="layui-btn layui-btn-normal" data-type="addFile">添加上传文件表</a>
        </div>
    </form>
  </div>
</fieldset>
<div class="layui-form users_list">
    <table class="layui-table" id="test" lay-filter="demo"></table>
    <script type="text/html" id="url">
    {{#  if(d.url != "" && d.url != null){ }}
    <span><button lay-event="downloadurl" class="layui-btn layui-btn-warm layui-btn-sm">下载文件</button></span>
    {{#  } else { }}
    <span ></span>
    {{#  } }}
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

        var beginDate= laydate.render({//渲染开始时间选择
            elem: '#beginDate', //通过id绑定html中插入的start
            type: 'date',
            max:"2099-12-31",//设置一个默认最大值
            done: function (value, dates) {
                endDate.config.min ={
                    year:dates.year,
                    month:dates.month-1, //关键
                    date: dates.date,
                    hours: 0,
                    minutes: 0,
                    seconds : 0
                };
            }
        });
        var endDate= laydate.render({//渲染结束时间选择
            elem: '#endDate',//通过id绑定html中插入的end
            type: 'date',
            min:"1970-1-1",//设置min默认最小值
            done: function (value, dates) {
                beginDate.config.max={
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
                    title : "编辑上传文件表",
                    type : 2,
                    content : "${base}/admin/file/edit?id="+data.id,
                    success : function(layero, index){
                        setTimeout(function(){
                            layer.tips('点击此处返回上传文件表列表', '.layui-layer-setwin .layui-layer-close', {
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
                layer.confirm("你确定要删除该上传文件表么？",{btn:['是的,我确定','我再想想']},
                        function(){
                            $.post("${base}/admin/file/delete",{"id":data.id},function (res){
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
            if(obj.event == "downloadurl"){
                $.post("${base}/fiel/download",{url:data.url,name:"下载文件"},function(res){
                    if(!res.success){
                       layer.msg(res.message);
                    }
                });
            }
        });

        var t = {
            elem: '#test',
            url:'${base}/admin/file/list',
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
                {field:'name', title: '标题'},
                {field:'description', title: '描述'},
                {field:'uploadUser', title: '上传人'},
                {field:'date',  title: '长传/下载日期',templet:'<div>{{ layui.laytpl.toDateString(d.date,"yyyy-MM-dd") }}</div>',unresize: true},
                {field:'url', title: '链接地址',templet:'#url'},
                {field:'delFlag',    title: '上传文件表状态',width:'12%',templet:'#userStatus'},
                {field:'createDate',  title: '创建时间',width:'15%',templet:'<div>{{ layui.laytpl.toDateString(d.createDate) }}</div>',unresize: true}, //单元格内容水平居中
                {fixed: 'right', title:'操作',  width: '15%', align: 'center',toolbar: '#barDemo'}
            ]]
        };
        table.render(t);

        var active={
            addFile : function(){
                var addIndex = layer.open({
                    title : "添加上传文件表",
                    type : 2,
                    content : "${base}/admin/file/add",
                    success : function(layero, addIndex){
                        setTimeout(function(){
                            layer.tips('点击此处返回上传文件表列表', '.layui-layer-setwin .layui-layer-close', {
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