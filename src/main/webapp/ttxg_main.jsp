<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
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
                <a class="navbar-brand" href="index.jsp">涛涛雪糕管理系统</a>
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
                            <img src="img/cow.png" class="img-thumbnail" />

                            <div class="inner-text">
                               <s:property value="#session.username"/><br>
                                Taotao icecream 

                            <br >
                                <small>factory management system  </small>  
                                <br>  
                            </div>
                        </div>

                    </li>


                   
                    <li>
                        <a href="#"><i class="fa fa-yelp "></i>进货管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="1_Grain_flour/putin_index.jsp" target="mg"><i class="fa fa-circle-o"></i>进货入库</a>
                            </li>
                            <li>
                                <a href="1_Grain_flour/draw_index.jsp" target="mg"><i class="fa fa-circle-o "></i>进货订单查询</a>
                            </li>
                            
                        </ul>
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-yelp "></i>仓库管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="2_Purchase/wheat_buy.jsp" target="mg"><i class="fa fa-key"></i>查询仓库</a>
                            </li>
                            
                            
                           
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-yelp "></i>批发销售管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                           
                             <li>
                                <a href="process_showView" target="mg"><i class="fa fa-circle-o "></i>线下销售 </a>
                            </li>
                             
                             
                           
                        </ul>
                    </li>
                     
                    <li>
                        <a href="#"><i class="fa fa-yelp "></i>用户管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="4_Sale/sale_index.jsp" target="mg"><i class="fa fa-circle-o "></i>客户管理</a>
                            </li>
                             
                        </ul>
                    </li>
                    
                    
                    
                    
                    
                </ul>
            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">涛涛雪糕</h1>
                        <h1 class="page-subhead-line"> </h1>

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="alert alert-info">
                            Niuniu flour factory management system.
                            
                          <br />
                            
                           <iframe name="mg" width="100%" height="600px" frameborder="0"  >
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
    <div id="footer-sec">
        &copy; 2017 Practice 1 groups | 期末实训 - Practical operation - 实训作业
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
