<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">
    
    	<title>javaplanner.jsp</title>
    
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="">
		<meta http-equiv="description" content="">
	
		<style>
			.highlight_area {
            	opacity: 0.3;
            	z-index:0;
            	filter:alpha(opacity=30);
        	} 
        	.highlight_area:hover {
            	background-color: #99F799;
	        }
		</style>
  	</head>
  
  	<body>
    	<div class="planner" id="planner"><%= getPlanner(request) %></div>
		<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*,com.dhtmlx.planner.controls.*,com.dhtmlx.planner.extensions.*" %>
		<%!
        	String getPlanner (HttpServletRequest request) throws Exception {
        		DHXPlanner s = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
        		
        		Calendar cal = Calendar.getInstance();
           		Date date = new Date();
         		cal.setTime(date);
         		int month = cal.get(Calendar.MONTH);
         		int day = cal.get(Calendar.DAY_OF_MONTH);
				int year = cal.get(Calendar.YEAR);
           		s.setInitialDate(year, month, day);				// set initial date to Today
        		
        		s.setWidth(1200);								// set width of planner
        		s.config.setDefaultDate("%j %F %Y");			// for date format in Header
        		s.config.setHourDate("%g:%i %A");				// for time format on Y-axis
        		s.config.setShowLoading(true);					// to show loading while data is fetched from db
        		s.config.setScrollHour(8);						// set the starting hour in visible view
        		s.config.setTimeStep(10);						// time increases in 10 mins steps
        		s.config.setCascadeEventDisplay(true);			// true for displaying events cascadingly
        		s.config.setCascadeEventCount(5);				// specify the number of maximum cascading events possible
        		s.config.setSeparateShortEvents(true);			// short events will be displayed seperately
        		s.calendars.attachMiniCalendar();				// puts the Calendar in header
        		s.lightbox.add(new DHXLightboxMiniCalendar("name", "Choose Dates"));		// for displaying Calendar in Editing mode for Long Events
        		s.highlight.enable("highlight_area", 60);		// show the position where cursor is with a different color
        		s.extensions.add(DHXExtension.PDF);
        		s.toPDF();										// for showing the pdf version of planner
        		s.templates.setEventText("Subject : {text}");	// how subject is displayed in day view
        		s.extensions.add(DHXExtension.TOOLTIP);			// to add default tooltip on events
        		
        		s.load("events.jsp", DHXDataFormat.JSON);
        		s.data.dataprocessor.setURL("events.jsp");
  				return s.render();
      		}
		%>
  	</body>
</html>