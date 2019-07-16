<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>404</title>
		<link rel="icon" href="${pageContext.request.contextPath}/images/avtar.png" type="image/x-icon"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/404.css">
	</head>
<body class="error-404">
<div id="doc_main">	
	<section class="bd clearfix">
		<div class="module-error">
			<div class="error-main clearfix">
				<div class="label"></div>
				<div class="info">
					<h3 class="title">啊哦，你所访问的页面不存在了，可能是炸了</h3>
					<div class="reason">
						<p>可能的原因：</p>
						<p>1.手抖打错了。</p>
						<p>2.链接过了保质期。</p>
					</div>
					<div class="oper">
						<p><a href="javascript:history.go(-1);">返回上一级页面&gt;</a></p>
						<p><a href="${pageContext.request.contextPath}/myProblem">首页&gt;</a></p>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

</body></html>
