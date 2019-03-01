package com.fsp.action;

import com.fsp.dao.UserContactFormD;

public class UserContactFormA {

	private String contact_form_fullname, contact_form_email, contact_form_subject, contact_form_query;
	private int add_contact_query_result;

	public String execute() {
	    add_contact_query_result = UserContactFormD.addContactQuery(this);
	    return "add_contact_query_execute_status";
	}

	public int getAdd_contact_query_result() {
		return add_contact_query_result;
	}

	public String getContact_form_fullname() {
		return contact_form_fullname;
	}

	public void setContact_form_fullname(String contact_form_fullname) {
		this.contact_form_fullname = contact_form_fullname;
	}

	public String getContact_form_email() {
		return contact_form_email;
	}

	public void setContact_form_email(String contact_form_email) {
		this.contact_form_email = contact_form_email;
	}

	public String getContact_form_subject() {
		return contact_form_subject;
	}

	public void setContact_form_subject(String contact_form_subject) {
		this.contact_form_subject = contact_form_subject;
	}

	public String getContact_form_query() {
		return contact_form_query;
	}

	public void setContact_form_query(String contact_form_query) {
		this.contact_form_query = contact_form_query;
	}
}