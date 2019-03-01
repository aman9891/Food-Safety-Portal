<%@page import="org.apache.struts2.components.Property"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
		<meta http-equiv="keywords" content="AJAX, Struts2, Bootstrap, JSTL">
		<meta http-equiv="description" content="Shows the List of Searched Restaurants to the User">
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
		
		<!-- JQuery file needed for running the code -->
		<script src="CssAndJsFiles/js/jquery.min 1.10.2.js"></script>

		<!-- My own CSS file -->
		<link href="CssAndJsFiles/css/MyCSS.css" rel="stylesheet" type="text/css">
		
		<script type="text/javascript">
			$(document).ready(function() {
    			var s = $("#sticker");
    			var pos = s.position();
    			
    			$(window).scroll(function() {
        			var windowpos = $(window).scrollTop();
        			if (windowpos >= pos.top) {
            			s.addClass("stick");
        			} else {
            			s.removeClass("stick");
        			}
    			});
			});
		</script>
  	</head>
  
  	<body>
  		<jsp:include page="../HTML/Header.html"></jsp:include>
  		<jsp:include page="../HTML/SearchFormRestaurantListPage.html"></jsp:include>
  		
  		<div class="search-result-advertisement">
    		
    		
    		<!-- Restaurant List Code Starts -->
      		
    		
    		<div class="search-result-container left" id="excellent">
    			<div class="row searched-rest-row">
    				<div class="searched-rest-list-container">
    					<ol id="searched-rest-list">

    						<s:iterator value="fetched_data" var="data">
    						
    							<li id="${data.rest_reg_number}">
    								<div class="rest-left-part left">
    									<div class="search-name">

    										<!-- Name of searched restaurant -->

	    									<div class="rest-name-get-directions">
	    										<div class="searched-rest-name left">
	    											<h3><a href="JSP/Restaurant.jsp?rest-id=${data.rest_id}" title="${data.rest_name}, ${data.rest_locality}, ${data.rest_city}">${data.rest_name}</a></h3>
	    										</div>
	    										<div class="get-directions-button left">
	    											<a href="HTML/GetDirections.html" title="Get the Directions to ${data.rest_name}" class="get-direction" target="_blank">Get Direction <i class="icon-arrow-right"></i></a>
	    										</div>
	    									</div>

    										<!-- The address of restaurant -->

    										<div class="rest-address">
	    										<a class="main-area" title="Search Restaurants in ${data.rest_locality}">${data.rest_locality}</a>
    											<span class="search-result-address" title="${data.rest_address}, ${data.rest_locality}, ${data.rest_city}">› ${data.rest_address}, ${data.rest_locality}, ${data.rest_city}</span>
    										</div>

    										<!-- Timings of restaurant -->

    										<div class="rest-timings">
												<span title="Open from ${data.rest_hours}">
                                	    			<span class="grey-text">Hours: </span> ${data.rest_hours}
												</span>
											</div>

											<!-- Contact numbers of restaurant -->

											<div class="rest-contacts">
												<span title="Call to Contact">
													<span class="grey-text">Contact: </span> ${data.rest_landline_number}, ${data.rest_mobile_number}
            	                        		</span>
                	                		</div>
    									</div>
    								</div>

    								<div class="rest-right-part right">

    									<!-- Rating of the restaurant -->

    									<div class="search-result-stars right">
	    									<div class="rest-rating-number right" title="Rated ${data.rest_rating} out of 10">${data.rest_rating}</div>
											<div class="rating-rank right">
												<div class="rating-text right">${data.rest_rating_text}</div><br>
            	                            	<div class="rating-num-votes right" title="Rating based on ${data.rest_number_of_user_votes} users votes">${data.rest_number_of_user_votes} User Votes</div>
											</div>
										</div>

										<!-- Link to the reviews -->

										<div class="search-details-reviews right">
    	                            		<a href="" class="search-result-reviews right" title="User reviews for ${data.rest_name}">${data.rest_number_of_reviews} reviews</a>
        	                        		<i class="icon-edit icon-large right"></i>
            	                    	</div>

	                	                <!-- Icons for the facilities provided -->

										<div class="search-details-icons right">
            	            	        	<div class="search-result-icons">

            	            	        		<c:choose>
            	            	        			<c:when test="${data.service_menu}">
            	            	        				<a href="" class="searched-rest-menu"><i class="icon-book icon-large right" title="Menu Available"></i></a>
            	            	        			</c:when>
            	            	        			<c:otherwise>
            	            	        				<i class="icon-book icon-large right" title="Menu Not Available" style="color: #DDDDDD;"></i>
            	            	        			</c:otherwise>
            	            	        		</c:choose>

            	            	        		<c:choose>
            	            	        			<c:when test="${data.service_bar}">
            	            	        				<i class="icon-beer icon-large right" title="Bar Available" style="color: #BD7545"></i>
            	            	        			</c:when>
            	            	        			<c:otherwise>
            	            	        				<i class="icon-beer icon-large right" title="Bar Not Available" style="color: #DDDDDD;"></i>
            	            	        			</c:otherwise>
            	            	        		</c:choose>

            	            	        		<c:choose>
            	            	        			<c:when test="${data.service_cater}">
            	            	        				<a href="" class="searched-rest-cater"><i class="icon-group icon-large right" title="Provide Catering Service. Click for Catering Schedule" style="color: #6C94DB"></i></a>
            	            	        			</c:when>
            	            	        			<c:otherwise>
            	            	        				<i class="icon-group icon-large right" title="No Catering Service" style="color: #DDDDDD;"></i>
            	            	        			</c:otherwise>
            	            	        		</c:choose>

            	            	        		<c:choose>
            	            	        			<c:when test="${data.service_home_delivery}">
            	            	        				<i class="icon-home icon-large right" title="Provide Home Delivery Service" style="color: #BB29BB"></i>
            	            	        			</c:when>
            	            	        			<c:otherwise>
            	            	        				<i class="icon-home icon-large right" title="No Home Delivery Service" style="color: #DDDDDD;"></i>
            	            	        			</c:otherwise>
            	            	        		</c:choose>

            	            	        		<c:choose>
            	            	        			<c:when test="${data.service_non_veg}">
            	            	        				<i class="icon-food icon-large right" title="Serves Non-Vegetarian" style="color: #cb202d"></i>
            	            	        			</c:when>
            	            	        			<c:otherwise>
            	            	        				<i class="icon-food icon-large right" title="Don't Serve Non-Vegetarian" style="color: #DDDDDD;"></i>
            	            	        			</c:otherwise>
            	            	        		</c:choose>

            	            	        		<c:choose>
            	            	        			<c:when test="${data.service_veg}">
            	            	        				<i class="icon-food icon-large right" title="Serves Vegetarain" style="color: green"></i>
            	            	        			</c:when>
            	            	        			<c:otherwise>
            	            	        				<i class="icon-food icon-large right" title="Don't Serve Vegetarian" style="color: #DDDDDD;"></i>
            	            	        			</c:otherwise>
            	            	        		</c:choose>
											</div>
										</div>
									</div>
    							</li>
    						</s:iterator>
    					</ol>
    				</div>
    			</div>
    		</div>
    		
    		
    		<!-- SideBar Code Starts -->
    		
    		
    		<div class="bs-docs-sidebar left" id="sticker">
        		<ul class="nav nav-list bs-docs-sidenav affix-top">
        			<s:iterator value="fetched_alpha" var="alpha"> 
  						<li><a href="searchRest#${alpha.value}" ><i class="icon-chevron-left left"></i> ${alpha.key} </a></li>
					</s:iterator>
        		</ul>
      		</div>
    	</div>

    	<jsp:include page="../HTML/Footer.html"></jsp:include>
  	</body>
</html>