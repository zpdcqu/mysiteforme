package com.mysiteforme.admin.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.mysiteforme.admin.base.DataEntity;

/**
 * <p>
 * 付款记录
 * </p>
 *
 * @author wangl
 * @since 2019-01-20
 */
@TableName("money_log")
public class MoneyLog extends DataEntity<MoneyLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 类型
     */
	private Integer type;
    /**
     * 金额
     */
	private Integer num;
    /**
     * 付款方式
     */
	private Integer method;
    /**
     * 付款凭证图片地址
     */
	private String url;
    /**
     * 备注
     */
	private String description;

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getMethod() {
		return method;
	}

	public void setMethod(Integer method) {
		this.method = method;
	}
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	@Override
	public String toString() {
		return "MoneyLog{" +
			", type=" + type +
			", num=" + num +
			", method=" + method +
			", url=" + url +
			", description=" + description +
			"}";
	}
}
