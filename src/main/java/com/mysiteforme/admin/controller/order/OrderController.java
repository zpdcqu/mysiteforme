package com.mysiteforme.admin.controller.order;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.mysiteforme.admin.annotation.SysLog;
import com.mysiteforme.admin.base.BaseController;
import com.mysiteforme.admin.entity.Order;
import com.mysiteforme.admin.entity.Order;
import com.mysiteforme.admin.service.order.OrderService;
import com.mysiteforme.admin.util.LayerData;
import com.mysiteforme.admin.util.RestResponse;
import com.xiaoleilu.hutool.date.DateUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.Date;
import java.util.Map;

/**
 * @program: demo
 * @description: 订单相关控制
 * @author: Zheng Peidong
 * @create: 2019-01-07 19:19
 */
@Controller
@RequestMapping("/admin/order")
public class OrderController extends BaseController {

    @Autowired
    OrderService orderService;

    /**
     * 订单列表
     * @param model
     * @return
     */
    @GetMapping("list")
    @SysLog("跳转订单列表")
    public String list(Model model){
        return "/order/list";
    }

    @RequiresPermissions("sys:order:add")
    @PostMapping("add")
    @ResponseBody
    @SysLog("保存新增订单数据")
    public RestResponse add(Order order){
        if(StringUtils.isBlank(order.getName())){
            return RestResponse.failure("订单名称不能为空");
        }
        if(menuService.getCountByName(order.getName())>0){
            return RestResponse.failure("订单名称已存在");
        }

        orderService.saveOrUpdateOrder(order);
        return RestResponse.success();
    }


    @RequiresPermissions("blog:article:list")
    @PostMapping("list")
    @ResponseBody
    public LayerData<Order> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                       @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                       ServletRequest request){
        Map<String,Object> map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<Order> layerData = new LayerData<>();
        EntityWrapper<Order> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);

        Page<Order> pageData = orderService.selectDetailOrder(map,new Page<>(page,limit));
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }


}