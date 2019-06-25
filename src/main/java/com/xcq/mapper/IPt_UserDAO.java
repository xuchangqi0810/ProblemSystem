package com.xcq.mapper;

import com.xcq.entity.Pt_User;
import com.xcq.entity.Pt_problem;
import com.xcq.entity.Statistics;

import java.util.List;

public interface IPt_UserDAO {
    //登录
    Pt_User Login(String u_name,String password);
    //本部门所有成员
    List<Pt_User> getByDIDUserList(Integer d_id);
    //问题数据统计
    List<Statistics> getStatisticsList();
}
