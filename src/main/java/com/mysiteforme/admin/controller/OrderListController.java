package com.mysiteforme.admin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.mysiteforme.admin.annotation.SysLog;
import com.mysiteforme.admin.base.MySysUser;
import com.mysiteforme.admin.entity.*;
import com.mysiteforme.admin.entity.VO.UserDemandVo;
import com.mysiteforme.admin.service.*;
import com.mysiteforme.admin.util.Constants;
import com.mysiteforme.admin.util.LayerData;
import com.mysiteforme.admin.util.RestResponse;
import com.xiaoleilu.hutool.date.DateUtil;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.lang.reflect.InvocationTargetException;
import java.util.*;
import java.util.Map.Entry;
import java.util.regex.Pattern;

/**
 * <p>
 * 订单列表 前端控制器
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
	@Autowired
	RoleService roleService;
	@Autowired
	FileService fileService;
	@Autowired
	RescourceService resourceService;

	@GetMapping("list")
	@SysLog("跳转订单列表列表")
	public String list() {
		return "/admin/orderList/list";
	}
	
	@GetMapping("my")
	@SysLog("跳转我的任务")
	public String myOrder(Model model) {
		model.addAttribute("loginName", MySysUser.loginName());
		return "/admin/orderList/myOrderList";
	}

	@PostMapping("myList")
	@SysLog("加载我的任务数据")
	@ResponseBody
	public LayerData<OrderListVo> myOrderList(ServletRequest request) throws IllegalAccessException, InvocationTargetException {
		request.setAttribute("s_userTId",MySysUser.loginName() );
		return list(null, null, null, request);
	}
	
	@PostMapping("list")
	@ResponseBody
	@SysLog("请求订单列表列表数据")
	public LayerData<OrderListVo> list(@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "limit", defaultValue = "10") Integer limit,
			@RequestParam(required=false)String hall,
			ServletRequest request)
			throws IllegalAccessException, InvocationTargetException {
		Map map = WebUtils.getParametersStartingWith(request, "s_");
		LayerData<OrderListVo> layerData = new LayerData<>();
		EntityWrapper<OrderList> wrapper = new EntityWrapper<>();
		wrapper.eq("del_flag", false);

		
		
		if (!map.isEmpty()) {
			String orderId = (String) map.get("orderId");
			if (StringUtils.isNotBlank(orderId)) {
				wrapper.like("order_id", orderId);
			} else {
				map.remove("orderId");
			}


			
			String name = (String) map.get("name");
			if (StringUtils.isNotBlank(name)) {
				wrapper.like("name", name);
			} else {
				map.remove("name");
			}

			String beginDeadDate = (String) map.get("beginDeadDate");
			String endDeadDate = (String) map.get("endDeadDate");
			if (StringUtils.isNotBlank(beginDeadDate)) {
				Date begin = DateUtil.parse(beginDeadDate);
				wrapper.ge("dead_date", begin);
			} else {
				map.remove("beginDeadDate");
			}
			if (StringUtils.isNotBlank(endDeadDate)) {
				Date end = DateUtil.parse(endDeadDate);
				wrapper.le("dead_date", end);
			} else {
				map.remove("endDeadDate");
			}

			String money = (String) map.get("money");
			if (StringUtils.isNotBlank(money)) {
				wrapper.like("money", money);
			} else {
				map.remove("money");
			}

			String userCId = (String) map.get("userCId");
			if (StringUtils.isNotBlank(userCId)) {
				wrapper.like("user_c_id", userCId);
			} else {
				map.remove("userCId");
			}

			String categories = (String) map.get("categories");
			if (StringUtils.isNotBlank(categories)) {
				wrapper.eq("categories", categories);
			} else {
				map.remove("categories");
			}

			String userTId = (String) map.get("userTId");
			if (StringUtils.isNotBlank(userTId)) {
				wrapper.like("user_t_id", userTId);
			} else {
				map.remove("userTId");
			}

			String level = (String) map.get("level");
			if (StringUtils.isNotBlank(level)) {
				wrapper.eq("level", level);
			} else {
				map.remove("level");
			}

			String isVip = (String) map.get("isVip");
			if (StringUtils.isNotBlank(isVip)) {
				if (isVip.equalsIgnoreCase("true")) {
					wrapper.eq("is_vip", true);
				} else if (isVip.equalsIgnoreCase("false")) {
					wrapper.eq("is_vip", false);
				} else {
					map.remove("isVip");
				}
			} else {
				map.remove("isVip");
			}

			String progress = (String) map.get("progress");
			if (StringUtils.isNotBlank(progress)) {
				wrapper.eq("progress", progress);
			} else {
				map.remove("progress");
			}

		}
		if (hall!=null) {
			wrapper.isNull("user_t_id");
			wrapper.between("progress", 2, 3);
			wrapper.orderBy("deadDate");
		} 
	//	wrapper.orderBy("dead_date", false);
		Page<OrderList> pageData = orderListService.selectPage(new Page<>(page, limit), wrapper);
		List<OrderList> records = pageData.getRecords();
		List<OrderListVo> vos = new ArrayList<>();
		for (OrderList orderList : records) {
			OrderListVo vo = new OrderListVo();
			BeanUtils.copyProperties(vo, orderList);
			Long deadDate = vo.getDeadDate().getTime();
			long currentTimeMillis = System.currentTimeMillis();
			Long time = deadDate - currentTimeMillis;
			int day = (int) (time / 3600 / 24 / 1000);
			int hour = (int) ((time - day * 3600 * 24 * 1000) / 3600 / 1000);
			if (time > 0) {
				vo.setRemaining(day + "天" + hour + "小时");
				vos.add(vo);
			} else {
				//如果是大厅的请求，过滤掉过期的订单
				if(hall==null) {
					vo.setRemaining("已过期");
					vos.add(vo);
				}
				
			}
			
		}
		layerData.setData(vos);
		layerData.setCount(pageData.getTotal());
		return layerData;
	}

	@GetMapping("add")
	@SysLog("跳转新增订单列表页面")
	public String add(Model model) {
		int maxId = orderListService.selectMaxId();
		String orderId = "R" + (21620 + maxId);
		model.addAttribute("orderId", orderId);
		// 关联用户的cid
		int maxCid = userService.selectMaxCid() + 3122;
		String loginName = "C" + maxCid;
		model.addAttribute("loginName", loginName);

		// 查询用户需求
		EntityWrapper<Demand> wrapper = new EntityWrapper<>();
		wrapper.eq("del_flag", false);
		List<Demand> demandList = demandService.selectList(wrapper);
		model.addAttribute("demandList", demandList);
		return "/admin/orderList/add";
	}

	@PostMapping("add")
	@SysLog("保存新增订单列表数据")
	@ResponseBody
	public RestResponse add(@RequestParam Map<String, String> remand, OrderList orderList, User user) {

		orderList.setUserCId(user.getLoginName());
		orderListService.insert(orderList);

		// 保存用户账号并设置角色为客户
		user.setPassword(Constants.DEFAULT_PASSWORD);
		Set<Role> roleSet = new HashSet<>();
		Role role = new Role();
		role.setId(3L);
		roleSet.add(role);
		user.setRoleLists(roleSet);
		User one = userService.saveUser(user);

		// 设置用户需求
		demandService.dropDemandByOrderId(orderList.getId());
		List<String> list = new ArrayList<>();
		for (Entry<String, String> entry : remand.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();
			Pattern pattern = Pattern.compile("[0-9]*");

			if (pattern.matcher(key).matches()) {
//        		System.out.println(key+":"+value);
				Demand demand = new Demand();
				if (value.equals("on")) {
					demandService.saveOrderDemands(orderList.getId(), Long.parseLong(key));
					list.add(key);
				} else {
					demandService.saveOrderDemands(orderList.getId(), Long.parseLong(key), value);
				}
			}

		}
		for (Entry<String, String> entry : remand.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();

			if (key.startsWith("userOption")) {
				String demandId = key.substring(key.indexOf("+") + 1);
				if (list.contains(demandId)) {
					demandService.updateUserOption(orderList.getId(), Long.parseLong(demandId), value);

				}

			}
			if (key.startsWith("remandFile")) {

				EntityWrapper<Rescource> wrapper3 = new EntityWrapper<>();
				wrapper3.eq("del_flag", 0);
				wrapper3.eq("hash", value);
				Rescource entity = new Rescource();
				entity.setOrderId(orderList.getOrderId());
				resourceService.update(entity, wrapper3);
			}

		}

		return RestResponse.success();
	}

	@GetMapping("edit")
	@SysLog("跳转编辑订单列表页面")
	public String edit(Long id, Model model) throws IllegalAccessException, InvocationTargetException {
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

		return "/admin/orderList/edit";
	}

	/**
	 * @param remand
	 * @param orderList
	 * @param user
	 * @return
	 */
	@PostMapping("edit")
	@ResponseBody
	@SysLog("保存编辑订单列表数据")
	public RestResponse edit(@RequestParam Map<String, String> remand, OrderList orderList, User user) {
		if (null == orderList.getId() || 0 == orderList.getId()) {
			return RestResponse.failure("ID不能为空");
		}
//		EntityWrapper<OrderList> orderWrapper = new EntityWrapper();
//		orderWrapper.eq("del_flag", 0);
//		orderWrapper.eq("order_id", orderList.getOrderId());
//		orderListService.update(orderList, orderWrapper);
		orderListService.updateById(orderList);

		EntityWrapper<User> userWrapper = new EntityWrapper();
		userWrapper.eq("login_name", user.getLoginName());
		userWrapper.eq("del_flag", 0);
		userService.update(user, userWrapper);

		// 设置用户需求
		demandService.dropDemandByOrderId(orderList.getId());
		List<String> list = new ArrayList<>();
		for (Entry<String, String> entry : remand.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();
			Pattern pattern = Pattern.compile("[0-9]*");

			if (pattern.matcher(key).matches()) {
//		        		System.out.println(key+":"+value);
				Demand demand = new Demand();
				if (value.equals("on")) {
					demandService.saveOrderDemands(orderList.getId(), Long.parseLong(key));
					list.add(key);
				} else {
					demandService.saveOrderDemands(orderList.getId(), Long.parseLong(key), value);
				}
			}

		}

		for (Entry<String, String> entry : remand.entrySet()) {
			String key = entry.getKey();
			String value = entry.getValue();

			if (key.startsWith("userOption")) {
				String demandId = key.substring(key.indexOf("+") + 1);
				if (list.contains(demandId)) {
					demandService.updateUserOption(orderList.getId(), Long.parseLong(demandId), value);

				}

			}
			if (key.startsWith("remandFile")) {

				EntityWrapper<Rescource> fileWrapper = new EntityWrapper<>();
				fileWrapper.eq("del_flag", 0);
				fileWrapper.eq("hash", value);
				Rescource entity = new Rescource();
				entity.setOrderId(orderList.getOrderId());
				resourceService.update(entity, fileWrapper);
			}

		}

		return RestResponse.success();
	}

	@PostMapping("delete")
	@ResponseBody
	@SysLog("删除订单列表数据")
	public RestResponse delete(@RequestParam(value = "id", required = false) Long id) {
		if (null == id || 0 == id) {
			return RestResponse.failure("ID不能为空");
		}
		OrderList orderList = orderListService.selectById(id);
		orderList.setDelFlag(true);
		orderListService.updateById(orderList);
		return RestResponse.success();
	}

}