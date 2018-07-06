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
<title>线下销售</title>

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
	<!-- -----------------------------------------商品添加的modal框--------------------------------------- -->
	<div class="modal fade" id="addGoodsModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModal3Label" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">选择商品</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<table class="table table-striped table-hover table-bordered"
					id='goods_table'>

					<thead>
						<tr>
							<td colspan="7" align="center">请选择商品</td>
						</tr>

						<tr>
							<td colspan="1">商品列表</td>
							<td colspan="1"><select class="custom-select"
								id="searchType" name="searchType">
									<option selected value="1">按名称搜索</option>
									<option value="2">按商品编号搜索</option>
									<option value="3">按品牌搜索</option>

							</select></td>

							<td colspan="5">
								<div class="input-group">


									<input type="text" class="form-control"
										placeholder="请输入商品名称关键词" id="searchText">
									<div class="input-group-append">
										<button class="btn btn-success" type="button" id="searchBtn">
											<i class="fa fa-search fa-lg"></i> 搜索商品
										</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
			
							<th scope="row">商品编号</th>
							<th scope="row">商品名称</th>
							<!-- <th scope="row">商品数量</th> -->
							<th scope="row">市场价格</th>
							<th scope="row">品牌名称</th>
							<th scope="row">商品备注</th>
							<th scope="row">操作</th>
						</tr>
					</thead>

					<tbody id="goods_tbody">
					</tbody>
				</table>
				
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
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					
				</div>
			</div>
		</div>
	</div>

	<!-- -----------------------------------------客户选取的modal框--------------------------------------- -->
	<div class="modal fade" id="addCustomerModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModal3Label" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">选择客户</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<table class="table table-striped table-hover table-bordered"
					id='user_table'>

					<thead>
						<tr>
							<td colspan="7" align="center">客户获取</td>
						</tr>

						<tr>
							<td colspan="1">用户列表</td>
							<td colspan="1"><select class="custom-select"
								id="userSearchType" name="searchType">
									<option selected value="1">按用户编号</option>
									<option value="2">按用户名搜索</option>
									<option value="3">按姓名搜索</option>
									<option value="4">按手机号搜索</option>

							</select></td>

							<td colspan="5">
								<div class="input-group">


									<input type="text" class="form-control"
										placeholder="请输入用户编号" id="userSearchText">
									<div class="input-group-append">
										<button class="btn btn-success" type="button" id="userSearchBtn">
											<i class="fa fa-search fa-lg"></i> 搜索用户
										</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
						
							<th scope="row">用户编号</th>
							<th scope="row">用户类型</th>
							<!-- <th scope="row">商品数量</th> -->
							<th scope="row">用户名</th>
							<th scope="row">姓名</th>
							<th scope="row">电话</th>
							<th scope="row">操作</th>
						</tr>
					</thead>

					<tbody id="user_tbody">


					</tbody>

					<tr style="background-color: white">
						<td colspan="7" align="center">
							
						</td>
					</tr>

				</table>
				
				<!-- 显示分页信息 -->
		<div class="row">
			<div class="col-md-6" id="userpage_info_col"></div>
			<div class="col-md-6" id="userpage_nav_col">
				<nav aria-label="Page navigation example">
				<ul class="pagination" id="userpage_ul">

				</ul>
				</nav>
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


	


	<!-- ******************html页面********************************** -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>线下销售</h3>

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
							<td colspan="8" align="center">线下销售</td>
						</tr>

						<tr>
							<td colspan="1">凭证编号：<span id="order_id"></</span></td>
							<td colspan="1">
							<span>订单处理人：</span>
							<span id="login-name"><shiro:principal/></span>							
							</td>
							<td colspan="1">
							客户：<span id="customer-info"></span>
							<button class="btn btn-secondary btn-sm" type="button" id="show-customer">
								<i class="fa  fa-address-book fa-xs"></i> 获取
							</button>
							</td>

							<td colspan="5">
								<div class="input-group">


									<input type="text" class="form-control"
										placeholder="请输入订单备注" id="order-remarks" >
									
								</div>
							</td>
						</tr>
						<tr>
						
							<th scope="row">商品编号</th>
							<th scope="row">商品名称</th>
							<th scope="row">市场价格</th>
							<th scope="row">品牌名称</th>
							<th scope="row">商品备注</th>
							<th scope="row">数量</th>
							<th scope="row">小计/元</th>
							<th scope="row">操作</th>
						</tr>
					</thead>

					<tbody id="added-goods">


					</tbody> 
					<tr style="background-color: white">
					<!-- last-money -->
					<td colspan="2"align="right" ><span>应付:</span><span id="total-money">0</span></td>
					<td colspan="2"align="right" ><span>优惠:</span><span id="save-money">0</span></td>
					<td colspan="4"align="right" ><span>实付:</span><span id="last-money">0</span></td>
					</tr>

					<tr style="background-color: white">
						<td colspan="8" align="center">
							<button class="btn btn-success" type="button" id="addGoods">
								<i class="fa fa-plus fa-lg"></i> 添加货品
							</button>
							<button class="btn btn-danger" type="button" id="commitOrder">
								<i class="fa fa-cc-paypal fa-lg"></i> 提交订单
							</button>
						</td>
					</tr>
					
				</table>

				<!-- </form> -->
			</div>
		</div>
		

	</div>
	<!-- ***************************************************************************************************************** -->


	<!-- ***************************************************************************************************************** -->



	<script>
		//--------------------------------------------模态框刷新页面入口--------------------------------------------------------
		$(function() {
			toPage(1);
			toCustomerPage(1);
			showOrderId();		
		});
		function showOrderId(){
		//findMaxOrderId
			$.ajax({
				url : "/TTXG/findMaxOrderId",
				type : "GET",
				success : function(result) {
					//console.log("eeeeeeeeeeeeeeee");
					console.log(result.extend.maxOrderId);
					$("#order_id").html(result.extend.maxOrderId+1);
				}
			});
		}
		
		
		
		//货品页面转到第pn页
		function toPage(pn) {
			$.ajax({
				url : "/TTXG/showGoodsJsonByCondition",
				data : {"pn":pn,"condition":condition,"searchType":searchType},
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_goods_table(result);
					buid_page_info(result);
					buid_page_nav(result);
				}
			});
		}
		//---------------------------------------------全局变量---------------------------------------------------------
			//声明全局变量 搜索条件 搜索方式
			var condition;
			var userCondition;
			var searchType;
			var userSearchType;					
			var goodsNameIsTrue = true;
			var currentPage;
			var userCurrentPage;
			var usertype;	
			var lastmoney;
    		var savemoney;	
			var total=0;
    			var a=0;
		//---------------------------------------------查询---------------------------------------------------------
		
		//查询类型转换
		$("#searchType").change(function(){
			
			var optionValue = $("#searchType option:selected").val();
			
			console.log(optionValue);
			if(optionValue==1){
				$("#searchText").attr("placeholder","请输入商品名称关键词");
				//值变化时候放入searchtext变量
				searchType=1;
			}else if(optionValue==2){
				$("#searchText").attr("placeholder","请输入商品编号");
				searchType=2;
			}else if(optionValue==3){
				$("#searchText").attr("placeholder","请输入品牌关键词");
				searchType=3;
			}
			
			
		});
		//查询的值发生变化时放入condition变量
		$("#searchText:text").change(function() {
			condition=$("#searchText").val();
		});
		//搜索按钮
		$("#searchBtn").click(function(){
			
			var data ={"pn":"1","condition":condition,"searchType":searchType};
			$.ajax({
				url : "/TTXG/showGoodsJsonByCondition",
				data : data,
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_goods_table(result);
					buid_page_info(result);
					buid_page_nav(result);
				}
			});
		
		});
		
		
		
//---------------------------------------------------------添加------------------------------------------------
		//传入表id，清除表内容、红绿、提示。
		function reset_form(id){
			$(id)[0].reset();
			$(id+" input").removeClass("is-invalid is-valid");
			$(id+" .invalid-feedback").empty()
		}
		
		//弹出添加框按钮
		$("#addGoods").click(function(){
			if(custom==null){
				alert("请先选择客户");
				return;
			}else{
				//显示modal框
				$("#addGoodsModal").modal({
				//点击背景不会消失
				backdrop:"static"
			});	
			
			}	
	
		});
		
		
		
		//点击添加，进行判断，主界面无该商品时添加商品；
		$(document).on("click",".add-to-table-btn",function(){
		
			var hasgoods=false;
			var gid= $(this).attr("goods-id");
			var goodsid_td = $("<td></td>").append($(this).attr("goods-id")).addClass("goods-id");
			var goodsname_td = $("<td></td>").append($(this).attr("goods-name"));
			var goodsmoney_td = $("<td></td>").addClass("gmn").append($(this).attr("goods-money"));
			var brand_td = $("<td></td>").append($(this).attr("brand-name"));
			var goodsremarks_td = $("<td></td>").append($(this).attr("goods-remarks"));
			var goodsnumber_td = $("<td style='width: 150px;'></td>").append('<div class="input-group"><div class="input-group-prepend"><span class="input-group-text num-add">+</span></div><input type="text" class="form-control number input-mini gnumber" value="1"><div class="input-group-append"><span class="input-group-text num-reduce">-</span></div></div>');
			var goodslmoney_td = $("<td></td>").addClass("subtotal").append($(this).attr("goods-money"));
			
			var delete_btn = $("<button></button>").append("<i class='fa fa-delete'></i> 移除").addClass("btn btn-info rm-btn").attr("goods-id",$(this).attr("goods-id"));
			
			var delete_btn_td = $("<td></td>").append(" ").append(delete_btn);
			//遍历提前绑定在按钮上的goods-id 检查是否存在
			$(".rm-btn").each(function(i,item){	
				if(item.getAttribute("goods-id")==gid){
					console.log("存在");
					hasgoods=true;
				}
	
			});
			//不存在则像主界面添加此条数据
			if(!hasgoods){
				$("<tr class='added-item'></tr>").append(goodsid_td)
							.append(goodsname_td)
							.append(goodsmoney_td)
							.append(brand_td)
							.append(goodsremarks_td)
							.append(goodsnumber_td)
							.append(goodslmoney_td)
							.append(delete_btn_td)
							.appendTo("#added-goods");
				$('#addGoodsModal').modal('hide');			
			}
		});
//----------------------------------------------------移除按钮----------------------------------------------------------

		//点击移除，移除相应数据
		$(document).on("click",".rm-btn",function(){
			 $(this).parent().parent().remove();
			 console.log("移除数据");
    			total=0;
    			$(".subtotal").each(function(i,item){   			
    				a = $(".subtotal").eq(i).text(); 			
    				total = total + parseFloat(a);
    			});	
    			
    			console.log(total);
    			$("#total-money").text(total); 
		
		});
	
	//-------------------------------------------------价格计算----------------------------------------------------
	
		//实时监控雪糕数量，并实时计算subtotal
		$(document).on("input porpertychange",".gnumber",function(){
			console.log("雪糕数量变化");
			var gmoney =$(this).parent().parent().parent().find($(".gmn")).html();
			var gnumber =$(this).val();

			$(this).parent().parent().parent().find($(".subtotal")).html(gmoney*gnumber);
		});
		
	
		
		//监控内容改变与节点改变，实时更新总价
		$('#added-goods').on('DOMNodeInserted DOMNodeRemoved onchange onpropertychange',function(){
    			console.log("内容变化");
    			total=0;
    			$(".subtotal").each(function(i,item){
    				//total =total + item;
    				
    				//console.log($(".subtotal").eq(i).text());
    				a = $(".subtotal").eq(i).text();
    			
    				total = total + parseFloat(a);
    			});	
    			
    			console.log(total);
    			$("#total-money").text(total.toFixed(2));
    			
           //-------------------按用户优惠----------------------
    			
    			if(usertype==3){
    				//批发商
    				lastmoney = total*0.8;
    				lastmoney = lastmoney.toFixed(2);
    				savemoney = total - lastmoney ;
    				savemoney = savemoney.toFixed(2);
    				$("#last-money").text(lastmoney);
    				$("#save-money").text(savemoney);
    			}else if(usertype==5){
    				//个体客户
    				lastmoney = total*0.9;
    				lastmoney = lastmoney.toFixed(2);
    				savemoney = total - lastmoney ;
    				savemoney = savemoney.toFixed(2);
    				$("#last-money").text(lastmoney);
    				$("#save-money").text(savemoney);
    			}
    			
    			   			
		});
		
		//加减控件
		$(document).on("click",".num-add",function(){
			 var num =$(this).parent().parent().find(".gnumber").val();
			 num++;
			 console.log(num);
			 $(this).parent().parent().find(".gnumber").val(num);
			
			//更新subtotal
			console.log("雪糕数量变化");
			var gmoney = $(this).parent().parent().parent().parent().find($(".gmn")).html();			
			var dd = $(this).parent().parent().parent().parent().find($(".subtotal")).html(gmoney*num);
			 
		});
		$(document).on("click",".num-reduce",function(){		 
			 var num =$(this).parent().parent().find(".gnumber").val();
			 if(num>1){
			 	num--;
			 	console.log(num);
			 	$(this).parent().parent().find(".gnumber").val(num);
			 	
			 	//更新subtotal
				console.log("雪糕数量变化");
				var gmoney = $(this).parent().parent().parent().parent().find($(".gmn")).html();			
				var dd = $(this).parent().parent().parent().parent().find($(".subtotal")).html(gmoney*num);
			}
		});
//------------------------------------------------------------提交订单部分-------------------------------------------
//*******************全局变量*****************************************************
var username;
var userid;
var lastInsertId;
var orderid;
var totalmoney;
var custom=null;
//****************************************************************************
var goodsid;




	
	function getUserIdAndInsertOrder(username){
		$.ajax({
				url : "/TTXG/getUserIdByName",
				data : {"username":username},
				type : "GET",
				success : function(result) {
					console.log(result);
					console.log(result.extend.userid);
					userid = result.extend.userid;
					insertOrder();
				}
				
			});	
	}
	
	
	//插订单
	function insertOrder(){
		totalmoney = $("#total-money").html();
		var orderremarks = $("#order-remarks").val();
		
		//将用户id设置到全局变量
			
		
		var data ={"ordermoney":lastmoney,"orderremarks":orderremarks,"userid":userid,"ordertype":"2","orderstate":"1","custom":custom};
		
		$.ajax({
				url : "/TTXG/insertOrder",
				data : data,
				type : "POST",
				success : function(result) {
					console.log(result.extend.orderid);
					orderid = result.extend.orderid;
					insertFlows(orderid);					
				}
				
							
			});
	
	}
	//批量插交易流
	function insertFlows(orderid){
		var flowList = new Array(); 

		for(var i =0 ;i<$(".added-item").length;i++){
			var flow = new Object();
			flow.goodsid = $(".added-item").eq(i).find(".goods-id").html();
			flow.goodsnumber = $(".added-item").eq(i).find(".gnumber").val();
			flow.subtotal = $(".added-item").eq(i).find(".subtotal").html();
			flow.orderid =orderid;
			flow.state = 1;	
			flowList.push(flow);
		}
		var data ={"flowList":flowList};
		
		console.log(flowList);
		 $.ajax({
		 		// headers必须添加，否则会报415错误
    			headers: {
        			'Accept': 'application/json',
        			'Content-Type': 'application/json'
    			 },
				url : "/TTXG/insertFlows",
				data : JSON.stringify(flowList),
				type : "POST",
				traditional:true,
				success : function(result) {
					console.log(result);
					toMsgPage();
				}
			}); 
		
	}
	//进入凭证页面
	function toMsgPage(){
	 window.location.href ="/TTXG/jsp/PurchaseMsg.jsp?orderid="+orderid;
	}
	
	
	//批量插库存
	function insertInStorehouse(){
		//在flow表中用触发器完成
	}
	
	


	//提交：插入订单，批量插入交易流，批量插入库内商品（触发器完成）
	$("#commitOrder").click(function(){
		username = $("#login-name").html();
		if($(".added-item").length==0){
			alert("请添加商品");
			return ;
		}
		if(confirm("是否提交订单？")){
			getUserIdAndInsertOrder(username);
		}
		

	});





	
		
//------------------------------------------------------------显示模态框表格-----------------------------------------
		function buid_goods_table(result) {
				$("#goods_tbody").empty();
				var shl = result.extend.page.list;
				//jQuery自带的遍历each
				$.each(shl, function(index, item) {
						
						var goodsid_td = $("<td></td>").append(item.goodsid);
						var goodsname_td = $("<td></td>").append(item.goodsname);
						var goodsmoney_td = $("<td></td>").append(item.marketprice);
						var brand_td = $("<td></td>").append(item.brand.brandname);
						var goodsremarks_td = $("<td></td>").append(item.goodsremarks);
						

						var add_button= $("<button></button>").append("<i class='fa fa-plus'></i> 添加").addClass("btn btn-info add-to-table-btn").val(item.goodsid).attr("goods-id",item.goodsid).attr("goods-name",item.goodsname).attr("goods-money",item.marketprice).attr("brand-name",item.brand.brandname).attr("goods-remarks",item.goodsremarks);
						
						var xxx_td = $("<td></td>").append(" ").append(add_button);
						
						$("<tr></tr>")
							.append(goodsid_td)
							.append(goodsname_td)
							.append(goodsmoney_td)
							.append(brand_td)
							.append(goodsremarks_td)
							.append(xxx_td)
							.appendTo("#goods_tbody");

				});
				}
	
//---------------------------------------------------------显示商品分页------------------------------------------------------------
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
			
// ************************************************************客户选取相关************************************************************************************
	function toCustomerPage(userpn) {
			$.ajax({
				url : "/TTXG/showCustomerByCondition",
				data : {"pn":userpn,"condition":userCondition,"searchType":userSearchType},
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_user_table(result);
					buid_userpage_info(result);
					buid_userpage_nav(result);
				}
			});
	}
	
	//---------------------------------------------查询---------------------------------------------------------
		
		//查询类型转换
		$("#userSearchType").change(function(){
			
			var optionValue = $("#userSearchType option:selected").val();
			
			console.log(optionValue);
			if(optionValue==1){
				$("#userSearchText").attr("placeholder","请输入用户编号");
				//值变化时候放入searchtext变量
				userSearchType=1;
			}else if(optionValue==2){
				$("#userSearchText").attr("placeholder","请输入用户名");
				userSearchType=2;
			}else if(optionValue==3){
				$("#userSearchText").attr("placeholder","请输入姓名");
				userSearchType=3;
			}else if(optionValue==4){
				$("#userSearchText").attr("placeholder","请输入电话");
				userSearchType=4;
			}
			
			
		});
		//查询的值发生变化时放入condition变量
		$("#userSearchText:text").change(function() {
			userCondition=$("#userSearchText").val();
		});
		//搜索按钮
		$("#userSearchBtn").click(function(){
			userCondition = $("#userSearchText").val();
			var data ={"pn":"1","condition":userCondition,"searchType":userSearchType};
			$.ajax({
				url : "/TTXG/showCustomerByCondition",
				data : data,
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_user_table(result);
					buid_userpage_info(result);
					buid_userpage_nav(result);
				}
			});
		
		});	
		
		
		
		//------------------------------------------------------------显示表格-----------------------------------------
		function buid_user_table(result) {
				$("#user_tbody").empty();
				var shl = result.extend.page.list;
				//jQuery自带的遍历each
				$.each(shl, function(index, item) {
						var type;
						if(item.usertype==1){
							type='管理员';
						}else if(item.usertype==2){
							type='售货员';
						}else if(item.usertype==3){
							type='三级经销商';
						}else if(item.usertype==4){
							type='送货员';
						}else if(item.usertype==5){
							type='个体客户';
						}
						
				
						var userid_td = $("<td></td>").append(item.userid);
						var usertype_td = $("<td></td>").append(type);
						
						var username_td = $("<td></td>").append(item.username);
						var name_td = $("<td></td>").append(item.name);
						var phone_td = $("<td></td>").append(item.phone);
						console.log(index);
						var add_button= $("<button></button>").append("<i class='fa fa-plus'></i> 选择").addClass("btn btn-info adduser-to-table-btn").val(item.userid).attr("user-id",item.userid).attr("user-name",item.username).attr("real-name",item.name).attr("user-type",item.usertype);
						//var delete_button= $('<button></button>').append("<i class='fa fa-trash-o'></i> 删除").addClass("btn btn-danger delete-btn").val(item.userid).attr("user-id",item.userid);
						//var update_button= $("<button></button>").append("<i class='fa fa-pencil'></i> 修改").addClass("btn btn-info update-btn").val(item.userid).attr("user-id",item.userid);
						///console.log(delete_button);
						var xxx_td = $("<td></td>").append(add_button);
						
						$("<tr></tr>")
							.append(userid_td)
							.append(usertype_td)
							.append(username_td)
							.append(name_td)
							.append(phone_td)
							.append(xxx_td)
							.appendTo("#user_tbody");

				});
				}
	
//---------------------------------------------------------显示客户分页------------------------------------------------------------
			function buid_userpage_info(result) {
				$("#userpage_info_col").empty();
				currentPage = result.extend.page.pageNum;
				$("#userpage_info_col").append("当前<span class='badge badge-secondary'> " + result.extend.page.pageNum + " </span>页, 共有<span class='badge badge-secondary'> " + result.extend.page.pages + " </span> 页,总计 <span class='badge badge-secondary'>" + result.extend.page.total + " </span>条记录");
			}
			function buid_userpage_nav(result) {
				$("#userpage_ul").empty();
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
						toCustomerPage(1);
					});
					prePage_li.click(function(){
						toCustomerPage(page.pageNum-1);
					});
				
				}
				if(page.hasNextPage==false){
					nextPage_li.addClass("disabled");
					lastPage_li.addClass("disabled");
				}else{
					nextPage_li.click(function(){
						toCustomerPage(page.pageNum+1);
					});
					lastPage_li.click(function(){
						toCustomerPage(page.pages);
					});
				
				}
				
				
				$("#userpage_ul").append(firstPage_li).append(prePage_li);
				
				$.each(page.navigatepageNums, function(index, item) {
					var pageNum_li = $("<li></li>").addClass("page-item").append($("<a></a>").addClass("page-link").append(item)).appendTo("#userpage_ul");
					if(page.pageNum == item){
						pageNum_li.addClass("active");
					}
					pageNum_li.click(function(){
						toCustomerPage(item);
					});
				});
				$("#userpage_ul").append(nextPage_li).append(lastPage_li);
				
			}	
			
			
//-------------------------------------------------------------------弹出获取框-------------------------------------------------------------------
			$("#show-customer").click(function(){
			//初始化
			//reset_form("#addGoodsModal form");	
				
			//显示modal框
			$("#addCustomerModal").modal({
				//点击背景不会消失
				backdrop:"static"
			});	
		});
			

			
			
			
//-------------------------------------------------------------------选择客户---------------------------------------------------------------	------		
			
			
			//点击添加，进行判断，主界面无该商品时添加商品；
		$(document).on("click",".adduser-to-table-btn",function(){
		
			var hasgoods=false;
			custom = $(this).attr("user-id");
			usertype = $(this).attr("user-type");
			var username = $(this).attr("user-name");
		
			var name = $(this).attr("real-name");
			$("#customer-info").html(name);	
			$('#addCustomerModal').modal('hide');	
		});
			

	
	</script>











