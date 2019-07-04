package com.xcq.mapper;

import com.xcq.entity.Pt_User;
import com.xcq.entity.Pt_problem;
import com.xcq.entity.Statistics;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IPt_UserDAO {
    //登录
    Pt_User Login(String u_name,String password);
    //本部门所有成员
    List<Pt_User> getByDIDUserList(@Param("d_id") Integer d_id);
    //问题数据统计
    List<Statistics> getStatisticsList();
    //修改密码
    int UpdatePwd(Integer u_id,String newPwd);
}
