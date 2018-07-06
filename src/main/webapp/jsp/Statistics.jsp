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
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>">
<!--  <link href="../css/table.css" rel="stylesheet"> -->
<title>数据统计</title>

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
<!-- 引入jquery ui -->
<link href="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.js"></script>
<!-- 引入frappe-charts 图表插件 -->
<script src="https://cdn.bootcss.com/frappe-charts/1.1.0/frappe-charts.min.iife.js"></script>
<link href="https://cdn.bootcss.com/frappe-charts/1.1.0/frappe-charts.min.css" rel="stylesheet">

<link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<style>
body {
	font-family: 微软雅黑;
}
</style>


</head>

<body>


	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="shadow-lg p-3 mb-5 bg-white rounded" align="center">
				<h6>
				总收入: <span id="total-in" class="badge badge-secondary fa fa-rmb"></span> |
				总支出: <span id="total-out" class="badge badge-secondary fa fa-rmb"></span> |
				总利润: <span id="total-my" class="badge badge-secondary fa fa-rmb"></span> |
				总销售订单数：<span id="total-sale" class="badge badge-secondary fa fa-rmb"></span> |
				总进货订单数：<span id="total-purchase" class="badge badge-secondary fa fa-rmb"></span>
				</div>
</h6>
			</div>
		</div>
		<div class="row"></div>
	
			<div class="card shadow-lg p-3 mb-5 bg-white rounded">
				<div class="card-body">
					
						<div id="chart01"></div>
					
				</div>
			</div>
		<div class="row"></div>
			<!-- <div class="card shadow-lg p-3 mb-5 bg-white rounded">
				<div class="card-body">
						<div id="chart02"></div>
				</div>
			</div> -->
			
		</div>



		
			
			
			
			
		

		<div class="row"></div>
	
	<!-- ***************************************************************************************************************** -->


	<!-- ***************************************************************************************************************** -->



	<script>
		//--------------------------------------------刷新页面入口--------------------------------------------------------

	var labelsdata = new Array();
	var purchasemoney = new Array();
	var salemoney = new Array();
	
$(function() {
		findThreeTotal();
		findThreeTotalWithMonths();
		const data_01 = {
			labels :labelsdata,//labelsdata,
			datasets : [
				{
					name : "收入",
					type : "bar",
					values : salemoney,
				},
				{
					name : "支出",
					type : "bar",
					values : purchasemoney,
				}
			]
		}
	
		const chart_1 = new frappe.Chart("#chart01", { // or a DOM element,
			// new Chart() in case of ES6 module with above usage
			title : "近月雪糕营收",
			data : data_01,
			type : 'bar', // or 'bar', 'line', 'scatter', 'pie', 'percentage'，axis-mixed
			height : 250,
			colors : [ '#7cd6fd', '#743ee2' ]
		})
	
	
	
	
	

	
}); 
	
	function findThreeTotal(){
		$.ajax({
				url : "/TTXG/findThreeTotal",
				//data : {"pn":pn,"condition":condition,"searchType":searchType},
				type : "GET",
				success : function(result) {
					console.log(result);
					var totalIn = result.extend.threeTotal[1].summoney;
					var totalOut = result.extend.threeTotal[0].summoney;
					var totalMy = totalIn - totalOut;
					var totalSale = result.extend.threeTotal[1].ordercount;
					var totalPurchase = result.extend.threeTotal[0].ordercount;
					$("#total-in").text(totalIn);
					$("#total-out").text(totalOut);
					$("#total-my").text(totalMy);
					$("#total-sale").text(totalSale);
					$("#total-purchase").text(totalPurchase);
				}
		});
	}	

	
	
	
	function findThreeTotalWithMonths(){
		$.ajax({
				url : "/TTXG/findThreeTotalWithMonths",
				type : "GET",
				success : function(result) {
					console.log(result);
					
					$.each(result.extend.chartBar, function(i,item) {
						//向列表开头插入元素		
						labelsdata.unshift(item.time);
						purchasemoney.unshift(item.summoneyp);
						 if(item.summoneys==undefined || item.summoneys==null){
							salemoney.unshift('0');	
						}else{
							salemoney.unshift(item.summoneys);
						}	 
						
					});
		console.log(salemoney);
		console.log(purchasemoney);
		console.log(labelsdata);
				}
		});
	}	
		

	



	</script>
</body>
</html>





