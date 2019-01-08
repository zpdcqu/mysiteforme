package com.mysiteforme.admin.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.mysiteforme.admin.entity.Order;

import java.util.List;
import java.util.Map;

/**
 * @program: demo
 * @description: 订单dao
 * @author: Zheng Peidong
 * @create: 2019-01-07 19:51
 */
public interface OrderDao extends BaseMapper<Order> {
    List<Order> selectDetailOrder(Map<String, Object> map, Page<Order> page);
}