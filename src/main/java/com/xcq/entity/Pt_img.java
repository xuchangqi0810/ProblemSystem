package com.xcq.entity;

public class Pt_img {
    private Integer id;
    private Integer pl_id;
    private String url;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPl_id() {
        return pl_id;
    }

    public void setPl_id(Integer pl_id) {
        this.pl_id = pl_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
