<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">

    	<title>Contact Us - We are always there to help you </title>

    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="Bootstrap, Struts2, Javascript">
		<meta http-equiv="description" content="ContactUs Form for User">
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

    			var result = "<s:property value = 'add_contact_query_result'/>";

    			if (result == 1)
            		$("#contactFormAlertSuccess").slideDown(400);    		// Show the Success Alert
        		else if(result == 2)
            		$("#contactFormAlertTechError").slideDown(400);			// Show the Error Alert when there is some technical error

            	$(".alert").find(".close").on("click", function (e) {

        			e.stopPropagation();    					// Don't allow the click to bubble up the DOM
        			e.preventDefault();    						// Don't let any default functionality occur (in case it's a link)
        			$(this).closest(".alert").slideUp(400);    	// Hide this specific Alert
    			});
        	});

			function changeSubmitTextAndDisable() {
 				var submit_button = document.getElementById("contact_form_submit_button");
 				submit_button.setAttribute("disabled", "disabled");
 				submit_button.innerHTML = "Processing Your Request";
			}
		</script>
	</head>

  	<body>

    	<jsp:include page="../HTML/Header.html"></jsp:include>

    	<!-- Contact Form code starts  -->

        <div class="page-content contact">
            <div class="mycontainer">
                <div class="row contact_form_body">
                	<h3>send message</h3>

                	<div id="contactFormAlertSuccess" class="alert alert-success hide">
  						<a class="close">×</a>
          				<strong>Your query has been successfully sent. Please check your Email !!!</strong>
					</div>

    	    		<div id="contactFormAlertTechError" class="alert alert-error hide">
    	    			<a class="close">×</a>
        				<strong>Technical Error ! Please try again after some time.</strong>
					</div>

                    <form method="post" action="sendContactMessage" name="contact_form" autocomplete="off" onsubmit = "changeSubmitTextAndDisable()">

                    	<input
                            type="text"
                            name="contact_form_fullname"
                            class="span6"
                            placeholder="Enter your Full Name"
                            required
                        ><br>

                        <input
                            type="email"
                            name="contact_form_email"
                            class="span6"
                            placeholder="Enter your Email"
                            autocomplete="on"
                            required
                        ><br>

                        <input
                            type="text"
                            name="contact_form_subject"
                            class="span6"
                            placeholder="Enter the Subject"
                            required
                        >

                        <textarea
                            name="contact_form_query"
                            rows="7"
                            class="span10"
                            placeholder="Type your Query"
                            required
                        ></textarea>

                        <button
                            type="submit"
                            id="contact_form_submit_button"
                            >Submit the Query
                        </button>

                        <s:token name="contact_form_token"></s:token>
                    </form>
                </div>
            </div>
        </div>
  	</body>
</html>