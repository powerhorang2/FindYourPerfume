package com.springriders.perfume.user.model;

public class UserDMI extends UserVO {
	private String strGender;
	private int ageGroup;
	
	public String getStrGender() {
		return strGender;
	}
	public void setStrGender(String strGender) {
		this.strGender = strGender;
	}
	public int getAgeGroup() {
		return ageGroup;	
	}
	public void setAgeGroup(int ageGroup) {
		this.ageGroup = ageGroup;
	}

	
}
