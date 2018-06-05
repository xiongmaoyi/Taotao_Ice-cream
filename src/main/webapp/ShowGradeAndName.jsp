<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="cn.com.ttxg.pojo.Grade"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'ShowGrade.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
	$(function(){
		$("#selectGrade").click(function(){
			var url ="/SSM_ALL/Grade/showGradeByName.action";
			$("#form_1").prop("action",url);
			$("#form_1").submit();
		
		});
	});

</script>

</head>

<body>
	<form action="" method="post" id="form_1">
		<table border="1" align="center">
			<tr><td><input type="text" name="studname" id="studname"><input type="button" id="selectGrade" value="查询"></td></tr>
			<tr>
				<td>成绩号</td>
				<td>姓名</td>
				<td>班级号</td>
				<td>成绩</td>
				<td>考试时间</td>
				<td>点击修改</td>
			</tr>
			<c:forEach items="${gradeCustomList}" var="l">
				<tr>
					<td>${l.gno}</td>
					<td>${l.studname}</td>
					<td>${l.courseid}</td>
					<td>${l.grade}</td>
					<td><fmt:formatDate value="${l.testtime}"  pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					<td><a
						href="/SSM_ALL/Grade/showUpdateGrade.action?gno=${l.gno}">修改</a></td>
				</tr>
			</c:forEach>
		</table>

	</form>
</body>
</html>
