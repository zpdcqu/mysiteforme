package com.mysiteforme.admin.service.impl;

import com.mysiteforme.admin.entity.Demand;
import com.mysiteforme.admin.dao.DemandDao;
import com.mysiteforme.admin.service.DemandService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 客户需求 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-01-20
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class DemandServiceImpl extends ServiceImpl<DemandDao, Demand> implements DemandService {

}
