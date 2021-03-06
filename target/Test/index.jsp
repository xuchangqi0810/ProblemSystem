<%@ page import="java.util.Date" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy-MM-dd" var="date"/>
<html>
<meta charset="utf-8">
<head>
    <link rel="icon" href="${pageContext.request.contextPath}/images/avtar.png" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <title>我的问题</title>
    <style type="text/css">
        .body::-webkit-scrollbar {
            display: none
        }

        #Navigation {
            margin-left: 15%;
            width: 70%;
        }

        .Navigation ul {
            height: 50px;
        }

        .Navigation ul li {
            float: left;
            list-style: none;

        }

        .content {
            width: 100%;
            height: 100%;
        }

        i:hover {
            color: red;
        }

    </style>
</head>
<body class="body">
<nav class="navbar navbar-default" role="navigation" style="background-color: #007DDB;">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" style="color: white" href="#">欢迎使用问题管理系统</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#" style="color: white"><span class="glyphicon glyphicon-user"></span>${pt_user.dep.d_name}&nbsp;&nbsp; ${pt_user.u_nickName}
            </a></li>
            <li><a href="${pageContext.request.contextPath}/loginOut" style="color: white"><span
                    class="glyphicon glyphicon-log-in"></span> 退出</a></li>
        </ul>
    </div>
</nav>
<div class="collapse navbar-collapse" id="Navigation">
    <ul class="nav navbar-nav">
        <li class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown">问题<b
                class="caret"></b></a>
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
<div class="zy">
    <div class="content" style="text-align: center">
        <form class="layui-form" action="" style="">
            <table class="table table-hover" style="margin-left: 1%;width: 98%;border: 1px solid;border-color: #e2e2e2">
                <caption>我的问题</caption>
                <thead>
                <tr>
                    <div class="layui-form-item" pane="">
                        <div class="layui-input-block">
                            <th colspan="13">
                                <input type="radio" value="0" name="like1" lay-filter="primary" title="全部"
                                       <c:if test="${pl_state == 0}">checked="checked"</c:if>>
                                <input type="radio" value="1" name="like1" lay-filter="primary" title="未开始"
                                       <c:if test="${pl_state == 1}">checked="checked"</c:if>>
                                <input type="radio" value="2" name="like1" lay-filter="primary" title="进行中"
                                       <c:if test="${pl_state == 2}">checked="checked"</c:if>>
                                <input type="radio" value="3" name="like1" lay-filter="primary" title="审核中"
                                       <c:if test="${pl_state == 3}">checked="checked"</c:if>>
                                <input type="radio" value="4" name="like1" lay-filter="primary" title="已完成"
                                       <c:if test="${pl_state == 4}">checked="checked"</c:if>>
                                <input type="radio" value="5" name="like1" lay-filter="primary" title="已关闭"
                                       <c:if test="${pl_state == 5}">checked="checked"</c:if>>
                                <label class="col-sm-1 control-label"
                                       style="padding-top: 0.85em;padding-left: 6%;width:10.5%;white-space:nowrap;font-size: 1.4rem">起始时间:</label>
                                <input type="text" class="layui-input col-sm-1" name="startDate" id="fsdate"
                                       value="${startDate}" placeholder="yyyy-MM-dd">
                                <label class="col-sm-1 control-label"
                                       style="padding-top: 0.85em;padding-left: 6%;width:10.5%;white-space:nowrap;font-size: 1.4rem;">结束时间:</label>
                                <input type="text" class="layui-input col-sm-1" name="stopDate" id="yqdate"
                                       value="${stopDate}" placeholder="yyyy-MM-dd" style="margin-right: 2.5em">
                                <input type="button" class="layui-btn" style="" onclick="selectProblem()" value="查询"/>
                                <i class="layui-icon layui-icon-download-circle" title="导出"
                                   style="font-size: 1em;cursor:pointer;float:right;padding-top: 0.35em"
                                   onclick="excelExport()">导出</i>
                            </th>
                        </div>
                    </div>
                </tr>
                <tr>
                    <th>编号</th>
                    <th style="width: 30%">问题名称</th>
                    <th>反馈人</th>
                    <th>负责人</th>
                    <th>发生时间</th>
                    <th>要求时间</th>
                    <th>进度</th>
                    <th>严重等级</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody style="font-size: 0.8em">
                <c:choose>
                    <c:when test="${not empty pt_problem}">
                        <c:forEach var="item" items="${pt_problem}">
                            <tr>
                                <th>${item.pl_id}</th>
                                <th onclick="showPro(${item.pl_id})" style="cursor:pointer" title="${item.pl_name}">
                                    <c:if test="${item.pt_type.t_id == 4}">
                                        <span style="padding: 5px;border-radius: 10px;background-color: #007DDB; font-size: 0.6em;color: white">${item.pt_type.t_name}</span>
                                    </c:if>
                                    <c:if test="${item.pt_type.t_id == 5}">
                                        <span style="padding: 5px;border-radius: 10px;background-color: #FF833C; font-size: 0.6em;color: white">${item.pt_type.t_name}</span>
                                    </c:if>
                                    <c:if test="${item.pt_type.t_id == 6}">
                                        <span style="padding: 5px;border-radius: 10px;background-color: #8C4BDB; font-size: 0.6em;color: white">${item.pt_type.t_name}</span>
                                    </c:if>
                                    <c:if test="${item.pt_type.t_id == 7}">
                                        <span style="padding: 5px;border-radius: 10px;background-color: #2DA5DB; font-size: 0.6em;color: white">${item.pt_type.t_name}</span>
                                    </c:if>
                                    &nbsp;${item.pl_name}
                                </th>
                                <th>${item.pl_feedback}</th>
                                <th><c:if test="${item.u_id != null}">${item.pt_user.u_nickName}</c:if></th>
                                <th>${item.pl_fsDate}</th>
                                <c:if test="${item.pl_yqDate == '0001-01-01'}">
                                    <th></th>
                                </c:if>
                                <c:if test="${item.pl_yqDate != '0001-01-01'}">
                                    <th>${item.pl_yqDate}</th>
                                </c:if>
                                <c:choose>
                                    <c:when test="${item.pl_state == 1}">
                                        <th>
                                            未开始
                                            <c:if test="${item.pl_yqDate != '0001-01-01'}">
                                                <c:if test="${item.timeout < 0}">
                                                    <span style="color: #f95731;"> 延期${-item.timeout}天</span>
                                                </c:if>
                                            </c:if>
                                        </th>
                                    </c:when>
                                    <c:when test="${item.pl_state == 2}">
                                        <th>
                                            <c:if test="${item.timeout >= 0}">
                                                进行中
                                            </c:if>
                                            <c:if test="${item.timeout < 0}">
                                                进行中<span style="color: #f95731;">
                                                <c:if test="${item.pl_yqDate != '0001-01-01'}">
                                                    延期${-item.timeout}天</span>
                                                </c:if>
                                            </c:if>
                                        </th>
                                    </c:when>
                                    <c:when test="${item.pl_state == 3}">
                                        <th>审核中</th>
                                    </c:when>
                                    <c:when test="${item.pl_state == 4}">
                                        <th>已完成</th>
                                    </c:when>
                                    <c:when test="${item.pl_state == 5}">
                                        <th>已关闭</th>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${item.pl_serious == 4}">
                                        <th style="color: red">一般</th>
                                    </c:when>
                                    <c:when test="${item.pl_serious == 3}">
                                        <th style="color: red">较重</th>
                                    </c:when>
                                    <c:when test="${item.pl_serious == 2}">
                                        <th style="color: red">严重</th>
                                    </c:when>
                                    <c:otherwise>
                                        <th style="color: red">非常严重</th>
                                    </c:otherwise>
                                </c:choose>
                                <th>
                                    <c:if test="${item.pl_state != 5}">
                                        <i class="layui-icon layui-icon-edit" title="编辑"
                                           style="font-size: 1.4em;cursor:pointer;"
                                           onclick="getByIdInUpdate(${item.pl_id})"></i>
                                        <i class="layui-icon <c:if test="${item.pl_state != 1 || item.pl_yqDate == '0001-01-01'}">layui-disabled</c:if> layui-icon-play"
                                           title="开始" style="font-size: 1.4em;cursor:pointer;"
                                           <c:if test="${item.pl_state == 1 && item.pl_yqDate != '0001-01-01'}">onclick="proStart(${item.pl_id})"</c:if> ></i>
                                        <i class="layui-icon layui-icon-log" title="工时"
                                           style="font-size: 1.4em;cursor:pointer" onclick="proInfos(${item.pl_id})"></i>
                                        <%--<i class="layui-icon layui-icon-add-1" title="添加相关人员"
                                           style="font-size: 1.4em;cursor:pointer;" onclick="addPerson(${item.pl_id},'${item.pl_name}')"></i>--%>
                                        <i class="layui-icon <c:if test="${item.pl_state == 1 || item.pl_state == 3 || item.pl_state == 4 || item.pl_yqDate == '0001-01-01'}">layui-disabled</c:if> layui-icon-ok"
                                           title="完成" style="font-size: 1.4em;cursor:pointer"
                                           <c:if test="${(item.pl_state != 1 && item.pl_state != 3) && item.pl_yqDate != '0001-01-01'}">onclick="proComplete(${item.pl_id})"</c:if> ></i>
                                        <c:if test="${pt_user.role.id != 3}">
                                            <i class="layui-icon <c:if test="${item.pl_state != 3}">layui-disabled</c:if> layui-icon-survey"
                                               title="审批" style="font-size: 1.4em;cursor:pointer"
                                               <c:if test="${item.pl_state == 3}">onclick="proExamine(${item.pl_id},${item.pl_state})"</c:if> ></i>
                                        </c:if>
                                        <c:if test="${item.pl_state == 4}">
                                            <i class="layui-icon layui-icon-close" title="关闭问题" onclick="cloProblem(${item.pl_id})"
                                               style="font-size: 1.4em;cursor:pointer"></i>
                                        </c:if>
                                    </c:if>
                                </th>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th style="text-align: center;font-size: 2em" colspan="10">暂无数据</th>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </form>
        <div id="laypage" style=""></div>
    </div>
</div>
</body>
<script type="text/javascript">
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //日期时间选择器
        laydate.render({
            elem: '#fsdate'
            , type: 'date'
        });
        laydate.render({
            elem: '#yqdate'
            , type: 'date'
        });
    });

    function selectProblem() {
        layui.use('layer', function () {
            var start = $("[name=like1]:checked").val();
            var startDate = $("[name=startDate]").val();
            var stopDate = $("[name=stopDate]").val();
            if ((startDate == "" || startDate == null) && (stopDate == "" || stopDate == null)) {
                location.href = "${pageContext.request.contextPath}/myProblem?pl_state=" + start;
            }
            if (startDate != "" && startDate != null) {
                if (stopDate == "" || stopDate == null) {
                    layer.msg("请选择结束时间");
                    return;
                }
            }
            if (stopDate != "" && stopDate != null) {
                if (startDate == "" || startDate == null) {
                    layer.msg("请选择起始时间");
                    return;
                }
            }
            if ((stopDate != "" && stopDate != null) && ((startDate != "" && startDate != null))) {
                location.href = "${pageContext.request.contextPath}/myProblem?pl_state=" + start + "&startDate=" + startDate + "&stopDate=" + stopDate;
            }
        });
    }

    layui.use('form', function () {
        var form = layui.form;
    });
    layui.use('element', function () {
        var element = layui.element;
    });
    layui.use('laypage', function () {
        layui.laypage.render({
            elem: 'laypage',//元素ID 不要加# 并且只能是ID
            count: ${pager.totalRecord},
            curr: ${pager.pageNum},
            limit: ${pager.pageSize},
            limits: [10, 15,],//可选每页显示数
            layout: ['prev', 'page', 'limit', 'next'],
            jump: function (obj, first) {
                if (first) {
                    return;
                }//如果是第一次不执行
                var startDate = $("[name=startDate]").val();
                var stopDate = $("[name=stopDate]").val();
                layer.load(0, {shade: false});
                var url = '${pageContext.request.contextPath}/myProblem?pageNum=' + obj.curr + '&pageSize=' + obj.limit + '&pl_state=' +${pl_state};
                if ((stopDate != "" && stopDate != null) && ((startDate != "" && startDate != null))) {
                    url = "${pageContext.request.contextPath}/myProblem?pageNum=" + obj.curr + "&pageSize=" + obj.limit + "&pl_state=${pl_state}&startDate=" + startDate + "&stopDate=" + stopDate;
                }
                layer.load(0, {shade: false});//加载框
                window.location.href = url;
            }
        });
    });

    window.onload = function () {
        var aLi = document.getElementsByTagName('tr');
        for (var i = 0; i < aLi.length; i++) {
            if (i % 2 == 0) {
                aLi[i].style.background = '';
            } else {
                aLi[i].style.background = '#f9f9f9';
            }
        }
    }

    function showPro(pl_id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getByIdInProblem",
            method: "get",
            data: {"pl_id": pl_id},
            success: function (data) {
                layui.use('layer', function () {
                    layer.open({
                        type: 2,
                        title: '问题详情',
                        shadeClose: false,
                        shade: 0.8,
                        area: ['65%', '80%'],
                        content: '${pageContext.request.contextPath}/problemInfo.jsp', //iframe的url
                        success: function (layero, index) {
                            var iframe = window['layui-layer-iframe' + index];
                            iframe.child(data)
                        }
                    });
                })
            }
        })
    }//查看问题信息
    function proStart(pl_id) {
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.confirm('问题将标记为"进行中"，您确定吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {//确定
                $.ajax({
                    url: "${pageContext.request.contextPath}/ProStart",
                    method: "POST",
                    data: {"pl_id": pl_id},
                    success: function (data) {
                        layer.msg("修改成功", {icon: 1});
                        window.setTimeout(function () {
                            location.reload();
                        }, 2000);
                    }
                })
            }, function () {//取消
            });
        });
    }

    function proComplete(pl_id) {//完成
        layui.use('layer', function () {
            layer.confirm('问题将标记为"审核中"，并由上级领导确认，您确定吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {//确定
                $.ajax({
                    url: "${pageContext.request.contextPath}/ProComplete",
                    method: "POST",
                    data: {
                        "pl_id": pl_id,
                        "state": 3,
                    },
                    success: function (data) {
                        layer.msg("修改成功", {icon: 1});
                        window.setTimeout(function () {
                            location.reload();
                        }, 2000);
                    }
                })
            }, function () {//取消
            });
        })
    }

    function proInfos(pl_id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getByIdInProblem",
            method: "GET",
            data: {"pl_id": pl_id},
            success: function (data) {
                if (data.pl_state == 1) {
                    layui.use('layer', function () {
                        layer.msg("您还没有开始解决问题，请开始后重试");
                        return;
                    })
                } else {
                    var content = '<div class="main" style="padding: 20px;width: 100%">\n' +
                        '    <table class="table table-form table-fixed" id="tables" style="margin-top:5%">\n' +
                        '</table>\n' +
                        '</div>'
                    $.ajax({
                        url: "${pageContext.request.contextPath}/getByIdInProblem",
                        method: "GET",
                        data: {"pl_id": pl_id},
                        async: false,
                        success: function (data) {
                            if (data.pl_state == 2 || data.pl_state == 1) {
                                content = '<div class="main" style="padding: 20px;width: 100%">\n' +
                                    '    <table class="table table-form table-fixed" id="tables" style="margin-top:5%">\n' +
                                    '      <thead class="thead">\n' +
                                    '        <tr class="text-center">\n' +
                                    '          <th class="w-id">ID</th>\n' +
                                    '          <th class="w-120px">日期</th>\n' +
                                    '          <th class="w-40px">工时</th>\n' +
                                    '          <th>备注</th>\n' +
                                    '          <th class="w-10px"></th>\n' +
                                    '        </tr>\n' +
                                    '      </thead>\n' +
                                    '            <tbody>' +
                                    '<tr class="text-center">\n' +
                                    '        <td>1<input type="hidden" name="pl_id" value="' + pl_id + '"/>\n' +
                                    '</td>\n' +
                                    '        <td class="col-sm-2"><input type="date" name="proDate" value="" class="form-control" autocomplete="off">\n' +
                                    '</td>\n' +
                                    '        <td class="col-sm-1"><input type="number" name="hours" value="" class="form-control text-center" autocomplete="off">\n' +
                                    '</td>\n' +
                                    '        <td class="text-left"><textarea name="remarks" class="form-control" style="height:50px;"></textarea>\n' +
                                    '</td>\n' +
                                    '        <td></td>\n' +
                                    '      </tr>\n' +
                                    '<tr class="text-center">\n' +
                                    '        <td>2<input type="hidden" name="pl_id" value="' + pl_id + '"/>\n' +
                                    '</td>\n' +
                                    '        <td class="col-sm-2"><input type="date" name="proDate" value="" class="form-control" autocomplete="off">\n' +
                                    '</td>\n' +
                                    '        <td class="col-sm-1"><input type="number" name="hours" value="" class="form-control text-center" autocomplete="off">\n' +
                                    '</td>\n' +
                                    '        <td class="text-left"><textarea name="remarks" class="form-control" style="height:50px;"></textarea>\n' +
                                    '</td>\n' +
                                    '        <td></td>\n' +
                                    '      </tr>\n' +
                                    '<tr>\n' +
                                    '        <td colspan="6" class="text-center"> <button onclick="addProInfo()" id="submit" class="btn btn-primary" data-loading="稍候...">保存</button></td>\n' +
                                    '      </tr>\n' +
                                    '    </tbody></table>\n' +
                                    '</div>';
                            }
                        }
                    })
                    layui.use('layer', function () {
                        layer.open({
                            type: 1,
                            skin: 'layui-layer-demo', //样式类名
                            closeBtn: 1, //不显示关闭按钮
                            anim: 2,
                            area: ['65%', '70%'],
                            shadeClose: false, //开启遮罩关闭
                            content: content
                        });
                    });

                    $.ajax({
                        url: "${pageContext.request.contextPath}/getByIdProInfo",
                        method: "GET",
                        data: {"pl_id": pl_id},
                        success: function (data) {
                            if (data.length != 0) {
                                var html = '<thead class="thead">\n' +
                                    '        <tr class="text-center">\n' +
                                    '          <th class="w-id">编号</th>\n' +
                                    '          <th class="w-120px">日期</th>\n' +
                                    '          <th class="w-40px">工时</th>\n' +
                                    '          <th>备注</th>\n' +
                                    '          <th class="w-10px"></th>\n' +
                                    '        </tr>\n' +
                                    '      </thead>\n';
                                var j = 1;
                                $.each(data, function (i, item) {
                                    if (item.state == 2) {
                                        html += '<tbody>' +
                                            '<tr>\n' +
                                            '        <td>' + j + '<input type="hidden" name="pl_id" value="' + item.pl_id + '"/>\n' +
                                            '</td>\n' +
                                            '        <td class="col-sm-2">' + item.proDate + '\n' +
                                            '</td>\n' +
                                            '        <td class="col-sm-1">' + item.hours + '\n' +
                                            '</td>\n' +
                                            '        <td class="text-left">' + item.remarks + '\n' +
                                            '</td>\n' +
                                            '        <td></td>\n' +
                                            '      </tr></tbody>\n';
                                        j++;
                                    }
                                });
                                $("#tables").append(html);
                            }
                        }
                    })
                }
            }
        })
    }

    function addProInfo() {
        var pl_id = document.getElementsByName('pl_id');
        var proDate = document.getElementsByName('proDate');
        var hours = document.getElementsByName('hours');
        var remarks = document.getElementsByName('remarks');
        var pl_ids = [];
        for (var i = 0; i < pl_id.length; i++) {
            pl_ids.push(pl_id[i].value);
        }
        var proDates = [];
        for (var i = 0; i < proDate.length; i++) {
            proDates.push(proDate[i].value);
        }
        var hourss = [];
        for (var i = 0; i < hours.length; i++) {
            hourss.push(hours[i].value);
        }
        var remarkss = [];
        for (var i = 0; i < remarks.length; i++) {
            remarkss.push(remarks[i].value);
        }
        //非空判断
        if (proDate[0].value != null && proDate[0].value != undefined && proDate[0].value != "") {
            if (hours[0].value == null || hours[0].value == undefined || hours[0].value == "") {
                layer.msg('请填写“工时”');
                return;
            }
        }
        if (hours[0].value != null && hours[0].value != undefined && hours[0].value != "") {
            if (proDate[0].value == null || proDate[0].value == undefined || proDate[0].value == "") {
                layer.msg('请填写“日期”');
                return;
            }
        }
        if (proDate[1].value != null && proDate[1].value != undefined && proDate[1].value != "") {
            if (hours[1].value == null || hours[1].value == undefined || hours[1].value == "") {
                layer.msg('请填写“工时”');
                return;
            }
        }
        if (hours[1].value != null && hours[1].value != undefined && hours[1].value != "") {
            if (proDate[1].value == null || proDate[1].value == undefined || proDate[1].value == "") {
                layer.msg('请填写“日期”');
                return;
            }
        }

        $.ajax({
            url: "${pageContext.request.contextPath}/AddProInfos",
            method: "POST",
            data: {
                "pl_id": pl_ids,
                "proDate": proDates,
                "hours": hourss,
                "remarks": remarkss,
                "state": 2,
                "method": 0
            },
            cache: false,
            async: false,
            success: function (data) {
                layer.msg('保存成功', {icon: 1});
                window.setTimeout(function () {
                    history.go(0);
                }, 1000);
            }
        });
    }

    function getByIdInUpdate(pl_id) {
        location.href = "${pageContext.request.contextPath}/getByIdInUpdate?pl_id=" + pl_id;
    }

    function proExamine(pl_id, pl_state) {
        if (pl_state == 3 || pl_state == 2) {
            layui.use('layer', function () {
                layer.confirm('问题将标记为"已完成"，您确定吗？', {//问题将标记为"审核中"，并由上级领导确认，您确定吗？
                    btn: ['同意', '不同意'] //按钮
                }, function () {//确定
                    $.ajax({
                        url: "${pageContext.request.contextPath}/updateStateExamine",
                        method: "POST",
                        data: {
                            "pl_id": pl_id,
                            "pl_state": 4
                        },
                        cache: false,
                        async: false,
                        success: function (data) {
                            if (data == 1) {
                                layer.msg('审批成功', {icon: 1});
                                window.setTimeout(function () {
                                    history.go(0);
                                }, 2000);
                            }
                        }
                    })
                }, function () {//取消
                    layer.confirm('请填写您的反馈意见<br/><textarea class="form-control" rows="3" name="describe"></textarea>', {
                        btn: ['确定', '取消'], //按钮
                    }, function () {
                        var backcontent = $("[name=describe]").val();
                        if (backcontent == null || backcontent == "" || backcontent == undefined) {
                            $("[name=describe]").attr("placeholder", "反馈不许为空")
                            return;
                        }
                        $.ajax({
                            url: "${pageContext.request.contextPath}/backProblem",
                            method: "POST",
                            data: {
                                "pl_id": pl_id,
                                "remarks": backcontent
                            },
                            cache: false,
                            async: false,
                            success: function (data) {
                                layer.msg('反馈成功', {icon: 1});
                                window.setTimeout(function () {
                                    history.go(0);
                                }, 2000);
                            }
                        })
                    }, function () {

                    });
                });
            })
        } else if (pl_state == 1) {
            layer.msg("请在开始问题后重试")
            return;
        }
    }

    function excelExport() {
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.confirm( "<input type='radio' value='0' name='exp' style='margin-left: 14%;' lay-filter='primary' checked='checked' title='我的问题'/>我的问题&nbsp;&nbsp;" +
                "<input type='radio' value='1' name='exp' style='margin-left: 22%;' lay-filter='primary' title='全部问题'/>全部问题<p>&nbsp;</p>" +
                "<input type='date' name='expstartDate'/>--<input type='date' name='expstopDate' /> ", {
                btn: ['确定','取消'] //按钮
            }, function(){//确定
                var start = $("[name=expstartDate]").val();
                var stop = $("[name=expstopDate]").val()
                if(start == '' || start == null || start == undefined){
                    layer.msg("请选择起始时间")
                    return;
                }
                if(stop == '' || stop == null || stop == undefined){
                    layer.msg("请选择结束时间")
                    return;
                }
                location.href = "${pageContext.request.contextPath}/export?num="+$("[name=exp]:checked").val()+"&start="+start+"&stop="+stop;
            }, function(){//取消
            });
        });
    }

    function cloProblem(pl_id) {
        layui.use('layer', function () {
            layer.confirm('问题将更改为‘已关闭’状态，您确定吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {//确定
                $.ajax({
                    url: "${pageContext.request.contextPath}/cloProblem",
                    method: "POST",
                    data: {
                        "pl_id": pl_id,
                        "state": 5,
                    },
                    success: function (data) {
                        if(data == "200"){
                            layer.msg("更改成功", {icon: 1})
                            window.setTimeout(function () {
                                location.reload();
                            }, 2000);
                        }else if(data == "500"){
                            layer.msg("更改失败，请刷新后重试",{icon:2})
                        }
                    }
                })
            }, function () {//取消
            });
        })
    }

    var pr_id;
    var p_name;
    function addPerson(pl_id,pl_name) {
        var u_idlist;

        pr_id = pl_id;
        p_name = pl_name;
        var title = "";
        $.ajax({
            url:"${pageContext.request.contextPath}/getProUser",
            method:"POST",
            data :{
              "pr_id":pl_id
            },
            async:false,
            success:function (data) {
                u_idlist = data;
                if(data != "" && data != null){
                    $.each(data,function (i,msg) {
                        title +='<div class="main" style="font-size: 1em">\n' +
                            '            <div class="pro-content">\n' +
                            '<div style="margin: 2% 0 1% 0;width: 100%">\n' +
                            '<label class="col-sm-1 control-label" style="margin: 2.6% 0 2% 3%;">相关人员:</label>\n' +
                            '                <div class="col-sm-4" style="padding: 2% 0 2% 0;">\n' +
                            '                    <select id="fzr" class="form-control" name="u_id">\n' +
                            '                        <option value="0">请选择负责人</option>\n' +
                            '                        <optgroup label="工艺部">\n' +
                            '                            <c:forEach var="item" items="${gylist}">\n' +
                            '                                <option value="${item.u_id}" name="${item.u_email}" ${item.u_id == data ? 'selected':''}>${item.u_nickName}</option>\n' +
                            '                            </c:forEach>\n' +
                            '                        </optgroup>\n' +
                            '                        <optgroup label="生产部">\n' +
                            '                            <c:forEach var="item" items="${sclist}">\n' +
                            '                                <option value="${item.u_id}" name="${item.u_email}"  ${item.u_id == msg.u_id ? 'selected':'' }>${item.u_nickName}</option>\n' +
                            '                            </c:forEach>\n' +
                            '                        </optgroup>\n' +
                            '                        <optgroup label="质检部">\n' +
                            '                            <c:forEach var="item" items="${zjlist}">\n' +
                            '                                <option value="${item.u_id}" name="${item.u_email}" ${item.u_id == msg.u_id ? 'selected':'' }>${item.u_nickName}</option>\n' +
                            '                            </c:forEach>\n' +
                            '                        </optgroup>\n' +
                            '                    </select>\n' +
                            '                </div>\n' +
                            '                <label class="col-sm-1 control-label" style="margin: 2.6% 0 2% 2%">职责:</label>\n' +
                            '                <div class="col-sm-5" style="margin: 2% 0 2% 0">\n' +
                            '                    <textarea class="form-control" rows="2" name="pro_zhize"></textarea>\n' +
                            '                </div></div></div></div>';
                    })
                }else{
                    title = '<div class="main" style="font-size: 1em">\n' +
                        '            <div class="pro-content">\n' +
                        '<div style="margin: 2% 0 1% 0;width: 100%">\n' +
                        '                    <label class="col-sm-1 control-label" style="margin: 2.8% 0 2% 3%;">生成列表:</label>\n' +
                        '                    <div class="col-sm-5" style="margin: 2% 0 2% 3%;">\n' +
                        '                        <input type="number" id="pro-users-count" name="pro-users" placeholder="请输入需要生成的相关人数" class="layui-input"/>\n' +
                        '                    </div>\n' +
                        '                    <div class="layui-inline" style="margin: 2% 0 2% 3%;">\n' +
                        '                        <input type="button" id="pro-btn" class="layui-btn" value="生成"/>\n' +
                        '                    </div>\n' +
                        '                </div>'+
                        '            </div>\n' +
                        '            <div class="pro-userlist">\n' +
                        '            </div>\n' +
                        '            <div class="pro-ending" style="margin: 35% 0 2% 47%;">\n' +
                        '                <input type="button" id="sub" class="layui-btn" onclick="btnUsers()" value="保存"/>\n' +
                        '            </div>\n' +
                        '        </div>';
                }
            }
        })


        var content = '<label class="col-sm-1 control-label" style="margin: 2.6% 0 2% 3%;">相关人员:</label>\n' +
            '                <div class="col-sm-4" style="padding: 2% 0 2% 0;">\n' +
            '                    <select id="fzr" class="form-control" name="u_id">\n' +
            '                        <option value="0">请选择负责人</option>\n' +
            '                        <optgroup label="工艺部">\n' +
            '                            <c:forEach var="item" items="${gylist}">\n' +
            '                                <option value="${item.u_id}" name="${item.u_email}">${item.u_nickName}</option>\n' +
            '                            </c:forEach>\n' +
            '                        </optgroup>\n' +
            '                        <optgroup label="生产部">\n' +
            '                            <c:forEach var="item" items="${sclist}">\n' +
            '                                <option value="${item.u_id}" name="${item.u_email}">${item.u_nickName}</option>\n' +
            '                            </c:forEach>\n' +
            '                        </optgroup>\n' +
            '                        <optgroup label="质检部">\n' +
            '                            <c:forEach var="item" items="${zjlist}">\n' +
            '                                <option value="${item.u_id}" name="${item.u_email}">${item.u_nickName}</option>\n' +
            '                            </c:forEach>\n' +
            '                        </optgroup>\n' +
            '                    </select>\n' +
            '                </div>\n' +
            '                <label class="col-sm-1 control-label" style="margin: 2.6% 0 2% 2%">职责:</label>\n' +
            '                <div class="col-sm-5" style="margin: 2% 0 2% 0">\n' +
            '                    <textarea class="form-control" rows="2" name="pro_zhize"></textarea>\n' +
            '                </div>';

        $(".pro-content").html(title);
        layui.use('layer', function () {
            layer.open({
                type: 1,
                skin: 'layui-layer-demo',
                closeBtn: 1, //关闭按钮
                anim: 2,
                area: ['65%', '70%'],
                shadeClose: false, //遮罩关闭
                content: title
            });
            $('[name=u_id]').each(function (i) {//获取多个select 选中的值
                $('[name=u_id]').get(i).value = u_idlist[i].u_id;
                $('[name=u_id]').get(i).selected = true;
                $('[name=pro_zhize]').get(i).value = u_idlist[i].details;
            });

            $(".layui-btn").click(function () {
                $(".pro-userlist").html('')
                var count = $('input[id="pro-users-count"]').val();//获取输入的人数
                var html='';
                if(count <= 0){
                    layer.msg('人数不能小于0');
                    return;
                }
                if(count > 8){
                    layer.msg('最多关联8人');
                    return;
                }
                for (var i = 0; i < count; i++) {
                    html += content;
                }
                $(".pro-userlist").html(html);
            })
        });
    }
    function btnUsers() {
        var u_id = [];
        var email = [];
        var details = [];

        //获取select选中的值，和input输入的值。
        $('[name=u_id]').each(function () {//获取多个select 选中的值
            email.push($(this).find("option:selected").attr("name"))
            u_id.push(parseInt($(this).val()));
        });
        $('[name=pro_zhize]').each(function () {//获取多个input
            details.push($(this).val());
        });

        for (var i = 0; i < $('input[id="pro-users-count"]').val(); i++) {
            if (u_id[i] == 0 && (details[i] == "" || details[i] == null || details[i] == undefined)) {
                u_id.splice(i, 1);
                email.splice(i, 1);
                details.splice(i, 1);
                --i;
            }
        }

        //格式验证
        for (var i = 0; i < u_id.length; i++){
            if(u_id[i] == 0 && (details[i] != "" && details[i] != null && details[i] != undefined)){
                layer.msg("请选择相关人员");
                return;
            }
            if(u_id[i] != 0 && (details[i] == "" || details[i] == null || details[i] == undefined)){
                layer.msg("请将职务信息填写完整");
                return;
            }
        }
        var s = u_id.join(",")+",";
        for(var i=0;i<u_id.length;i++) {//判断是否有重复元素
            if(s.replace(u_id[i]+",","").indexOf(u_id[i]+",")>-1) {
                layer.msg("相关人员不能重复")
                return;
            }
        }

        $.ajax({
            url:"${pageContext.request.contextPath}/addProUsers",
            method:"POST",
            data:{
                "u_id":u_id,
                "email":email,
                "details":details,
                "pl_id":pr_id,
                "pl_name":p_name
            },
            success:function (data) {
                if(data == 200){
                    layer.msg("添加成功")
                }else{
                    layer.msg("添加失败，请稍后重试")
                }
            }
        })

    }
</script>
</html>
