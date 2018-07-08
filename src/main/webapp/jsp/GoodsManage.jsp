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
<title>商品管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- 引入aewsome图标库 -->
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- 引入jquery -->
<script src="${basePath}js/jquery-3.3.1.js"></script>
<!-- 引入bootstrap -->
<script src="https://cdn.bootcss.com/bootstrap/4.1.1/js/bootstrap.js"></script>
<link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.css"
	rel="stylesheet">
<!-- 引入fileinput -->
<link href="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/css/fileinput.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.4.8/js/fileinput.js"></script>


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
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">添加商品</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="addForm">

						<div class="form-group row">
							<label for="write_goodsname" class="col-sm-3 col-form-label"
								>商品名称</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="write_goodsname" name="goodsname" maxlength="20"
									placeholder="请输入商品名称">
								<input type="hidden" name="state" value="1">
								<div class="invalid-feedback" id="goodsname-feedback"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="select_brand" class="col-sm-3 col-form-label">商品品牌</label>
							<div class="col-sm-9">
								<select class="custom-select" id="brand_select" name="brandid">
									
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="write_goodsmoney" class="col-sm-3 col-form-label">商品进价</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="write_goodsmoney" maxlength="15"
									name="goodsmoney" placeholder="请输入单价">
								<div class="invalid-feedback" id="goodsmoney-feedback"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="write_marketprice" class="col-sm-3 col-form-label">市场价格</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="write_marketprice" maxlength="15"
									name="marketprice" placeholder="请输入市场价格">
								<div class="invalid-feedback" id="marketprice-feedback"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="upload_goodspng" class="col-sm-3 col-form-label">上传图片</label>
							<div class="col-sm-9">
							
								<input name="file" class="form-control-file" type="file" id="file"/>
								<!-- 上传到指定相册所需的token -->								
								<input name="Token" type="hidden" id="Token" value="6262b3db9806129a9c9006e17b411e2ab77ab9a6:IhetRcHXL6BdjvHUW23XbAeAnuI=:eyJkZWFkbGluZSI6MTUzMDc5NTU5MSwiYWN0aW9uIjoiZ2V0IiwidWlkIjoiNjUyNTk1IiwiYWlkIjoiMTQ2NTE1MyIsImZyb20iOiJmaWxlIn0=" />
								<!-- 进度条 -->							
								<progress style="display:none" max="329105" value="0"></progress>							
								<input type="hidden" name="goodspng" value="" id="add-png">
								<!-- <input type="file" class="form-control-file"
									id="upload_goodspng" name="goodspng"> -->
							</div>
						</div>

						<div class="form-group row">
							<label for="write_goodsremarks" class="col-sm-3 col-form-label">备注</label>
							<div class="col-sm-9">
								<textarea class="form-control" id="write_goodsremarks" maxlength="400"
									name="goodsremarks" rows="3"></textarea>
							</div>

						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-info upbtn" id="addUploadBtn" value="Upload" >上传图片</button>
					<button type="button" class="btn btn-primary"
						id="insertGoods_btn" >添加</button>
				</div>
			</div>
		</div>
	</div>







	<!-- -----------------------------------------商品修改的modal框--------------------------------------- -->
	
	
	<div class="modal fade" id="updateGoodsModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModal3Label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">修改商品</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="updateForm"  enctype="multipart/form-data">
						
						<div class="form-group row">
							<label for="goodsid-static" class="col-sm-3 col-form-label"
								>商品编号</label>
							<div class="col-sm-9">
								<!-- <input type="text" class="form-control" id="update_goodsid" name="goodsid"
									> -->
								<p class="form-control-static" id="goodsid-static">111</p>
							</div>
						</div>
						<div class="form-group row">
							<label for="update_goodsname" class="col-sm-3 col-form-label"
								>商品名称</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="update_goodsname" name="goodsname"
									placeholder="请输入商品名称">
								<div class="invalid-feedback" id="goodsname-feedback2"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="select_brand" class="col-sm-3 col-form-label">商品品牌</label>
							<div class="col-sm-9">
								<select class="custom-select" id="brand_select" name="brandid">
									
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="update_goodsmoney" class="col-sm-3 col-form-label">商品进价</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="update_goodsmoney"
									name="goodsmoney" placeholder="请输入单价">
								<div class="invalid-feedback" id="goodsmoney-feedback2"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="update_marketprice" class="col-sm-3 col-form-label">市场价格</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="update_marketprice" maxlength="15"
									name="marketprice" placeholder="请输入市场价格">
								<div class="invalid-feedback" id="marketprice-feedback2"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="update_goodspng" class="col-sm-3 col-form-label">上传图片</label>
							<div class="col-sm-9">
							
								<input name="file" class="form-control-file" type="file" id="file"/>								
								<input name="Token" type="hidden" id="Token" value="6262b3db9806129a9c9006e17b411e2ab77ab9a6:IhetRcHXL6BdjvHUW23XbAeAnuI=:eyJkZWFkbGluZSI6MTUzMDc5NTU5MSwiYWN0aW9uIjoiZ2V0IiwidWlkIjoiNjUyNTk1IiwiYWlkIjoiMTQ2NTE1MyIsImZyb20iOiJmaWxlIn0=" />
								<!-- 进度条 -->							
								<progress style="display:none" max="329105" value="0"></progress>
								<input type="hidden" name="goodspng" value="" id="update-png">
								
								<!-- <input type="file" class="form-control-file"
									id="update_goodspng" name="goodspng"> -->
							</div>
						</div>

						<div class="form-group row">
							<label for="update_goodsremarks" class="col-sm-3 col-form-label">备注</label>
							<div class="col-sm-9">
								<textarea class="form-control" id="update_goodsremarks" 
									name="goodsremarks" rows="3"></textarea>
							</div>

						</div>
					</form>
					<!-- 上传成功后返回的数据 -->
					<!-- <div id="res"></div> -->
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-info upbtn" id="updateUploadBtn" value="Upload" >上传图片</button>
					<button type="button" class="btn btn-primary"
						id="updateGoods_btn">修改</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	


	<!-- **************************************************** -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>商品管理</h3>

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
							<td colspan="8" align="center">商品管理</td>
						</tr>

						<tr>
							<td colspan="1">商品列表</td>
							<td colspan="1"><select class="custom-select"
								id="searchType" name="searchType">
									<option selected value="1">按名称搜索</option>
									<option value="2">按商品编号搜索</option>
									<option value="3">按品牌搜索</option>

							</select></td>

							<td colspan="6">
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
							<th scope="row"> <input type="checkbox" id="check_all"/> </th>
							<th scope="row">编号</th>
							<th scope="row">名称</th>
							<!-- <th scope="row">商品数量</th> -->
							<th scope="row">进价</th>
							<th scope="row">市场价</th>
							<th scope="row">品牌</th>
							<th scope="row">备注</th>
							<th scope="row">操作</th>
						</tr>
					</thead>

					<tbody id="goods_tbody">

					
					</tbody>

					<tr style="background-color: white">
						<td colspan="8" align="center">
							<button class="btn btn-success" type="button" id="addGoods">
								<i class="fa fa-plus fa-lg"></i> 添加商品
							</button>
							<button class="btn btn-danger" type="button" id="deleteSelectedGoods">
								<i class="fa fa-trash-o fa-lg"></i> 删除商品
							</button>
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
			toPage(1)		
		});
		
		//转到第pn页
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
			var searchType;			
			var goodsNameIsTrue = true;
			var currentPage;		
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
		
//-------------------------------------------删除--------------------------------------------------------------------
		//绑定删除按钮点击事件
		$(document).on("click",".delete-btn",function(){
			//父元素tr的第二个td内的内容
			var goodsname = $(this).parents("tr").find("td:eq(2)").text();
			//1、显示是否删除
			if(confirm("确认删除【"+goodsname+"】？")){
				deleteById($(this).attr("goods-id"));
			}
		
		});
			
		//删除函数
		function deleteById(goodsid){
		
			$.ajax({
				url : "/TTXG/deleteGoodsById/"+goodsid,
				type : "DELETE",
				success : function(result) {				
					toPage(currentPage);
				}
			});
		}
		//批量删除函数
		function deleteByIds(ids){
		
			$.ajax({
				url : "/TTXG/deleteGoodsById/"+ids,
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
		$("#deleteSelectedGoods").click(function() {
			if ($(".check_item:checked").length == 0) {
				alert("请选择要删除的条目。");
			} else {
				var goodsnames = '';
				var ids = '';
				$.each($(".check_item:checked"), function() {
					//组装name
					goodsnames = goodsnames + $(this).parents("tr").find("td:eq(2)").text() + ",";
					//组装ids以-分割
					ids = ids + $(this).parents("tr").find("td:eq(1)").text() + "-";
				});
	
				//去除多余的分割号
				goodsnames = goodsnames.substring(0, goodsnames.length - 1);
				ids = ids.substring(0, ids.length - 1);
	
				if (confirm("确认删除【" + goodsnames + "】吗？")) {
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
		$("#addGoods").click(function(){
			//初始化
			pngUrl=null;
			//jindutiao
			$("progress").val(0);	
			reset_form("#addGoodsModal form");	
			//查询品牌信息
			getBrand("#addGoodsModal select");		
			//显示modal框
			$("#addGoodsModal").modal({
				//点击背景不会消失
				backdrop:"static"
			});	
		});
		
		
		//查询品牌信息
		function getBrand(selectid){
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
		}
		
		//----------------------------------------添加：校验-----------------------------------------------
		
		//商品添加的表单前端校验方法
		function validate_addGoods(){
			var r = true;
			//拿到用户输入的要校验的数据
			var goodsname = $("#write_goodsname").val();
			var goodsmoney = $("#write_goodsmoney").val();
			var marketprice = $("#write_marketprice").val();
			//编写正则表达式
			//验证中文字符字母数组的正则
			var reg_goodsname =/^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
			//验证数组或小数的正则
			var reg_goodsmoney =/^(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?$/;
			
			if(!reg_goodsname.test(goodsname)){
				$("#goodsname-feedback").empty();//清空显示内容
            	$("#goodsname-feedback").append("请输入正确的商品名称");//修改显示的内容
            	$("#write_goodsname").removeClass("is-valid");//清除合法状态
            	$("#write_goodsname").addClass("is-invalid");//添加非法状态
				r = false;			
			}else{
				$("#goodsname-feedback").empty();//清空显示内容
				$("#write_goodsname").removeClass("is-invalid");
				$("#write_goodsname").addClass("is-valid");//改为合法状态
			}
			
			
			
			if(!reg_goodsmoney.test(goodsmoney)){			
				$("#goodsmoney-feedback").empty().append("请输入正确的商品价格");
            	$("#write_goodsmoney").removeClass("is-valid").addClass("is-invalid");				
				r = false;			
			}else{
				$("#goodsmoney-feedback").empty();//清空显示内容
				$("#write_goodsmoney").removeClass("is-invalid").addClass("is-valid");//改为合法状态
			}
			
			if(!reg_goodsmoney.test(goodsmoney)){			
				$("#marketprice-feedback").empty().append("请输入正确的市场价格");
            	$("#write_marketprice").removeClass("is-valid").addClass("is-invalid");				
				r = false;			
			}else{
				$("#goodsmoney-feedback").empty();//清空显示内容
				$("#write_goodsmoney").removeClass("is-invalid").addClass("is-valid");//改为合法状态
			}	
			
			if(goodsNameIsTrue == false){
				$("#goodsname-feedback").empty().append("库中已有该商品");
            	$("#write_goodsname").removeClass("is-valid").addClass("is-invalid");
				r = false;
			}
		
			return r;
		}
		
		//商品名称数据库校验
		$("#write_goodsname").change(function(){
			goodsNameIsTrue = true;
			validate_goodsName();					
		});
		
		function validate_goodsName(){
			var data ={"goodsname":$("#write_goodsname").val()}; 
			$.ajax({
				url:"/TTXG/checkGoodsName",
				data:data,
				type:"POST",
				success:function(result){
					if(result.code==100){
						$("#goodsname-feedback").empty();//清空显示内容
						$("#write_goodsname").removeClass("is-valid")
					}else{
						$("#goodsname-feedback").empty().append("库中已有该商品");
            			$("#write_goodsname").removeClass("is-valid").addClass("is-invalid");
            			goodsNameIsTrue = false;
					}						
				}						
			});
		}
		
		
		//确认添加按钮
		$("#insertGoods_btn").click(function(){
					
			//jquery获得表单数据的方法（获得表单提交的数据key：name value：value）
			var data = $("#addGoodsModal form").serialize();
			
			console.log("uuuuuuuuuuuuuuuuuuuuuuuu"+data);
			
			
			//执行函数，校验通过才能继续执行
			if(!validate_addGoods()){
				return false;
			}
			
			
			
			$.ajax({
				url : "/TTXG/addGoods",
				data : data,
				type : "POST",
				success : function(result) {
					//初始化
					$("#addGoodsModal form input").removeClass("is-valid is-invalid");
					$("#goodsmoney-feedback").empty();
					$("#goodsname-feedback").empty();
					if(result.code == 100){
						//关闭模态框
						$("#addGoodsModal").modal("hide");
						//调到最后一页
						toPage(result.extend.page.pages);					
					}else{
						//后端校验不通过则显示错误信息
						if(result.extend.errorMap.goodsname){
							$("#goodsname-feedback").empty().append(result.extend.errorMap.goodsname);
            				$("#write_goodsname").removeClass("is-valid").addClass("is-invalid");
						}
						if(result.extend.errorMap.goodsmoney){
							$("#goodsmoney-feedback").empty().append(result.extend.errorMap.goodsmoney);
            				$("#write_goodsmoney").removeClass("is-valid").addClass("is-invalid");
						}
					}
					
				}
			});
			
		});
		
//------------------------------------------------------------修改-----------------------------------------		
		//updateGoodsModal
		//为后来添加的元素绑定事件
		$(document).on("click",".update-btn",function(){
		
			//查出商品信息
			//查出品牌信息
			//显示修改模态框
			
			//初始化
			pngUrl=null;
			reset_form("#updateGoodsModal form");
			$("progress").val(0);	
			//$("#goodsid-static").empty();
			//查询品牌信息
			getBrand("#updateGoodsModal select");
			//向查询函数传入id
			getGoodsById($(this).attr("goods-id"));
			//将id绑定在模态框的修改按钮上
			$("#updateGoods_btn").attr("goods-id",$(this).attr("goods-id"));
			
			$("#updateGoodsModal").modal({
				//点击背景不会消失
				backdrop:"static"
			});
		});
		
		function getGoodsById(id){
			$.ajax({
				url:"/TTXG/getGoodsById/"+id,
				type:"GET",
				success:function(result){
					//数据回显			
					$("#goodsid-static").text(result.extend.goods.goodsid)
					$("#update_goodsname").val(result.extend.goods.goodsname);
					$("#update_goodsmoney").val(result.extend.goods.goodsmoney);
					$("#update_marketprice").val(result.extend.goods.marketprice);
					$("#update_goodsremarks").val(result.extend.goods.goodsremarks);
					$("#update_marketprice").val(result.extend.goods.marketprice);
					$("#updateGoodsModal select").val(result.extend.goods.brandid);
				}
			
			});

		}
		//确认修改
		$("#updateGoods_btn").click(function(){
			//获得表单数据，吧方法设为put
			var data = $("#updateGoodsModal form").serialize()+"&_method=PUT";
			if(!validate_updateGoods()){
				return false;
			}
			//发送put请求
			$.ajax({
				url:"/TTXG/updateGoodsById/"+$(this).attr("goods-id"),
				data:data,
				type:"POST",
				success:function(result){
					$("#updateGoodsModal").modal("hide");
					toPage(currentPage);
				}			
			});
		});
		
		//验证
		function validate_updateGoods(){
			var r = true;
			//拿到用户输入的要校验的数据
			var goodsname = $("#update_goodsname").val();
			var goodsmoney = $("#update_goodsmoney").val();
			var marketprice = $("#update_marketprice").val();
			//编写正则表达式
			//验证中文字符字母数组的正则
			var reg_goodsname =/^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
			//验证数组或小数的正则
			var reg_goodsmoney =/^(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?$/;
			
			if(!reg_goodsname.test(goodsname)){
				$("#goodsname-feedback2").empty();//清空显示内容
            	$("#goodsname-feedback2").append("请输入正确的商品名称");//修改显示的内容
            	$("#update_goodsname").removeClass("is-valid");//清除合法状态
            	$("#update_goodsname").addClass("is-invalid");//添加非法状态
				r = false;			
			}else{
				$("#goodsname-feedback2").empty();//清空显示内容
				$("#update_goodsname").removeClass("is-invalid");
				$("#update_goodsname").addClass("is-valid");//改为合法状态
			}
			
			
			if(!reg_goodsmoney.test(goodsmoney)){			
				$("#goodsmoney-feedback2").empty().append("请输入正确的商品价格");
            	$("#update_goodsmoney").removeClass("is-valid").addClass("is-invalid");				
				r = false;			
			}else{
				$("#goodsmoney-feedback2").empty();//清空显示内容
				$("#update_goodsmoney").removeClass("is-invalid").addClass("is-valid");//改为合法状态
			}
			
			
			if(!reg_goodsmoney.test(marketprice)){			
				$("#marketprice-feedback2").empty().append("请输入正确的市场价格");
            	$("#update_marketprice").removeClass("is-valid").addClass("is-invalid");				
				r = false;			
			}else{
				$("#marketprice-feedback2").empty();//清空显示内容
				$("#update_marketprice").removeClass("is-invalid").addClass("is-valid");//改为合法状态
			}
					
			return r;
		}
		
//-----------------------------------------------------------上传图片---------------------------------------------------------
/* $("#upload_goodspng").fileinput({

                language:"zh", //设置语言

                uploadUrl:"http://up.imgapi.com/", //上传的地址

               allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀

               //uploadExtraData:{"id": 1, "fileName":'123.mp3'},

                uploadAsync: true, //默认异步上传

                showUpload:true, //是否显示上传按钮

                showRemove :true, //显示移除按钮

                showPreview :true, //是否显示预览

                showCaption:false,//是否显示标题

                browseClass:"btn btn-primary", //按钮样式    

               dropZoneEnabled: false,//是否显示拖拽区域

               //minImageWidth: 50, //图片的最小宽度

               //minImageHeight: 50,//图片的最小高度

               //maxImageWidth: 1000,//图片的最大宽度

               //maxImageHeight: 1000,//图片的最大高度

                //maxFileSize:0,//单位为kb，如果为0表示不限制文件大小

               //minFileCount: 0,

                maxFileCount:10, //表示允许同时上传的最大文件个数

                enctype:'multipart/form-data',

               validateInitialCount:true,

                previewFileIcon: "<iclass='glyphicon glyphicon-king'></i>",

               msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",

           }).on("fileuploaded", function (event, data, previewId, index){
				
                 console.log(data);

			});		 */

var pngUrl;
$('#addUploadBtn').click(function(){
	//序列化带文件的表单
    var formData = new FormData($('#addForm')[0]);
    var $id = "#add-png";
    console.log('fffffffffffffffffffff');
    console.log(formData);
    uploadFile(formData,$id);
});
$('#updateUploadBtn').click(function(){
	//序列化带文件的表单
    var formData = new FormData($('#updateForm')[0]);
    var $id ="#update-png";
    console.log('fffffffffffffffffffff');
    console.log(formData);
    uploadFile(formData,$id);
});

//上传文件
function uploadFile(formData,$id){
	 $.ajax({
        url: 'http://up.imgapi.com/',
        type: 'POST',
        data:formData,
        cache: false,
        contentType: false,
        processData: false,
        xhr: function() {
            myXhr = $.ajaxSettings.xhr();
            if(myXhr.upload){
                myXhr.upload.addEventListener('progress',progressHandlingFunction, false);
            }
            return myXhr;
        },
        beforeSend: function(){
			$('progress').show();
		},
        success: function(data){
			console.log(data);
			$('#res').html(JSON.stringify(data));
			alert("上传成功，linkurl:"+data.linkurl);
			pngUrl = data.linkurl;
			//window.location.reload();
			$($id).val(pngUrl);	
		},
        error: function(data){
			console.log(data);
		}
        
    });

}

function progressHandlingFunction(e){
    if(e.lengthComputable){
        $('progress').attr({value:e.loaded,max:e.total});
    }
}
		
		
		
		
//------------------------------------------------------------显示表格-----------------------------------------
		function buid_goods_table(result) {
				$("#goods_tbody").empty();
				var shl = result.extend.page.list;
				//jQuery自带的遍历each
				$.each(shl, function(index, item) {
						var checkbox_td = $('<td><input type="checkbox" class="check_item"></td>');
						var goodsid_td = $("<td></td>").append(item.goodsid);
						var goodsname_td = $("<td></td>").append(item.goodsname);
						/* var goodscount_td = $("<td></td>").append(item.goodscount); */
						var goodsmoney_td = $("<td></td>").append(item.goodsmoney);
						var marketprice_td = $("<td></td>").append(item.marketprice);
						var brand_td = $("<td></td>").append(item.brand.brandname);
						var goodsremarks_td = $("<td></td>").append(item.goodsremarks);
						console.log(index);
						
						var delete_button= $('<button></button>').append("<i class='fa fa-trash-o'></i> 删除").addClass("btn btn-danger delete-btn").val(item.goodsid).attr("goods-id",item.goodsid);//.click(function(){deleteById(item.goodsid);});
						var update_button= $("<button></button>").append("<i class='fa fa-pencil'></i> 修改").addClass("btn btn-info update-btn").val(item.goodsid).attr("goods-id",item.goodsid);
						console.log(delete_button);
						var xxx_td = $("<td></td>").append(delete_button).append(" ").append(update_button);
						
						$("<tr></tr>").append(checkbox_td)
							.append(goodsid_td)
							.append(goodsname_td)
							.append(goodsmoney_td)
							.append(marketprice_td)
							.append(brand_td)
							.append(goodsremarks_td)
							.append(xxx_td)
							.appendTo("#goods_tbody");

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











