package com.xcq.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.xcq.entity.Pt_User;
import com.xcq.entity.Pt_problem;
import com.xcq.entity.Pt_type;
import com.xcq.entity.Statistics;
import com.xcq.service.IPt_ProblemService;
import com.xcq.service.IPt_UserService;
import com.xcq.util.Pager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class Pt_UserController {
    @Resource(name = "pt_Userservice")
    private IPt_UserService userService;

    @Resource(name = "pt_Problemesrvice")
    private IPt_ProblemService problemService;


    @RequestMapping(value = "/login")
    @ResponseBody//登录
    public String Login(String u_name,String password, HttpSession session){
        Pt_User ptUser = userService.Login(u_name, password);
        if (ptUser == null){
            return "back";
        }
        session.setAttribute("pt_user",ptUser);
        return "success";
    }

    @RequestMapping(value = "/problemList")//全部问题
    public String ProblemList(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,
                            @RequestParam(defaultValue="0",required=true,value="state") Integer state,Pager pager,
                            HttpServletRequest request, HttpSession session){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(session.getAttribute("state") == null){
            session.setAttribute("state",state);
        }
        if(state != session.getAttribute("state")){
            session.setAttribute("state",state);
        }
        Pt_User pt_user = (Pt_User) session.getAttribute("pt_user");
        Page<?> page = PageHelper.startPage(pager.getPageNum(), pager.getPageSize());
        List<Pt_problem> pt_problems = problemService.ProblemList((Integer) session.getAttribute("state"),pt_user.getD_id());
        for (Pt_problem item: pt_problems) {
            if(item.getPl_state() == 1 || item.getPl_state() == 2){
                try {
                    item.setTimeout((int) ((sdf.parse(item.getPl_yqDate()).getTime() - sdf.parse(sdf.format(new Date())).getTime()) / 1000 / 60 / 60 / 24));
                } catch (ParseException e) {


                }
            }
        }
        request.setAttribute("problem",pt_problems);
        request.setAttribute("page",pager.getPage(page));
        return "problemlist";
    }

    @RequestMapping(value = "/myProblem")//我的问题
    public String myProblem(@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,
                            @RequestParam(defaultValue="0",required=true,value="pl_state") Integer pl_state,Pager pager,
                            HttpServletRequest request, HttpSession session) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(session.getAttribute("pt_state") == null){
            session.setAttribute("pl_state",pl_state);
        }
        if(pl_state != session.getAttribute("pl_state")){
            session.setAttribute("pt_state",pl_state);
        }
        Pt_User pt_user = (Pt_User) session.getAttribute("pt_user");
        Page<?> page = PageHelper.startPage(pager.getPageNum(), pager.getPageSize());
        List<Pt_problem> pt_problems = problemService.MyProblem(pt_user.getU_id(), (Integer) session.getAttribute("pl_state"));
        for (Pt_problem item: pt_problems) {
            if(item.getPl_state() == 1 || item.getPl_state() == 2){
                item.setTimeout((int) ((sdf.parse(item.getPl_yqDate()).getTime() - sdf.parse(sdf.format(new Date())).getTime()) / 1000 / 60 / 60 / 24));
            }
        }
        request.setAttribute("pt_problem",pt_problems);
        request.setAttribute("pager",pager.getPage(page));
        return "index";
    }



    @RequestMapping(value = "pt_typeList",method = RequestMethod.GET)//问题分类
    public String pt_typeList(HttpServletRequest request,HttpSession session){
        Pt_User pt_user = (Pt_User) session.getAttribute("pt_user");
        List<Pt_type> pt_types = problemService.Pt_typeList();

        request.setAttribute("pt_typeList",pt_types);

        List<Pt_User> byDIDUserList = userService.getByDIDUserList(pt_user.getD_id());
        request.setAttribute("byDIDUsers",byDIDUserList);
        return "createproblem";
    }

    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public Object uploadImg(@RequestParam MultipartFile file,HttpSession session){
        Integer pl_id;
        pl_id = (Integer) session.getAttribute("pl_id");
        String filename = file.getOriginalFilename();
        //获取后缀名
        String sname = filename.substring(filename.lastIndexOf("."));
        //时间格式化格式
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        //获取当前时间并作为时间戳
        String timeStamp = simpleDateFormat.format(new Date());
        String newName = timeStamp+sname;
        //获取全路径
        String realPath = session.getServletContext().getRealPath("/upload");
        //拼接全路径
        File newfile= new File(realPath,newName);
        try {
            //上传文件
            file.transferTo(newfile);
            problemService.UploadImg(pl_id,newName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "200";
    }

    @RequestMapping(value = "getByIdInUpdate",method = RequestMethod.GET)//进入修改
    public String getByIdInUpdate(Integer pl_id,HttpServletRequest request,HttpSession session){
        Pt_problem byIdInProblem = problemService.getByIdInProblem(pl_id);
        Pt_User pt_user = (Pt_User) session.getAttribute("pt_user");
        List<Pt_User> byDIDUserList = userService.getByDIDUserList(pt_user.getD_id());
        List<Pt_type> pt_types = problemService.Pt_typeList();
        request.setAttribute("problem",byIdInProblem);
        request.setAttribute("typeList",pt_types);
        request.setAttribute("Users",byDIDUserList);
        return "updateproblem";
    }

    @RequestMapping(value = "getStatisticsList",method = RequestMethod.GET)
    @ResponseBody
    public Object getStatisticsList(HttpServletRequest request){
        List<Statistics> statisticsList = userService.getStatisticsList();
        return statisticsList;
    }


    @RequestMapping(value = "loginOut")
    public String LoginOut(HttpSession session){
        session.removeAttribute("pt_user");
        return "login";
    }

    @RequestMapping(value = "updatePwd",method = RequestMethod.POST)
    @ResponseBody
    public Object updatePwd(Integer u_id,String newPwd){
        int i = userService.UpdatePwd(u_id, newPwd);
        return i;
    }

    public IPt_UserService getUserService() {
        return userService;
    }

    public void setUserService(IPt_UserService userService) {
        this.userService = userService;
    }

    public IPt_ProblemService getProblemService() {
        return problemService;
    }

    public void setProblemService(IPt_ProblemService problemService) {
        this.problemService = problemService;
    }
}
