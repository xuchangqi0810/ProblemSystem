package com.xcq.service;

import com.xcq.entity.Pt_User;
import com.xcq.entity.Statistics;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IPt_UserService {
    Pt_User Login(String u_name,String password);
    //本部门所有成员
    List<Pt_User> getByDIDUserList(Integer d_id);
    List<Statistics> getStatisticsList();
    //修改密码
    int UpdatePwd(Integer u_id,String newPwd);
}
