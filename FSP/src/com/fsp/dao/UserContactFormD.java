package com.fsp.dao;

import java.sql.*;
import com.fsp.action.UserContactFormA;
import com.fsp.utilities.classes.EmailMainLogic;
import com.fsp.utilities.interfaces.DBParameters;

public class UserContactFormD implements DBParameters {

	public static int addContactQuery(UserContactFormA ucf) {

		int add_contact_query_status = 2;

		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(connection, db_username, db_password);

			String insert_add_contact_query = "insert into ContactUser(FullName, Email, Subject, Query, Status, DateTime) values(?,?,?,?,?,SYSTIMESTAMP)";

			PreparedStatement insert_add_contact_ps = con.prepareStatement(insert_add_contact_query);

			insert_add_contact_ps.setString(1,ucf.getContact_form_fullname());
			insert_add_contact_ps.setString(2,ucf.getContact_form_email());
			insert_add_contact_ps.setString(3,ucf.getContact_form_subject());
			insert_add_contact_ps.setString(4,ucf.getContact_form_query());
			insert_add_contact_ps.setString(5,"Unseen");

			if (insert_add_contact_ps.executeUpdate() == 1) {

				String emailSubject = "Reply to your Query";
				String emailContent = "Thank you <strong>"+ucf.getContact_form_fullname().toUpperCase()+"</strong> for contacting us. We will soon reply to your query.";

			    EmailMainLogic.sendEmail(ucf.getContact_form_email(), emailSubject, emailContent);

			    add_contact_query_status = 1;
			}
		}
		catch(SQLException e) {
			System.out.println("SQLException in UserContactFormD class");
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException in UserContactFormD class");
			e.printStackTrace();
		}

		return add_contact_query_status;
	}
}