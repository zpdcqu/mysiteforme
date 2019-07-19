package com.mysiteforme.admin.dao;

import com.mysiteforme.admin.entity.Demand;
import com.mysiteforme.admin.entity.UserDemand;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 * 需求表 Mapper 接口
 * </p>
 *
 * @author wangl
 * @since 2019-02-17
 */
public interface DemandDao extends BaseMapper<Demand> {

	void dropDemandByOrderId(Long id);



	
	void saveOrderDemand(@Param("orderId")Long orderId,@Param("demandId") long demandId);



	void saveOrderDemandAndOption(@Param("orderId")Long orderId,@Param("demandId") long demandId,@Param("option") String option);




	List<UserDemand> selectUserDemand(Long id);


	UserDemand selectOneDemand(@Param("id") Long id,@Param("demandId") Long demandId);




	void updateUserOption(@Param("orderId") Long orderId, @Param("demandId")long demandId,@Param("userOption") String userOption);

}
