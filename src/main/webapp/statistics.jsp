<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="icon" href="${pageContext.request.contextPath}/images/avtar.png" type="image/x-icon"/>
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
        <li><a href="${pageContext.request.contextPath}/updatepassword.jsp">更改密码</a></li>
    </ul>
</div>
<div id="chartmain" style="width:80rem; height: 60rem;margin-left: 45rem;"></div>
</body>
<script type="text/javascript">

    var myChart = echarts.init(document.getElementById('chartmain'));
    var monthOfYear = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    // 先取到当前日期对象
    var date = new Date();
    // 月份数组
    var nearThree = [];
    // 当月
    var month = date.getMonth();
    // 现将本月推入数组
    nearThree.push(monthOfYear[month]);
    // 最近一月逆推5个月
    for (var i = 1; i <= 5; i++) {
        date.setMonth(month - i);
        nearThree.unshift(monthOfYear[date.getMonth()]);
    }

    var option ;
    setTimeout(function () {
        option = {
            legend: {
                show:true,
                data:[]
            },
            tooltip: {
                trigger: 'axis',
                showContent: false
            },
            dataset: {
                source: [
                    ['product', nearThree[0] + "月", nearThree[1] + "月", nearThree[2] + "月", nearThree[3] + "月", nearThree[4] + "月", nearThree[5] + "月"],
                ]
            },
            xAxis: {type: 'category'},
            yAxis: {
                gridIndex: 0,
                min:0,
                max:25
            },
            grid: {top: '55%'},
            series: [
                {
                    type: 'pie',
                    id: 'pie',
                    radius: '35%',
                    center: ['50%', '25%'],
                    label: {
                        formatter: '{b}: {@7月} ({d}%)'
                    },
                    encode: {
                        itemName: 'product',
                        value: '7月',
                        tooltip: '7月'
                    }
                }
            ]
        };

        myChart.on('updateAxisPointer', function (event) {
            var xAxisInfo = event.axesInfo[0];
            if (xAxisInfo) {
                var dimension = xAxisInfo.value + 1;
                myChart.setOption({
                    series: {
                        id: 'pie',
                        label: {
                            formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                        },
                        encode: {
                            value: dimension,
                            tooltip: dimension
                        }
                    }
                });
            }
        });
    });


    window.onload = function () {
        $.ajax({
            url:'${pageContext.request.contextPath}/getStatisticsList',
            data:{
                "day":nearThree,
            },
            method:'GET',
            traditional: true,
            success:function (data) {
                option.legend.data = data;
                var arr = [];
                $.each(data,function (i,item) {
                    if(item.t_name != null && item.t_name != undefined && item.t_name != ""){
                        option.series.push({type: 'line', smooth: true, seriesLayoutBy: 'row'});
                    }
                    arr = [item.t_name, item.day1, item.day2, item.day3, item.day4, item.day5, item.day6];
                    option.dataset.source.push(arr);
                    option.legend.data.push(item.t_name);
                    arr = [];

                });
                //使用制定的配置项和数据显示图表
                myChart.setOption(option);
            }
        });
    }
</script>
</html>
