package com.xcq.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Pt_proInfo {
    private Integer id;
    private Integer pl_id;
    private Integer u_id;
    private Date proDate;
    private Integer state;
    private Integer hours;
    private Integer surplus;
    private String remarks;
    private Pt_User user;

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

    public Integer getU_id() {
        return u_id;
    }

    public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

    public String getProDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(proDate);
    }

    public void setProDate(Date proDate) {
        this.proDate = proDate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getHours() {
        return hours;
    }

    public void setHours(Integer hours) {
        this.hours = hours;
    }

    public Integer getSurplus() {
        return surplus;
    }

    public void setSurplus(Integer surplus) {
        this.surplus = surplus;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Pt_User getUser() {
        return user;
    }

    public void setUser(Pt_User user) {
        this.user = user;
    }

    public Pt_proInfo() {
    }

    public Pt_proInfo(Integer id, Integer pl_id, Integer u_id, Date proDate, Integer state, Integer hours, Integer surplus, String remarks, Pt_User user) {
        this.id = id;
        this.pl_id = pl_id;
        this.u_id = u_id;
        this.proDate = proDate;
        this.state = state;
        this.hours = hours;
        this.surplus = surplus;
        this.remarks = remarks;
        this.user = user;
    }
}
