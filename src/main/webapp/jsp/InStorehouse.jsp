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
<title>My JSP 'Purchase.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.css"
	rel="stylesheet">
<!-- <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script> -->
<script src="${basePath}js/jquery-3.3.1.js"></script>
<style>
 body{
    font-family: 微软雅黑;
  }

</style>


</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>仓库查询</h3>
				
			</div>
		</div>
		<div class="row"></div>


		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<!-- <form> -->
					<table class="table table-striped table-hover table-bordered"
						id='inStorehouse_table'>

						<thead>
							<tr>
								<td colspan="7" align="center">仓库查询 
								


								</td>
							</tr>

							<tr>
								<td colspan="1">货品列表 </td>
								<td colspan="1">
								<select class="custom-select" id="searchType" name="searchType">
										<option selected value="1">按名称搜索</option>
										<option value="2">按商品编号搜索</option>
										<option value="3">按品牌搜索</option>
										
								</select>
								</td>
								
								<td colspan="5">
									<div class="input-group">
										

										<input type="text" class="form-control"
											placeholder="请输入商品名称关键词" id="searchText">
										<div class="input-group-append">
											<button class="btn btn-success" type="button" id="searchBtn">
												<span class="glyphicons glyphicons-search"></span>搜索库存
											</button>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">商品编号</th>
								<th scope="row">商品名称</th>
								<th scope="row">商品数量</th>
								<th scope="row">商品进价</th>
								<th scope="row">品牌名称</th>
								<th scope="row">商品备注</th>
								
							</tr>
						</thead>

						<tbody id="inStorehouse_tbody">


						</tbody>
						
						<tr style="background-color: white">
							<td colspan="7" align="right"></td>
						</tr>
						
					</table>

				<!-- </form> -->
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<div class="col-md-6" id="page_info_col">
				
			</div>
			<div class="col-md-6" id="page_nav_col">
				<nav aria-label="Page navigation example">
					<ul class="pagination" id="page_ul">
					
					</ul>
				</nav>
			</div>
		</div>

	</div>






	<script>
		//
		$(function() {
			toPage(1)
			
			
		});
			var condition;
			
			var searchType;
		
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
	
		$("#searchBtn").click(function(){
			
			var data ={"pn":"1","condition":condition,"searchType":searchType};
			$.ajax({
				url : "/TTXG/inStorehouseJsonByCondition",
				data : data,
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_inStorehouse_table(result);
					buid_page_info(result);
					buid_page_nav(result);
				}
			});
		
		});
		
	
		function toPage(pn) {
			$.ajax({
				url : "/TTXG/inStorehouseJsonByCondition",
				data : {"pn":pn,"condition":condition,"searchType":searchType},
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_inStorehouse_table(result);
					buid_page_info(result);
					buid_page_nav(result);
					
				}
			});
			
		
			
	
		}
	
		function buid_inStorehouse_table(result) {
				$("#inStorehouse_tbody").empty();
				var shl = result.extend.page.list;
				//jQuery自带的遍历
				$.each(shl, function(index, item) {
						
						var goodsid_td = $("<td></td>").append(item.goodsid);
						var goodsname_td = $("<td></td>").append(item.goodsCustom.goodsname);
						if(item.goodscount<=50){
							var goodscount_span = $("<span style='color:red'></span>").append(item.goodscount);
							var goodscount_td = $("<td class='goods-count'></td>").append(goodscount_span);
						}else{
							var goodscount_td = $("<td class='goods-count'></td>").append(item.goodscount);
						}
					
						var goodsmoney_td = $("<td></td>").append(item.goodsCustom.goodsmoney);
						var brand_td = $("<td></td>").append(item.goodsCustom.brand.brandname);
						var goodsremarks_td = $("<td></td>").append(item.goodsCustom.goodsremarks);
					
						
						$("<tr></tr>").append(goodsid_td)
							.append(goodsname_td)
							.append(goodscount_td)
							.append(goodsmoney_td)
							.append(brand_td)
							.append(goodsremarks_td)
							.appendTo("#inStorehouse_tbody");
	
	
					
	
				});
				}
	
	
			function buid_page_info(result) {
				$("#page_info_col").empty();
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













</body>
</html>
