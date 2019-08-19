<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<link rel="icon" href="${pageContext.request.contextPath}/images/avtar.png" type="image/x-icon"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<head>
    <title>修改问题</title>
</head>
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
        width: 70%;
        margin-left: 15%;
        padding: 20px 17% 0 10%;
        /*margin-top: 0.5%;


        background-color: #e6eae6;
        */
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
        <label class="col-sm-3 control-label">问题名称：<span class="required">*</span></label>
        <div class="col-sm-7">
            <input type="text" name="pl_name" lay-verify="title" autocomplete="off" value="${problem.pl_name}" placeholder="请输入问题名称" class="layui-input">
            <%--<input type="hidden" name="u_id" value="${problem.u_id}">
            <input type="hidden" name="pl_id" value="${problem.pl_id}">--%>
        </div>
        <label class="col-sm-3 control-label">问题类型：<span class="required">*</span></label>
        <div class="col-sm-7">
            <select class="form-control" name="t_id">
                <option value="0">请选择问题类型</option>
                <c:forEach var="item" items="${typeList}">
                    <option value="${item.t_id}"<c:if test="${item.t_id == problem.t_id}">selected="selected"</c:if>>${item.t_name}</option>
                </c:forEach>
            </select>
        </div>

            <label class="col-sm-3 control-label">负责人：</label>
            <div class="col-sm-7">
                <select id="fzr" class="form-control" name="u_id" <c:if test="${pt_user.role.id == 3}"> disabled="disabled" </c:if>>
                    <option value="0">请选择负责人</option>
                    <optgroup label="工艺部">
                        <c:forEach var="item" items="${gylist}">
                            <option value="${item.u_id}" name="${item.u_email}" <c:if test="${item.u_id == problem.u_id}">selected="selected"</c:if>>${item.u_nickName}</option>
                        </c:forEach>
                    </optgroup>
                    <optgroup label="生产部">
                        <c:forEach var="item" items="${sclist}">
                            <option value="${item.u_id}" name="${item.u_email}" <c:if test="${item.u_id == problem.u_id}">selected="selected"</c:if>>${item.u_nickName}</option>
                        </c:forEach>
                    </optgroup>
                </select>
            </div>

        <label class="col-sm-3 control-label">问题描述：</label>
        <div class="col-sm-9">
            <textarea class="form-control" rows="3" name="pl_describe">${problem.pl_describe}</textarea>
        </div>


        <label class="col-sm-3 control-label">发生时间：<span class="required">*</span></label>
        <div class="layui-input-inline col-sm-7">
            <input type="text" class="layui-input" name="pl_fsDate" value="${problem.pl_fsDate}" id="fsdate" placeholder="yyyy-MM-dd">
        </div>

            <label class="col-sm-3 control-label">要求时间：</label>
            <div class="layui-input-inline col-sm-7" disabled="disabled">
                <input type="text" class="layui-input" name="pl_yqDate" <c:if test="${pt_user.role.id == 3}">disabled="disabled"</c:if> <c:if test="${problem.pl_yqDate== '0001-01-01'}">value=""</c:if> <c:if test="${problem.pl_yqDate!= '0001-01-01'}">value="${problem.pl_yqDate}"</c:if>   id="yqdate" placeholder="yyyy-MM-dd">
            </div>

        <label class="col-sm-3 control-label">严重等级:<span class="required">*</span></label>
        <div class="col-sm-7">
            <select class="form-control" name="pl_serious">
                <option value="4"<c:if test="${4 == problem.pl_serious}">selected="selected"</c:if>>一般</option>
                <option value="3"<c:if test="${3 == problem.pl_serious}">selected="selected"</c:if>>较重</option>
                <option value="2"<c:if test="${2 == problem.pl_serious}">selected="selected"</c:if>>严重</option>
                <option value="1"<c:if test="${1 == problem.pl_serious}">selected="selected"</c:if>>非常严重</option>
            </select>
        </div>

        <label class="col-sm-3 control-label">解决方案：</label>
        <div class="col-sm-9">
            <textarea class="form-control" rows="3" name="pl_programme">${problem.pl_programme}</textarea>
        </div>
        <div class="layui-btn-group col-sm-9" style="margin-left: 49%">
            <input type="submit" id="sub" class="layui-btn" onclick="problemSave(${problem.u_id})" value="确定"/>
            <input type="button" id="back" class="layui-btn" onclick="javascript :history.back(-1);" value="返回"/>
        </div>

    </div>
</div>

</body>
<script type="text/javascript">
    
    layui.use('laydate', function() {
        var laydate = layui.laydate;
        //日期时间选择器
        laydate.render({
            elem: '#fsdate'
            ,type: 'date'
        });
        laydate.render({
            elem: '#yqdate'
            ,type: 'date'
        });
    });


    function problemSave(prou_id) {
        layui.use('layer',function () {
            var t_id = $("[name=t_id]").val();
            var u_id = $("[name=u_id]").val();
            var pl_name = $("[name=pl_name]").val();
            var pl_describe = $("[name=pl_describe]").val();
            var pl_fsDate = $("[name=pl_fsDate]").val();
            var pl_yqDate = $("[name=pl_yqDate]").val();
            var pl_serious = $("[name=pl_serious]").val();
            var pl_programme = $("[name=pl_programme]").val();
            var num;//判断负责人是否变化，0不发，1发送邮件
            if(prou_id != undefined){
                if(prou_id == u_id){
                    num = 0;
                }else{
                    num = 1;
                }
            }else{
                num = 1;
            }

            if(pl_name == null || pl_name == undefined || pl_name == ""){
                layer.msg("请输入问题名称");
                return;
            }
            if(t_id == 0 || t_id == undefined || t_id == ""){
                layer.msg("请选择问题类型");
                return;
            }
            if(pl_fsDate == null || pl_fsDate == undefined || pl_fsDate == ""){
                layer.msg("请选择发生时间");
                return;
            }
            if(pl_serious == null || pl_serious == undefined || pl_serious == ""){
                layer.msg("请选择严重等级");
                return;
            }
            if(pl_yqDate != null && pl_yqDate != undefined && pl_yqDate != ""){
                if(pl_fsDate > pl_yqDate){
                    layer.msg("要求日期不能小于发生日期");
                    return;
                }
            }

            if(u_id != 0){
                if(pl_yqDate == null || pl_yqDate == undefined || pl_yqDate == ""){
                    layer.msg("请选择完成时间");
                    return;
                }
            }
            var toEmail = $("#fzr").find("option:selected").attr("name");//获取选中用户的邮箱

            if(pl_yqDate == null || pl_yqDate == undefined || pl_yqDate == ""){
                pl_yqDate = "0001-01-01";
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/updateProblem",
                method:"POST",
                data:{
                    "pl_id":${problem.pl_id},
                    "t_id":parseInt(t_id),
                    "u_id":parseInt(u_id),
                    "pl_name":pl_name,
                    "pl_describe":pl_describe,
                    "pl_fsDate":pl_fsDate,
                    "pl_yqDate":pl_yqDate,
                    "pl_serious":parseInt(pl_serious),
                    "pl_programme":pl_programme
                },
                success:function (data) {
                    layer.msg("修改成功")
                    if(toEmail == undefined){
                        toEmail = "";
                    }
                    if(data == "success"){
                        layer.load(0, {shade: false});
                        $.ajax({
                            url: "${pageContext.request.contextPath}/sendEmail",
                            method:"POST",
                            data:{
                                "toEmail":toEmail,
                                "pl_name":pl_name,
                                "num": num,//1发送  2不发送
                                "state":200,
                            },
                            success:function (data) {
                                window.location.href=document.referrer;
                            }
                        });
                    }else{
                        layer.msg('保存失败，请刷新后重试！');
                    }
                }
            });
        })
    }


</script>
</html>