<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页--layui后台管理模板</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all"/>
    <link rel="stylesheet" href="${base}/static/css/main.css" media="all"/>
</head>
<body class="childrenBody" bgcolor="#f8f8ff">
<div class="panel_box row">
    <#if (userMenu?size>0)>

    </#if>
</div>

<div style="padding: 20px; background-color: #F2F2F2;">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md24">
					<div class="layui-card">
						<div class="layui-card-header">关键实时数据</div>
						<div class="layui-card-body" style="height:100px"> <div>
                <#list userMenu as items>
                    <div class="panel col <#if (!items_has_next)>max_panel</#if> ">
                        <a href="javascript:" data-url="${base}${items.href}">
                            <div class="panel_icon"
                                 <#if (items.bgColor != "")>style="background-color: ${items.bgColor}"
                                 <#else>style="background-color: #54ade8"</#if>>
                                <i class="layui-icon" data-icon="${items.icon}">${items.icon}</i>
                            </div>
                            <div class="panel_word newMessage">
                                <span>${items.dataCount}</span>
                                <cite>${items.name}</cite>
                            </div>
                        </a>
                    </div>
                </#list>
            </div> </div>
					</div>
				</div>
				<div class="layui-col-md7">
					<div class="layui-card">
						<div class="layui-card-header">任务大厅 <a href="#" style="float: right;">更多</a></div>
						<div class="layui-card-body">
							 <table id="gridList" style="margin: 0px; padding: 0px; width: 688px;" tabindex="0" role="presentation"
                   aria-multiselectable="false" aria-labelledby="gbox_gridList"
                   class="ui-jqgrid-btable ui-common-table table table-bordered">
                <tbody>
                <tr class="jqgfirstrow" role="row">
                    <td role="gridcell" style="height:0px;width:28px;"></td>
                    <td role="gridcell" style="height:0px;width:150px;display:none;">任务编号</td>
                    <td role="gridcell" style="height:0px;width:70px;"></td>
                    <td role="gridcell" style="height:0px;width:300px;"></td>
                    <td role="gridcell" style="height:0px;width:80px;"></td>
                    <td role="gridcell" style="height:0px;width:80px;"></td>
                    <td role="gridcell" style="height:0px;width:100px;"></td>
                </tr>
                <tr role="row" id="1" tabindex="-1" class="jqgrow ui-row-ltr">
                    <td role="gridcell" class="jqgrid-rownum " style="text-align:center;width: 28px;" title="1"
                        aria-describedby="gridList_rn">1
                    </td>
                    <td role="gridcell" style="display:none;" title="" aria-describedby="gridList_OrderID">&nbsp;</td>
                    <td role="gridcell" style="text-align:left;" title="M181085" aria-describedby="gridList_OrderCode">
                        M181085
                    </td>
                    <td role="gridcell" style="text-align:left;" title="【11】课题自拟-小型糖果包装机设计"
                        aria-describedby="gridList_OrderName"><a class="aLinkClass"
                                                                 onclick="openOrderManage(&quot;0a8a37db-694a-4261-a7ea-b2f48d4df2f9&quot;,20)"
                                                                 title="点击查看详情">【11】课题自拟-小型糖果包装机设计</a></td>
                    <td role="gridcell" style="text-align:center;" title="320" aria-describedby="gridList_TeacherCost">
                        320
                    </td>
                    <td role="gridcell" style="text-align:left;" title="1天6小时"
                        aria-describedby="gridList_AdvanceDiffTime">1天6小时
                    </td>
                    <td role="gridcell" style="text-align:left;" title="2019-01-07"
                        aria-describedby="gridList_EstimateCompleteTime">2019-01-07
                    </td>
                </tr>
                <tr role="row" id="2" tabindex="-1" class="jqgrow ui-row-ltr">
                    <td role="gridcell" class="jqgrid-rownum " style="text-align:center;" title="2"
                        aria-describedby="gridList_rn">2
                    </td>
                    <td role="gridcell" style="display:none;" title="" aria-describedby="gridList_OrderID">&nbsp;</td>
                    <td role="gridcell" style="text-align:left;" title="M181097" aria-describedby="gridList_OrderCode">
                        M181097
                    </td>
                    <td role="gridcell" style="text-align:left;" title="【10】无纺布自动丝网印刷和模切装置设计"
                        aria-describedby="gridList_OrderName"><a class="aLinkClass"
                                                                 onclick="openOrderManage(&quot;3cc5a7f7-5109-4066-b6a5-06182e8110a5&quot;,20)"
                                                                 title="点击查看详情">【10】无纺布自动丝网印刷和模切装置设计</a></td>
                    <td role="gridcell" style="text-align:center;" title="800" aria-describedby="gridList_TeacherCost">
                        800
                    </td>
                    <td role="gridcell" style="text-align:left;" title="13天6小时"
                        aria-describedby="gridList_AdvanceDiffTime">13天6小时
                    </td>
                    <td role="gridcell" style="text-align:left;" title="2019-01-19"
                        aria-describedby="gridList_EstimateCompleteTime">2019-01-19
                    </td>
                </tr>
                <tr role="row" id="3" tabindex="-1" class="jqgrow ui-row-ltr">
                    <td role="gridcell" class="jqgrid-rownum " style="text-align:center;" title="3"
                        aria-describedby="gridList_rn">3
                    </td>
                    <td role="gridcell" style="display:none;" title="" aria-describedby="gridList_OrderID">&nbsp;</td>
                    <td role="gridcell" style="text-align:left;" title="M181099" aria-describedby="gridList_OrderCode">
                        M181099
                    </td>
                    <td role="gridcell" style="text-align:left;" title="【10】齿轮齿条助力转向系统设计"
                        aria-describedby="gridList_OrderName"><a class="aLinkClass"
                                                                 onclick="openOrderManage(&quot;91390bea-191a-400a-9476-7a48472b7ff3&quot;,20)"
                                                                 title="点击查看详情">【10】齿轮齿条助力转向系统设计</a></td>
                    <td role="gridcell" style="text-align:center;" title="280" aria-describedby="gridList_TeacherCost">
                        280
                    </td>
                    <td role="gridcell" style="text-align:left;" title="4天6小时"
                        aria-describedby="gridList_AdvanceDiffTime">4天6小时
                    </td>
                    <td role="gridcell" style="text-align:left;" title="2019-01-10"
                        aria-describedby="gridList_EstimateCompleteTime">2019-01-10
                    </td>
                </tr>
                <tr role="row" id="4" tabindex="-1" class="jqgrow ui-row-ltr">
                    <td role="gridcell" class="jqgrid-rownum " style="text-align:center;" title="4"
                        aria-describedby="gridList_rn">4
                    </td>
                    <td role="gridcell" style="display:none;" title="" aria-describedby="gridList_OrderID">&nbsp;</td>
                    <td role="gridcell" style="text-align:left;" title="M181101" aria-describedby="gridList_OrderCode">
                        M181101
                    </td>
                    <td role="gridcell" style="text-align:left;" title="【11】圆片状产品热封包装装置设计"
                        aria-describedby="gridList_OrderName"><a class="aLinkClass"
                                                                 onclick="openOrderManage(&quot;4f758208-6040-4da3-bd02-669595804527&quot;,20)"
                                                                 title="点击查看详情">【11】圆片状产品热封包装装置设计</a></td>
                    <td role="gridcell" style="text-align:center;" title="1100" aria-describedby="gridList_TeacherCost">
                        1100
                    </td>
                    <td role="gridcell" style="text-align:left;" title="6天6小时"
                        aria-describedby="gridList_AdvanceDiffTime">6天6小时
                    </td>
                    <td role="gridcell" style="text-align:left;" title="2019-01-12"
                        aria-describedby="gridList_EstimateCompleteTime">2019-01-12
                    </td>
                </tr>
                <tr role="row" id="5" tabindex="-1" class="jqgrow ui-row-ltr">
                    <td role="gridcell" class="jqgrid-rownum " style="text-align:center;" title="5"
                        aria-describedby="gridList_rn">5
                    </td>
                    <td role="gridcell" style="display:none;" title="" aria-describedby="gridList_OrderID">&nbsp;</td>
                    <td role="gridcell" style="text-align:left;" title="M181111" aria-describedby="gridList_OrderCode">
                        M181111
                    </td>
                    <td role="gridcell" style="text-align:left;" title="【11】基于次声波的腹部按摩器(有参考资料)"
                        aria-describedby="gridList_OrderName"><a class="aLinkClass"
                                                                 onclick="openOrderManage(&quot;2e4f3b62-bd60-4247-a21a-3d23800db37a&quot;,20)"
                                                                 title="点击查看详情">【11】基于次声波的腹部按摩器(有参考资料)</a></td>
                    <td role="gridcell" style="text-align:center;" title="800" aria-describedby="gridList_TeacherCost">
                        800
                    </td>
                    <td role="gridcell" style="text-align:left;" title="6天6小时"
                        aria-describedby="gridList_AdvanceDiffTime">6天6小时
                    </td>
                    <td role="gridcell" style="text-align:left;" title="2019-01-12"
                        aria-describedby="gridList_EstimateCompleteTime">2019-01-12
                    </td>
                </tr>
                <tr role="row" id="6" tabindex="-1" class="jqgrow ui-row-ltr">
                    <td role="gridcell" class="jqgrid-rownum " style="text-align:center;" title="6"
                        aria-describedby="gridList_rn">6
                    </td>
                    <td role="gridcell" style="display:none;" title="" aria-describedby="gridList_OrderID">&nbsp;</td>
                    <td role="gridcell" style="text-align:left;" title="M181118" aria-describedby="gridList_OrderCode">
                        M181118
                    </td>
                    <td role="gridcell" style="text-align:left;" title="【11】钻孔组合机床总体设计及典型夹具设计"
                        aria-describedby="gridList_OrderName"><a class="aLinkClass"
                                                                 onclick="openOrderManage(&quot;787490fc-15ae-4243-b947-1f6e151978a5&quot;,20)"
                                                                 title="点击查看详情">【11】钻孔组合机床总体设计及典型夹具设计</a></td>
                    <td role="gridcell" style="text-align:center;" title="600" aria-describedby="gridList_TeacherCost">
                        600
                    </td>
                    <td role="gridcell" style="text-align:left;" title="10天6小时"
                        aria-describedby="gridList_AdvanceDiffTime">10天6小时
                    </td>
                    <td role="gridcell" style="text-align:left;" title="2019-01-16"
                        aria-describedby="gridList_EstimateCompleteTime">2019-01-16
                    </td>
                </tr>
                <tr role="row" id="7" tabindex="-1" class="jqgrow ui-row-ltr">
                    <td role="gridcell" class="jqgrid-rownum " style="text-align:center;" title="7"
                        aria-describedby="gridList_rn">7
                    </td>
                    <td role="gridcell" style="display:none;" title="" aria-describedby="gridList_OrderID">&nbsp;</td>
                    <td role="gridcell" style="text-align:left;" title="M181120" aria-describedby="gridList_OrderCode">
                        M181120
                    </td>
                    <td role="gridcell" style="text-align:left;" title="【11】汽车用喷油嘴支架的模具设计"
                        aria-describedby="gridList_OrderName"><a class="aLinkClass"
                                                                 onclick="openOrderManage(&quot;2f79f938-72d9-4a9b-bf59-9f871e1fc772&quot;,20)"
                                                                 title="点击查看详情">【11】汽车用喷油嘴支架的模具设计</a></td>
                    <td role="gridcell" style="text-align:center;" title="800" aria-describedby="gridList_TeacherCost">
                        800
                    </td>
                    <td role="gridcell" style="text-align:left;" title="9天6小时"
                        aria-describedby="gridList_AdvanceDiffTime">9天6小时
                    </td>
                    <td role="gridcell" style="text-align:left;" title="2019-01-15"
                        aria-describedby="gridList_EstimateCompleteTime">2019-01-15
                    </td>
                </tr>
                <tr role="row" id="8" tabindex="-1" class="jqgrow ui-row-ltr ">
                    <td role="gridcell" class="jqgrid-rownum " style="text-align:center;" title="8"
                        aria-describedby="gridList_rn">8
                    </td>
                    <td role="gridcell" style="display:none;" title="" aria-describedby="gridList_OrderID">&nbsp;</td>
                    <td role="gridcell" style="text-align:left;" title="M181124" aria-describedby="gridList_OrderCode">
                        M181124
                    </td>
                    <td role="gridcell" style="text-align:left;" title="【11】无需手持的固定式吹风机"
                        aria-describedby="gridList_OrderName"><a class="aLinkClass"
                                                                 onclick="openOrderManage(&quot;f9522fa2-84c4-490b-9694-c451ac295da0&quot;,20)"
                                                                 title="点击查看详情">【11】无需手持的固定式吹风机</a></td>
                    <td role="gridcell" style="text-align:center;" title="850" aria-describedby="gridList_TeacherCost">
                        850
                    </td>
                    <td role="gridcell" style="text-align:left;" title="2天6小时"
                        aria-describedby="gridList_AdvanceDiffTime">2天6小时
                    </td>
                    <td role="gridcell" style="text-align:left;" title="2019-01-08"
                        aria-describedby="gridList_EstimateCompleteTime">2019-01-08
                    </td>
                </tr>
                </tbody>
            </table>
						</div>
					</div>
				</div>
				<div class="layui-col-md5">
					<div class="layui-card">
						<div class="layui-card-header">可能感兴趣的订单 </div>
						<div class="layui-card-body"> 放个表格 </div>
					</div>
				</div>
				<div class="layui-col-md7">
					<div class="layui-card">
						<div class="layui-card-header">在线沟通须知</div>
						<div class="layui-card-body"> 内容 </div>
					</div>
				</div>
				<div class="layui-col-md5">
					<div class="layui-card">
						<div class="layui-card-header">系统公告</div>
						<div class="layui-card-body"> 放个公告内容 </div>
					</div>
				</div>
				<div class="layui-col-md12">
					<div class="layui-card">
						<div class="layui-card-header">公告</div>
						<div class="layui-card-body">
							<div id="shang_box" class="shang_box">
								<h2> 各位技术老师：</h2>
								<p> 为方便给给你们打款（进度款、尾款等），将推行系统统一打款（每个周六支付符合结算条件的订单款），需要技术老师把个人的收款支付宝账户信息进行完善。</p>
								<p> 操作方法：</p>
								<p style="color: red; font-weight: bold; --darkreader-inline-color:#b4534b;" data-darkreader-inline-color="">
									后续如果发现以上不诚信行为，一经核实直接取消合作关系，列入黑名单。 </p>
								<p> 1、点击系统左边菜单栏【用户管理】。2、点击【个人信息】，打开个人信息页面；3、将[支付宝账户]和[支付宝真名]两项信息进行填充。 </p>
								<p style="margin-bottom:30px;"></p>
								<p style="text-align:right; padding-right:30px;margin-bottom:5px;"> 中信博文 </p>
								<p style="text-align:right; padding-right:20px;">2018年11月24日</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



   


<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use(['layer', 'jquery', 'form'], function () {
        var layer = layui.layer,
            $ = layui.jquery,
            form = layui.form;

        $(".panel a").on("click", function () {
            window.parent.addTab($(this));
        });
    });
</script>
</body>
</html>