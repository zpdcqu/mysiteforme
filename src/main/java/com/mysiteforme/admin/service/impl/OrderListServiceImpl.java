package com.mysiteforme.admin.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.BlogTags;
import com.mysiteforme.admin.entity.OrderList;
import com.mysiteforme.admin.dao.OrderListDao;
import com.mysiteforme.admin.service.OrderListService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.ws.Action;

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

    @Autowired
    OrderListDao orderListDao;
    @Override
    public int selectMaxId() {
        Integer id = orderListDao.selectMaxId();
        if(id==null){
            id=0;
        }
        return ++id;
    }
}
