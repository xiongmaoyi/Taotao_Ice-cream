<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="cn.com.g12.pojo.Grade"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UpdateGrade.jsp' starting page</title>
    
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
    <form action="/SSM_ALL/Grade/updateGradeById.action" method="post">
		<c:if test="${allErrors!=null}">
			<c:forEach items="${allErrors}" var="error">
				${error.defaultMessage}<br>
			</c:forEach>
		</c:if>
		<table border="1" align="center">
		<tr><td>成绩号</td><td><input type="text"  readonly  unselectable="on" name="gno" value="${Grade.gno}"/></td></tr>
		<tr><td>学号</td><td><input type="text" readonly  unselectable="on" name="studid" value="${Grade.studid}"/></td></tr>
		<tr><td>课程号</td><td><input type="text" readonly  unselectable="on" name="courseid" value="${Grade.courseid}"/></td></tr>
		<tr><td>成绩</td><td><input type="text" name="grade" value="${Grade.grade}"/></td></tr>	
		<tr><td>考试时间</td><td><input type="text" name="testtime" value="<fmt:formatDate value="${Grade.testtime}"  pattern="yyyy-MM-dd HH:mm:ss"/>"/></td></tr>	
		<tr><td colspan="2" align="center"><input type="submit" value="提交"><input type="button" value="重置"></td></tr>	
		</table>    
    
    </form>
  </body>
</html>
