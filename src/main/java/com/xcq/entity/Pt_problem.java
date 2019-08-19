package com.xcq.entity;

import com.sun.istack.internal.Nullable;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Pt_problem {
    private Integer pl_id;
    private Integer t_id;
    private Integer u_id;
    private String pl_name;
    private String pl_feedback;
    private String pl_describe;
    private Date pl_lrDate;
    private Date pl_fsDate;
    private Date pl_yqDate;
    private Date pl_wcDate;
    private Integer pl_state;
    private Integer pl_serious;
    private String pl_programme;
    private Integer pl_yjhours;
    private Integer pl_surplustime;
    private Date pl_starttime;
    private Integer d_id;
    private Integer timeout;
    private Pt_User pt_user;
    private  Pt_type pt_type;
    private List<Pt_img> lists;
    private List<Pt_proInfo> proInfos;
    private List<Pt_Duty> dutyList;

    public Integer getPl_id() {
        return pl_id;
    }

    public void setPl_id(Integer pl_id) {
        this.pl_id = pl_id;
    }

    public Integer getT_id() {
        return t_id;
    }

    public void setT_id(Integer t_id) {
        this.t_id = t_id;
    }

    public Integer getU_id() {
        return u_id;
    }

    public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

    public String getPl_name() {
        return pl_name;
    }

    public void setPl_name(String pl_name) {
        this.pl_name = pl_name;
    }

    public String getPl_feedback() {
        return pl_feedback;
    }

    public void setPl_feedback(String pl_feedback) {
        this.pl_feedback = pl_feedback;
    }

    public String getPl_describe() {
        return pl_describe;
    }

    public void setPl_describe(String pl_describe) {
        this.pl_describe = pl_describe;
    }

    public String getPl_lrDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(this.pl_lrDate);
    }

    public String getPl_starttime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(this.pl_starttime);
    }

    public void setPl_starttime(Date pl_starttime) {
        this.pl_starttime = pl_starttime;
    }

    public Integer getPl_surplustime() {
        return pl_surplustime;
    }

    public void setPl_surplustime(Integer pl_surplustime) {
        this.pl_surplustime = pl_surplustime;
    }

    public void setPl_lrDate(Date pl_lrDate) {
        this.pl_lrDate = pl_lrDate;
    }

    public String getPl_fsDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(this.pl_fsDate);
    }

    public void setPl_fsDate(Date pl_fsDate) {
        this.pl_fsDate = pl_fsDate;
    }

    public String getPl_yqDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(this.pl_yqDate);
}

    public void setPl_yqDate(Date pl_yqDate) {
        this.pl_yqDate = pl_yqDate;
    }

    public Integer getD_id() {
        return d_id;
    }

    public void setD_id(Integer d_id) {
        this.d_id = d_id;
    }

    public List<Pt_proInfo> getProInfos() {
        return proInfos;
    }

    public void setProInfos(List<Pt_proInfo> proInfos) {
        this.proInfos = proInfos;
    }

    public Integer getTimeout() {
        return timeout;
    }

    public void setTimeout(Integer timeout) {
        this.timeout = timeout;
    }

    public Pt_problem() {
    }

    public Pt_problem(Integer pl_id, Integer t_id, Integer u_id, String pl_name, String pl_feedback, String pl_describe, Date pl_lrDate, Date pl_fsDate, Date pl_yqDate, Date pl_wcDate, Integer pl_state, Integer pl_serious, String pl_programme, Integer pl_yjhours, Integer pl_surplustime, Date pl_starttime, Integer d_id, Integer timeout, Pt_User pt_user, Pt_type pt_type, List<Pt_img> lists, List<Pt_proInfo> proInfos, List<Pt_Duty> dutyList) {
        this.pl_id = pl_id;
        this.t_id = t_id;
        this.u_id = u_id;
        this.pl_name = pl_name;
        this.pl_feedback = pl_feedback;
        this.pl_describe = pl_describe;
        this.pl_lrDate = pl_lrDate;
        this.pl_fsDate = pl_fsDate;
        this.pl_yqDate = pl_yqDate;
        this.pl_wcDate = pl_wcDate;
        this.pl_state = pl_state;
        this.pl_serious = pl_serious;
        this.pl_programme = pl_programme;
        this.pl_yjhours = pl_yjhours;
        this.pl_surplustime = pl_surplustime;
        this.pl_starttime = pl_starttime;
        this.d_id = d_id;
        this.timeout = timeout;
        this.pt_user = pt_user;
        this.pt_type = pt_type;
        this.lists = lists;
        this.proInfos = proInfos;
        this.dutyList = dutyList;
    }

    public List<Pt_Duty> getDutyList() {
        return dutyList;
    }

    public void setDutyList(List<Pt_Duty> dutyList) {
        this.dutyList = dutyList;
    }

    public Integer getPl_yjhours() {
        return pl_yjhours;
    }

    public void setPl_yjhours(Integer pl_yjhours) {
        this.pl_yjhours = pl_yjhours;
    }

    public List<Pt_img> getLists() {
        return lists;
    }

    public void setLists(List<Pt_img> lists) {
        this.lists = lists;
    }

    public String getPl_wcDate() {
        if(this.pl_wcDate != null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(this.pl_wcDate);
        }
        return null;
    }

    public void setPl_wcDate(Date pl_wcDate) {
        this.pl_wcDate = pl_wcDate;
    }

    public Integer getPl_state() {
        return pl_state;
    }

    public void setPl_state(Integer pl_state) {
        this.pl_state = pl_state;
    }

    public Integer getPl_serious() {
        return pl_serious;
    }

    public void setPl_serious(Integer pl_serious) {
        this.pl_serious = pl_serious;
    }

    public String getPl_programme() {
        return pl_programme;
    }

    public void setPl_programme(String pl_programme) {
        this.pl_programme = pl_programme;
    }

    public Pt_User getPt_user() {
        return pt_user;
    }

    public void setPt_user(Pt_User pt_user) {
        this.pt_user = pt_user;
    }

    public Pt_type getPt_type() {
        return pt_type;
    }

    public void setPt_type(Pt_type pt_type) {
        this.pt_type = pt_type;
    }
}
