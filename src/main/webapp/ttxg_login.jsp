<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>用户登陆</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.css"
	rel="stylesheet">
<script src="${basePath}js/jquery-3.3.1.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.1/js/bootstrap.js"></script>
</head>

<body>
	<div class="htmleaf-container" id="ctctn">
		<div
		  style="text-align:center;margin:0 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000;padding: 50px">
			<h1>涛涛雪糕管理系统</h1>
		</div>
		<div class="wrapper">
			<div class="container">
				<h1>Taotao ice-cream factory management system</h1>

				<form action="loginByUser" method="post">
					<input type="text" id="username" placeholder="Username"
						name="username"> <input type="password" id="password"
						placeholder="Password" name="password">
					<button type="submit" class="login-button">Login</button>
					<br>
					<br>
					<a href="user/logout"><span class="badge badge-info">Logout</span></a>
				</form>

			</div>

			<ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>

	<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script>
		$('#login-button').click(function(event) {
			event.preventDefault();
			$('form').fadeOut(500);
			$('.wrapper').addClass('form-success');
		});
	</script>

	




	<script>
		function notNullFunction() {
			var x = document.getElementById("username").value;
			var y = document.getElementById("password").value;
	
			if (x == "" || y == "" || z == "") {
				alert("请输入用户名和密码");
				return false;
			}
		}
		
		$(function(){

			$("div").css("height","100%");

		})
		
		
		
		
	</script>





</body>
</html>
