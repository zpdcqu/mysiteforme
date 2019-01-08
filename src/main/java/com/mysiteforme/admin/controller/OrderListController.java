package com.mysiteforme.admin.controller;

import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.OrderList;
import com.mysiteforme.admin.service.OrderListService;
import com.baomidou.mybatisplus.plugins.Page;
import com.mysiteforme.admin.util.LayerData;
import com.mysiteforme.admin.util.RestResponse;
import com.mysiteforme.admin.annotation.SysLog;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 订单列表  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-01-08
 */
@Controller
@RequestMapping("/admin/orderList")
public class OrderListController {
    private static final Logger LOGGER = LoggerFactory.getLogger(OrderListController.class);

    @Autowired
    private OrderListService orderListService;

    @GetMapping("list")
    @SysLog("跳转订单列表列表")
    public String list(){
        return "/admin/orderList/list";
    }

    @PostMapping("list")
    @ResponseBody
    @SysLog("请求订单列表列表数据")
    public LayerData<OrderList> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                      ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<OrderList> layerData = new LayerData<>();
        EntityWrapper<OrderList> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        if(!map.isEmpty()){
            String orderId = (String) map.get("orderId");
            if(StringUtils.isNotBlank(orderId)) {
                wrapper.like("order_id",orderId);
            }else{
                map.remove("orderId");
            }

            String name = (String) map.get("name");
            if(StringUtils.isNotBlank(name)) {
                wrapper.like("name",name);
            }else{
                map.remove("name");
            }

            String beginDeadDate = (String) map.get("beginDeadDate");
            String endDeadDate = (String) map.get("endDeadDate");
            if(StringUtils.isNotBlank(beginDeadDate)) {
                Date begin = DateUtil.parse(beginDeadDate);
                wrapper.ge("dead_date",begin);
            }else{
                map.remove("beginDeadDate");
            }
            if(StringUtils.isNotBlank(endDeadDate)) {
                Date end = DateUtil.parse(endDeadDate);
                wrapper.le("dead_date",end);
            }else{
                map.remove("endDeadDate");
            }

            String money = (String) map.get("money");
            if(StringUtils.isNotBlank(money)) {
                wrapper.like("money",money);
            }else{
                map.remove("money");
            }

            String categories = (String) map.get("categories");
            if(StringUtils.isNotBlank(categories)) {
                wrapper.eq("categories",categories);
            }else{
                map.remove("categories");
            }

            String level = (String) map.get("level");
            if(StringUtils.isNotBlank(level)) {
                wrapper.eq("level",level);
            }else{
                map.remove("level");
            }

        }
        Page<OrderList> pageData = orderListService.selectPage(new Page<>(page,limit),wrapper);
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增订单列表页面")
    public String add(){
        return "/admin/orderList/add";
    }

    @PostMapping("add")
    @SysLog("保存新增订单列表数据")
    @ResponseBody
    public RestResponse add(OrderList orderList){
        orderListService.insert(orderList);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑订单列表页面")
    public String edit(Long id,Model model){
        OrderList orderList = orderListService.selectById(id);
        model.addAttribute("orderList",orderList);
        return "/admin/orderList/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑订单列表数据")
    public RestResponse edit(OrderList orderList){
        if(null == orderList.getId() || 0 == orderList.getId()){
            return RestResponse.failure("ID不能为空");
        }
        orderListService.updateById(orderList);
        return RestResponse.success();
    }

    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除订单列表数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        OrderList orderList = orderListService.selectById(id);
        orderList.setDelFlag(true);
        orderListService.updateById(orderList);
        return RestResponse.success();
    }

}