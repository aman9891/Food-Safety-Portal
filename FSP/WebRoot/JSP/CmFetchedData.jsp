<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head></head>

  	<body>
    	<%
    		String r = request.getParameter("radioselected");
    		String s = request.getParameter("searchval");
    		String searchColumnName = new String();
    		String searchedBy = new String();

    		if(r.equals("reg_num")) {
    			searchColumnName = "REGISTRATION_NUMBER";
    			searchedBy = "LAST SEARCHED BY REGISTRATION NUMBER";
    		}
    		else if(r.equals("rest_name")) {
    			searchColumnName = "REST_NAME";
    			searchedBy = "LAST SEARCHED BY RESTAURANT NAME";
    		}

    		if(s == null || s.trim().equals("")) {
    			%>
				<h3>Please Enter Valid Input !!!</h3>
			<%
			}

			else {
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");

					String search_rest_query = "Select REGISTRATION_NUMBER, REST_NAME, ADDRESS, LOCALITY, CITY, HOURS, REST_LANDLINE_NUMBER, REST_MOBILE_NUMBER, WEBSITE, VEGETARIAN, NON_VEGETARIAN, HOME_DELIVERY, CATERING, BAR, MENU ,MANAGER_NAME, MANAGER_CONTACT_NUMBER, OWNER_NAME, OWNER_CONTACT_NUMBER from RESTAURANTINFO where "+searchColumnName+"= '"+s+"'";
					PreparedStatement ps = con.prepareStatement(search_rest_query);
					ResultSet rs = ps.executeQuery();

					%>

					<div id="fetched_tabular_data">
						<div id="last_searched_by_text"><%=searchedBy %></div>

						<table class="table table-striped" id="cm_result_table">
							<thead>
								<tr>
									<th class="center">SNo.</th>
									<th class="center">Registration Number</th>
									<th class="center">Restaurant Name</th>
									<th class="center">Address</th>
									<th class="center">Locality</th>
									<th class="center">City</th>
									<th class="center">Timings</th>
									<th class="center">LandLine Number</th>
									<th class="center">Mobile Number</th>
									<th class="center">Website</th>
									<th class="center">Services</th>
									<th class="center">Manager's Name</th>
									<th class="center">Manager's Contact Number</th>
									<th class="center">Owner's Name</th>
									<th class="center">Owner's Contact Number</th>
								</tr>
							</thead>

							<tbody>
								<%
									int counter = 1;
									while(rs.next()) {
										%>
											<tr id="<%=rs.getString(1) %>">
												<td class="center"><%=counter %></td>
												<td class="center"><%=rs.getString(1) %></td>
												<td class="center"><%=rs.getString(2) %></td>
												<td class="center"><%=rs.getString(3) %></td>
												<td class="center"><%=rs.getString(4) %></td>
												<td class="center"><%=rs.getString(5) %></td>
												<td class="center"><%=rs.getString(6) %></td>
												<td class="center"><%=rs.getLong(7) %></td>
												<td class="center"><%=rs.getLong(8) %></td>
												<td class="center"><%=rs.getString(9) %></td>
												<td id="cm_service_checkboxes">
													
													<%if((rs.getString(10)).equals("True")) { %>
														<input type="checkbox" id="cm_service_veg" name="service" value="True" checked> Veg &nbsp&nbsp
													<%
													}
													else { %>
														<input type="checkbox" id="cm_service_veg" name="service" value="True"> Veg &nbsp&nbsp
													<%} %>



													<%if((rs.getString(11)).equals("True")) { %>
														<input type="checkbox" id="cm_service_non_veg" name="service" value="True" checked> Non-Veg <br>
													<%
													}
													else { %>
														<input type="checkbox" id="cm_service_non_veg" name="service" value="True"> Non-Veg <br>
													<%} %>



													<%if((rs.getString(12)).equals("True")) { %>
														<input type="checkbox" id="cm_service_home_delivery" name="service" value="True" checked> Home Delivery <br>
													<%
													}
													else { %>
														<input type="checkbox" id="cm_service_home_delivery" name="service" value="True"> Home Delivery <br>
													<%} %>



													<%if((rs.getString(13)).equals("True")) { %>
														<input type="checkbox" id="cm_service_cater" name="service" value="True" checked> Catering <br>
													<%
													}
													else { %>
														<input type="checkbox" id="cm_service_cater" name="service" value="True"> Catering <br>
													<%} %>



													<%if((rs.getString(14)).equals("True")) { %>
														<input type="checkbox" id="cm_service_bar" name="service" value="True" checked> Bar &nbsp&nbsp
													<%
													}
													else { %>
														<input type="checkbox" id="cm_service_bar" name="service" value="True"> Bar &nbsp&nbsp
													<%} %>



													<%if((rs.getString(15)).equals("True")) { %>
														<input type="checkbox" id="cm_service_menu" name="service" value="True" checked> Menu
													<%
													}
													else { %>
														<input type="checkbox" id="cm_service_menu" name="service" value="True"> Menu
													<%} %>

												</td>
												<td class="center"><%=rs.getString(16) %></td>
												<td class="center"><%=rs.getLong(17) %></td>
												<td class="center"><%=rs.getString(18) %></td>
												<td class="center"><%=rs.getLong(19) %></td>
											</tr>
										<%
										++counter;
									}
								%>
							</tbody>
						</table>
					</div>
					<%
				}
				catch(SQLException e) {
					System.out.println("SQLException in CmFetchedData.jsp");
					e.printStackTrace();
				}
				catch (ClassNotFoundException e) {
					System.out.println("ClassNotFound Exception in CmFetchedData.jsp");
					e.printStackTrace();
				}
			}
    	%>
  	</body>
</html>