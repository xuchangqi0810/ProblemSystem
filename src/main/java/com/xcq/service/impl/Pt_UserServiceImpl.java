package com.xcq.service.impl;

import com.xcq.entity.Statistics;
import com.xcq.entity.UserDirctionary;
import com.xcq.mapper.IPt_UserDAO;
import com.xcq.entity.Pt_User;
import com.xcq.service.IPt_UserService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service("pt_Userservice")
public class Pt_UserServiceImpl implements IPt_UserService{
    @Resource(name = "IPt_UserDAO")
    private IPt_UserDAO userdao;

    public IPt_UserDAO getUserdao() {
        return userdao;
    }

    public void setUserdao(IPt_UserDAO userdao) {
        this.userdao = userdao;
    }

    @Override
    public Pt_User Login(String u_name, String password) {
        Pt_User login = userdao.Login(u_name, password);
        return login;
    }

    @Override
    public List<Pt_User> getByDIDUserList(Integer d_id) {
        return userdao.getByDIDUserList(d_id);
    }

    @Override
    public List<Pt_User> getUserList() {
        return userdao.getUserList();
    }

    @Override
    public List<Statistics> getStatisticsList() {
        return userdao.getStatisticsList();
    }

    @Override
    public int UpdatePwd(Integer u_id, String newPwd) {
        return userdao.UpdatePwd(u_id,newPwd);
    }
}
