package com.mysiteforme.admin.service;

import com.mysiteforme.admin.entity.Demand;
import com.mysiteforme.admin.entity.UserDemand;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
/**
 * <p>
 * 需求表 服务类
 * </p>
 *
 * @author wangl
 * @since 2019-02-17
 */
public interface DemandService extends IService<Demand> {

	void dropDemandByOrderId(Long id);

	void saveOrderDemands(Long orderId, long demandId);

	void saveOrderDemands(Long orderId, long demandId, String option);

	UserDemand selectOneDemand(Long id, Long demandId);

	void updateUserOption(Long orderId, long demandId, String userOption);

}
