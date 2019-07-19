package com.mysiteforme.admin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.annotation.SysLog;
import com.mysiteforme.admin.base.MySysUser;
import com.mysiteforme.admin.entity.Demand;
import com.mysiteforme.admin.entity.OrderList;
import com.mysiteforme.admin.entity.Rescource;
import com.mysiteforme.admin.entity.User;
import com.mysiteforme.admin.entity.UserDemand;
import com.mysiteforme.admin.entity.UserDemandVo;
import com.mysiteforme.admin.service.DemandService;
import com.mysiteforme.admin.service.FileService;
import com.mysiteforme.admin.service.OrderListService;
import com.mysiteforme.admin.service.RescourceService;
import com.mysiteforme.admin.service.RoleService;
import com.mysiteforme.admin.service.UserService;
import com.mysiteforme.admin.util.RestResponse;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/hall")
public class HallController {
	@Autowired
	private OrderListService orderListService;

	@Autowired
	private UserService userService;
	@Autowired
	private DemandService demandService;
	@Autowired
	RoleService roleService;
	@Autowired
	FileService fileService;
	@Autowired
	RescourceService resourceService;

	
	
    @GetMapping("list")
    @SysLog("跳转订单列表列表")
    public String list(){
        return "/admin/hall_bak/list";
    }
    
    @PostMapping("takeOrder")
    @ResponseBody
    @SysLog("接单")
    public RestResponse takeOrder(@RequestParam Long id){
    	OrderList order = orderListService.selectById(id);
    	
    	order.setUserTId(MySysUser.loginName());
    	order.setProgress(3);
    	orderListService.updateById(order);
    	return RestResponse.success();
    }
    
    
    
    @GetMapping("detail")
    @SysLog("跳转任务详情")
    
    	public String detail(Long id, Model model) throws IllegalAccessException, InvocationTargetException {
    		OrderList orderList = orderListService.selectById(id);
    		model.addAttribute("orderList", orderList);

    		// 客户信息回显
    		EntityWrapper<User> wrapper = new EntityWrapper<>();
    		wrapper.eq("login_name", orderList.getUserCId());
    		wrapper.eq("del_flag", false);
    		User user = userService.selectOne(wrapper);
    		model.addAttribute("cuser", user);

    		// 用户需求回显
    		EntityWrapper<Demand> wrapper2 = new EntityWrapper<Demand>();
    		List<Demand> demandList = demandService.selectList(wrapper2);
    		List<UserDemandVo> vos = new ArrayList<>();
    		for (Demand demand : demandList) {
    			UserDemandVo vo = new UserDemandVo();
    			BeanUtils.copyProperties(vo, demand);
    			Long demandId = demand.getId();
    			UserDemand ud = demandService.selectOneDemand(id, demandId);
    			if (ud != null) {
    				vo.setChecked(true);
    				vo.setUserOption(ud.getUserOption());
    			}
    			vos.add(vo);
    		}
    		model.addAttribute("demandList", vos);

    		EntityWrapper<Rescource> wrapper3 = new EntityWrapper<Rescource>();
    		wrapper3.eq("del_flag", 0);
    		wrapper3.eq("order_id", orderList.getOrderId());
    		List<Rescource> fileList = resourceService.selectList(wrapper3);
    		model.addAttribute("fileList", fileList);
        return "/admin/hall_bak/detail";
    }
    
    


}