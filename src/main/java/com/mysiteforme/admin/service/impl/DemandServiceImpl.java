package com.mysiteforme.admin.service.impl;

import com.mysiteforme.admin.entity.Demand;
import com.mysiteforme.admin.entity.UserDemand;
import com.mysiteforme.admin.dao.DemandDao;
import com.mysiteforme.admin.service.DemandService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 需求表 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-02-17
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class DemandServiceImpl extends ServiceImpl<DemandDao, Demand> implements DemandService {

	@Override
	public void dropDemandByOrderId(Long id) {
		
		baseMapper.dropDemandByOrderId(id);
	}

	@Override
	public void saveOrderDemands(Long orderId, long demandId) {
		
		baseMapper.saveOrderDemand(orderId,demandId);
	}

	@Override
	public void saveOrderDemands(Long orderId, long demandId, String option) {
	
		baseMapper.saveOrderDemandAndOption(orderId,demandId,option);
	}

	

	@Override
	public UserDemand selectOneDemand(Long id, Long demandId) {
		
		return baseMapper.selectOneDemand(id,demandId);
	}

	@Override
	public void updateUserOption(Long orderId, long demandId, String userOption) {
		baseMapper.updateUserOption(orderId,demandId,userOption);
	}



}
