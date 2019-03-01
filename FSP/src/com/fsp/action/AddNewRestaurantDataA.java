package com.fsp.action;

import com.fsp.bean.RestaurantB;
import com.fsp.dao.AddNewRestaurantDataD;

public class AddNewRestaurantDataA extends RestaurantB {

	private int add_restaurant_result;

	public String execute() {

		add_restaurant_result = AddNewRestaurantDataD.addRestaurant(this);
		return "add_restaurant_execute_status";
	}

	public int getAdd_restaurant_result() {
		return add_restaurant_result;
	}
}