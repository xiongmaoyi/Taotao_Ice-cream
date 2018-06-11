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
				<form>
					<table class="table table-striped table-hover table-bordered"
						id='warehouse_table'>

						<thead>
							<tr>
								<td colspan="7" align="center">仓库查询</td>
							</tr>

							<tr>
								<td colspan="2">货品列表
								</td>
								<td colspan="5">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="请输入商品名称关键粗">
										<div class="input-group-append">
											<button class="btn btn-success" type="button">
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
								<th scope="row">xx</th>
							</tr>
						</thead>

						<%-- <c:forEach items="${page.list}" var="whgoods">
							<c:forEach items="${whgoods.goodsCustomList}" var="gl">
								<tr>
									<td>${whgoods.goodsid}</td>
									<td>${gl.goodsname}</td>
									<td>${whgoods.goodscount}</td>
									<td>${gl.goodsmoney}</td>
									<td>${gl.brand.brandname}</td>
									<td>${gl.goodsremarks}</td>
									<td>xx</td>
								</tr>
							</c:forEach>
						</c:forEach> --%>
						<tbody id="warehouse_tbody">


						</tbody>
						<tr style="background-color: white">
							<td colspan="7" align="right"></td>
						</tr>
						


					</table>

				</form>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<div class="col-md-6" id="page_info_col">
				<%-- <span>当前 ${page.pageNum} 页, 共有${page.pages}页,
					总计${page.total}条记录</span> --%>
			</div>
			<div class="col-md-6" id="page_nav_col">
				<nav aria-label="Page navigation example">
				<ul class="pagination" id="page_ul">
					<%-- <li class="page-item"><a class="page-link"
						href="/TTXG/showAllWarehouse.action?pn=1">首页</a></li>
					<c:if test="${page.hasPreviousPage}">
						<li class="page-item"><a class="page-link"
							href="/TTXG/showAllWarehouse.action?pn=${page.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
					</c:if>

					<c:forEach items="${page.navigatepageNums}" var="page_Num">
						<c:if test="${page_Num==page.pageNum}">
							<li class="page-item active"><a class="page-link"
								href="/TTXG/showAllWarehouse.action?pn=${page_Num}">
									${page_Num} </a></li>
						</c:if>
						<c:if test="${page_Num!=page.pageNum}">
							<li class="page-item"><a class="page-link"
								href="/TTXG/showAllWarehouse.action?pn=${page_Num}">${page_Num}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${page.hasNextPage }">
						<li class="page-item"><a class="page-link"
							href="/TTXG/showAllWarehouse.action?pn=${page.pageNum+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</c:if>
					<li class="page-item"><a class="page-link"
						href="/TTXG/showAllWarehouse.action?pn=${page.pages}">末页</a></li> --%>
				</ul>
				</nav>
			</div>
		</div>

	</div>






	<script>
		$(function() {
			toPage(3)
		});
	
		function toPage(pn) {
			$.ajax({
				url : "/TTXG/warehouseJson",
				data : "pn="+pn,
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_warehouse_table(result);
					buid_page_info(result);
					buid_page_nav(result);
				}
			});
	
		}
	
		function buid_warehouse_table(result) {
				$("#warehouse_tbody").empty();
				var whs = result.extend.page.list;
				//jQuery自带的遍历
				$.each(whs, function(index, item) {
					$.each(whs[index].goodsCustomList, function(index, gcl) {
						var goodsid_td = $("<td></td>").append(item.goodsid);
						var goodsname_td = $("<td></td>").append(gcl.goodsname);
						var goodscount_td = $("<td></td>").append(item.goodscount);
						var goodsmoney_td = $("<td></td>").append(item.goodsid);
						var brand_td = $("<td></td>").append(item.goodsid);
						var goodsremarks_td = $("<td></td>").append(item.goodsid);
						var xxx_td = $("<td></td>").append(item.goodsid);
	
						$("<tr></tr>").append(goodsid_td)
							.append(goodsname_td)
							.append(goodscount_td)
							.append(goodsmoney_td)
							.append(brand_td)
							.append(goodsremarks_td)
							.append(xxx_td)
							.appendTo("#warehouse_tbody");
	
	
					});
	
				});
				}
	
	
			function buid_page_info(result) {
				$("#page_info_col").empty();
				$("#page_info_col").append("当前 " + result.extend.page.pageNum + " 页, 共有" + result.extend.page.pages + "页,总计" + result.extend.page.total + "条记录");
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
