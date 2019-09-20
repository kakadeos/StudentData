package com.cdac.beans;

import java.util.Arrays;

public class Student {
	private int id;
	private String name;
	private String standard;
	private String gender;
	private String city;
	private String dob;
	private boolean smssubscribe;
	private String[] sports;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public boolean isSmssubscribe() {
		return smssubscribe;
	}
	public void setSmssubscribe(boolean smssubscribe) {
		this.smssubscribe = smssubscribe;
	}
	public String[] getSports() {
		return sports;
	}
	public void setSports(String[] sports) {
		this.sports = sports;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", standard=" + standard + ", gender=" + gender + ", city="
				+ city + ", dob=" + dob + ", smssubscribe=" + smssubscribe + ", sports=" + Arrays.toString(sports)
				+ "]";
	}
	
}
