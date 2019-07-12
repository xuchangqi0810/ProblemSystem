package com.xcq.service;

import com.xcq.entity.Pt_proInfo;
import com.xcq.entity.Pt_problem;
import com.xcq.entity.Pt_type;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public interface IPt_ProblemService {
    List<Pt_problem> ProblemList(@Param("state") Integer state,@Param("d_id") Integer d_id);
    //查询我的所有问题
    List<Pt_problem> MyProblem(Integer u_id,Integer pl_state);
    //问题分类
    List<Pt_type> Pt_typeList();
    @Transactional
    int CreateProblem(Pt_problem problem);//新建问题
    @Transactional
    int UploadImg(Integer pl_id,String url);
    Pt_problem getByIdInProblem(Integer pl_id);
    @Transactional
    int UpdateStart(@Param("pl_id")Integer pl_id,@Param("pl_starttime")Date pl_starttime);
    @Transactional
    int AddProInfo(Pt_proInfo proInfo);
    @Transactional
    int UpdateHours(Integer pl_id,Integer hours);
    List<Pt_proInfo> getByIdProInfo(Integer pl_id);
    @Transactional
    int UpdateState(Integer pl_id, Integer state, Date pl_wcDate);
    @Transactional
    int UpdateProblem(Pt_problem problem);
    @Transactional
    int UpdateStateExamine(Integer pl_id, Integer state);//审核
}
