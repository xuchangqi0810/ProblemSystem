package com.xcq.service;

import com.xcq.entity.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public interface IPt_ProblemService {
    List<Pt_problem> ProblemList(@Param("state") Integer state,@Param("d_id") Integer d_id,@Param("startDate") String startDate,@Param("stopDate") String stopDate);
    //查询我的所有问题
    List<Pt_problem> MyProblem(@Param("u_id") Integer u_id,@Param("pl_state") Integer pl_state,@Param("startDate") String startDate,@Param("stopDate") String stopDate);
    //问题分类
    List<Pt_type> Pt_typeList();
    int CreateProblem(Pt_problem problem);//新建问题
    int UploadImg(Integer pl_id,String url);
    Pt_problem getByIdInProblem(Integer pl_id);
    int UpdateStart(@Param("pl_id")Integer pl_id,@Param("pl_starttime")Date pl_starttime);
    int AddProInfo(Pt_proInfo proInfo);
    int UpdateHours(Integer pl_id,Integer hours);
    List<Pt_proInfo> getByIdProInfo(Integer pl_id);
    int UpdateState(Integer pl_id, Integer state, Date pl_wcDate);
    int UpdateProblem(Pt_problem problem);
    int UpdateStateExamine(Integer pl_id, Integer state);//审核
    List<Dictionary> StatisticsList(Integer day1,Integer day2,Integer day3,Integer day4,Integer day5,Integer day6);
    int AddProUsers(Pt_Duty duty);//添加关联人员
}
