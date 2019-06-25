package com.xcq.entity;

public class Pt_User {
    private Integer u_id;
    private Integer d_id;
    private String u_name;
    private String u_nickName;
    private String password;
    private Integer u_gender;
    private String u_email;
    private Pt_Role role;

    public Integer getU_id() {
        return u_id;
    }

    public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

    public Integer getD_id() {
        return d_id;
    }

    public void setD_id(Integer d_id) {
        this.d_id = d_id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_nickName() {
        return u_nickName;
    }

    public void setU_nickName(String u_nickName) {
        this.u_nickName = u_nickName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getU_gender() {
        return u_gender;
    }

    public void setU_gender(Integer u_gender) {
        this.u_gender = u_gender;
    }

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    public Pt_Role getRole() {
        return role;
    }

    public void setRole(Pt_Role role) {
        this.role = role;
    }
}
