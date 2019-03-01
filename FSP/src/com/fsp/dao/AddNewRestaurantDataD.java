package com.fsp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.fsp.action.AddNewRestaurantDataA;
import com.fsp.utilities.interfaces.DBParameters;

public class AddNewRestaurantDataD implements DBParameters {

	public static int addRestaurant(AddNewRestaurantDataA anrd) {

		int add_restaurant_status = 3, row_count = 0;

		try {
			Class.forName(driver);
			Connection con= DriverManager.getConnection(connection, db_username, db_password);

			String search_rest_reg_num_query = "Select * from RESTAURANTINFO where REGISTRATION_NUMBER = '"+anrd.getRest_reg_number()+"'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(search_rest_reg_num_query);

			while(rs.next()) {
				++row_count;
			}

			if(row_count == 0) {

				String insert_rest_info_query = "insert into RESTAURANTINFO(REGISTRATION_NUMBER, REST_NAME, ADDRESS, LOCALITY, CITY, HOURS, REST_LANDLINE_NUMBER, REST_MOBILE_NUMBER, WEBSITE, RATING, RATING_TEXT, NUMBER_OF_USER_VOTES, NUMBER_OF_REVIEWS, VEGETARIAN, NON_VEGETARIAN, HOME_DELIVERY, CATERING, BAR, MENU, OWNER_NAME, OWNER_CONTACT_NUMBER, MANAGER_NAME, MANAGER_CONTACT_NUMBER) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement insert_rest_info_ps = con.prepareStatement(insert_rest_info_query);

				insert_rest_info_ps.setString(1,anrd.getRest_reg_number());
				insert_rest_info_ps.setString(2,anrd.getRest_name());
				insert_rest_info_ps.setString(3,anrd.getRest_address());
				insert_rest_info_ps.setString(4,anrd.getRest_locality());
				insert_rest_info_ps.setString(5,anrd.getRest_city());
				insert_rest_info_ps.setString(6,combineTime(anrd));
				insert_rest_info_ps.setLong(7,anrd.getRest_landline_number());
				insert_rest_info_ps.setLong(8,anrd.getRest_mobile_number());
				insert_rest_info_ps.setString(9,anrd.getRest_url());
				insert_rest_info_ps.setByte(10,anrd.getRest_rating());
				insert_rest_info_ps.setString(11,checkRatingText(anrd.getRest_rating()));
				insert_rest_info_ps.setInt(12,0);
				insert_rest_info_ps.setInt(13,0);
				insert_rest_info_ps.setString(14,checkService(anrd.getService_veg()));
				insert_rest_info_ps.setString(15,checkService(anrd.getService_non_veg()));
				insert_rest_info_ps.setString(16,checkService(anrd.getService_home_delivery()));
				insert_rest_info_ps.setString(17,checkService(anrd.getService_cater()));
				insert_rest_info_ps.setString(18,checkService(anrd.getService_bar()));
				insert_rest_info_ps.setString(19,checkService(anrd.getService_menu()));
				insert_rest_info_ps.setString(20,anrd.getRest_owner_name());
				insert_rest_info_ps.setLong(21,anrd.getRest_owner_contact_number());
				insert_rest_info_ps.setString(22,anrd.getRest_manager_name());
				insert_rest_info_ps.setLong(23,anrd.getRest_manager_contact_number());

				add_restaurant_status = insert_rest_info_ps.executeUpdate();
			}
			else
				add_restaurant_status = 2;
		}
		catch(SQLException e) {
			System.out.println("SQLException in AddNewRestaurantDataD class");
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException in AddNewRestaurantDataD class");
			e.printStackTrace();
		}

		return add_restaurant_status;
	}

	public static String combineTime(AddNewRestaurantDataA anrd) {
		return anrd.getRest_opening_timings()+" "+anrd.getRest_opening_abbr()+" to "+anrd.getRest_closing_timings()+" "+anrd.getRest_closing_abbr();
	}

	public static String checkRatingText(int rating) {
		switch(rating) {
			case 0: return "NOT YET RATED";
			case 1: return "VERY POOR";
			case 2:
			case 3: return "BAD";
			case 4:
			case 5: return "AVERAGE";
			case 6:
			case 7: return "GOOD";
			case 8:
			case 9:	return "VERY GOOD";
			case 10: return "EXCELLENT";
		}
		return "AVERAGE";
	}

	public static String checkService(String service) {

		service = service+"";

		if(service.equals("True"))
			return "True";
		else
			return "False";
	}
}