<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">

    	<title>Food Safety Portal - Search the Restaurants the easiest way And Do Much More !!</title>

    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="Bootstrap, Struts2, JQuery">
		<meta http-equiv="description" content="Home Page of FSP">

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

		<!-- Supporting files for the Main Slider -->
		<link href="CssAndJsFiles/MainSlider/engine1/style.css" rel="stylesheet" type="text/css"/>
    	<script src="CssAndJsFiles/MainSlider/engine1/jquery.js" type="text/javascript"></script>

		<!-- Supporting files for the Most Visited Places Slider -->
		<link href="CssAndJsFiles/MostLikedPlacesSlider/engine2/style.css" rel="stylesheet" type="text/css">
		<script src="CssAndJsFiles/MostLikedPlacesSlider/engine2/jquery.js" type="text/javascript"></script>

		<!-- My own CSS file -->
		<link href="CssAndJsFiles/css/MyCSS.css" rel="stylesheet" type="text/css">
  	</head>

  	<body>
    	<jsp:include page="../HTML/Header.html"></jsp:include>
    	<jsp:include page="../HTML/MainSlider.html"></jsp:include>
    	<jsp:include page="../HTML/HomePageSearchForm.html"></jsp:include>
    	<jsp:include page="../HTML/TagLine.html"></jsp:include>
    	<jsp:include page="../HTML/OurSpecials.html"></jsp:include>
    	<jsp:include page="../HTML/MostLikedPlaces.html"></jsp:include>
    	<jsp:include page="../HTML/Footer.html"></jsp:include>

    	<!-- Script files for Main Slider -->
    	<script src="CssAndJsFiles/MainSlider/engine1/wowslider.js" type="text/javascript"></script>
        <script src="CssAndJsFiles/MainSlider/engine1/script.js" type="text/javascript"></script>

    	<!-- Script files for Most Liked Places Slider -->
        <script src="CssAndJsFiles/MostLikedPlacesSlider/engine2/wowslider.js" type="text/javascript"></script>
        <script src="CssAndJsFiles/MostLikedPlacesSlider/engine2/script.js" type="text/javascript"></script>
  	</body>
</html>