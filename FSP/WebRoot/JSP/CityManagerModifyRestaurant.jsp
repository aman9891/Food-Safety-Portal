<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<base href="<%=basePath%>">

    	<title>Search / Update and Delete Restaurants in your city and Manage them easily</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="AJAX, Strusts2, Bootstrap, JQuery">
		<meta http-equiv="description" content="Using this page City Manager can Update data of Existing Restaurants and can also Delete them">
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

		<!-- JQQuery file needed for running the code -->
		<script src="CssAndJsFiles/js/jquery.min 1.10.2.js"></script>
		
		<link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
		<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>

		<script type="text/javascript">
			function showSearchForm (whichRadioButton) {

				if (whichRadioButton == "reg_num") {
            		jQuery("#cm_search_by_rest_name").hide();
            		jQuery("#cm_search_by_reg_num").show();
            	}
           		else if(whichRadioButton == "rest_name") {
            		jQuery("#cm_search_by_reg_num").hide();
            		jQuery("#cm_search_by_rest_name").show();
            	}
            	else if(whichRadioButton == "by_city") {
            		jQuery("#cm_search_by_rest_name").hide();
           			jQuery("#cm_search_by_reg_num").hide();
           		}
			}

			function showList() {

      			var xmlhttp, entered_data;
      			var search_criteria = $("input[name=searchBy]:checked").val();

      			if(search_criteria == "reg_num") {
      				entered_data = document.getElementById('cm_rest_reg_number').value;
      			}
      			else if(search_criteria == "rest_name") {
      				entered_data = document.getElementById('cm_rest_name').value;
      			}

        		var url = "JSP/CmFetchedData.jsp?radioselected="+search_criteria+"&searchval="+entered_data;

        		if (window.XMLHttpRequest) {
            		xmlhttp = new XMLHttpRequest();
        		}
        		else {
            		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        		}

        		xmlhttp.onreadystatechange = function()
        		{
            		if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
            		{
            			$("#cm_tabular_data").show();
            			
            			document.getElementById("cm_tabular_data").innerHTML = xmlhttp.responseText;
            			
            			$("#cm_result_table").dataTable({
                			"sPaginationType": "full_numbers"
            			});
            		}
        		}
        		
        		xmlhttp.open("GET", url, true);
        		xmlhttp.send();
			}
		</script>
	</head>

  	<body>
    	<jsp:include page="../HTML/CmHeader.html"></jsp:include>
    	
    	<div id="city_manager_work_area_container">
    		<div class="city_manager_container">
    			<jsp:include page="../HTML/ModifyRestaurant.html"></jsp:include>
    		</div>
    	</div>
  	</body>
</html>