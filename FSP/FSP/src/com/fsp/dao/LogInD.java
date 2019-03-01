package com.fsp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.fsp.action.LogInA;
import com.fsp.utilities.classes.HashedPassword;
import com.fsp.utilities.interfaces.DBParameters;

public class LogInD implements DBParameters {

	public static int checkLogIn(LogInA li) {

		int check_login_status = 5;

		try {
			Class.forName(driver);
			Connection con= DriverManager.getConnection(connection, db_username, db_password);

			String check_user_query = "Select RegisteredUser.password, RegisteredUser.status from RegisteredUser where RegisteredUser.email = '"+li.getLogin_email()+"'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(check_user_query);

			if(rs.next()) {
				if(rs.getString(1).equals(HashedPassword.securePassword(li.getLogin_password())))
					if(rs.getString(2).equals("Verified"))
						check_login_status = 1;
					else
						check_login_status = 2;
				else
					check_login_status = 3;
			}
			else
				check_login_status = 4;
		}
		catch(SQLException e) {
			System.out.println("SQLException in LogInD class");
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			System.out.println("ClassNotFound Exception in LogInD class");
			e.printStackTrace();
		}

		return check_login_status;
	}
}