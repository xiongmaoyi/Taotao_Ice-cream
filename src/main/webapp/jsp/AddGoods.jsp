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
    <link href="../css/table.css" rel="stylesheet">
    <title>My JSP 'Purchase.jsp' starting page</title>
    
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
  	<form>
    <table>
    	<tr><td colspan="4">货品购置</td></tr>
    	<tr><td>搜索</td><td colspan="2"><input type="text"></td><td><input type="button" value = "搜索" class="button button-rounded button-tiny"></td></tr>
    	
    	<tr><th>商品编号</th><th>商品名称</th><th>商品进价</th><th>操作</th></tr>
    	<tr><td></td><td></td><td></td><td><input type="checkbox"></td></tr>
    	<tr><td></td><td></td><td></td><td><input type="checkbox"></td></tr>
    	<tr><td></td><td></td><td></td><td><input type="checkbox"></td></tr>
    	
    	<tr><td>数量</td><td><input type="text" ></td>  <td colspan="2" align="center"> <input type="button" class="button button-rounded button-tiny" value ="添加" ></td></tr>
    
    
    </table>
    
    </form>
  </body>
</html>
