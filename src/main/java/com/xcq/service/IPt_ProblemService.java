package com.xcq.service;

import com.xcq.entity.Dictionary;
import com.xcq.entity.Pt_proInfo;
import com.xcq.entity.Pt_problem;
import com.xcq.entity.Pt_type;
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
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    int CreateProblem(Pt_problem problem);//新建问题
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    int UploadImg(Integer pl_id,String url);
    Pt_problem getByIdInProblem(Integer pl_id);
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    int UpdateStart(@Param("pl_id")Integer pl_id,@Param("pl_starttime")Date pl_starttime);
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    int AddProInfo(Pt_proInfo proInfo);
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    int UpdateHours(Integer pl_id,Integer hours);
    List<Pt_proInfo> getByIdProInfo(Integer pl_id);
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    int UpdateState(Integer pl_id, Integer state, Date pl_wcDate);
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    int UpdateProblem(Pt_problem problem);
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    int UpdateStateExamine(Integer pl_id, Integer state);//审核
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    List<Dictionary> StatisticsList(Integer day1,Integer day2,Integer day3,Integer day4,Integer day5,Integer day6);
}
