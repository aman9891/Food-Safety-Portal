package com.fsp.action;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import com.fsp.bean.RestaurantB;
import com.fsp.dao.UserSearchRestaurantD;

public class UserSearchRestaurantA {

	private String searched_restaurant_city, searched_restaurant_locality, searched_restaurant_name;
	private int search_rest_result;

	List<RestaurantB> fetched_data = new ArrayList<RestaurantB>();
	LinkedHashMap<Character, String> fetched_alpha = new LinkedHashMap<Character, String>();

	public String execute() {
		search_rest_result = UserSearchRestaurantD.searchRestaurant(this, fetched_data, fetched_alpha);
		return "search_rest_execute_status";
	}

	public List<RestaurantB> getFetched_data() {
		return fetched_data;
	}

	public void setFetched_data(List<RestaurantB> fetched_data) {
		this.fetched_data = fetched_data;
	}
	
	public LinkedHashMap<Character, String> getFetched_alpha() {
		return fetched_alpha;
	}

	public void setFetched_alpha(LinkedHashMap<Character, String> fetched_alpha) {
		this.fetched_alpha = fetched_alpha;
	}

	public int getSearch_rest_result() {
		return search_rest_result;
	}
	
	public String getSearched_restaurant_city() {
		return searched_restaurant_city;
	}

	public void setSearched_restaurant_city(String searched_restaurant_city) {
		this.searched_restaurant_city = searched_restaurant_city;
	}

	public String getSearched_restaurant_locality() {
		return searched_restaurant_locality;
	}

	public void setSearched_restaurant_locality(String searched_restaurant_locality) {
		this.searched_restaurant_locality = searched_restaurant_locality;
	}

	public String getSearched_restaurant_name() {
		return searched_restaurant_name;
	}

	public void setSearched_restaurant_name(String searched_restaurant_name) {
		this.searched_restaurant_name = searched_restaurant_name;
	}
}