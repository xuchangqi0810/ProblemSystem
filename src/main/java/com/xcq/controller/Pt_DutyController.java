package com.xcq.controller;

import com.xcq.entity.Pt_Duty;
import com.xcq.service.IPt_DutyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class Pt_DutyController {

    @Resource(name = "dutyService")
    private IPt_DutyService dutyService;

    @RequestMapping(value = "getProUser")
    @ResponseBody
    public Object getProUsers(@RequestParam("pr_id") Integer pr_id, HttpServletRequest request){
        List<Pt_Duty> allDuty = dutyService.getAllDuty(pr_id);
        List<Integer> pro_userId = new ArrayList<>();
        for (Pt_Duty item: allDuty) {
            pro_userId.add(item.getU_id());
        }
        return allDuty;
    }

    public IPt_DutyService getDutyService() {
        return dutyService;
    }

    public void setDutyService(IPt_DutyService dutyService) {
        this.dutyService = dutyService;
    }
}
