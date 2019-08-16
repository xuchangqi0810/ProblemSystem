package com.xcq.service.impl;

import com.xcq.entity.Pt_Duty;
import com.xcq.mapper.IPt_DutyDAO;
import com.xcq.service.IPt_DutyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("dutyService")
public class Pt_DutyServiceImpl implements IPt_DutyService{
    @Resource(name="IPt_DutyDAO")
    private IPt_DutyDAO pt_dutyDAO;

    @Override
    public List<Pt_Duty> getAllDuty(Integer pr_id) {
        return pt_dutyDAO.getAllDuty(pr_id);
    }

    public IPt_DutyDAO getPt_dutyDAO() {
        return pt_dutyDAO;
    }

    public void setPt_dutyDAO(IPt_DutyDAO pt_dutyDAO) {
        this.pt_dutyDAO = pt_dutyDAO;
    }
}
