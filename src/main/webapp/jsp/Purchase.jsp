<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    	<tr><td colspan="5">货品购置</td></tr>
    	<tr><td>订单编号</td><td>0001</td><td>日期</td><td colspan="2">2017.2.3</td></tr>
    	<tr><td colspan="5">商品列表 <input type="button" class="button button-rounded button-tiny" value="获取商品"> </td></tr>
    	<tr><th>商品编号</th><th>商品名称</th><th>商品数量</th><th>小计</th><th>操作</th></tr>
    	<tr><td></td><td></td><td></td><td></td><td><input type="checkbox"></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td><input type="checkbox"></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td><input type="checkbox"></td></tr>
    	<tr><td colspan="5" align="right">总计：0</td></tr>
    	<tr><td colspan="5" align="center"><input type="button" class="button button-rounded button-tiny" value ="删除" > <input type="button" class="button button-rounded button-tiny" value ="确认订单" ></td></tr>
    
    
    </table>
    
    </form>
  </body>
</html>
