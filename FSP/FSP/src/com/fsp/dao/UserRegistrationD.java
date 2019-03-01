package com.fsp.dao;

import java.sql.*;
import com.fsp.action.UserRegistrationA;
import com.fsp.utilities.classes.AESencrp;
import com.fsp.utilities.classes.EmailMainLogic;
import com.fsp.utilities.classes.HashedPassword;
import com.fsp.utilities.interfaces.DBParameters;

public class UserRegistrationD implements DBParameters {

	public static int registerUser(UserRegistrationA ur) {

		int register_user_status = 2, row_count = 0;

		try {
			Class.forName(driver);
			Connection con= DriverManager.getConnection(connection, db_username, db_password);

			String search_user_query = "Select * from RegisteredUser where RegisteredUser.email = '"+ur.getUser_registration_form_email()+"'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(search_user_query);

			while(rs.next()) {
				++row_count;
			}

			if(row_count == 0) {

				String insert_user_query = "insert into RegisteredUser(Email, Password, Status, DateTime) values (?,?,?,SYSTIMESTAMP)";

				PreparedStatement insert_user_ps = con.prepareStatement(insert_user_query);
				insert_user_ps.setString(1,ur.getUser_registration_form_email());
				insert_user_ps.setString(2,HashedPassword.securePassword(ur.getUser_registration_form_password()));
				insert_user_ps.setString(3,"UnVerified");

				if(insert_user_ps.executeUpdate() == 1) {

					String emailSubject = "Welcome to Food Safety Portal";
					String confirmationLink = "http://aman:8888/FSP/JSP/AccountActivation.jsp?token="+AESencrp.encrypt(ur.getUser_registration_form_email());
					String emailContent = "Hello, Thank you for registering at Food Safety Portal.<br/><br/>Please click on below link to verfy your account:<br/><br/>"+confirmationLink+"<br/><br/><strong>Account Details:</strong><br/>Email: "+ur.getUser_registration_form_email()+"<br/>Password: "+ur.getUser_registration_form_password();

					EmailMainLogic.sendEmail(ur.getUser_registration_form_email(), emailSubject, emailContent);

					register_user_status = 1;
				}
			}
			else
				register_user_status = 3;
		}
		catch(SQLException e) {
			System.out.println("SQLException in UserRegistrationD class");
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException in UserRegistrationD class");
			e.printStackTrace();
		} 
		catch (Exception e) {
			System.out.println("Exception in Encryption and Decryption in UserRegistrationD.java");
			e.printStackTrace();
		}

		return register_user_status;
	}
}