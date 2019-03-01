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

	    <title>Log In - Enjoy the experience you never had before !!!</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="Bootstrap, Javascript, Struts2">
		<meta http-equiv="description" content="Shows the Log In Form For ALL">
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

		<script type="text/javascript">
			$(document).ready(function () {
			// Run this code only when the DOM (all elements) are ready
    			var result = "<s:property value = 'login_result'/>";

    			if(result == 2)
            		$("#formAlertNotVerified").slideDown(400);			// Show the Error Alert when email id is not verified
            	else if(result == 3)
            		$("#formAlertIncorrectPassword").slideDown(400);	// Show the Error Alert when email is registered but password is not correct
            	else if(result == 4)
            		$("#formAlertNotRegistered").slideDown(400);		// Show the Error alert when email is not registered
            	else if(result == 5)
            		$("#formAlertTechError").slideDown(400);			// Show the Error alert when technical error occurs

            	$(".alert").find(".close").on("click", function (e) {
        		// Find all elements with the "alert" class, get all descendant elements with the class "close", and bind a "click" event handler

        		e.stopPropagation();    					// Don't allow the click to bubble up the DOM
        		e.preventDefault();    						// Don't let any default functionality occur (in case it's a link)
        		$(this).closest(".alert").slideUp(400);    	// Hide this specific Alert
    			});
        	});	
		</script>
  	</head>

  	<body>
    	<jsp:include page="../HTML/Header.html"></jsp:include>
    	<jsp:include page="../HTML/LogInForm.html"></jsp:include>
  	</body>
</html>