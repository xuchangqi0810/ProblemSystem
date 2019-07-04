<%--
  Created by IntelliJ IDEA.
  User: GY06
  Date: 2019/5/22
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<head>
    <title>新建问题</title>
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
        font-size: 18px;
    }
</style>
<body>
<nav class="navbar navbar-default" role="navigation" style="background-color: #007DDB;">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: white" href="#">欢迎使用问题管理系统</a>
        </div>
        <ul class="nav navbar-nav navbar-right" >
            <li><a href="#" style="color: white"><span class="glyphicon glyphicon-user"></span>${pt_user.dep.d_name}&nbsp;&nbsp; ${pt_user.u_name}</a></li>
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
            <label class="col-sm-3 control-label">问题名称:<span class="required">*</span></label>
            <div class="col-sm-7">
                <input type="text" name="pl_name" lay-verify="title" autocomplete="off" placeholder="请输入问题名称" class="layui-input">
            </div>
            <label class="col-sm-3 control-label">问题类型:<span class="required">*</span></label>
            <div class="col-sm-7">
                <select class="form-control" name="t_id">
                    <option value="0">请选择问题类型</option>
                    <c:forEach var="item" items="${pt_typeList}">
                        <option value="${item.t_id}">${item.t_name}</option>
                    </c:forEach>
                </select>
            </div>
            <input type="hidden" name="pl_feedback" value="${pt_user.u_nickName}">

            <label class="col-sm-3 control-label">负责人:</label>
            <div class="col-sm-7">
                <select id="fzr" class="form-control" name="u_id">
                    <option value="0">请选择负责人</option>
                    <c:forEach var="item" items="${byDIDUsers}">
                        <option value="${item.u_id}" name="${item.u_email}">${item.u_nickName}</option>
                    </c:forEach>
                </select>
            </div>

            <label class="col-sm-3 control-label">问题描述:</label>
            <div class="col-sm-9">
                <textarea class="form-control" rows="3" name="pl_describe"></textarea>
            </div>


            <label class="col-sm-3 control-label">发生时间:<span class="required">*</span></label>
            <div class="layui-input-inline col-sm-7">
                <input type="text" class="layui-input" name="pl_fsDate" id="fsdate" placeholder="yyyy-MM-dd">
            </div>

            <label class="col-sm-3 control-label">要求时间:</label>
            <div class="layui-input-inline col-sm-7">
                <input type="text" class="layui-input" name="pl_yqDate" id="yqdate" placeholder="yyyy-MM-dd">
            </div>

            <label class="col-sm-3 control-label">严重等级:<span class="required">*</span></label>
            <div class="col-sm-7">
                <select class="form-control" name="pl_serious">
                    <option value="4">一般</option>
                    <option value="3">较重</option>
                    <option value="2">严重</option>
                    <option value="1">非常严重</option>
                </select>
            </div>

            <label class="col-sm-3 control-label">解决方案:</label>
            <div class="col-sm-9">
                <textarea class="form-control" rows="3" name="pl_programme"></textarea>
            </div>
            <label class="col-sm-3 control-label">上传图片:<span class="required">*</span></label>
            <div class="layui-upload col-sm-9">
                <button type="button" class="layui-btn" id="test2"  >选择图片</button>&nbsp;&nbsp;&nbsp;<button style="display: none" class="layui-btn" id="btn">上传</button>
                <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px; background-color: #2aabd2">
                    预览图：
                    <div class="layui-upload-list"  id="ImgPreview"></div>
                </blockquote>
            </div>
            <div class="layui-btn-group col-sm-9" style="margin-left: 49%">
                <input type="submit" id="sub" class="layui-btn" onclick="problemSave()" value="保存"/>
                <input type="button" id="back" class="layui-btn" onclick="javascript :history.back(-1);" value="返回"/>
            </div>

        </div>
</div>

</body>
<script type="text/javascript">

    var pl_id = 0;
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

    layui.use("upload",function () {
        var $ = layui.jquery
            ,upload = layui.upload;
        //多图片上传
        upload.render({
            elem: '#test2'
            ,url: '${pageContext.request.contextPath}/upload'
            ,multiple: true,
            accept:"image",
            auto:false,
            data:{pl_id:pl_id},
            number:2,
            acceptMime: 'image/*',
            bindAction:'#btn',
            choose:function (obj) {
                var files = obj.pushFile();
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#ImgPreview').append('<div class="image-container" style="display: inline-block" id="container'+index+'">' +
                        '<div class="delete-css">' +
                        '<button id="upload_img_'+index+'" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>' +
                        '</div>' +
                        '<img id="showImg'+index+'" style="width: 150px; margin:10px;cursor:pointer;" src="'+ result +'" alt="'+ file.name +'" ></div>')
                    $("#upload_img_" + index).bind('click', function () {
                        delete files[index];
                        $("#container"+index).remove();
                    });



                    $("#showImg"+index).bind('click',function () {
                        var width = $("#showImg"+index).width();
                        var height = $("#showImg"+index).height();
                        var scaleWH = width/height;
                        var bigH = 600;
                        var bigW = scaleWH*bigH;
                        if(bigW>900){
                            bigW = 900;
                            bigH = bigW/scaleWH;
                        }

                        // 放大预览图片
                        layer.open({
                            type: 1,
                            title: false,
                            closeBtn: 1,
                            shadeClose: true,
                            area: [bigW + 'px', bigH + 'px'], //宽高
                            content: "<img width='"+bigW+"' height='"+bigH+"' src=" + result + " />"
                        });
                    });

                });
            },
            allDone: function(obj){ //当文件全部被提交后，才触发
                layer.msg('已成功上传'+obj.successful+'个文件');
            }
        });
    });

    function problemSave() {
        var t_id = $("[name=t_id]").val();
        var u_id = $("[name=u_id]").val();
        var pl_name = $("[name=pl_name]").val();
        var pl_feedback = $("[name=pl_feedback]").val();
        var pl_describe = $("[name=pl_describe]").val();
        var pl_fsDate = $("[name=pl_fsDate]").val();
        var pl_yqDate = $("[name=pl_yqDate]").val();
        var pl_serious = $("[name=pl_serious]").val();
        var pl_programme = $("[name=pl_programme]").val();

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

        var length = document.getElementsByClassName("image-container").length;
        if(length == 0){
            layer.msg("请选择上传图片");
            return;
        }

        if(length > 2){
            layer.msg("最多上传2张图片");
            return;
        }

        var toEmail = $("#fzr").find("option:selected").attr("name");//获取选中用户的邮箱
        if(pl_yqDate == null || pl_yqDate == undefined || pl_yqDate == ""){
            pl_yqDate = "0001-01-01";
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/createProblem",
            method:"POST",
            data:{"t_id":parseInt(t_id),
                "u_id":parseInt(u_id),
                "pl_name":pl_name,
                "pl_feedback":pl_feedback,
                "pl_describe":pl_describe,
                "pl_fsDate":pl_fsDate,
                "pl_yqDate":pl_yqDate,
                "pl_serious":parseInt(pl_serious),
                "pl_programme":pl_programme,
                "pl_state":1
            },
            success:function (data) {
                if(toEmail == undefined){
                    toEmail = "";
                }
                $("#btn").click();
                if(data == "success"){
                    layer.load(0, {shade: false});
                    $.ajax({
                        url: "${pageContext.request.contextPath}/sendEmail",
                        method:"POST",
                        data:{
                            "toEmail":toEmail,
                            "pl_name":pl_name,
                            "num":0,
                            "state":100,
                        },
                        success:function (data) {
                            location.href = "${pageContext.request.contextPath}/myProblem"
                        }
                    });

                }else{
                    layer.msg('保存失败，请刷新后重试！');
                }
            }
        })

    }


</script>
</html>