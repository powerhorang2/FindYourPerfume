package com.springriders.perfume.cmt.model;

public class CmtDMI extends CmtVO {
	private String nm;
	private String profile_img;
	private String r_dt;
	private String m_dt;
	private String bd;
	private String gender;
	private int i_user;
	private int Cmt_cnt;
	
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
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
	public String getBd() {
		return bd;
	}
	public void setBd(String bd) {
		this.bd = bd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public int getCmt_cnt() {
		return Cmt_cnt;
	}
	public void setCmt_cnt(int cmt_cnt) {
		Cmt_cnt = cmt_cnt;
	}
	
}
