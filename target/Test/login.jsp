<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>	
<head>
<title>问题管理系统</title>
	<meta charset="utf-8">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
 <!--SIGN UP-->
 <h1>问题管理系统</h1>
<div class="login-form">
	<div class="close"> </div>
		<div class="head-info">
			<label class="lbl-1"> </label>
			<label class="lbl-2"> </label>
			<label class="lbl-3"> </label>
		</div>
			<div class="clear"> </div>
	<div class="avtar">
		<img src="${pageContext.request.contextPath}/images/avtar.png" />
	</div>
			<form>
					<input type="text" class="text" id="name">
						<div class="key">
					<input type="password" id="password">
						</div>
			</form>
	<div class="signin">
		<input type="submit" id="btn" value="登录" >
	</div>
</div>
 <script type="text/javascript">


     document.onkeydown = function(e){
         if(e.keyCode == 13){
             login();
         }
     }

     $(function(){
         $("#btn").click(function(){
             login();
         })
     });

     function login() {
         layui.use('layer', function(){
			 var name = $("#name").val();
			 var pwd = $("#password").val();
			 if(name == null || name == undefined || name == ""){
				 layer.msg("请输入用户名");
				 return;
			 }
			 if(pwd == null || pwd == undefined || pwd == ""){
				 layer.msg("请输入密码");
				 return;
			 }
			 $.ajax({
				 url:'${pageContext.request.contextPath}/login',
				 method:"POST",
				 data:{"u_name":name,"password":pwd},
				 success:function (data) {
					 if(data == "back"){
						 layer.msg("用户名或密码错误",{icon:2})
						 return;
					 }
					 window.location.href = "${pageContext.request.contextPath}/myProblem";
				 }
			 })
         });
     }
 </script>
</body>
</html>