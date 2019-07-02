<%--
  Created by IntelliJ IDEA.
  User: GY06
  Date: 2019/5/31
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <title>Title</title>
</head>
<style type="text/css">
    fieldset{
        display: inline-block;
        font-size: 0.7rem;
    }
    .actionbox{
        width: 60%;
        margin-bottom: 2%;
    }
    table{
        font-size: 0.8rem;
        margin-left: 10%;
    }
    table th{
        padding: 6% 0 6% 0;
    }
    .td-right{
        float: right;
    }
    #content li{
        padding: 1% 0 1% 0;
    }
    .history{
        border-radius:5px;
    }
</style>
<body style="margin: 2% 2% 0 2%">
<fieldset class='actionbox'>
    <legend>
        问题描述
    </legend>
    <span id="describe"></span>

</fieldset>
<fieldset  class='action' style="width: 26%;float: right">
    <legend>
        基本信息
    </legend>
    <table style="font-size: 0.7rem" class="table table-data table-condensed table-borderless">
        <tr>
            <th class="td-right">反馈人&nbsp;&nbsp;&nbsp;</th>
            <td id="fkr"></td>
        </tr>
        <tr>
            <th class="td-right">负责人&nbsp;&nbsp;&nbsp;</th>
            <td id="fzr"></td>
        </tr>
        <tr>
            <th class="td-right">问题类型&nbsp;&nbsp;&nbsp;</th>
            <td id="type"></td>
        </tr>
        <tr>
            <th class="td-right">问题状态&nbsp;&nbsp;&nbsp;</th>
            <td id="state"></td>
        </tr>
        <tr>
            <th class="td-right">严重等级&nbsp;&nbsp;&nbsp;</th>
            <td id="serious"></td>
        </tr>

    </table>

</fieldset>
<fieldset class='actionbox'>
    <legend>
        解决方案
    </legend>
    <span id="progarmme"></span>

</fieldset>
<fieldset class='actionbox'>
    <legend>
        图片
    </legend>
    <div id="imgs"></div>

</fieldset>
<fieldset  style="width: 26%;float: right">
    <legend>
        问题的一生
    </legend>
    <table style="font-size: 0.7rem" class="table table-data table-condensed table-borderless">
        <tbody><tr>
            <th class="w-80px">录入时间&nbsp;&nbsp;&nbsp;</th>
            <td id="lr"></td>
        </tr>
        <tr>
            <th>实际开始&nbsp;&nbsp;&nbsp;</th>
            <td id="start"></td>
        </tr>
        <tr>
            <th>截止日期&nbsp;&nbsp;&nbsp;</th>
            <td id="stop"></td>
        </tr>
        <tr>
            <th>完成时间&nbsp;&nbsp;&nbsp;</th>
            <td id="count"></td>
        </tr>
        <tr>
            <th>总消耗&nbsp;&nbsp;&nbsp;</th>
            <td id="hours"></td>
        </tr>
        </tbody></table>
</fieldset>
<fieldset class='actionbox'>
    <legend>
        历史
    </legend>
    <div id="proInfos">
        <ol id="content">

        </ol>
    </div>

</fieldset>


</body>
<script type="text/javascript">
    function child(data){
        var hours = 0;
        var content = "<li value='1'>1."+data.pl_lrDate+"，由<strong>"+data.pl_feedback+"</strong>创建。</li>";
        if(data.pl_state != 1){
            content += "<li value='2'>2."+data.pl_starttime+"，由<strong>"+data.pt_user.u_nickName+"</strong>开始。</li>";
        }
        var j = 3;
        for (var i = 0; i < data.proInfos.length; i++){
            if(data.proInfos[i].state == 2){
                hours +=data.proInfos[i].hours;
                content += "<li value='"+j+"'>"+j+"."+data.proInfos[i].proDate+"，由<strong>"+data.pt_user.u_nickName+"</strong>记录工时，消耗<strong>"+data.proInfos[i].hours+"</strong>小时。</li>" +
                    "<div class=\"history\" style='background-color: #cac19d;padding: 1%'>        <div class=\"changes hide alert\" id=\"changeBox4\"></div>\n" +
                    "                <div class=\"article-content comment276\">"+data.proInfos[i].remarks+"</div>        \n" +
                    "        </div>";
            }else if(data.proInfos[i].state == 3){
                content += "<li value='"+j+"'>"+j+"."+data.proInfos[i].proDate+"，由<strong>"+data.proInfos[i].user.u_nickName+"</strong>驳回，反馈意见如下</li>" +
                    "<div class=\"history\" style='background-color: #cac19d;padding: 1%'>        <div class=\"changes hide alert\" id=\"changeBox4\"></div>\n" +
                    "                <div class=\"article-content comment276\">"+data.proInfos[i].remarks+"</div>        \n" +
                    "        </div>";
            }
            j++;
            if(i == data.proInfos.length -1 && (data.pl_state == 3 || data.pl_state ==4 )){
                content += "<li value='"+j+"'>"+j+"."+data.proInfos[i].proDate+"，由<strong>"+data.pt_user.u_nickName+"</strong>完成。</li>"
            }
        }
        $("#describe").html(data.pl_describe);
        $("#fkr").html(data.pl_feedback);
        $("#fzr").html(data.pt_user.u_nickName);
        $("#type").html(data.pt_type.t_name);
        $("#content").html(content);
        $("#lr").html(data.pl_lrDate);
        if(data.pl_starttime == '0001-01-01'){
            $("#start").html(" ");
        }else{
            $("#start").html(data.pl_starttime);
        }
        $("#hours").html(hours+"工时");
        if(data.pl_yqDate == '0001-01-01'){
            $("#stop").html(" ");
        }else{
            $("#stop").html(data.pl_yqDate);
        }
        $("#progarmme").html(data.pl_programme);
        if(data.pl_wcDate == "" || data.pl_wcDate == null){
            $("#count").html(" ");
        }else{
            $("#count").html(data.pl_wcDate);
        }




        if(data.pl_state == 1){
            $("#state").html("未开始");
        }else if(data.pl_state == 2){
            $("#state").html("进行中");
        }else if(data.pl_state == 3){
            $("#state").html("待审核");
        }else if(data.pl_state == 4){
            $("#state").html("已完成");
        }
        if(data.pl_serious == 4){
            $("#serious").html("一般");
        }else if(data.pl_serious == 3){
            $("#serious").html("较重");
        }else if(data.pl_serious == 2){
            $("#serious").html("严重");
        }else{
            $("#serious").html("非常严重");
        }
        if(data.lists.length != 0){
            $.each(data.lists,function(i,item){
                $("#imgs").append("<img id='showImg"+i+"' style='width: 20%; margin:2%;cursor:pointer;' src=${pageContext.request.contextPath}\'"+ item.url+"\'>")
                $("#showImg"+i+"").bind('click',function () {
                    var width = $("#showImg"+i).width();
                    var height = $("#showImg"+i).height();
                    var scaleWH = width/height;
                    var bigH = 500;
                    var bigW = scaleWH*bigH;
                    if(bigW>800){
                        bigW = 800;
                        bigH = bigW/scaleWH;
                    }

                    layui.use('layer',function () {
                        // 放大预览图片
                        layer.open({
                            type: 1,
                            title: false,
                            closeBtn: 1,
                            shadeClose: true,
                            area: [bigW + 'px', bigH + 'px'], //宽高
                            content: "<img width='"+bigW+"' height='"+bigH+"' src=" + item.url + " />"
                        });
                    })
                });
            })
        }else{
            $("#imgs").html("<div style='height: 20%'>&nbsp&nbsp&nbsp;</div>")
        }

    }
</script>
</html>
