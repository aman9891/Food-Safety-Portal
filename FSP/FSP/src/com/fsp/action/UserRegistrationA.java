package com.fsp.action;

import com.fsp.dao.UserRegistrationD;

public class UserRegistrationA {

	private String user_registration_form_email, user_registration_form_password;
	private int register_user_result;

	public String execute() {
		register_user_result = UserRegistrationD.registerUser(this);
		return "register_user_execute_status";
	}

	public int getRegister_user_result() {
		return register_user_result;
	}

	public String getUser_registration_form_email() {
		return user_registration_form_email;
	}

	public void setUser_registration_form_email(String user_registration_form_email) {
		this.user_registration_form_email = user_registration_form_email;
	}

	public String getUser_registration_form_password() {
		return user_registration_form_password;
	}

	public void setUser_registration_form_password(String user_registration_form_password) {
		this.user_registration_form_password = user_registration_form_password;
	}
}