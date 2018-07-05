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
<title>已接订单</title>

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

<link href="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.js"></script>
<style>
body {
	font-family: 微软雅黑;
}
</style>


</head>

<body>
<div style="display:none;">
<!-- 登录用户名隐藏域 -->
	<span id="login-name"><shiro:principal/></span>
</div>
	<!-- -----------------------------------------订单查看的modal框--------------------------------------- -->
	<div class="modal fade" id="seeOrderModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModal3Label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">订单详情</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
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
					<tr><td colspan="4">客户姓名: <span id="customer-name"></span></td></tr>
					<tr><td colspan="4">客户电话: <span id="customer-phone"></span></td></tr>
					
					<tr><td colspan="4">客户地址: <span id="customer-address"></span></td></tr>
					
					<tr><td>商品编号</td><td>商品名称</td><td>数量</td><td>小计</td></tr>
					<tbody id="flows_tbody">
					</tbody>
					
					
					<tr><td colspan="4" align="right">总计：<span id="total-money">0</span> 元</td></tr>
					<tr><td colspan="2">处理人：<span id="user-name"></span></td><td colspan="2"><span id="custom-name"></span></td></tr>
					<tr><td colspan="2"><span></span></td><td colspan="2" align="right">日期：<span id="order-date"></span></td></tr>
					
					</table>
					
					<p class="card-text"><span id="order-remarks"></span></p>
					
				</div>
			</div>

		</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					
				</div>
			</div>
		</div>
	</div>







	<!-- -----------------------------------------商品修改的modal框--------------------------------------- -->


	<div class="modal fade" id="updateOrderModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModal3Label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">修改订单</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">

						<div class="row">
							<div class="card" style="margin: auto">
								<!-- <img class="card-img-top" src="/images/pathToYourImage.png"
					alt="Card image cap"> -->
								<div class="card-body">
									<h4 class="card-title">订单信息</h4>
									<h6 class="card-subtitle mb-2 text-muted">Order Massage</h6>
									<table class="table table-striped table-borderless"
										id='msg_table'>
										<tr>
											<td colspan="4">订单编号: <span id="order-id2"></span></td>
										</tr>
										<tr>
											<td colspan="4">订单类型: <span id="order-type2"></span></td>
										</tr>
										
										<tbody id="order-state">
										
										</tbody>
										
										<tr>
											<td colspan="4">商品列表</td>
										</tr>
										<tr>
											<td>商品编号</td>
											<td>商品名称</td>
											<td>数量</td>
											<td>小计</td>
										</tr>
										<tbody id="flows_tbody2">
										</tbody>


										<tr>
											<td colspan="4" align="right">

												<div class="input-group">
													<div class="input-group-prepend">
														<span class="input-group-text">总计</span>
													</div>
													<input type="text" style="text-align: right" name="ordermoney" id="total-money2" value="0" class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">￥</span>
													</div>
												</div>


											</td>

										</tr>
										
										<tr>
											<td colspan="2">处理人：<span id="user-name2"></span></td>
											<td colspan="2">日期：<span id="order-date2"></span></td>
										</tr>


									</table>
									
									<p class="card-text">
									<textarea class="form-control" id="order-remarks2" name="orderremarks" rows="3" maxlength="400" >

									</textarea>
									</p>

								</div>
							</div>

						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="updateOrder_btn">修改</button>
				</div>
			</div>
		</div>
	</div>












	<!-- *************yi*************************************** -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>已接订单</h3>

			</div>
		</div>
		<div class="row"></div>


		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<!-- <form> -->
				<table class="table table-striped table-hover table-bordered"
					id='goods_table'>

					<thead>
						<tr>
							<td colspan="9" align="center">已接订单</td>
						</tr>

						<tr>
							<td colspan="1">订单列表</td>
							<td colspan="2"><select class="custom-select"
								id="searchType" name="searchType">
									<option selected value="1">按订单编号搜索</option>
									<option value="2">按日期搜索</option>
									<option value="3">按订单状态搜索</option>
							
							

							</select></td>

							<td id="search-condition" colspan="6">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="请输入订单编号" id="searchText">
									<div class="input-group-append">
										<button class="btn btn-success search-btn" type="button" id="searchBtn">
											<i class="fa fa-search fa-lg"></i> 搜索订单
										</button>
									</div>
								</div> 

								



							</td>
						</tr>
						<tr>
							
							<th scope="row">编号</th>
							<th scope="row">类型</th>
							<th scope="row">客户</th>
							<th scope="row">金额</th>
							<th scope="row">日期</th>
							<th scope="row">状态</th>
							<th scope="row">处理</th>
							<th scope="row">操作</th>
						</tr>
					</thead>

					<tbody id="order_tbody">


					</tbody>

					<tr style="background-color: white">
						<td colspan="9" align="center">
							
						
						</td>
					</tr>

				</table>

				<!-- </form> -->
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<div class="col-md-6" id="page_info_col"></div>
			<div class="col-md-6" id="page_nav_col">
				<nav aria-label="Page navigation example">
				<ul class="pagination" id="page_ul">

				</ul>
				</nav>
			</div>
		</div>

	</div>
	<!-- ***************************************************************************************************************** -->


	<!-- ***************************************************************************************************************** -->



	<script>
		//--------------------------------------------刷新页面入口--------------------------------------------------------
		$(function() {
			toPage(1);
			//$("#search-date").datepicker();	
			
		});
		
		//转到第pn页
		function toPage(pn) {
			var username = $("#login-name").html();
			$.ajax({
				url : "/TTXG/findOrderByDelivery",
				data : {"pn":pn,"condition":condition,"searchType":searchType,"date1":date1,"date2":date2,"delivery":username},
				type : "GET",
				success : function(result) {
					console.log(result);
				 	buid_orders_table(result);
					buid_page_info(result);
					buid_page_nav(result); 
					console.log("toPage++++"+result.extend.page.pageNum);
				}
			});
		}
		//---------------------------------------------全局变量---------------------------------------------------------
			//声明全局变量 搜索条件 搜索方式
			var condition;
			var searchType;	
			var username;
			var userid;		
			var currentPage;	
			var date1;
			var date2;	
		//---------------------------------------------查询---------------------------------------------------------
		
		//查询类型转换
		$("#searchType").change(function(){
			
			var optionValue = $("#searchType option:selected").val();
			
			console.log(optionValue);
			if(optionValue==1){
				$("#search-condition").empty().append('<div class="input-group"><input type="text" class="form-control" placeholder="请输入订单编号" id="searchText"><div class="input-group-append"><button class="btn btn-success search-btn" type="button" id="searchBtn"><i class="fa fa-search fa-lg"></i> 搜索订单</button></div></div>');

				//值变化时候放入searchtext变量
				searchType=1;
			}else if(optionValue==2){
				$("#search-condition").empty().append('<div class="input-group input-daterange"><input type="text" class="form-control search-date" id="first-date" ><div class="input-group-append"><span class="input-group-text">to</span></div><input type="text" id="last-date" class="form-control search-date"><div class="input-group-append"><button class="btn btn-success search-btn" type="button" id="searchBtn"><i class="fa fa-search fa-lg"></i> 搜索订单</button></div></div>');
				//日期控件初始化
				$(".search-date").datepicker({
					showAnim: 'slideDown',//show 默认,slideDown 滑下,fadeIn 淡入,blind 百叶窗,bounce 反弹,Clip 剪辑,drop 降落,fold 折叠,slide 滑动
					minDate: '-5y',//最小日期，可以是Date对象，或者是数字（从今天算起，例如+7），或者有效的字符串('y'代表年, 'm'代表月, 'w'代表周, 'd'代表日, 例如：'+1m +7d')。
					maxDate: +1,//最大日期，同上
					defaultDate : +4, //默认日期，同上
					duration : 'fast',//动画展示的时间，可选是"slow", "normal", "fast",''代表立刻，数字代表毫秒数
					firstDay : 1 ,//设置一周中的第一天。默认星期天0，星期一为1，以此类推。
					nextText : '下一月',//设置“下个月”链接的显示文字。鼠标放上去的时候
					prevText : '上一月',//设置“上个月”链接的显示文字。
					showButtonPanel: true,//是否显示按钮面板 
					currentText : '今天',//设置当天按钮的文本内容，此按钮需要通过showButtonPanel参数的设置才显示。
					gotoCurrent : false,//如果设置为true，则点击当天按钮时，将移至当前已选中的日期，而不是今天。
					dateFormat: "yy-mm-dd"
				
				});	
				searchType=2;
			}else if(optionValue==3){
				$("#search-condition").empty().append('<div class="input-group"><input type="text" class="form-control" placeholder="请输入状态码  配送中：2，已完成：3  " id="searchText"><div class="input-group-append"><button class="btn btn-success search-btn" type="button" id="searchBtn"><i class="fa fa-search fa-lg"></i> 搜索订单</button></div></div>');
				searchType=3;
			}
			
			
		});
		//查询的值发生变化时放入condition变量
		
		
		$(document).on("input porpertychange change","#searchText",function(){
			console.log("condition改变");
			condition=$("#searchText").val();
			
		});
		
		
		
		
		//搜索按钮
		$(document).on("click",".search-btn",function(){
			console.log("chaxun");
			var username = $("#login-name").html();
			  var data ={"pn":"1","condition":condition,"searchType":searchType,"date1":date1,"date2":date2,"delivery":username};
			  $.ajax({
				url : "/TTXG/findOrderByDelivery",
				data : data,
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_orders_table(result)
					buid_page_info(result);
					buid_page_nav(result); 
				} 
			}); 
			
		});
		
		//监听日期变化
		$(document).on("input porpertychange change",".search-date",function(){
			console.log("日期变化");
			date1=$("#first-date").val();
			date2=$("#last-date").val();
			console.log(date1+"to"+date2);
		});
		
		
		
		
//---------------------------------------------------------------------送达---------------------------------------------------------------------------***********************

	
	$(document).on("click",".order-finish-btn",function(){
			var orderid = $(this).attr("order-id");
			if(confirm("请确认订单已送达？")){
				finishOrder(orderid);;
			}
	});
	

		
function finishOrder(orderid){
	console.log(userid+"idididiididididididiid");
	var data = "&_method=PUT";
	$.ajax({
				url : "/TTXG/finishOrderById/"+orderid,
				data : data,
				type : "POST",
				success : function(result) {
					console.log(result);
					toPage(currentPage);
				}
			});	

}	
		

//---------------------------------------------------------查看------------------------------------------------
		//传入表id，清除表内容、红绿、提示。
		function reset_form(id){
			$(id)[0].reset();
			$(id+" input").removeClass("is-invalid is-valid");
			$(id+" .invalid-feedback").empty()
		}
		
		$(document).on("click",".see-btn",function(){	
			//向查询函数传入id
			findCompleteOrder($(this).attr("order-id"));
			$("#seeOrderModal").modal({
				//点击背景不会消失
				backdrop:"static"
			});
		});

		//查询订单详细信息
		function findCompleteOrder(orderid){
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
		//填充详细信息
		function buildTable(result){
			//id
			$("#order-id").html(result.extend.orderCustoms[0].orderid);
			//类型
			if(result.extend.orderCustoms[0].ordertype==1){
				$("#order-type").html(" 进货");
			}else if(result.extend.orderCustoms[0].ordertype==2){
						$("#order-type").html(" 销售");
			}
			//总价 处理人 日期	
			$("#total-money").html(result.extend.orderCustoms[0].ordermoney);
			$("#user-name").html(result.extend.orderCustoms[0].user.username);
			if(result.extend.orderCustoms[0].orderremarks!=null){
				$("#order-remarks").html("备注："+result.extend.orderCustoms[0].orderremarks);
			}
			
			if(result.extend.orderCustoms[0].custom!=null){
				$("#custom-name").html("客户: "+result.extend.orderCustoms[0].customer.username);
				$("#customer-phone").html(result.extend.orderCustoms[0].customer.phone);
				$("#customer-name").html(result.extend.orderCustoms[0].customer.name);
				$("#customer-address").html(result.extend.orderCustoms[0].customer.address);
				
			}
			
			
			var newDate = new Date(result.extend.orderCustoms[0].orderdate);			
			$("#order-date").html(newDate.toLocaleDateString());
			
			//清空
			$("#flows_tbody").empty();
			//填充flow
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
		
		
//------------------------------------------------------------显示中央表格-----------------------------------------
		function buid_orders_table(result) {
				$("#order_tbody").empty();
				var shl = result.extend.page.list;
				//jQuery自带的遍历each
				$.each(shl, function(index, item) {
						
						var orderid_td = $("<td></td>").append(item.orderid);
						if(item.ordertype==1){
							var ordertype_td = $("<td></td>").append("进货");
						}else if(item.ordertype==2){
							var ordertype_td = $("<td></td>").append("销售");
						}
						//防止js为空报错
						if(item.custom==null){
							var customer_td = $("<td></td>").append("无"); 
						}else{
							var customer_td = $("<td></td>").append(item.customer.username); 
						}
						
						var ordermoney_td = $("<td></td>").append(item.ordermoney);
						
						var newDate = new Date(item.orderdate);		
						var orderdate_td = $("<td></td>").append(newDate.toLocaleDateString());
						var orderstate_td;
						if(item.ordertype==1){
							orderstate_td = $("<td></td>").append("无");
						}else if(item.ordertype==2){
							if(item.orderstate==1){
							orderstate_td = $("<td></td>").append("未接单");
							}else if(item.orderstate==2){
							orderstate_td = $("<td></td>").append("配送中");
							}else if(item.orderstate==3){
							orderstate_td = $("<td></td>").append("已完成");
							}
						}
						var username_td = $("<td></td>").append(item.user.username);
						console.log(index);
						
						
						var finish_button= $("<button></button>").append("<i class='fa fa-check'></i> 送达").addClass("btn btn-warning order-finish-btn").val(item.orderid).attr("order-id",item.orderid);
						var see_button= $("<button></button>").append("<i class='fa fa-eye'></i> 查看").addClass("btn btn-secondary see-btn").val(item.orderid).attr("order-id",item.orderid);
				
						var xxx_td = $("<td></td>").append(" ").append(see_button);
						 if(item.orderstate!=3){
						 	xxx_td.append(" ").append(finish_button);
						 }
						$("<tr></tr>")
							.append(orderid_td)
							.append(ordertype_td)
							.append(customer_td)
							.append(ordermoney_td)
							.append(orderdate_td)
							.append(orderstate_td)
							.append(username_td)
							.append(xxx_td)
							.appendTo("#order_tbody");

				});
				}
	
//---------------------------------------------------------显示分页------------------------------------------------------------
			function buid_page_info(result) {
				$("#page_info_col").empty();
				currentPage = result.extend.page.pageNum;
				$("#page_info_col").append("当前<span class='badge badge-secondary'> " + result.extend.page.pageNum + " </span>页, 共有<span class='badge badge-secondary'> " + result.extend.page.pages + " </span> 页,总计 <span class='badge badge-secondary'>" + result.extend.page.total + " </span>条记录");
			}
			function buid_page_nav(result) {
				$("#page_ul").empty();
				var page = result.extend.page;
				console.log(page);
	
				var firstPage_li = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("首页"));
				var prePage_li = $("<li></li>").addClass("page-item").addClass("page-item").append($("<a></a>").addClass("page-link").append("&laquo;"));
				var nextPage_li = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("&raquo;"));
				var lastPage_li = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append("末页"));	
				
				if(page.hasPreviousPage==false){
					firstPage_li.addClass("disabled");
					prePage_li.addClass("disabled");
				}else{
					firstPage_li.click(function(){
						toPage(1);
					});
					prePage_li.click(function(){
						toPage(page.pageNum-1);
					});
				
				}
				if(page.hasNextPage==false){
					nextPage_li.addClass("disabled");
					lastPage_li.addClass("disabled");
				}else{
					nextPage_li.click(function(){
						toPage(page.pageNum+1);
					});
					lastPage_li.click(function(){
						toPage(page.pages);
					});
				
				}
				
				
				$("#page_ul").append(firstPage_li).append(prePage_li);
				
				$.each(page.navigatepageNums, function(index, item) {
					var pageNum_li = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append(item)).appendTo("#page_ul");
					if(page.pageNum == item){
						pageNum_li.addClass("active");
					}
					pageNum_li.click(function(){
						toPage(item);
					});
				});
				$("#page_ul").append(nextPage_li).append(lastPage_li);
				
			}
	
	</script>











