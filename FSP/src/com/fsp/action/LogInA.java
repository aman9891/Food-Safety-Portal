package com.fsp.action;

import com.fsp.dao.LogInD;

public class LogInA {

	private String login_email, login_password;
	private int login_result;

	public String execute() {
		login_result = LogInD.checkLogIn(this);

		if(login_result == 1)
			return "success";
		else
			return "error";
	}

	public int getLogin_result() {
		return login_result;
	}

	public String getLogin_email() {
		return login_email;
	}

	public void setLogin_email(String login_email) {
		this.login_email = login_email;
	}

	public String getLogin_password() {
		return login_password;
	}

	public void setLogin_password(String login_password) {
		this.login_password = login_password;
	}
}