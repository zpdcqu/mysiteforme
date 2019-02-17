package com.mysiteforme.admin.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.mysiteforme.admin.base.DataEntity;

/**
 * <p>
 * 需求表
 * </p>
 *
 * @author wangl
 * @since 2019-02-17
 */
public class Demand extends DataEntity<Demand> {

    private static final long serialVersionUID = 1L;


	/**
     * 需求名称
     */
	private String name;
    /**
     * 需求类型
     */
	private Integer type;
    /**
     * 下拉选项
     */
	private String option;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}


	@Override
	public String toString() {
		return "Demand{" +
			", name=" + name +
			", type=" + type +
			", option=" + option +
			"}";
	}
}
