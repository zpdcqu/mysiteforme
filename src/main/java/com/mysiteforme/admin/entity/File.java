package com.mysiteforme.admin.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.mysiteforme.admin.base.DataEntity;

/**
 * <p>
 * 上传文件表
 * </p>
 *
 * @author wangl
 * @since 2019-02-22
 */
public class File extends DataEntity<File> {

    private static final long serialVersionUID = 1L;

    /**
     * 标题
     */
	@TableField("file_name")
	private String fileName;
    /**
     * 描述
     */
	private String hash;
    /**
     * 关联订单id
     */
	@TableField("order_id")
	private Long orderId;
    /**
     * 文件大小
     */
	@TableField("file_size")
	private String fileSize;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}
	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}


	@Override
	public String toString() {
		return "File{" +
			", fileName=" + fileName +
			", hash=" + hash +
			", orderId=" + orderId +
			", fileSize=" + fileSize +
			"}";
	}
}
