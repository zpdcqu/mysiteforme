package com.mysiteforme.admin.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.mysiteforme.admin.base.DataEntity;

/**
 * <p>
 * 订单列表
 * </p>
 *
 * @author wangl
 * @since 2019-01-20
 */
@TableName("order_list")
public class OrderList extends DataEntity<OrderList> {

    private static final long serialVersionUID = 1L;

    /**
     * 订单编号
     */
	@TableField("order_id")
	private String orderId;
    /**
     * 订单名称
     */
	private String name;
    /**
     * 截止时间
     */
	@TableField("dead_date")
	private Date deadDate;
    /**
     * 订单价格
     */
	private Long money;
    /**
     * 关联客户
     */
	@TableField("user_c_id")
	private Integer userCId;
    /**
     * 所属类别
     */
	private Integer categories;
    /**
     * 关联技术
     */
	@TableField("user_t_id")
	private Integer userTId;
    /**
     * 课程等级
     */
	private Integer level;
    /**
     * 是否加急
     */
	@TableField("is_vip")
	private Boolean isVip;
    /**
     * 订单进度
     */
	private Integer progress;
    /**
     * 其他需求
     */
	private String others;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public Date getDeadDate() {
		return deadDate;
	}

	public void setDeadDate(Date deadDate) {
		this.deadDate = deadDate;
	}
	public Long getMoney() {
		return money;
	}

	public void setMoney(Long money) {
		this.money = money;
	}
	public Integer getUserCId() {
		return userCId;
	}

	public void setUserCId(Integer userCId) {
		this.userCId = userCId;
	}
	public Integer getCategories() {
		return categories;
	}

	public void setCategories(Integer categories) {
		this.categories = categories;
	}
	public Integer getUserTId() {
		return userTId;
	}

	public void setUserTId(Integer userTId) {
		this.userTId = userTId;
	}
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}
	public Boolean getVip() {
		return isVip;
	}

	public void setVip(Boolean isVip) {
		this.isVip = isVip;
	}
	public Integer getProgress() {
		return progress;
	}

	public void setProgress(Integer progress) {
		this.progress = progress;
	}
	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
	}


	@Override
	public String toString() {
		return "OrderList{" +
			", orderId=" + orderId +
			", name=" + name +
			", deadDate=" + deadDate +
			", money=" + money +
			", userCId=" + userCId +
			", categories=" + categories +
			", userTId=" + userTId +
			", level=" + level +
			", isVip=" + isVip +
			", progress=" + progress +
			", others=" + others +
			"}";
	}
}
