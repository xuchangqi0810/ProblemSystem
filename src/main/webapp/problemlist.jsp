<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<meta charset="utf-8">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <title>全部问题</title>
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

        .content{
            width: 100%;
            height: 100%;
        }

        i:hover{
            color: red;
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
<div class="zy">

    <div class="content" style="text-align: center">
        <form class="layui-form" action="" style="">
            <table class="table table-hover" style="margin-left: 1%;width: 98%">
                <caption>全部问题</caption>
                <thead>
                <tr>
                    <div class="layui-form-item" pane="">
                        <div class="layui-input-block">
                            <th colspan="13">
                                <input type="radio" value="0" name="like1" lay-filter="primary" title="全部" <c:if test="${state == 0}">checked="checked"</c:if>>
                                <input type="radio" value="1" name="like1" lay-filter="primary" title="未开始" <c:if test="${state == 1}">checked="checked"</c:if>>
                                <input type="radio" value="2" name="like1" lay-filter="primary" title="进行中" <c:if test="${state == 2}">checked="checked"</c:if>>
                                <input type="radio" value="3" name="like1" lay-filter="primary" title="审核中" <c:if test="${state == 3}">checked="checked"</c:if>>
                                <input type="radio" value="4" name="like1" lay-filter="primary" title="已完成" <c:if test="${state == 4}">checked="checked"</c:if>>
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
                <tbody style="font-size: 14px">
                <c:forEach var="item"   items="${problem}">
                    <tr>
                        <th>${item.pl_id}</th>
                        <th onclick="showPro(${item.pl_id})" style="cursor:pointer" title="${item.pl_name}"><span style="padding: 5px;border-radius: 10px;background-color: #007DDB;font-size:12px;color: white">${item.pt_type.t_name}</span>&nbsp;${item.pl_name}</th>
                        <th>${item.pl_feedback}</th>
                        <th>${item.pt_user.u_nickName}</th>
                        <th>${item.pl_fsDate}</th>
                        <c:if test="${item.pl_yqDate == '0001-01-01'}"><th></th></c:if>
                        <c:if test="${item.pl_yqDate != '0001-01-01'}"><th>${item.pl_yqDate}</th></c:if>
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
                                        剩余${item.timeout}天
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
                            <c:if test="${item.u_id == pt_user.u_id || pt_user.role.id < 3}">
                                <i class="layui-icon layui-icon-edit" title="编辑" style="font-size: 20px;cursor:pointer;" onclick="getByIdInUpdate(${item.pl_id})"></i>
                                <i class="layui-icon <c:if test="${item.pl_state != 1 || item.pl_yqDate == '0001-01-01' || item.u_id == null }">layui-disabled</c:if> layui-icon-play"  title="开始" style="font-size: 20px;cursor:pointer;" <c:if test="${item.pl_state == 1 && item.pl_yqDate != '0001-01-01'}">onclick="proStart(${item.pl_id})"</c:if> ></i>
                                <i class="layui-icon layui-icon-log"  title="工时" style="font-size: 20px;cursor:pointer" onclick="proInfos(${item.pl_id})"></i>
                                <i class="layui-icon <c:if test="${item.pl_state == 3 || item.pl_state == 4 || item.pl_yqDate == '0001-01-01' || item.u_id == null }">layui-disabled</c:if> layui-icon-ok" title="完成" style="font-size: 20px;cursor:pointer" <c:if test="${(item.pl_state == 1||item.pl_state == 2) && item.pl_yqDate != '0001-01-01'}">onclick="proComplete(${item.pl_id})"</c:if> ></i>
                            </c:if>

                            <c:if test="${pt_user.role.id <3}">
                                <i class="layui-icon <c:if test="${item.pl_state != 3}">layui-disabled</c:if> layui-icon-survey" title="审批" style="font-size: 20px;cursor:pointer" <c:if test="${item.pl_state == 3}">onclick="proExamine(${item.pl_id},${item.pl_state})"</c:if> ></i>
                            </c:if>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
        <div id="laypage" style=""></div>
    </div>
</div>
</body>
<script type="text/javascript">
    layui.use('form',function () {
        var form = layui.form;
        form.on('radio(primary)', function (data) {
            location.href = "${pageContext.request.contextPath}/problemList?state="+$(this).val();
            var index = layer.load(0, {shade: false});
            form.render();
        });
    })
    layui.use('element', function(){
        var element = layui.element;
    });

    layui.use('laypage', function(){
        layui.laypage.render({
            elem: 'laypage',//元素ID 不要加# 并且只能是ID
            count: ${page.totalRecord},
            curr: ${page.pageNum},
            limit : ${page.pageSize},
            limits: [10,15,],//可选每页显示数
            layout: ['prev', 'page','limit','next'],
            jump: function(obj, first){
                if(first){ return ; }//如果是第一次不执行
                layer.load(0, {shade: false});
                var url = '${pageContext.request.contextPath}/problemList?pageNum='+obj.curr+'&pageSize='+obj.limit+'&state='+${state};
                layer.load(0, {shade: false});//加载框
                window.location.href = url;
            }
        });
    });

    window.onload = function(){

        var aLi = document.getElementsByTagName('tr');
        for(var i=0;i<aLi.length;i++){
            if(i%2==0){
                aLi[i].style.background = '';
            }
            else{
                aLi[i].style.background = '#f9f9f9';
            }
        }
    }

    function showPro(pl_id) {
        $.ajax({
            url:"${pageContext.request.contextPath}/getByIdInProblem",
            method:"get",
            data:{"pl_id":pl_id},
            success:function (data) {
                layui.use('layer',function () {
                    layer.open({
                        type: 2,
                        title: '问题详情',
                        shadeClose: false,
                        shade: 0.8,
                        area: ['65%', '80%'],
                        content: '${pageContext.request.contextPath}/problemInfo.jsp', //iframe的url
                        success:function (layero,index) {
                            var iframe = window['layui-layer-iframe' + index];
                            iframe.child(data)
                        }
                    });
                })
            }
        })
    }//查看问题信息
    function proStart(pl_id) {
        layui.use('layer', function(){
            var layer = layui.layer;
            layer.confirm('问题将标记为"进行中"，您确定吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){//确定
                document.write("<form action='${pageContext.request.contextPath}/ProStart' class='proform' method='post'>")
                document.write("<input type='hidden' value="+pl_id+" name='pl_id'/>");
                document.write("</form>")
                $(".proform").submit();
            }, function(){//取消

            });
        });
    }

    function proComplete(pl_id) {//完成
        layui.use('layer', function(){
            layer.confirm('问题将标记为"审核中"，并由上级领导确认，您确定吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){//确定
                $.ajax({
                    url:"${pageContext.request.contextPath}/ProComplete",
                    method:"POST",
                    data:{
                        "pl_id":pl_id,
                        "state":3,
                    },
                    success:function (data) {
                        layer.msg("修改成功",{icon:1});
                        window.setTimeout(function(){
                            history.go(0);
                        }, 2000);

                    }
                })
            }, function(){//取消

            });
        })
    }
    function proInfos(pl_id){
        $.ajax({
            url:"${pageContext.request.contextPath}/getByIdInProblem",
            method:"GET",
            data:{"pl_id":pl_id},
            success:function (data) {
                if(data.pl_state == 1){
                    layui.use('layer',function(){
                        layer.msg("您还没有开始解决问题，请开始后重试");
                        return;
                    })
                }else {
                    var content = '<div class="main" style="padding: 20px;width: 100%">\n' +
                        '    <table class="table table-form table-fixed" id="tables" style="margin-top:5%">\n' +
                        '</table>\n' +
                        '</div>'
                    $.ajax({
                        url:"${pageContext.request.contextPath}/getByIdInProblem",
                        method:"GET",
                        data:{"pl_id":pl_id},
                        async:false,
                        success:function (data) {
                            if(data.pl_state == 2 || data.pl_state == 1){
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
                                    '        <td class="col-sm-1"><input type="text" name="hours" value="" class="form-control text-center" autocomplete="off">\n' +
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
                                    '        <td class="col-sm-1"><input type="text" name="hours" value="" class="form-control text-center" autocomplete="off">\n' +
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
                    layui.use('layer',function () {
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
                        url:"${pageContext.request.contextPath}/getByIdProInfo",
                        method:"GET",
                        data:{"pl_id":pl_id},
                        success:function (data) {
                            if(data.length != 0){
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
                                $.each(data,function(i,item){
                                    if(item.state == 2){
                                        html += '<tbody>' +
                                            '<tr>\n' +
                                            '        <td>'+j+'<input type="hidden" name="pl_id" value="'+item.pl_id+'"/>\n' +
                                            '</td>\n' +
                                            '        <td class="col-sm-2">'+item.proDate+'\n' +
                                            '</td>\n' +
                                            '        <td class="col-sm-1">'+item.hours+'\n' +
                                            '</td>\n' +
                                            '        <td class="text-left">'+item.remarks+'\n' +
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
        for (var i = 0; i < pl_id.length;i++){
            pl_ids.push(pl_id[i].value);
        }
        var proDates = [];
        for (var i = 0; i < proDate.length;i++){
            proDates.push(proDate[i].value);
        }
        var hourss = [];
        for (var i = 0; i < hours.length;i++){
            hourss.push(hours[i].value);
        }
        var remarkss = [];
        for (var i = 0; i < remarks.length;i++){
            remarkss.push(remarks[i].value);
        }
        //非空判断
        if(proDate[0].value != null && proDate[0].value != undefined && proDate[0].value != ""){
            if(hours[0].value == null || hours[0].value == undefined || hours[0].value == ""){
                layer.msg('请填写“工时”');
                return;
            }
        }
        if(hours[0].value != null && hours[0].value != undefined && hours[0].value != ""){
            if(proDate[0].value == null || proDate[0].value == undefined || proDate[0].value == ""){
                layer.msg('请填写“日期”');
                return;
            }
        }
        if(proDate[1].value != null && proDate[1].value != undefined && proDate[1].value != ""){
            if(hours[1].value == null || hours[1].value == undefined || hours[1].value == ""){
                layer.msg('请填写“工时”');
                return;
            }
        }
        if(hours[1].value != null && hours[1].value != undefined && hours[1].value != ""){
            if(proDate[1].value == null || proDate[1].value == undefined || proDate[1].value == ""){
                layer.msg('请填写“日期”');
                return;
            }
        }

        $.ajax({
            url:"${pageContext.request.contextPath}/AddProInfos",
            method:"POST",
            data:{
                "pl_id":pl_ids,
                "proDate":proDates,
                "hours":hourss,
                "remarks":remarkss,
                "state":2,
                "method":0
            },
            cache:false,
            async:false,
            success:function (data) {
                location.href = "${pageContext.request.contextPath}/myProblem";
            }
        });
    }
    function getByIdInUpdate(pl_id) {
        location.href = "${pageContext.request.contextPath}/getByIdInUpdate?pl_id="+pl_id;
    }

    function proExamine(pl_id,pl_state) {
        if(pl_state == 3 || pl_state == 2){
            layui.use('layer', function(){
                layer.confirm('问题将标记为"已完成"，您确定吗？', {
                    btn: ['同意','不同意'] //按钮
                }, function(){//确定
                    $.ajax({
                        url:"${pageContext.request.contextPath}/updateStateExamine",
                        method:"POST",
                        data:{
                            "pl_id":pl_id,
                            "pl_state":4
                        },
                        cache:false,
                        async:false,
                        success:function (data) {
                            if(data == 1){
                                layer.msg('审批成功', {icon: 1});
                                window.setTimeout(function(){
                                    location.href = "${pageContext.request.contextPath}/problemList";
                                }, 2000);
                            }
                        }
                    })
                }, function(){//取消
                    layer.confirm('请填写您的反馈意见<br/><textarea class="form-control" rows="3" name="describe"></textarea>', {
                        btn: ['确定','取消'], //按钮
                    }, function() {
                        var backcontent = $("[name=describe]").val();
                        if(backcontent == null || backcontent == "" || backcontent == undefined){
                            $("[name=describe]").attr("placeholder","反馈不许为空")
                            return;
                        }
                        $.ajax({
                            url:"${pageContext.request.contextPath}/backProblem",
                            method:"POST",
                            data:{
                                "pl_id":pl_id,
                                "remarks":backcontent
                            },
                            cache:false,
                            async:false,
                            success:function (data) {
                                layer.msg('反馈成功', {icon: 1});
                                history.go(0);
                            }
                        })
                    }, function() {

                    });
                });
            })
        }else if(pl_state == 1){
            layer.msg("请在开始问题后重试")
            return;
        }
    }

</script>
</html>
