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
<title>用户管理</title>

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
	<!-- -----------------------------------------用户添加的modal框--------------------------------------- -->
	<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModal3Label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">添加用户</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">

						<div class="form-group row">
							<label for="write_username" class="col-sm-3 col-form-label"
								>用户名</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="write_username" name="username" maxlength="20"
									placeholder="请输入用户名">
								<input type="hidden" name = "state" value="1"> 
								<div class="invalid-feedback" id="username-feedback"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="write_password" class="col-sm-3 col-form-label"
								>密码</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="write_password" name="password" maxlength="20"
									placeholder="请输入用户密码">
								<div class="invalid-feedback" id="password-feedback"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="select_usertype" class="col-sm-3 col-form-label">用户类型</label>
							<div class="col-sm-9">
								<select class="custom-select"  name="usertype">
								<shiro:hasAnyRoles name="admin">	<option value =1>管理员</option>
									<option value =2>售货员</option></shiro:hasAnyRoles>
									<option value =3>三级经销商</option>
								<shiro:hasAnyRoles name="admin">	<option value =4>送货员</option></shiro:hasAnyRoles>
									<option value =5>个体客户</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="write_name" class="col-sm-3 col-form-label">姓名</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="write_name" maxlength="15"
									name="name" placeholder="请输入姓名">
								<div class="invalid-feedback" id="name-feedback"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="write_phone" class="col-sm-3 col-form-label">电话</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="write_phone" maxlength="11"
									name="phone" placeholder="请输入手机号">
								<div class="invalid-feedback" id="phone-feedback"></div>
							</div>
						</div>

						<div class="form-group row">
							<label for="write_address" class="col-sm-3 col-form-label">地址</label>
							<div class="col-sm-9">
								<textarea class="form-control" id="write_address" maxlength="400"
									name="address" rows="3"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="insertUser_btn" >添加</button>
				</div>
			</div>
		</div>
	</div>







	<!-- -----------------------------------------用户修改的modal框--------------------------------------- -->
	
	
	<div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModal3Label" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal3Label">修改用户信息</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						
						<div class="form-group row">
							<label for="userid-static" class="col-sm-3 col-form-label"
								>用户编号</label>
							<div class="col-sm-9">
								
								<p class="form-control-static" id="userid-static">*</p>
							</div>
						</div>
						<div class="form-group row">
							<label for="update_username" class="col-sm-3 col-form-label"
								>用户名</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="update_username" name="username" maxlength="20"
									placeholder="请输入用户名">
								<div class="invalid-feedback" id="username-feedback2"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="update_password" class="col-sm-3 col-form-label"
								>密码</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="update_password" name="password" maxlength="20"
									placeholder="请输入用户密码">
								<div class="invalid-feedback" id="password-feedback2"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="select_usertype" class="col-sm-3 col-form-label">用户类型</label>
							<div class="col-sm-9">
								<select class="custom-select " id="user_select" name="usertype">
									<shiro:hasAnyRoles name="admin">	<option value =1>管理员</option>
									<option value =2>售货员</option></shiro:hasAnyRoles>
									<option value =3>三级经销商</option>
								<shiro:hasAnyRoles name="admin">	<option value =4>送货员</option></shiro:hasAnyRoles>
									<option value =5>个体客户</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="update_name" class="col-sm-3 col-form-label">姓名</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="update_name" maxlength="15"
									name="name" placeholder="请输入姓名">
								<div class="invalid-feedback" id="name-feedback2"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="update_phone" class="col-sm-3 col-form-label">电话</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="update_phone" maxlength="11"
									name="phone" placeholder="请输入手机号">
								<div class="invalid-feedback" id="phone-feedback2"></div>
							</div>
						</div>

						<div class="form-group row">
							<label for="update_address" class="col-sm-3 col-form-label">地址</label>
							<div class="col-sm-9">
								<textarea class="form-control" id="update_address" maxlength="400"
									name="address" rows="3"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="updateUser_btn">修改</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	


	<!-- **************************************************** -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>用户管理</h3>

			</div>
		</div>
		<div class="row"></div>


		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<!-- <form> -->
				<table class="table table-striped table-hover table-bordered"
					id='user_table'>

					<thead>
						<tr>
							<td colspan="7" align="center">用户管理</td>
						</tr>

						<tr>
							<td colspan="1">用户列表</td>
							<td colspan="1"><select class="custom-select"
								id="searchType" name="searchType">
									<option selected value="1">按用户编号</option>
									<option value="2">按用户名搜索</option>
									<option value="3">按姓名搜索</option>
									<option value="4">按手机号搜索</option>

							</select></td>

							<td colspan="5">
								<div class="input-group">


									<input type="text" class="form-control"
										placeholder="请输入用户编号" id="searchText">
									<div class="input-group-append">
										<button class="btn btn-success" type="button" id="searchBtn">
											<i class="fa fa-search fa-lg"></i> 搜索用户
										</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"> <input type="checkbox" id="check_all"/> </th>
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
							<button class="btn btn-success" type="button" id="addUser">
								<i class="fa fa-plus fa-lg"></i> 添加用户
							</button>
							<!-- 只有管理员才能删除用户 -->
				<shiro:hasAnyRoles name="admin">
							<button class="btn btn-danger" type="button" id="deleteSelectedUser">
								<i class="fa fa-trash-o fa-lg"></i> 删除用户
							</button>
				</shiro:hasAnyRoles>
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
				url : "/TTXG/showCustomerByCondition",
				data : {"pn":pn,"condition":condition,"searchType":searchType},
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_user_table(result);
					buid_page_info(result);
					buid_page_nav(result);
				}
			});
		}
		//---------------------------------------------全局变量---------------------------------------------------------
			//声明全局变量 搜索条件 搜索方式
			var condition;
			var searchType;			
			var userNameIsTrue = true;
			var currentPage;		
		//---------------------------------------------查询---------------------------------------------------------
		
		//查询类型转换
		$("#searchType").change(function(){
			
			var optionValue = $("#searchType option:selected").val();
			
			console.log(optionValue);
			if(optionValue==1){
				$("#searchText").attr("placeholder","请输入用户编号");
				//值变化时候放入searchtext变量
				searchType=1;
			}else if(optionValue==2){
				$("#searchText").attr("placeholder","请输入用户名");
				searchType=2;
			}else if(optionValue==3){
				$("#searchText").attr("placeholder","请输入姓名");
				searchType=3;
			}else if(optionValue==4){
				$("#searchText").attr("placeholder","请输入电话");
				searchType=4;
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
				url : "/TTXG/showCustomerByCondition",
				data : data,
				type : "GET",
				success : function(result) {
					console.log(result);
					buid_user_table(result);
					buid_page_info(result);
					buid_page_nav(result);
				}
			});
		
		});
		
//-------------------------------------------删除--------------------------------------------------------------------
		//绑定删除按钮点击事件
		$(document).on("click",".delete-btn",function(){
			//父元素tr的第二个td内的内容
			var name = $(this).parents("tr").find("td:eq(3)").text();
			//1、显示是否删除
			if(confirm("确认删除用户：【"+name+"】？")){
				deleteById($(this).attr("user-id"));
			}
		
		});
			
		//删除函数
		function deleteById(userid){
		
			$.ajax({
				url : "/TTXG/deleteUserById/"+userid,
				type : "DELETE",
				success : function(result) {				
					toPage(currentPage);
				}
			});
		}
		//批量删除函数
		function deleteByIds(ids){
		
			$.ajax({
				url : "/TTXG/deleteUserById/"+ids,
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
		$("#deleteSelectedUser").click(function() {
			if ($(".check_item:checked").length == 0) {
				alert("请选择要删除的条目。");
			} else {
				var usernames = '';
				var ids = '';
				$.each($(".check_item:checked"), function() {
					//组装name
					usernames = usernames + $(this).parents("tr").find("td:eq(3)").text() + ",";
					//组装ids以-分割
					ids = ids + $(this).parents("tr").find("td:eq(1)").text() + "-";
				});
	
				//去除多余的分割号
				usernames = usernames.substring(0, usernames.length - 1);
				ids = ids.substring(0, ids.length - 1);
	
				if (confirm("确认删除【" + usernames + "】吗？")) {
					deleteByIds(ids);
				}
			}
		});
		
		
//---------------------------------------------------------添加------------------------------------------------
		//传入表id，清除表内容、红绿、提示。
		function reset_form(id){
			$(id)[0].reset();
			$(id+" input").removeClass("is-invalid is-valid");
			$(id+" .invalid-feedback").empty();
		}
		
		//弹出添加框按钮
		$("#addUser").click(function(){
			//初始化
			reset_form("#addUserModal form");
			//查询品牌信息
			/* getBrand("#addUserModal select"); */		
			//显示modal框
			$("#addUserModal").modal({
				//点击背景不会消失
				backdrop:"static"
			});	
		});
		
		
		
		
		//----------------------------------------添加：校验-----------------------------------------------
		
		
		function validate_addUser(){
			var r = true;
			//拿到用户输入的要校验的数据
			$("#addUserModal form input").removeClass("is-valid is-invalid");
			$("#addUserModal form .invalid-feedback").empty();
			var username = $("#write_username").val();
			var password = $("#write_password").val();
			var name = $("#write_name").val();
			var phone = $("#write_phone").val();
			
			
			//编写正则表达式
			//验证中文字符字母数组的正则
			var reg_name =/^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
			//验证6或更多位
			var reg_password =/^[a-zA-Z\d_]{6,}$/;
			var reg_phone = /^[1][3,4,5,7,8][0-9]{9}$/;
			
			if(!reg_name.test(username)){
				$("#username-feedback").empty();//清空显示内容
            	$("#username-feedback").append("请输入正确的用户名");//修改显示的内容
            	$("#write_username").removeClass("is-valid");//清除合法状态
            	$("#write_username").addClass("is-invalid");//添加非法状态
				r = false;			
			}else{
				$("#username-feedback").empty();//清空显示内容
				$("#write_username").removeClass("is-invalid");
				$("#write_username").addClass("is-valid");//改为合法状态
			}
			
			
			if(!reg_password.test(password)){			
				$("#password-feedback").empty().append("请输入6位以上的密码");
            	$("#write_password").removeClass("is-valid").addClass("is-invalid");				
				r = false;			
			}else{
				$("#password-feedback").empty();//清空显示内容
				$("#write_password").removeClass("is-invalid").addClass("is-valid");//改为合法状态
			}
			
			if(!reg_name.test(name)){
				$("#name-feedback").empty();//清空显示内容
            	$("#name-feedback").append("请输入正确的姓名");//修改显示的内容
            	$("#write_name").removeClass("is-valid");//清除合法状态
            	$("#write_name").addClass("is-invalid");//添加非法状态
				r = false;			
			}else{
				$("#name-feedback").empty();//清空显示内容
				$("#write_name").removeClass("is-invalid");
				$("#write_name").addClass("is-valid");//改为合法状态
			}
			
			if(!reg_phone.test(phone)){
				$("#phone-feedback").empty();//清空显示内容
            	$("#phone-feedback").append("请输入正确的手机号");//修改显示的内容
            	$("#write_phone").removeClass("is-valid");//清除合法状态
            	$("#write_phone").addClass("is-invalid");//添加非法状态
				r = false;			
			}else{
				$("#phone-feedback").empty();//清空显示内容
				$("#write_phone").removeClass("is-invalid");
				$("#write_phone").addClass("is-valid");//改为合法状态
			}
			
			
			if(userNameIsTrue == false){
				$("#username-feedback").empty().append("用户名已存在");
            	$("#write_username").removeClass("is-valid").addClass("is-invalid");
				r= false;
			}	
			return r;
		}
		
		
		$("#write_username").change(function(){
			userNameIsTrue = true;
			validate_userName();				
		});
		
		function validate_userName(){
			var data ={"username":$("#write_username").val()}; 
			$.ajax({
				url:"/TTXG/checkUserName",
				data:data,
				type:"POST",
				success:function(result){
					if(result.code==100){
						$("#username-feedback").empty();//清空显示内容
						$("#write_username").removeClass("is-invalid");
					}else{
						$("#username-feedback").empty().append("该用户名已存在");
            			$("#write_username").removeClass("is-valid").addClass("is-invalid");
            			userNameIsTrue = false;
					}						
				}						
			});
		
		
		}
		
		
		//确认添加按钮
		$("#insertUser_btn").click(function(){
					
			//jquery获得表单数据的方法（获得表单提交的数据key：name value：value）
			var data = $("#addUserModal form").serialize();
			
			//执行函数，qianduan校验通过才能继续执行
			if(!validate_addUser()){
				return false;
			}
			
			
			
			$.ajax({
				url : "/TTXG/addUser",
				data : data,
				type : "POST",
				success : function(result) {
				
					if(result.code == 100){
						//关闭模态框
						$("#addUserModal").modal("hide");
						//调到最后一页
						toPage(result.extend.page.pages);					
					}else{
						
						//后端校验不通过则显示错误信息
						if(result.extend.errorMap.username){
							$("#username-feedback").empty().append(result.extend.errorMap.username);
            				$("#write_username").removeClass("is-valid").addClass("is-invalid");
						}
						if(result.extend.errorMap.password){
							$("#password-feedback").empty().append(result.extend.errorMap.password);
            				$("#write_password").removeClass("is-valid").addClass("is-invalid");
						}
						if(result.extend.errorMap.name){
							$("#name-feedback").empty().append(result.extend.errorMap.name);
            				$("#write_name").removeClass("is-valid").addClass("is-invalid");
						}
						if(result.extend.errorMap.phone){
							$("#phone-feedback").empty().append(result.extend.errorMap.phone);
            				$("#write_phone").removeClass("is-valid").addClass("is-invalid");
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
			reset_form("#updateUserModal form");	
			
			//向查询函数传入id
			getUserById($(this).attr("user-id"));
			//将id绑定在模态框的修改按钮上
			$("#updateUser_btn").attr("user-id",$(this).attr("user-id"));
			
			$("#updateUserModal").modal({
				//点击背景不会消失
				backdrop:"static"
			});
		});
		
		function getUserById(id){
			$.ajax({
				url:"/TTXG/getUserById/"+id,
				type:"GET",
				success:function(result){
					//数据回显			
					$("#userid-static").text(result.extend.user.userid)
					$("#update_username").val(result.extend.user.username);
					$("#update_password").val(result.extend.user.password);
					$("#updateUserModal select").val(result.extend.user.usertype);
					$("#update_name").val(result.extend.user.name);
					$("#update_phone").val(result.extend.user.phone);
					$("#update_address").val(result.extend.user.address);
				}
			
			});

		}
		//确认修改
		$("#updateUser_btn").click(function(){
			//获得表单数据，吧方法设为put
			var data = $("#updateUserModal form").serialize()+"&_method=PUT";
			if(!validate_updateUser()){
				return false;
			}
			//发送put请求
			$.ajax({
				url:"/TTXG/updateUserById/"+$(this).attr("user-id"),
				data:data,
				type:"POST",
				success:function(result){
					$("#updateUserModal").modal("hide");
					toPage(currentPage);
				}			
			});
		});
		
		//验证
		function validate_updateUser(){
			var r = true;
			//拿到用户输入的要校验的数据
			$("#updateUserModal form input").removeClass("is-valid is-invalid");
			$("#updateUserModal form .invalid-feedback2").empty();
			var username = $("#update_username").val();
			var password = $("#update_password").val();
			var name = $("#update_name").val();
			var phone = $("#update_phone").val();
			
			
			//编写正则表达式
			//验证中文字符字母数组的正则
			var reg_name =/^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
			//验证6或更多位
			var reg_password =/^[a-zA-Z\d_]{6,}$/;
			var reg_phone = /^[1][3,4,5,7,8][0-9]{9}$/;
			
			if(!reg_name.test(username)){
				$("#username-feedback2").empty();//清空显示内容
            	$("#username-feedback2").append("请输入正确的用户名");//修改显示的内容
            	$("#update_username").removeClass("is-valid");//清除合法状态
            	$("#update_username").addClass("is-invalid");//添加非法状态
				r = false;			
			}else{
				$("#username-feedback2").empty();//清空显示内容
				$("#update_username").removeClass("is-invalid");
				$("#update_username").addClass("is-valid");//改为合法状态
			}
			
			
			if(!reg_password.test(password)){			
				$("#password-feedback2").empty().append("请输入6位以上的密码");
            	$("#update_password").removeClass("is-valid").addClass("is-invalid");				
				r = false;			
			}else{
				$("#password-feedback2").empty();//清空显示内容
				$("#update_password").removeClass("is-invalid").addClass("is-valid");//改为合法状态
			}
			
			if(!reg_name.test(name)){
				$("#name-feedback2").empty();//清空显示内容
            	$("#name-feedback2").append("请输入正确的姓名");//修改显示的内容
            	$("#update_name").removeClass("is-valid");//清除合法状态
            	$("#update_name").addClass("is-invalid");//添加非法状态
				r = false;			
			}else{
				$("#name-feedback2").empty();//清空显示内容
				$("#update_name").removeClass("is-invalid");
				$("#update_name").addClass("is-valid");//改为合法状态
			}
			
			if(!reg_phone.test(phone)){
				$("#phone-feedback2").empty();//清空显示内容
            	$("#phone-feedback2").append("请输入正确的手机号");//修改显示的内容
            	$("#update_phone").removeClass("is-valid");//清除合法状态
            	$("#update_phone").addClass("is-invalid");//添加非法状态
				r = false;			
			}else{
				$("#phone-feedback2").empty();//清空显示内容
				$("#update_phone").removeClass("is-invalid");
				$("#update_phone").addClass("is-valid");//改为合法状态
			}
			
			
			if(userNameIsTrue == false){
				$("#username-feedback2").empty().append("用户名已存在");
            	$("#update_username").removeClass("is-valid").addClass("is-invalid");
				r= false;
			}			
			return r;
		}
		
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
						
						var checkbox_td = $('<td><input type="checkbox" class="check_item"></td>');
						var userid_td = $("<td></td>").append(item.userid);
						var usertype_td = $("<td></td>").append(type);
						
						var username_td = $("<td></td>").append(item.username);
						var name_td = $("<td></td>").append(item.name);
						var phone_td = $("<td></td>").append(item.phone);
						console.log(index);
					
						var delete_button= $('<button></button>').append("<i class='fa fa-trash-o'></i> 删除").addClass("btn btn-danger delete-btn").val(item.userid).attr("user-id",item.userid);
						var update_button= $("<button></button>").append("<i class='fa fa-pencil'></i> 修改").addClass("btn btn-info update-btn").val(item.userid).attr("user-id",item.userid);
						console.log(delete_button);
						
						var xxx_td = $("<td></td>").append(delete_button).append(" ").append(update_button);
						
					
						$("<tr></tr>").append(checkbox_td)
							.append(userid_td)
							.append(usertype_td)
							.append(username_td)
							.append(name_td)
							.append(phone_td)
							.append(xxx_td)
							.appendTo("#user_tbody");

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











