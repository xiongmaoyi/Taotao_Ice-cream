<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
  </head>
  
  <body>
    <div class="htmleaf-container">
	<div class="wrapper">
		<div class="container">
			<h1>Taotao ice-cream factory management system</h1>
			
			<form action="appuser_login" method="post">
				<input type="text" id="username" placeholder="Username" name="appuser.username">
				<input type="password" id="password" placeholder="Password" name="appuser.password">
				<button type="submit"  onclick="notNullFunction()">Login</button><s:property value="#request.error"/>
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
$('#login-button').click(function (event) {
	event.preventDefault();
	$('form').fadeOut(500);
	$('.wrapper').addClass('form-success');
});
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
<h1>涛涛雪糕管理系统</h1>
</div>




<script>
function notNullFunction()
{
	var x=document.getElementById("username").value;
	var y=document.getElementById("password").value;
	
	if(x==""||y==""||z=="")
	{
		alert("请输入用户名和密码");
		return false;
	}
}
</script>





  </body>
</html>
