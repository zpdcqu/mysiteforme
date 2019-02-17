package com.mysiteforme.admin.entity;

import java.util.Date;
import com.baomidou.mybatisplus.activerecord.Model;
import com.mysiteforme.admin.base.DataEntity;

/**
 * <p>
 * 上传文件表
 * </p>
 *
 * @author wangl
 * @since 2019-01-20
 */
public class File extends DataEntity<File> {

    private static final long serialVersionUID = 1L;

    /**
     * 标题
     */
	private String name;
    /**
     * 描述
     */
	private String description;
    /**
     * 上传人
     */
	private String uploadUser;
    /**
     * 长传/下载日期
     */
	private Date date;
    /**
     * 链接地址
     */
	private String url;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	public String getUploadUser() {
		return uploadUser;
	}

	public void setUploadUser(String uploadUser) {
		this.uploadUser = uploadUser;
	}
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}


	@Override
	public String toString() {
		return "File{" +
			", name=" + name +
			", description=" + description +
			", uploadUser=" + uploadUser +
			", date=" + date +
			", url=" + url +
			"}";
	}
}
