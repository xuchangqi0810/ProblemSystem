package com.xcq.service;

import com.xcq.entity.Pt_User;
import com.xcq.entity.Statistics;

import java.util.List;

public interface IPt_UserService {
    Pt_User Login(String u_name,String password);
    //本部门所有成员
    List<Pt_User> getByDIDUserList(Integer d_id);
    List<Statistics> getStatisticsList();
}
