<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.xcq.util.MD5Utils" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/avtar.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            width: 100%;
            height: 100%;
        }
        #Navigation{
            margin-left: 15%;
            width: 70%;
        }
        .Navigation ul{
            height: 50px;
        }
        .Navigation ul li{
            float: left;
            list-style: none;

        }
        #cont{
            margin-top:5%;
            width: 70%;
            margin-left: 17%;
            padding: 20px 17% 0 10%;
        }

        #cont label{
            margin-top: 3%;
        }
        .form-group div{
            margin: 20px 0 20px 0;
        }
        .form-group label{
            margin: 15px 0 0 0;
        }
        .required{
            color: red;
            font-size: 1em;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default" role="navigation" style="background-color: #007DDB;">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: white" href="#">欢迎使用问题管理系统</a>
        </div>
        <ul class="nav navbar-nav navbar-right" >
            <li><a href="#" style="color: white"><span class="glyphicon glyphicon-user"></span>${pt_user.dep.d_name}&nbsp;&nbsp; ${pt_user.u_nickName}</a></li>
            <li><a href="${pageContext.request.contextPath}/loginOut" style="color: white"><span class="glyphicon glyphicon-log-in"></span> 退出</a></li>
        </ul>
    </div>
</nav>
<div class="collapse navbar-collapse" id="Navigation">
    <ul class="nav navbar-nav">
        <li class="dropdown active"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">问题<b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a href="${pageContext.request.contextPath}/myProblem">我的</a></li>
                <li class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/problemList">全部</a></li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/pt_typeList">新建问题</a></li>
        <li><a href="${pageContext.request.contextPath}/statistics.jsp">数据统计</a></li>
        <li><a href="${pageContext.request.contextPath}/updatepassword.jsp">更改密码</a></li>
    </ul>
</div>
<div id="cont">
    <div class="form-group">
        <label class="col-sm-3 control-label">用户名:<span class="required">*</span></label>
        <div class="col-sm-7">
            <input type="text" name="u_name" lay-verify="title" autocomplete="off" value="${pt_user.u_name}" placeholder="请输入问题名称" class="layui-input layui-disabled" disabled="disabled">
        </div>
        <label class="col-sm-3 control-label">旧密码:<span class="required">*</span></label>
        <div class="col-sm-7">
            <input type="password" name="usedPwd" lay-verify="title" autocomplete="off" placeholder="请输入旧密码" class="layui-input">
        </div>
        <label class="col-sm-3 control-label">新密码:<span class="required">*</span></label>
        <div class="col-sm-7">
            <input type="password" name="newPwdA" lay-verify="title" autocomplete="off" placeholder="请输入新密码" class="layui-input"><span style="color: #9199aa;font-size: 0.6em">由数字、大写字母、小写字母、特殊字符至少两种字符组成</span>
        </div>
        <label class="col-sm-3 control-label">确认密码:<span class="required">*</span></label>
        <div class="col-sm-7">
            <input type="password" name="newPwdB" lay-verify="title" autocomplete="off" placeholder="请再次输入密码" class="layui-input">
        </div>
        <div class="layui-btn-group col-sm-9" style="margin-left: 46%">
            <input type="submit" id="sub" class="layui-btn" onclick="updatePwd('${pt_user.password}')" value="确认"/>
            <input type="button" id="back" class="layui-btn" onclick="javascript :history.back(-1);" value="返回"/>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    function updatePwd(pwd){
        layui.use('layer', function(){
            var usedPwd = hex_md5($("[name=usedPwd]").val());
            var newPwdA = $("[name=newPwdA]").val();
            var newPwdB = $("[name=newPwdB]").val();

            if(usedPwd == "" || usedPwd == null || usedPwd == undefined){
                layer.msg("请输入旧密码");
                return;
            }
            if(newPwdA == "" || newPwdA == null || newPwdA == undefined){
                layer.msg("请输入您的新密码");
                return;
            }
            if(newPwdB == "" || newPwdB == null || newPwdB == undefined){
                layer.msg("请再次输入密码");
                return;
            }

            if(usedPwd != pwd){
                layer.msg("密码输入错误，请重新输入", {icon: 2});
                return;
            }

            if(newPwdA.length < 6 || newPwdA.length > 18){
                layer.msg("密码最小长度6位，最大长度18位",{icon:2});
                return;
            }

            var flag = check(newPwdA);
            if(!flag){
                layer.msg("密码至少包含两种及以上字符组成",{icon:2});
                return;
            }

            if(newPwdA != newPwdB){
                layer.msg("两次密码输入不一致",{icon:2});
                return;
            }

            $.ajax({
                url:"${pageContext.request.contextPath}/updatePwd",
                method:"POST",
                data:
                    {
                        "u_id":${pt_user.u_id},
                        "newPwd":newPwdB
                    },
                success:function (data) {
                    if(data == 1){
                        layer.msg("修改成功,请重新登陆",{icon:1});
                        window.setTimeout(function(){
                            location.href = "${pageContext.request.contextPath}/loginOut";
                        }, 1500);
                    }else{
                        layer.msg("出错啦，请刷新页面后重试或联系管理员",{icon:2});
                    }
                }
            })
        });
    }
    function check(pwd){
        //6-18位 ，由数字、大写字母、小写字母、特殊字符
        var r = /^[0-9a-zA-Z!@#$^]{6,18}$/;//特殊字符可以补充，与后续校验同步即可
        if(r.test(pwd)){
            var a = /[0-9]/.exec(pwd)!=null ? 1:0;
            var b = /[a-z]/.exec(pwd)!=null ? 1:0;
            var c = /[A-Z]/.exec(pwd)!=null ? 1:0;
            var d = /[!@#$^]/.exec(pwd)!=null ? 1:0;
            return a + b + c + d >= 2;//至少2种
        }
        return false;
    }
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/md5.js"></script>
