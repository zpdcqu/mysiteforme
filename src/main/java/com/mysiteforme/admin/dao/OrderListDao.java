package com.mysiteforme.admin.dao;

import com.mysiteforme.admin.entity.OrderList;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 * 订单列表 Mapper 接口
 * </p>
 *
 * @author wangl
 * @since 2019-01-08
 */
public interface OrderListDao extends BaseMapper<OrderList> {

    Integer selectMaxId();
}
