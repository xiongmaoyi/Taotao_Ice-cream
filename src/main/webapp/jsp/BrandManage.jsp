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
<title>品牌管理</title>

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
	<!-- -----------------------------------------品牌添加的modal框--------------------------------------- -->
	<div class="modal fade" id="addBrandModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModal3Label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">添加品牌</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">

						<div class="form-group row">
							<label for="write_brandname" class="col-sm-3 col-form-label"
								>品牌名称</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="write_brandname" name="brandname" maxlength="20"
									placeholder="请输入品牌名称">
								<div class="invalid-feedback" id="brandname-feedback"></div>
							</div>
						</div>
						
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="insertBrand_btn" >添加</button>
				</div>
			</div>
		</div>
	</div>







	<!-- -----------------------------------------商品修改的modal框--------------------------------------- -->
	
	
	<div class="modal fade" id="updateBrandModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModal3Label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">修改品牌</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						
						<div class="form-group row">
							<label for="brandid-static" class="col-sm-3 col-form-label"
								>品牌编号</label>
							<div class="col-sm-9">
								<!-- <input type="text" class="form-control" id="update_goodsid" name="goodsid"
									> -->
								<p class="form-control-static" id="brandid-static">111</p>
							</div>
						</div>
						<div class="form-group row">
							<label for="update_brandname" class="col-sm-3 col-form-label"
								>品牌名称</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="update_brandname" name="brandname"
									placeholder="请输入品牌名称">
								<div class="invalid-feedback" id="brandname-feedback2"></div>
							</div>
						</div>
				
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="updateBrand_btn">修改</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	


	<!-- **************************************************** -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>品牌管理</h3>

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
							<td colspan="4" align="center">品牌管理</td>
						</tr>

						<tr>
							<td colspan="1">品牌列表</td>
							<td colspan="1"><select class="custom-select"
								id="searchType" name="searchType">
									<option selected value="1">品牌编号搜索</option>
									<option value="2">按名称搜索</option>
							</select></td>

							<td colspan="2">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="请输入品牌编号" id="searchText">
									<div class="input-group-append">
										<button class="btn btn-success" type="button" id="searchBtn">
											<i class="fa fa-search fa-lg"></i> 搜索品牌
										</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"> <input type="checkbox" id="check_all"/> </th>
							<th scope="row">品牌编号</th>
							<th scope="row">品牌名称</th>
							<th scope="row">操作</th>
						</tr>
					</thead>

					<tbody id="item_tbody">


					</tbody>

					<tr style="background-color: white">
						<td colspan="7" align="center">
							<button class="btn btn-success" type="button" id="addItem">
								<i class="fa fa-plus fa-lg"></i> 添加品牌
							</button>
							<button class="btn btn-danger" type="button" id="deleteSelectedItem">
								<i class="fa fa-trash-o fa-lg"></i> 删除品牌
							</button>
						</td>
					</tr>

				</table>

			
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
			toPage(1)		
		});
		
		//转到第pn页
		function toPage(pn) {
			$.ajax({
				url : "/TTXG/showBrandPageByCondition",
				data : {"pn":pn,"condition":condition,"searchType":searchType},
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_item_table(result);
					buid_page_info(result);
					buid_page_nav(result);
				}
			});
		}
		//---------------------------------------------全局变量---------------------------------------------------------
			//声明全局变量 搜索条件 搜索方式
			var condition;
			var searchType;			
			var brandNameIsTrue = true;
			var currentPage;		
		//---------------------------------------------查询---------------------------------------------------------
		
		//查询类型转换
		$("#searchType").change(function(){
			
			var optionValue = $("#searchType option:selected").val();
			
			console.log(optionValue);
			if(optionValue==1){
				$("#searchText").attr("placeholder","请输入品牌编号");
				//值变化时候放入searchtext变量
				searchType=1;
			}else if(optionValue==2){
				$("#searchText").attr("placeholder","请输入品牌名");
				searchType=2;
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
				url : "/TTXG/showBrandPageByCondition",
				data : data,
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_item_table(result);
					buid_page_info(result);
					buid_page_nav(result);
					
				}
			});
		
		});
		
//-------------------------------------------删除--------------------------------------------------------------------
		//绑定删除按钮点击事件
		$(document).on("click",".delete-btn",function(){
			//父元素tr的第二个td内的内容
			var brandname = $(this).parents("tr").find("td:eq(2)").text();
			//1、显示是否删除
			if(confirm("确认删除【"+brandname+"】？")){
				deleteById($(this).attr("brand-id"));
			}
		
		});
			
		//删除函数
		function deleteById(brandid){
		
			$.ajax({
				url : "/TTXG/deleteBrandById/"+brandid,
				type : "DELETE",
				success : function(result) {				
					toPage(currentPage);
				}
			});
		}
		//批量删除函数
		function deleteByIds(ids){
		
			$.ajax({
				url : "/TTXG/deleteBrandById/"+ids,
				type : "DELETE",
				success : function(result) {	
					toPage(currentPage);
				}
			});
		}
		
		//--------------------------------全选全不选--批量删除-----------------------------------------------
		$("#check_all").click(function(){
			//prop读取dom原生属性
			var isCheckAll = $(this).prop("checked");
			$(".check_item").prop("checked",isCheckAll);
		});
		
		//给每一个check_item绑定点击事件
		$(document).on("click",".check_item",function(){
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		
		});
		
		//批量删除按钮绑定单击事件
		$("#deleteSelectedItem").click(function() {
			if ($(".check_item:checked").length == 0) {
				alert("请选择要删除的条目。");
			} else {
				var brandnames = '';
				var ids = '';
				$.each($(".check_item:checked"), function() {
					//组装name
					brandnames = brandnames + $(this).parents("tr").find("td:eq(2)").text() + ",";
					//组装ids以-分割
					ids = ids + $(this).parents("tr").find("td:eq(1)").text() + "-";
				});
	
				//去除多余的分割号
				brandnames = brandnames.substring(0, brandnames.length - 1);
				ids = ids.substring(0, ids.length - 1);
	
				if (confirm("确认删除【" + brandnames + "】吗？")) {
					deleteByIds(ids);
				}
			}
		});
		
		
//---------------------------------------------------------添加------------------------------------------------
		//传入表id，清除表内容、红绿、提示。
		function reset_form(id){
			$(id)[0].reset();
			$(id+" input").removeClass("is-invalid is-valid");
			$(id+" .invalid-feedback").empty()
		}
		
		//弹出添加框按钮
		$("#addItem").click(function(){
			//初始化
			reset_form("#addBrandModal form");	
				
			//显示modal框
			$("#addBrandModal").modal({
				//点击背景不会消失
				backdrop:"static"
			});	
		});
		
		
		//查询品牌信息
		/* function getBrand(selectid){
			//每次点击清空下拉菜单里的信息，以免重复添加
			$(selectid).empty();
			var data;
			$.ajax({
				url : "/TTXG/showBrandJson",
				data : data,
				type : "GET",
				success : function(result) {
					console.log(result);
					$.each(result.extend.brandList,function(index,brand){
						var brand_option = $("<option></option>").append(brand.brandname).val(brand.brandid).attr("name","brandid");
						brand_option.appendTo(selectid);
					});
				}
			});
		} */
		
		//----------------------------------------添加：校验-----------------------------------------------
		
		//商品添加的表单前端校验方法
		function validate_addBrand(){
			var r = true;
			//拿到用户输入的要校验的数据
			var brandname = $("#write_brandname").val();
				
			//编写正则表达式
			//验证中文字符字母数组的正则
			var reg_brandname =/^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
			
			
			if(!reg_brandname.test(brandname)){
				$("#brandname-feedback").empty();//清空显示内容
            	$("#brandname-feedback").append("请输入正确的商品名称");//修改显示的内容
            	$("#write_brandname").removeClass("is-valid");//清除合法状态
            	$("#write_brandname").addClass("is-invalid");//添加非法状态
				r = false;			
			}else{
				$("#brandname-feedback").empty();//清空显示内容
				$("#write_brandname").removeClass("is-invalid");
				$("#write_brandname").addClass("is-valid");//改为合法状态
			}
			
					
			return r;
		}
		
		//商品名称数据库校验
		$("#write_brandname").change(function(){
			brandNameIsTrue = true;
			validate_brandName();					
		});
		
		function validate_brandName(){
			var data ={"brandname":$("#write_brandname").val()}; 
			$.ajax({
				url:"/TTXG/checkBrandName",
				data:data,
				type:"POST",
				success:function(result){
					if(result.code==100){
						$("#brandname-feedback").empty();//清空显示内容
						$("#write_brandname").removeClass("is-valid is-invalid")
					}else{
						$("#brandname-feedback").empty().append("库中已存在");
            			$("#write_brandname").removeClass("is-valid").addClass("is-invalid");
            			brandNameIsTrue = false;
					}						
				}						
			});
		
		
		}
		
		
		//确认添加按钮
		$("#insertBrand_btn").click(function(){
					
			//jquery获得表单数据的方法（获得表单提交的数据key：name value：value）
			var data = $("#addBrandModal form").serialize();
			
			//执行函数，校验通过才能继续执行
			if(!validate_addBrand()){
				return false;
			}
			
			if(brandNameIsTrue == false){
				$("#brandname-feedback").empty().append("库中已存在");
            	$("#write_brandname").removeClass("is-valid").addClass("is-invalid");
				return false;
			}
			
			$.ajax({
				url : "/TTXG/addBrand",
				data : data,
				type : "POST",
				success : function(result) {
					console.log(result);
					//初始化
					$("#addBrandModal form input").removeClass("is-valid is-invalid");
					
					$("#brandname-feedback").empty();
					if(result.code == 100){
						//关闭模态框
						$("#addBrandModal").modal("hide");
						//调到最后一页
						toPage(result.extend.page.pages);					
					}else{
						//后端校验不通过则显示错误信息
						if(result.extend.errorMap.brandname){
							$("#brandname-feedback").empty().append(result.extend.errorMap.brandname);
            				$("#write_brandname").removeClass("is-valid").addClass("is-invalid");
						}
						
					}
					
				}
			});
			
		});
		
//------------------------------------------------------------修改-----------------------------------------		
		
		//为后来添加的元素绑定事件
		$(document).on("click",".update-btn",function(){
		
			//查出商品信息
			//查出品牌信息
			//显示修改模态框
			
			//初始化
			reset_form("#updateBrandModal form");	
			
		
			//向查询函数传入id
			getBrandById($(this).attr("brand-id"));
			//将id绑定在模态框的修改按钮上
			$("#updateBrand_btn").attr("brand-id",$(this).attr("brand-id"));
			
			$("#updateBrandModal").modal({
				//点击背景不会消失
				backdrop:"static"
			});
		});
		
		function getBrandById(id){
			$.ajax({
				url:"/TTXG/getBrandById/"+id,
				type:"GET",
				success:function(result){
					//数据回显			
					$("#brandid-static").text(result.extend.brand.brandid);
					$("#update_brandname").val(result.extend.brand.brandname);
				}
			
			});

		}
		//确认修改
		$("#updateBrand_btn").click(function(){
			//获得表单数据，吧方法设为put
			var data = $("#updateBrandModal form").serialize()+"&_method=PUT";
			if(!validate_updateBrand()){
				return false;
			}
			//发送put请求
			$.ajax({
				url:"/TTXG/updateBrandById/"+$(this).attr("brand-id"),
				data:data,
				type:"POST",
				success:function(result){
					$("#updateBrandModal").modal("hide");
					toPage(currentPage);
				}			
			});
		});
		
		//验证
		function validate_updateBrand(){
			var r = true;
			//拿到用户输入的要校验的数据
			var brandname = $("#update_brandname").val();
		
			
			//编写正则表达式
			//验证中文字符字母数组的正则
			var reg_brandname =/^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
	
			if(!reg_brandname.test(brandname)){
				$("#brandname-feedback2").empty();//清空显示内容
            	$("#brandname-feedback2").append("请输入正确的商品名称");//修改显示的内容
            	$("#update_brandname").removeClass("is-valid");//清除合法状态
            	$("#update_brandname").addClass("is-invalid");//添加非法状态
				r = false;			
			}else{
				$("#brandname-feedback2").empty();//清空显示内容
				$("#update_brandname").removeClass("is-invalid");
				$("#update_brandname").addClass("is-valid");//改为合法状态
			}
			
			
			return r;
		}
		
//------------------------------------------------------------显示表格-----------------------------------------
		function buid_item_table(result) {
				$("#item_tbody").empty();
				var shl = result.extend.page.list;
				//jQuery自带的遍历each
				$.each(shl, function(index, item) {
						var checkbox_td = $('<td><input type="checkbox" class="check_item"></td>');
						var brandid_td = $("<td></td>").append(item.brandid);
						var brandname_td = $("<td></td>").append(item.brandname);
						
						console.log(index);
						
						var delete_button= $('<button></button>').append("<i class='fa fa-trash-o'></i> 删除").addClass("btn btn-danger delete-btn").val(item.brandid).attr("brand-id",item.brandid);
						var update_button= $("<button></button>").append("<i class='fa fa-pencil'></i> 修改").addClass("btn btn-info update-btn").val(item.brandid).attr("brand-id",item.brandid);
						console.log(delete_button);
						var xxx_td = $("<td></td>").append(delete_button).append(" ").append(update_button);
						
						$("<tr></tr>").append(checkbox_td)
							.append(brandid_td)
							.append(brandname_td)
							.append(xxx_td)
							.appendTo("#item_tbody");

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











