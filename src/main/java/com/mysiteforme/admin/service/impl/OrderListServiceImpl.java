package com.mysiteforme.admin.service.impl;

import com.mysiteforme.admin.entity.OrderList;
import com.mysiteforme.admin.dao.OrderListDao;
import com.mysiteforme.admin.service.OrderListService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 订单列表 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-01-08
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class OrderListServiceImpl extends ServiceImpl<OrderListDao, OrderList> implements OrderListService {

}
