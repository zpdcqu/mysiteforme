package com.mysiteforme.admin.service.order.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.mysiteforme.admin.dao.OrderDao;
import com.mysiteforme.admin.entity.Order;
import com.mysiteforme.admin.service.order.OrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @program: demo
 * @description: 订单服务实现类
 * @author: Zheng Peidong
 * @create: 2019-01-07 19:50
 */
@Service
@Transactional(readOnly = true, rollbackFor = Exception.class)
public class OrderServiceImpl  extends ServiceImpl<OrderDao, Order> implements OrderService {
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void saveOrUpdateOrder(Order order) {
        insertOrUpdate(order);
    }

    @Override
    public Page<Order> selectDetailOrder(Map<String, Object> map, Page<Order> page) {
        List<Order> list = baseMapper.selectDetailOrder(map,page);
        page.setRecords(list);
        return page;
    }
}