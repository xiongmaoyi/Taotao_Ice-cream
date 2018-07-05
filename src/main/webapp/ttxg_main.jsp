<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>涛涛雪糕管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<!-- BOOTSTRAP STYLES-->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
    <style type="text/css">
		body{font-family:"微软雅黑"; 	
		}
		
		
	</style>

  </head>
  
  <body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="ttxg_main.jsp">涛涛雪糕管理系统</a>
            </div>

            <div class="header-right">

              


            </div>
        </nav>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <div class="user-img-div">
                            <img src="imges/xg01.jpg" class="img-thumbnail" />

                            <div class="inner-text">
                               <s:property value="#session.username"/><br>
                                Taotao icecream 

                            <br >
                                <small>factory management system  </small>  
                                <shiro:user>
                                <small> 欢迎<shiro:principal/>     <a href="user/logout">LoginOut</a>  </small>
                                </shiro:user>
                                <br>  
                            </div>
                        </div>

                    </li>


                   <shiro:hasAnyRoles name="admin">
                    <li>
                        <a href="#"><i class="fa fa-yelp "></i>进货管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="jsp/Purchase.jsp" target="mg"><i class="fa fa-truck"></i>进货入库</a>
                            </li>
                            <li>
                                <a href="jsp/SearchPurchase.jsp" target="mg"><i class="fa fa-search"></i>进货订单查询</a>
                            </li>
                            
                        </ul>
                    </li>
                    </shiro:hasAnyRoles>
                     
                    <!--  
                    	hasRole有就显示
                    	hasAnyRoles有任何一个角色就能显示
                    	lacksRole 没有时显示	
                    	hasPermition name=“user：creat” 有权限则显示
                    	lacksPermission 没有这个权限时显示
                     -->
                     <shiro:hasAnyRoles name="admin,sale">
                     <li>
                        <a href="#"><i class="fa fa-yelp "></i>仓库管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="jsp/InStorehouse.jsp" target="mg"><i class="fa fa-search"></i>查询仓库</a>
                            </li>
                        </ul>
                    </li>
                    </shiro:hasAnyRoles>
              
                    <shiro:hasAnyRoles name="admin,sale">
                    <li>
                        <a href="#"><i class="fa fa-yelp "></i>批发销售管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                           
                             <li>
                                <a href="jsp/OfflineSale.jsp" target="mg"><i class="fa fa-cny "></i>线下销售 </a>
                            </li>
                             <li>
                                <a href="jsp/SearchSale.jsp" target="mg"><i class="fa fa-search"></i>销售单查询 </a>
                            </li>
                             
                           
                        </ul>
                    </li>
                    </shiro:hasAnyRoles>
                    
                    <shiro:hasAnyRoles name="admin,delivery">
                     <li>
                        <a href="#"><i class="fa fa-yelp "></i>送货管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                           
                             <li>
                                <a href="jsp/UnDeliver.jsp" target="mg"><i class="fa fa-newspaper-o "></i>未接订单 </a>
                            </li>
                             <li>
                                <a href="jsp/MyDeliver.jsp" target="mg"><i class="fa fa-motorcycle"></i>我接的订单</a>
                            </li>
                             
                           
                        </ul>
                    </li>
                    </shiro:hasAnyRoles>
                    

                    
                    <shiro:hasAnyRoles name="admin">
                     <li>
                        <a href="#"><i class="fa fa-yelp "></i>收支统计 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">                 
                             <li>
                                <a href="jsp/OfflineSale.jsp" target="mg"><i class="fa fa-bar-chart-o  "></i>统计报表 </a>
                            </li>                              
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-yelp "></i>订单管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">                 
                            <li>
                                <a href="jsp/OrderManage.jsp" target="mg"><i class="fa fa-search"></i>订单管理</a>
                            </li>                              
                        </ul>
                    </li>
                    </shiro:hasAnyRoles>
                    
                     <shiro:hasAnyRoles name="admin,sale">
                    <li>
                        <a href="#"><i class="fa fa-yelp "></i>系统管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="jsp/UserManage.jsp" target="mg"><i class="fa fa-users "></i>用户管理</a>
                            </li>

                            <li>
                                <a href="jsp/GoodsManage.jsp" target="mg"><i class="fa fa-cubes"></i>商品管理</a>
                            </li>
                            <li>
                                <a href="jsp/BrandManage.jsp" target="mg"><i class="fa fa-cc-diners-club"></i>品牌管理</a>
                            </li> 
                        </ul>
                   </li>
                    </shiro:hasAnyRoles>
                    
                    
                    
                    
                </ul>
            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">涛涛雪糕管理窗口</h1>
                        <h1 class="page-subhead-line"> </h1>

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="alert alert-info" style="padding: 0;border: 0;">
                            
                           <iframe src="index.jsp" name="mg" width="100%" height="600px" frameborder="0" style="padding: 0;" >
							</iframe>

                        </div>
                    </div>
                </div>

            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <div id="footer-sec" align="center">
        &copy; 2018 Practice 1 groups | 期末实训 - Practical operation - 实训作业
    </div>
    <!-- /. FOOTER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="js/jquery.metisMenu.js"></script>
    <!-- CUSTOM SCRIPTS -->
    <script src="js/custom.js"></script>

  </body>
</html>
