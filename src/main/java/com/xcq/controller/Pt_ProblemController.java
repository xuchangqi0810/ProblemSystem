package com.xcq.controller;

import com.xcq.entity.ApplicationEmail;
import com.xcq.entity.Pt_User;
import com.xcq.entity.Pt_proInfo;
import com.xcq.entity.Pt_problem;
import com.xcq.service.IPt_ProblemService;
import com.xcq.service.IPt_UserService;
import com.xcq.service.MailSenderSrvServices;
import com.xcq.util.ExcelUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class Pt_ProblemController {
    @Resource(name = "pt_Problemesrvice")
    private IPt_ProblemService problemService;

    @Resource(name = "pt_Userservice")
    private IPt_UserService userService;

    @Autowired
    private MailSenderSrvServices mailSend;

    @RequestMapping(value = "sendEmail",method = RequestMethod.POST)
    @ResponseBody
    public Object send(@RequestParam String toEmail,@RequestParam String pl_name,@RequestParam Integer state,@RequestParam Integer num,HttpSession session){
        String to = toEmail;//收件人
        String subject = "“您有新的问题待查看”";
        String text = "<html><body>点击或复制连接<a href='http://192.168.20.168:8080/Test'>问题管理系统</a>，即可登陆系统查看</br>"+pl_name+"</body></html>";
        ApplicationEmail email = new ApplicationEmail(to,subject,text);
        try {
            if(state == 100){//新建
                if(!(to.equals(""))){
                    mailSend.sendHtmlEmailByAsynchronousMode(email);
                }else{//新建问题后必通知人
                    //新建后发送邮件到部门负责人
                    /*Pt_User user = (Pt_User) session.getAttribute("pt_user");
                    List<Pt_User> byDIDUserList = userService.getByDIDUserList(user.getD_id());
                    String address = "";
                    for (Pt_User item: byDIDUserList) {
                        if(item.getRole().getId() == 2){
                            address = item.getU_email();
                        }
                    }
                    email.setRecipient(address);*/
                    email.setRecipient("xuchangqi0810@dingtalk.com");
                    mailSend.sendMailByAsynchronousMode(email);
                }
            }else if(state == 200){//修改
                if(num == 1){
                    mailSend.sendMailByAsynchronousMode(email);
                }
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "发送成功";
    }


    @RequestMapping(value = "createProblem",method = RequestMethod.POST)
    @ResponseBody
    public Object CreateProblem(@RequestParam Integer t_id, @RequestParam Integer u_id,@RequestParam String pl_name, @RequestParam String pl_feedback,
                                @RequestParam String pl_describe, @RequestParam Integer pl_serious, @RequestParam String pl_programme, @RequestParam Integer pl_state,
                                @RequestParam String pl_fsDate, @RequestParam String pl_yqDate,@RequestParam Integer d_id, HttpSession session) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Pt_problem problem = new Pt_problem();
        problem.setT_id(t_id);
        if(u_id == 0){
            problem.setU_id(null);
        }else{
            problem.setU_id(u_id);
        }
        problem.setPl_name(pl_name);
        problem.setPl_lrDate(new Date());
        problem.setPl_feedback(pl_feedback);
        problem.setPl_describe(pl_describe);
        problem.setPl_serious(pl_serious);
        problem.setPl_programme(pl_programme);
        problem.setPl_state(pl_state);
        problem.setPl_fsDate(sdf.parse(pl_fsDate));
        problem.setPl_yqDate(sdf.parse(pl_yqDate));
        problem.setD_id(d_id);

        int i = problemService.CreateProblem(problem);
        String success = "";
        if(i > 0){
            success = "success";
        }else {
            success = "error";
        }
        if(session.getAttribute("pl_id") != null){
            session.removeAttribute("pl_id");
        }
        session.setAttribute("pl_id",problem.getPl_id());
        return success;
    }


    @RequestMapping(value = "getByIdInProblem",method = RequestMethod.GET)//问题信息
    @ResponseBody
    public Object getByIdInproblem(Integer pl_id,HttpServletRequest request){
        Pt_problem byIdInProblem = problemService.getByIdInProblem(pl_id);
        for (int i = 0; i < byIdInProblem.getLists().size(); i++) {
            byIdInProblem.getLists().get(i).setUrl(request.getContextPath()+"/upload/"+byIdInProblem.getLists().get(i).getUrl());
        }
        return byIdInProblem;
    }

    @RequestMapping(value = "ProStart",method = RequestMethod.POST)//开始
    public String ProStart(Integer pl_id){
        int i = problemService.UpdateStart(pl_id,new Date());
        return "forward:myProblem";
    }

    @RequestMapping(value = "AddProInfos",method = RequestMethod.POST)//添加问题信息
    @ResponseBody
    public Object addProInfo(@RequestParam(value = "pl_id[]") Integer[] pl_id,@RequestParam(value = "proDate[]") String[] proDate,
                             @RequestParam(value = "hours[]") Integer[] hours, @RequestParam(value = "remarks[]") String[] remarks,
                             @RequestParam(value = "state") Integer state,@RequestParam(value = "method") Integer method){
        Pt_problem problem = problemService.getByIdInProblem(pl_id[0]);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Pt_proInfo proInfo = null;
        for (int i = 0; i < hours.length; i++) {
            if(hours[i] == null){
                break;
            }
            try {
                proInfo = new Pt_proInfo();
                proInfo.setPl_id(pl_id[i]);
                proInfo.setState(state);
                proInfo.setProDate(sdf.parse(proDate[i]));
                proInfo.setHours(hours[i]);
                proInfo.setRemarks(remarks[i]);
                problemService.AddProInfo(proInfo);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if(method == 200){
            try {
                problemService.UpdateState(pl_id[0],3,new Date());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "success";
    }

    @RequestMapping(value = "getByIdProInfo",method = RequestMethod.GET)//获取修改问题信息
    @ResponseBody
    public Object getByIdProInfo(Integer pl_id){
        List<Pt_proInfo> byIdProInfo = problemService.getByIdProInfo(pl_id);
        return byIdProInfo;
    }

    @RequestMapping(value = "updateProblem",method = RequestMethod.POST)
    @ResponseBody
    public Object UpdateProblem(@RequestParam Integer pl_id,@RequestParam Integer t_id,@RequestParam Integer u_id,@RequestParam String pl_name,@RequestParam String pl_describe,
                                @RequestParam String pl_fsDate,@RequestParam String pl_yqDate,@RequestParam Integer pl_serious,@RequestParam String pl_programme){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Pt_problem problem = new Pt_problem();
        problem.setPl_id(pl_id);
        problem.setT_id(t_id);
        if(u_id == 0){
            problem.setU_id(null);
        }else{
            problem.setU_id(u_id);
        }
        problem.setPl_name(pl_name);
        problem.setPl_describe(pl_describe);
        try {
            problem.setPl_fsDate(sdf.parse(pl_fsDate));
            problem.setPl_yqDate(sdf.parse(pl_yqDate));
            problem.setPl_serious(pl_serious);
            problem.setPl_programme(pl_programme);
            int state = problemService.UpdateProblem(problem);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "success";
    }

    @RequestMapping(value = "ProComplete",method = RequestMethod.POST)//完成问题
    @ResponseBody
    public Object ProComplete(Integer pl_id,Integer state,HttpSession session){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Pt_User user = (Pt_User) session.getAttribute("pt_user");
        List<Pt_User> byDIDUserList = userService.getByDIDUserList(user.getD_id());
        String address = "";
        for (Pt_User item: byDIDUserList) {
            if(item.getRole().getId() == 2){
                address = item.getU_email();
            }
        }
        int i = 0;
        try {
            i = problemService.UpdateState(pl_id, state, sdf.parse(sdf.format(new Date())));
            if(i > 0){
                String subject = "“您有新的问题待审批，请注意查看！”";
                String text = "<html><body>点击或复制连接<a href='http://192.168.20.168:8080/Test'>问题管理系统</a>，即可登陆系统查看</br>具体信息请登录网站查看。</body></html>";
                ApplicationEmail email = new ApplicationEmail(address,subject,text);
                mailSend.sendMailByAsynchronousMode(email);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return i;
    }

    @RequestMapping(value = "updateStateExamine",method = RequestMethod.POST)
    @ResponseBody
    public Object UpdateStateExamine(Integer pl_id,Integer pl_state){
        int i = problemService.UpdateStateExamine(pl_id, pl_state);
        if(i > 0){
            Pt_problem problem = problemService.getByIdInProblem(pl_id);
            String subject = "“您有新的问题已被审批，请注意查收！”";
            String text = "<html><body>点击或复制连接<a href='http://192.168.20.168:8080/Test'>问题管理系统</a>，即可登陆系统查看</br>"+problem.getPl_name()+" 已审批通过。</body></html>";
            ApplicationEmail email = new ApplicationEmail(problem.getPt_user().getU_email(),subject,text);
            mailSend.sendMailByAsynchronousMode(email);
        }
        return i;
    }

    @RequestMapping(value = "backProblem",method = RequestMethod.POST)
    @ResponseBody
    public Object backProblem(Integer pl_id,String remarks,HttpSession session){
        Pt_User user = (Pt_User) session.getAttribute("pt_user");
        int i = 0;
        i = problemService.UpdateState(pl_id, 2, null);
        Pt_proInfo proInfo = new Pt_proInfo();
        proInfo.setPl_id(pl_id);
        proInfo.setProDate(new Date());
        proInfo.setSurplus(0);
        proInfo.setHours(0);
        proInfo.setState(3);
        proInfo.setRemarks(remarks);
        proInfo.setU_id(user.getU_id());
        i += problemService.AddProInfo(proInfo);
        if(i > 0){
            Pt_problem problem = problemService.getByIdInProblem(pl_id);
            String subject = "“您有新的问题已被审批，请注意查收！”";
            String text = "<html><body>点击或复制连接<a href='http://192.168.20.168:8080/Test'>问题管理系统</a>，即可登陆系统查看</br>"+problem.getPl_name()+" 未通过审批，具体信息请登录网站查看。</body></html>";
            ApplicationEmail email = new ApplicationEmail(problem.getPt_user().getU_email(),subject,text);
            mailSend.sendMailByAsynchronousMode(email);
        }
        return i;
    }

    @RequestMapping("export")
    public Object ExportFile(@RequestParam Integer num,HttpServletResponse response,HttpSession session){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        Pt_User user = (Pt_User) session.getAttribute("pt_user");
        List<Pt_problem> pt_problems = null;
        if(num == 0){
            pt_problems = problemService.MyProblem(user.getU_id(),0,"0001-01-01","0001-01-01");
        }else{
            pt_problems = problemService.ProblemList(0,user.getD_id(),"0001-01-01","0001-01-01");
        }
        String[] title = {"问题编号","问题名称","反馈人","负责人","问题分类","问题描述","发生日期","问题状态","完成日期","严重等级","解决方案"};
        String fileName = "问题信息表"+sdf.format(new Date())+".xls";
        String sheetName = "问题信息表-"+sdf.format(new Date());
        String[][] content = new String[pt_problems.size()][];
        for (int i = 0; i < pt_problems.size(); i++) {
            content[i] = new String[title.length];
            Pt_problem problem = pt_problems.get(i);
            content[i][0] = problem.getPl_id().toString();
            content[i][1] = problem.getPl_name();
            content[i][2] = problem.getPl_feedback();
            if(problem.getU_id() == null){
                content[i][3] = "";
            }else{
                content[i][3] = problem.getPt_user().getU_nickName();
            }
            content[i][4] = problem.getPt_type().getT_name();
            content[i][5] = problem.getPl_describe();
            content[i][6] = problem.getPl_fsDate().toString();
            switch (problem.getPl_state()){
                case 1:
                    content[i][7] = "未开始";
                    break;
                case 2:
                    content[i][7] = "进行中";
                    break;
                case 3:
                    content[i][7] = "审核中";
                    break;
                case 4:
                    content[i][7] = "已完成";
                    break;
            }

            if(problem.getPl_wcDate() == null || problem.getPl_wcDate().toString() == "0001-01-01"){
                content[i][8] = "0000-00-00";
            }else{
                content[i][8] = problem.getPl_wcDate().toString();
            }
            switch (problem.getPl_serious()){
                case 4:
                    content[i][9] = "一般";
                    break;
                case 3:
                    content[i][9] = "较重";
                    break;
                case 2:
                    content[i][9] = "严重";
                    break;
                default:
                    content[i][9] = "非常严重";
                    break;
            }
            content[i][10] = problem.getPl_programme();
        }
        HSSFWorkbook workbook = ExcelUtils.getHSSFWorkbook(sheetName,title,content,null);


        try {
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            workbook.write(os);
            os.flush();
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }


        return "";
    }

    //发送响应流方法
    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes(),"ISO8859-1");
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public IPt_ProblemService getProblemService() {
        return problemService;
    }

    public void setProblemService(IPt_ProblemService problemService) {
        this.problemService = problemService;
    }

    public IPt_UserService getUserService() {
        return userService;
    }

    public void setUserService(IPt_UserService userService) {
        this.userService = userService;
    }

    public MailSenderSrvServices getMailSend() {
        return mailSend;
    }

    public void setMailSend(MailSenderSrvServices mailSend) {
        this.mailSend = mailSend;
    }
}
