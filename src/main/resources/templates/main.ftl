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


<div class="layui-col-md12">
    <div class="layui-card">

        <div class="layui-card-header">

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>   关键数据实时指标</legend>
            </fieldset>
        </div>
        <div class="layui-card-body">
            <div>
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
            </div>
        </div>
    </div>
</div>
<br/>
<div class="layui-col-md8">
    <div class="layui-card">
        <div class="layui-card-header">

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>   任务大厅</legend>
            </fieldset>
            <a style="float: right" href="#">更多 </a>
        </div>
        <div class="layui-card-body">
            <table id="gridList" style="margin: 0px; padding: 0px; width: 688px;" tabindex="0" role="presentation"
                   aria-multiselectable="false" aria-labelledby="gbox_gridList"
                   class="ui-jqgrid-btable ui-common-table table table-bordered">
                <tbody>
                <tr class="jqgfirstrow" role="row">
                    <td role="gridcell" style="height:0px;width:28px;"></td>
                    <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
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

<div class="layui-col-md4">
    <div class="layui-card">
        <div class="layui-card-header">

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>  系统通告</legend>
            </fieldset>
        </div>
        <div class="layui-card-body">

        </div>
    </div>
</div>

<br/>
<div class="layui-col-md8">
    <div class="layui-card">
        <div class="layui-card-header">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend> 在线沟通通知</legend>
            </fieldset>


        </div>
        <div class="layui-card-body">
            <div style="padding:0px 5px 0px 5px;">
                <p>
                    在线聊天是提供技术老师和我们的客户即时交流的一个桥梁，开发的目的是为了提高沟通效率，提升服务体验。我们倡导科学沟通，礼貌沟通，高效沟通，因此需要大家遵守以下条约：
                </p>
                <p>
                    1、内容相关性。严禁在聊天过程中沟通订单需求以外的其他信息。
                </p>
                <p>
                    2、用语文明礼貌。严禁在聊天过程中出现辱骂客户的行为，沟通双方都是平等的，相互理解，相互尊重。
                </p>
                <p>
                    3、沟通有时不能实时回复。客户如果不在线，您可以留言。在确实有需要实时沟通的情况下，可以提前约定好双方都在线的时间集中交流。
                </p>
                <p>
                    4、 禁止出现联系方式。为了双方交易的安全性，<font color="red">严禁在聊天过程中发送或索要个人联系方式等信息（如手机号码、QQ、邮箱、微信等）。否则所有后果自行承担。</font>
                </p>
                <p>
                    5、 关于额外需求的处理流程。在沟通过程中，如果客户提出额外的需求，技术人员可以找管理员私聊反映。我们会根据新增需求的工作量，跟您和客户分别协商是否增加费用以及增加多少费用，<font
                            color="red">严禁技术人员直接给客户报价，发现1次直接终止所有合作。</font>
                </p>
                <p>
                    6、 如果设计已经全部完成，可在聊天工具里发演示截图给客户验收，并第一时间通知客户找我们付款，或通知管理员找客户收款。<font color="red">请勿在没有告知管理员的情况下直接上传全部源文件。</font>
                </p>
                <p>
                    在开启聊天之前，默认您已经知晓并同意以上所有沟通条约。如您不同意，视为放弃合作。
                </p>
            </div>
        </div>
    </div>
</div>

<div class="layui-col-md4">
    <div class="layui-card">
        <div class="layui-card-header">
            可能感兴趣的订单

        </div>
        <div class="layui-card-body">

        </div>
    </div>
</div>
<br/>


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