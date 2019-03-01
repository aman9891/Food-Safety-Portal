package com.fsp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedHashMap;
import java.util.List;
import com.fsp.action.UserSearchRestaurantA;
import com.fsp.bean.RestaurantB;
import com.fsp.utilities.interfaces.DBParameters;

public class UserSearchRestaurantD implements DBParameters {

	public static int searchRestaurant(UserSearchRestaurantA usr, List<RestaurantB> fetched_data, LinkedHashMap<Character, String> fetched_alpha) {

	String searchParameterAppend = "", orderParameter = "REST_NAME", search_rest_query;
	int search_restaurant_status = 0;

	try {
		Class.forName(driver);
		Connection con= DriverManager.getConnection(connection, db_username, db_password);
		
		// Appending Search Criteria
		
		if(usr.getSearched_restaurant_locality().length() > 0)
			searchParameterAppend = searchParameterAppend + " AND LOCALITY = '"+usr.getSearched_restaurant_locality()+"'";
		
		if(usr.getSearched_restaurant_name().length() > 0)
			searchParameterAppend = searchParameterAppend + " AND REST_NAME = '"+usr.getSearched_restaurant_name()+"'";
		
		// Appending OrderBy Criteria
		
		if(usr.getSearched_restaurant_locality().length() == 0 && usr.getSearched_restaurant_name().length() > 0)
			orderParameter = "LOCALITY";
		
		// Final Query to be Executed
		
		if(searchParameterAppend.length() > 0)
			search_rest_query = "Select * from RESTAURANTINFO where CITY = '"+usr.getSearched_restaurant_city()+"'"+searchParameterAppend+" ORDER BY "+orderParameter;
		
		else
			search_rest_query = "Select * from RESTAURANTINFO where CITY = '"+usr.getSearched_restaurant_city()+"'"+" ORDER BY "+orderParameter;
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(search_rest_query);
		
		while(rs.next()) {
			RestaurantB rb = new RestaurantB();

			rb.setRest_id(rs.getString("ID"));
			rb.setRest_reg_number(rs.getString("REGISTRATION_NUMBER"));
			rb.setRest_name(rs.getString("REST_NAME"));
			rb.setRest_address(rs.getString("ADDRESS"));
			rb.setRest_locality(rs.getString("LOCALITY"));
			rb.setRest_city(rs.getString("CITY"));
			rb.setRest_hours(rs.getString("HOURS"));
			rb.setRest_landline_number(rs.getLong("REST_LANDLINE_NUMBER"));
			rb.setRest_mobile_number(rs.getLong("REST_MOBILE_NUMBER"));
			rb.setRest_rating(rs.getByte("RATING"));
			rb.setRest_rating_text(rs.getString("RATING_TEXT"));
			rb.setRest_number_of_user_votes(rs.getInt("NUMBER_OF_USER_VOTES"));
			rb.setRest_number_of_reviews(rs.getInt("NUMBER_OF_REVIEWS"));
			rb.setService_veg(rs.getString("VEGETARIAN"));
			rb.setService_non_veg(rs.getString("NON_VEGETARIAN"));
			rb.setService_home_delivery(rs.getString("HOME_DELIVERY"));
			rb.setService_cater(rs.getString("CATERING"));
			rb.setService_bar(rs.getString("BAR"));
			rb.setService_menu(rs.getString("MENU"));

			fetched_data.add(rb);
			
			if(! fetched_alpha.containsKey(rs.getString("REST_NAME").charAt(0)))
				fetched_alpha.put(rs.getString("REST_NAME").charAt(0), rs.getString("REGISTRATION_NUMBER"));
		}
		
		search_restaurant_status = 1;
	}
	catch(SQLException e) {
		System.out.println("SQLException in UserSearchRestaurantD class");
		e.printStackTrace();
	}
	catch (ClassNotFoundException e) {
		System.out.println("ClassNotFound Exception in UserSearchRestaurantD class");
		e.printStackTrace();
	}

	return search_restaurant_status;
}
}