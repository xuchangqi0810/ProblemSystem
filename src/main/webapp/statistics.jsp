<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/echarts/js/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <title>数据统计</title>
    <style type="text/css">
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
        <li><a href="#">更改密码</a></li>
    </ul>
</div>
<div id="chartmain" style="width:700px; height: 500px;margin-left: 30%;"></div>
</body>
<script type="text/javascript">
    var list=[];
    //指定图标的配置和数据
    var option = {
        title:{
            text:'问题数据统计'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{b} <br/>{c} : {d} %"      //a 系列名称，b 数据项名称，c 数值，d 百分比
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:list
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series:[{
            name:'问题数据统计',
            type:'pie',
            radius:'80%',
            data:[],

        }]
    };
    window.onload = function () {
        var myChart = echarts.init(document.getElementById('chartmain'));
        $.ajax({
            url:'${pageContext.request.contextPath}/getStatisticsList',
            method:'GET',
            success:function (data) {
                list = data;
                console.log(list)
                $.each(data,function (i,item) {
                    option.series[0].data.push({value:item.count,name:item.name})
                })
                //使用制定的配置项和数据显示图表
                myChart.setOption(option);
            }
        });
    }


</script>
</html>
