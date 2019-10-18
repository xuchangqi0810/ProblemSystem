package com.xcq.service.impl;

import com.xcq.entity.*;
import com.xcq.mapper.IPt_ProblemDAO;
import com.xcq.service.IPt_ProblemService;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.INTERNAL;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("pt_Problemesrvice")
public class Pt_ProblemServiceImpl implements IPt_ProblemService{


    @Override
    public List<Pt_problem> ProblemList(Integer state, Integer d_id, String startDate, String stopDate) {
        return problemDAO.ProblemList(state,d_id,startDate,stopDate);
    }

    @Override
    public List<Pt_problem> MyProblem(Integer u_id, Integer pl_state, String startDate, String stopDate) {
        return problemDAO.MyProblem(u_id,pl_state,startDate,stopDate);
    }


    @Override
    public List<Pt_type> Pt_typeList() {
        return problemDAO.Pt_typeList();
    }

    @Override
    public int CreateProblem(Pt_problem problem) {
        return problemDAO.CreateProblem(problem);
    }

    @Override
    public int UploadImg(Integer pl_id, String url,String name) {
        return problemDAO.UploadImg(pl_id,url,name);
    }

    @Override
    public Pt_problem getByIdInProblem(Integer pl_id) {
        return problemDAO.getByIdInProblem(pl_id);
    }

    @Override
    public int UpdateStart(Integer pl_id,Date pl_starttime) {
        return problemDAO.UpdateStart(pl_id,pl_starttime);
    }

    @Override
    public int AddProInfo(Pt_proInfo proInfo) {
        return problemDAO.AddProInfo(proInfo);
    }

    @Override
    public int UpdateHours(Integer pl_id, Integer hours) {
        return problemDAO.UpdateHours(pl_id,hours);
    }

    @Override
    public List<Pt_proInfo> getByIdProInfo(Integer pl_id) {
        return problemDAO.getByIdProInfo(pl_id);
    }

    @Override
    public int UpdateState(Integer pl_id, Integer state, Date pl_wcDate) {
        return problemDAO.UpdateState(pl_id,state,pl_wcDate);
    }

    @Override
    public int UpdateProblem(Pt_problem problem) {
        return problemDAO.UpdateProblem(problem);
    }

    @Override
    public int UpdateStateExamine(Integer pl_id, Integer state) {
        return problemDAO.UpdateStateExamine(pl_id,state);
    }

    @Override
    public List<Dictionary> StatisticsList(Integer day1,Integer day2,Integer day3,Integer day4,Integer day5,Integer day6) {
        Map<String,Object> map = new HashMap<>();
        map.put("day1",day1);
        map.put("day2",day2);
        map.put("day3",day3);
        map.put("day4",day4);
        map.put("day5",day5);
        map.put("day6",day6);
        return problemDAO.StatisticsList(map);
    }

    @Override
    public int AddProUsers(Pt_Duty duty) {
        return problemDAO.AddProUsers(duty);
    }

    @Resource(name = "IPt_ProblemDAO")
    private IPt_ProblemDAO problemDAO;

    public IPt_ProblemDAO getProblemDAO() {
        return problemDAO;
    }

    public void setProblemDAO(IPt_ProblemDAO problemDAO) {
        this.problemDAO = problemDAO;
    }
}
