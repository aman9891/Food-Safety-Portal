package com.fsp.utilities.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.fsp.utilities.interfaces.DBParameters;

public class EmailConfirmation implements DBParameters {

	public static int update(String link_fetched_email) {

		try {

			Class.forName(driver);
			Connection con= DriverManager.getConnection(connection, db_username, db_password);

			String check_update_query = "Update RegisteredUser set status='Verified' WHERE (email='"+link_fetched_email+"' AND status='UnVerified')";

			PreparedStatement check_update_ps = con.prepareStatement(check_update_query);
			int check_update_status = check_update_ps.executeUpdate();

			if(check_update_status == 1)
				return check_update_status;
		}
		catch(SQLException e) {
			System.out.println("SQLException in EmailConfirmation java");
			e.printStackTrace();
		}
		catch(ClassNotFoundException e) {
			System.out.println("ClassNotFoundException in EmailConfirmation java");
			e.printStackTrace();
		}
		return 0;
	}
}