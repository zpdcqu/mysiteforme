package com.mysiteforme.admin.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.mysiteforme.admin.base.TreeEntity;

/**
 * <p>
 * 客户需求
 * </p>
 *
 * @author wangl
 * @since 2019-01-20
 */
public class Demand extends TreeEntity<Demand> {

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
     * 用途
     */
	private Integer isOne;

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
	public Integer getIsOne() {
		return isOne;
	}

	public void setIsOne(Integer isOne) {
		this.isOne = isOne;
	}


	@Override
	public String toString() {
		return "Demand{" +
			", name=" + name +
			", type=" + type +
			", isOne=" + isOne +
			"}";
	}
}
