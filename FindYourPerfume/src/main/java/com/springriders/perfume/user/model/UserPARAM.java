package com.springriders.perfume.user.model;

public class UserPARAM extends UserVO {
	private String msg;
	private String loginMsg;
	private int nt_m_c;
	private String strGender;
	private int ageGroup;
	private int i_p;

	public int getNt_m_c() {
		return nt_m_c;
	}

	public void setNt_m_c(int nt_m_c) {
		this.nt_m_c = nt_m_c;
	}

	public String getLoginMsg() {
		return loginMsg;
	}

	public void setLoginMsg(String loginMsg) {
		this.loginMsg = loginMsg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

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

	public int getI_p() {
		return i_p;
	}

	public void setI_p(int i_p) {
		this.i_p = i_p;
	}
	
}
