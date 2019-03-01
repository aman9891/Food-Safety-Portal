<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="com.fsp.utilities.classes.UpdateStatusAfterEmailConfirmation"%>
<%@ page language="java" import="com.fsp.utilities.classes.AESencrp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">

	    <title>Your Account Has Been Verified and Activated Successfully. Enjoy our Site</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="Bootstrap, Email Account Confirmation, JavaMail API">
		<meta http-equiv="description" content="This page is shown when particular user clicks on verification link sent via email">
		<meta name="author" content="Aman Agarwal, Meghal Aggarwal">

		<link rel="icon"
      		  type="image/png"
      		  href="CssAndJsFiles/images/General/favicon.jpg">

      	<!-- My own css file -->
		<link href="CssAndJsFiles/css/MyCSS.css" rel="stylesheet" type="text/css">
	</head>

  	<body>
  		<%
  			String link_fetched_email = AESencrp.decrypt(request.getParameter("token"));
  		  	int email_confirmation_status = UpdateStatusAfterEmailConfirmation.update(link_fetched_email);

  		  	if(email_confirmation_status == 1) {
  		%>
	  		  	<img class="confirmation_image" src="CssAndJsFiles/images/General/successEmailConfirmation.gif" alt="">
  			  	<p class="confirmation_text">Your account has been verified and successfully activated. Please login to continue.</p>
  			  	<p class="confirmation_propagate_link"><a href="JSP/CompleteLogInForm.jsp">Login!!</a></p>
  		<%  }
  		  	else {	%>
  		  		<img class="confirmation_image" src="CssAndJsFiles/images/General/wrongEmail.jpg" alt="Wrong Email Address">
  		  		<p class="confirmation_text">Either the account has already been verified or does not exist.</p>
  		  		<p class="confirmation_propagate_link"><a href="JSP/HomePage.jsp">Home Page!!</a></p>	
		<% }
  		%>
  	</body>
</html>