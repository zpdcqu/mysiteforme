package com.mysiteforme.admin.service.order;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.mysiteforme.admin.entity.Order;

import java.util.Map;

/**
 * 订单服务接口
 */
public interface OrderService extends IService<Order> {

    void saveOrUpdateOrder(Order order);

    Page<Order> selectDetailOrder(Map<String, Object> map, Page<Order> page);
}
