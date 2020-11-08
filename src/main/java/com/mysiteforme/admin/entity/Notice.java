package com.mysiteforme.admin.entity;

import com.baomidou.mybatisplus.annotations.TableName;

@TableName("tb_notice")
public class Notice {
    int id;
    String content;
    String title;
    Integer type;

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
