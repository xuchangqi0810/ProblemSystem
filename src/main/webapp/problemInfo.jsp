<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <title>Title</title>
</head>
<style type="text/css">
    .body::-webkit-scrollbar {display:none}
    fieldset{
        font-size: 1em;
        background-color: #FFFFFF;
        border-radius: 3.5px;
    }

    table{
        font-size: 1em;
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
<body style="margin: 2% 2% 0 2%;background-color: #CCCCCC" class="body">
<div class="layui-row">
    <div class="layui-col-xs12 layui-col-md10">
        <div class="grid-demo grid-demo-bg1">
            <fieldset class='actionbox'>
                <legend>
                    问题描述
                </legend>
                <span id="describe"></span>
            </fieldset>
        </div>
    </div>
    <div class="layui-col-xs6 layui-col-md2">
        <div class="grid-demo">
            <fieldset  class='action' >
                <legend>
                    基本信息
                </legend>
                <table style="font-size: 0.9em" class="table table-data table-condensed table-borderless">
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
        </div>
    </div>
    <div class="layui-col-xs6 layui-col-md10" style="margin-top: -5%;">
        <div class="grid-demo grid-demo-bg2">
            <fieldset class='actionbox'>
                <legend>
                    解决方案
                </legend>
                <span id="progarmme"></span>
            </fieldset>
        </div>
    </div>
    <div class="layui-col-xs6 layui-col-md10">
        <div class="grid-demo grid-demo-bg2">
            <fieldset class='actionbox'>
                <legend>
                    附件
                </legend>
                <div id="imgs"></div>
            </fieldset>
        </div>
    </div>
    <div class="layui-col-xs6 layui-col-md10">
        <div class="grid-demo grid-demo-bg2">
            <fieldset class='actionbox'>
                <legend>
                    历史
                </legend>
                <div id="proInfos">
                    <ol id="content">
                    </ol>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="layui-col-xs6 layui-col-md2">
        <div class="grid-demo">
            <fieldset>
                <legend>
                    问题的一生
                </legend>
                <table style="font-size: 0.9em" class="table table-data table-condensed table-borderless">
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
        </div>
    </div>
</div>
<%--<fieldset  style="width: 25%;float: right;position: absolute;margin: 6% 0 0 9.2%">
    <legend>
        相关人员
    </legend>
    <table style="font-size: 0.9em" class="table table-data table-condensed table-borderless">
        <tbody class="xiangguan">

        </tbody>
    </table>
</fieldset>--%>
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
                    "<div class=\"history\" style='background-color: #0099CC;padding: 1%'>        <div class=\"changes hide alert\" id=\"changeBox4\"></div>\n" +
                    "                <div class=\"article-content comment276\" style='color: #FFFFFF'>"+data.proInfos[i].remarks+"</div>        \n" +
                    "        </div>";
            }else if(data.proInfos[i].state == 3){
                content += "<li value='"+j+"'>"+j+"."+data.proInfos[i].proDate+"，由<strong>"+data.proInfos[i].user.u_nickName+"</strong>驳回，反馈意见如下</li>" +
                    "<div class=\"history\" style='background-color: #0099CC;padding: 1%'>        <div class=\"changes hide alert\" id=\"changeBox4\"></div>\n" +
                    "                <div class=\"article-content comment276\">"+data.proInfos[i].remarks+"</div>        \n" +
                    "        </div>";
            }
            j++;
            if(i == data.proInfos.length -1 && (data.pl_state == 3 || data.pl_state ==4 ||data.pl_state == 5 )){
                content += "<li value='"+j+"'>"+j+"."+data.proInfos[i].proDate+"，由<strong>"+data.pt_user.u_nickName+"</strong>完成。</li>"
            }
        }
        $("#describe").html(data.pl_describe);
        $("#fkr").html(data.pl_feedback);
        if(data.pt_user != null){
            $("#fzr").html(data.pt_user.u_nickName);
        }
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
            var last;
            $.each(data.lists,function(i,item){
                last = item.url.split(".");
                if (last[1] == "jpg" || last[1] == "png" || last[1] == "bmp" || last[1] == "jpeg") {
                    $("#imgs").append("<img id='showImg"+i+"' style='width: 20%; margin:2%;cursor:pointer;' src='"+item.url+"'/>")
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
                }else if(last[1] == "txt" || last[1] == "ppt" || last[1] == "pptx" || last[1] == "doc" || last[1] == "docx" || last[1] == "xlsx"){
                    var str = JSON.stringify(item.name);
                    $('#imgs').append('<div class="image-container" style="display: inline-block" id="container' + i + '">' +
                     '<a href="#" onclick="downloadFile(\''+item.url+'\',\''+item.name+'\')" title="点击下载">' + item.name + '</a></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;')
                }
            })
        }else{
            $("#imgs").html("<div style='height: 20%'>&nbsp&nbsp&nbsp;</div>")
        }
        if(data.dutyList == null || data.dutyList == "" || data.dutyList == undefined){
            $(".xiangguan").append("<tr><td>暂无相关人员</td></tr>");
        }else{
            $.each(data.dutyList,function (i,item) {
                $(".xiangguan").append("<tr>\n" +
                    "            <th class=\"w-80px\">"+item.user.u_nickName+"&nbsp;&nbsp;&nbsp;</th>\n" +
                    "            <td>"+item.details+"</td>\n" +
                    "        </tr>");
            })
        }
    }

    function downloadFile(url,name) {
        location.href = "${pageContext.request.contextPath}/download?url="+url+"&name="+encodeURI(encodeURI(name));
        /*$.ajax({
            url:"",
            type:"get",
            data:{
                "url":url,
                "name":
            }
        })*/
    }
</script>
</html>
