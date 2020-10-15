package com.springriders.perfume.user.model;

public class UserVO {
	private int i_user;
	private int user_type;
	private int gender;
	private int[] note;
	private String user_id;
	private String user_pw;
	private String salt;
	private String profile_img;
	private String bd;
	private String nm;
	private String r_dt;
	private String m_dt;
	
	
	
	public String getR_dt() {
		return r_dt;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	public String getM_dt() {
		return m_dt;
	}
	public void setM_dt(String m_dt) {
		this.m_dt = m_dt;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getBd() {
		return bd;
	}
	public void setBd(String bd) {
		this.bd = bd;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public int[] getNote() {
		return note;
	}
	public void setNote(int[] note) {
		this.note = note;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	
	
}