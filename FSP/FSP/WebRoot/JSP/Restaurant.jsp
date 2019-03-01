<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">

    	<title></title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="bootstarp, jquery, fullcalendar">
		<meta http-equiv="description" content="This page is shown when particular restaurant link is clicked">

		<link rel="icon"
      		  type="image/png"
      		  href="CssAndJsFiles/images/General/favicon.jpg">

		<!-- Style sheet for template -->
		<link href="CssAndJsFiles/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="CssAndJsFiles/css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
		<script src="CssAndJsFiles/js/bootstrap.min.js" type="text/javascript"></script>
		<link href="CssAndJsFiles/css/style.css" rel="stylesheet" type="text/css">

		<!-- Style sheet for fonts -->
		<link href="CssAndJsFiles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

		<!-- My own CSS file -->
		<link href="CssAndJsFiles/css/MyCSS.css" rel="stylesheet" type="text/css">
	</head>

  	<body>
    	<jsp:include page="../HTML/Header.html"></jsp:include>
    	<jsp:include page="../HTML/RestaurantBasicData.html"></jsp:include>
  	</body>
</html>