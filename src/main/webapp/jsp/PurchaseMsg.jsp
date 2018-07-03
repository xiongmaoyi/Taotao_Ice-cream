<%@page import="com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor"%>
<%@page import="com.fasterxml.jackson.databind.util.JSONPObject"%>
<%@page import="com.alibaba.druid.support.json.JSONParser"%>
<%@page import="cn.com.ttxg.pojo.FlowCustom"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>">
<!--  <link href="../css/table.css" rel="stylesheet"> -->
<title>订单信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 引入aewsome图标库 -->
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.css"
	rel="stylesheet">
<script src="${basePath}js/jquery-3.3.1.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.1/js/bootstrap.js"></script>
<style>
body {
	font-family: 微软雅黑;
}
</style>


</head>

<body>

	<!-- ******************html页面********************************** -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3></h3>
			</div>
		</div>
		
	
		
		<div class="row">
			<div class="card" style="margin: auto">
				<!-- <img class="card-img-top" src="/images/pathToYourImage.png"
					alt="Card image cap"> -->
				<div class="card-body">
					<h4 class="card-title">订单信息</h4>
    				<h6 class="card-subtitle mb-2 text-muted">Order Massage</h6>
    				<table class="table table-striped table-borderless" 
					id='msg_table'>
					<tr><td colspan="4">订单编号: <span id="order-id"></span></td></tr>
					<tr><td colspan="4">订单类型: <span id="order-type"></span></td></tr>
					<tr><td colspan="4">商品列表</td></tr>
					<tr><td>商品编号</td><td>商品名称</td><td>数量</td><td>小计</td></tr>
					<tbody id="flows_tbody">
					</tbody>
					
					
					<tr><td colspan="4" align="right">总计：<span id="total-money"></span> 元</td></tr>
					<tr><td colspan="2">处理人：<span id="user-name"></span></td><td colspan="2">日期：<span id="order-date"></span></td></tr>
					
					
					</table>
					
					<p class="card-text"><span id="order-remarks"></span></p>
					<a href="#!" class="btn btn-primary">返回</a>
				</div>
			</div>

		</div>

	</div>
	<!-- ***************************************************************************************************************** -->


	<!-- ***************************************************************************************************************** -->



	<script>
		//--------------------------------------------刷新页面入口--------------------------------------------------------
		$(function() {
			var orderid = <%= request.getParameter("orderid")%>
  			console.log(orderid);			
			$("#order-id").html(orderid);
			getOrderById(orderid);
		});
		
		function getOrderById(orderid){
			$.ajax({
				url : "/TTXG/findOrderById",
				data : {"orderid":orderid},
				type : "GET",
				success : function(result) {
					console.log(result);
					buildTable(result);
				}
				
			});	
		}
		function buildTable(result){
			
			if(result.extend.orderCustoms[0].ordertype==1){
				$("#order-type").html(" 进货");
			}else if(result.extend.orderCustoms[0].ordertype==2){
						$("#order-type").html(" 销售");
			}
					
			$("#total-money").html(result.extend.orderCustoms[0].ordermoney);
			$("#user-name").html(result.extend.orderCustoms[0].user.username);
			if(result.extend.orderCustoms[0].orderremarks!=null){
				$("#order-remarks").html("备注："+result.extend.orderCustoms[0].orderremarks);
			}
			
			var newDate = new Date(result.extend.orderCustoms[0].orderdate);			
			$("#order-date").html(newDate.toLocaleDateString());
			
			
			$.each(result.extend.orderCustoms[0].flows, function(i, item) {
				var goodsid_td = $("<td></td>").append(item.goodsid);
				var goodsname_td = $("<td></td>").append(item.goods.goodsname);
				var goodsnumber_td = $("<td></td>").append(item.goodsnumber);
				var subtotal_td = $("<td></td>").append(item.subtotal+" 元");
				
				$("<tr></tr>").append(goodsid_td)
							.append(goodsname_td)
							.append(goodsnumber_td)
							.append(subtotal_td)
							.appendTo("#flows_tbody");	
			});
			
			
			
		}
		
	
	</script>











