<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="cn.com.ttxg.pojo.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'ShowUser.jsp' starting page</title>

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
	<table border="1">
		<tr>
			<td>用户ID</td>
			<td>用户名</td>
			<td>生日</td>
			<td>地址</td>
		</tr>
		<c:forEach items="${userList}" var="l">
		<tr>
			<td>${l.id}</td>
			<td>${l.userName}</td>
			<td>${l.birthday}</td>
			<td>${l.address}</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>
