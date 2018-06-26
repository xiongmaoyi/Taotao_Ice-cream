<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
   
  	<p>
    <div align="center">
    <input type="button" value="showuser" 
				onclick="javascrtpt:window.location.href='/SSM_ALL/showUserView.action'">
    </div>
    
    <div align="center">
    <input type="button" value="查询成绩" 
				onclick="javascrtpt:window.location.href='/SSM_ALL/Grade/showGrade.action'">
    </div>
    <div align="center">
    <input type="button" value="登陆页面" 
				onclick="javascrtpt:window.location.href='/TTXG/ttxg_login.jsp'">
    </div>
    <div align="center">
    <input type="button" value="zhuye" 
				onclick="javascrtpt:window.location.href='/TTXG/ttxg_main.jsp'">
    </div>
    <div align="center">
    <input type="button" value="仓库" 
				onclick="javascrtpt:window.location.href='/TTXG/jsp/InStorehouse.jsp'">
    </div>
    </p>
  </body>
</html>
