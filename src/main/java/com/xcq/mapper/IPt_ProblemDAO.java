package com.xcq.mapper;

import com.xcq.entity.Dictionary;
import com.xcq.entity.Pt_proInfo;
import com.xcq.entity.Pt_problem;
import com.xcq.entity.Pt_type;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IPt_ProblemDAO {

    List<Pt_problem> ProblemList(@Param("state") Integer state,@Param("d_id") Integer d_id);

    List<Pt_problem> MyProblem(@Param("u_id") Integer u_id,@Param("pl_state") Integer pl_state);//查询我的所有问题

    List<Pt_type> Pt_typeList();//问题分类

    int CreateProblem(Pt_problem problem);//新建问题

    int UploadImg(Integer pl_id,String url);

    Pt_problem getByIdInProblem(Integer pl_id);

    int UpdateStart(@Param("pl_id")Integer pl_id,@Param("pl_starttime")Date pl_starttime);

    int AddProInfo(Pt_proInfo proInfo);

    int UpdateHours(Integer pl_id,Integer hours);

    List<Pt_proInfo> getByIdProInfo(Integer pl_id);

    int UpdateState(@Param("pl_id") Integer pl_id,@Param("state") Integer state,@Param("pl_wcDate") Date pl_wcDate);

    int UpdateStateExamine(Integer pl_id, Integer state);//审核

    int UpdateProblem(Pt_problem problem);

    List<Dictionary> StatisticsList(Map<String,Object> map);

}
