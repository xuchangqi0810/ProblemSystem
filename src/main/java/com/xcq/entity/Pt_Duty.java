package com.xcq.entity;

public class Pt_Duty {
    private Integer id;
    private Integer u_id;
    private Integer pr_id;
    private Pt_User user;
    private Pt_problem pro;
    private String details;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Integer getU_id() {
        return u_id;
    }

    public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

    public Integer getPr_id() {
        return pr_id;
    }

    public void setPr_id(Integer pr_id) {
        this.pr_id = pr_id;
    }

    public Pt_User getUser() {
        return user;
    }

    public void setUser(Pt_User user) {
        this.user = user;
    }

    public Pt_problem getPro() {
        return pro;
    }

    public void setPro(Pt_problem pro) {
        this.pro = pro;
    }
}
