package com.mysiteforme.admin.controller;

import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.mysiteforme.admin.entity.Demand;
import com.mysiteforme.admin.entity.OrderList;
import com.mysiteforme.admin.entity.OrderListVo;
import com.mysiteforme.admin.entity.Role;
import com.mysiteforme.admin.entity.User;
import com.mysiteforme.admin.service.DemandService;
import com.mysiteforme.admin.service.OrderListService;
import com.mysiteforme.admin.service.RoleService;
import com.mysiteforme.admin.service.UserService;
import com.baomidou.mybatisplus.plugins.Page;
import com.mysiteforme.admin.util.EntityUtils;
import com.mysiteforme.admin.util.LayerData;
import com.mysiteforme.admin.util.RestResponse;
import com.mysiteforme.admin.annotation.SysLog;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * <p>
 * 订单列表  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-01-20
 */
@Controller
@RequestMapping("/admin/orderList")
public class OrderListController {
    private static final Logger LOGGER = LoggerFactory.getLogger(OrderListController.class);

    @Autowired
    private OrderListService orderListService;

    @Autowired
    private UserService userService;
    @Autowired
    private DemandService demandService;
    @Autowired RoleService roleService;
   
    
    @GetMapping("list")
    @SysLog("跳转订单列表列表")
    public String list(){
        return "/admin/orderList/list";
    }

    @PostMapping("list")
    @ResponseBody
    @SysLog("请求订单列表列表数据")
    public LayerData<OrderListVo> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                      ServletRequest request) throws IllegalAccessException, InvocationTargetException{
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<OrderListVo> layerData = new LayerData<>();
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

            String userCId = (String) map.get("userCId");
            if(StringUtils.isNotBlank(userCId)) {
                wrapper.like("user_c_id",userCId);
            }else{
                map.remove("userCId");
            }

            String categories = (String) map.get("categories");
            if(StringUtils.isNotBlank(categories)) {
                wrapper.eq("categories",categories);
            }else{
                map.remove("categories");
            }

            String userTId = (String) map.get("userTId");
            if(StringUtils.isNotBlank(userTId)) {
                wrapper.like("user_t_id",userTId);
            }else{
                map.remove("userTId");
            }

            String level = (String) map.get("level");
            if(StringUtils.isNotBlank(level)) {
                wrapper.eq("level",level);
            }else{
                map.remove("level");
            }

            String isVip = (String) map.get("isVip");
            if(StringUtils.isNotBlank(isVip)) {
                if(isVip.equalsIgnoreCase("true")){
                    wrapper.eq("is_vip",true);
                }else if(isVip.equalsIgnoreCase("false")){
                    wrapper.eq("is_vip",false);
                }else{
                    map.remove("isVip");
                }
            }else{
                map.remove("isVip");
            }

            String progress = (String) map.get("progress");
            if(StringUtils.isNotBlank(progress)) {
                wrapper.eq("progress",progress);
            }else{
                map.remove("progress");
            }

        }
        Page<OrderList> pageData = orderListService.selectPage(new Page<>(page,limit),wrapper);
        List<OrderList> records = pageData.getRecords();
        List<OrderListVo> vos = new ArrayList<>();
        for (OrderList orderList : records) {
        	OrderListVo vo = new OrderListVo();
			BeanUtils.copyProperties(vo, orderList);
			Long deadDate = vo.getDeadDate().getTime();
			long currentTimeMillis = System.currentTimeMillis();
			Long time = deadDate-currentTimeMillis;
			int day = (int) (time/3600/24/1000);
			int hour = (int) ((time-day*3600*24*1000)/3600/1000);
			if(time >0) {
				vo.setRemaining(day+"天"+hour+"小时");
				vos.add(vo);
			}else {
				vo.setRemaining("已过期");
			}
			
			
		}
        layerData.setData(vos);
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增订单列表页面")
    public String add(Model model){
    	int maxId =  orderListService.selectMaxId();
    	String orderId = "R"+(21620+maxId);
    	model.addAttribute("orderId", orderId);
    	//关联用户的cid
    	int  maxCid = userService.selectMaxCid()+3122; 
    	String loginName = "C"+maxCid;
    	model.addAttribute("loginName",loginName);
    	
    	//查询用户需求
    	EntityWrapper<Demand> wrapper = new EntityWrapper<>();
    	wrapper.eq("del_flag",false);
		List<Demand> demandList = demandService.selectList(wrapper );
		model.addAttribute("demandList", demandList);
        return "/admin/orderList/add";
    }

    @PostMapping("add")
    @SysLog("保存新增订单列表数据")
    @ResponseBody
    public RestResponse add(@RequestParam Map<Integer,String> remand,OrderList orderList,User user){
    	
    	orderList.setUserCId(user.getLoginName());
        orderListService.insert(orderList);
        
       
        boolean ok = userService.insert(user);  
        if(ok) {
        	EntityWrapper<User> wrapper = new EntityWrapper<>();
        	wrapper.eq("del_flag",false);
        	wrapper.eq("login_name", user.getLoginName());
        	User selectOne = userService.selectOne(wrapper);
        	Long id = selectOne.getId(); 
        	
        	
        	//设置用户的角色
        	userService.dropUserRolesByUserId(id); 
        	Set<Role> roleSet = new HashSet<>();
        	Role role= new Role();
        	role.setId(3L);
        	roleSet.add(role);
        	userService.saveUserRoles(id, roleSet);
        }
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