<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">

    	<title>Add Data of New Restaurants in your City and be Ahead</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="Struts2, Bootstrap">
		<meta http-equiv="description" content="City Manager's Form for Adding New Restaurant Data">
		<meta name="author" content="Aman Agarwal, Meghal Aggarwal">

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

		<!-- My own css file -->
		<link href="CssAndJsFiles/css/MyCSS.css" rel="stylesheet" type="text/css">

		<!-- JQuery file needed for running the code -->
		<script src="CssAndJsFiles/js/jquery.min 1.10.2.js"></script>

		<script>
			$(document).ready(function () {

				var result = "<s:property value = 'add_restaurant_result'/>";

    			if (result == 1)
            		$("#addRestaurantFormAlertSuccess").slideDown(400);    		// Show the Success Alert
        		else if(result == 2)
            		$("#addRestaurantFormAlertDupError").slideDown(400);		// Show when Registration Number already exists
            	else if(result == 3)
            		$("#addRestaurantFormAlertTechError").slideDown(400);		// Show the Error Alert when there is some technical error

            	$(".alert").find(".close").on("click", function (e) {

        			e.stopPropagation();    					// Don't allow the click to bubble up the DOM
        			e.preventDefault();    						// Don't let any default functionality occur (in case it's a link)
        			$(this).closest(".alert").slideUp(400);    	// Hide this specific Alert
    			});
        	});
        </script>
	</head>

  	<body>
    	<jsp:include page="../HTML/CmHeader.html"></jsp:include>
    	<div id="city_manager_work_area_container">
    		<div class="city_manager_container">
    			<jsp:include page="../HTML/AddRestaurantForm.html"></jsp:include>
    		</div>
    	</div>
  	</body>
</html>