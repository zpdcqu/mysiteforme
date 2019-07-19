package com.mysiteforme.admin.dao;

import com.mysiteforme.admin.entity.Rescource;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 * 系统资源 Mapper 接口
 * </p>
 *
 * @author wangl
 * @since 2018-01-14
 */
public interface RescourceDao extends BaseMapper<Rescource> {

	void saveOrderId(@Param("hash")String value,@Param("id") Long id);

	
}
