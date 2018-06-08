<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	
	

</head>

<body>
	<form action="" method="post" id="gradeForm">
		<table border="1" align="center">
			<tr>
				<td>选择</td>
				<td>成绩号</td>
				<td>学号</td>
				<td>班级号</td>
				<td>成绩</td>
				<td>考试时间</td>
				<td>点击修改</td>
			</tr>
			<c:forEach items="${gradeList}" var="Grade">
				<tr>
					<td><input type="checkbox" value="${Grade.gno}" name="gnos"></td>
					<td>${Grade.gno}</td>
					<td>${Grade.studid}</td>
					<td>${Grade.courseid}</td>
					<td>${Grade.grade}</td>
					<td><fmt:formatDate value="${Grade.testtime}"  pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					<td><a
						href="/SSM_ALL/Grade/showUpdateGrade.action?gno=${Grade.gno}">修改</a></td>
				</tr>
			</c:forEach>
			<tr><td colspan="7" align="center"><input type="button" value="delete" id="delButton"></td></tr>
		</table>

	</form>


	<script>
		$(function() {
			//console.log(123);
			$("#delButton").click(function() {
				var url = '/SSM_ALL/Grade/deleteGrades.action';
				var $form = $("#gradeForm")
				$form.prop("action", url);
				$form.submit();
			});
			
			
			
			
		});
	</script>
</body>
</html>
