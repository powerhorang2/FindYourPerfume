package com.springriders.perfume.cmt.model;

public class CmtDMI extends CmtVO {
	private String nm;
	private String profile_img;
	private String bd;
	private int ageGroup;
	private String gender;
	private int cmt_cnt;
	private int page_cnt;
	
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
	public String getBd() {
		return bd;
	}
	public void setBd(String bd) {
		this.bd = bd;
	}
	public int getAgeGroup() {
		return ageGroup;
	}
	public void setAgeGroup(int ageGroup) {
		this.ageGroup = ageGroup;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getCmt_cnt() {
		return cmt_cnt;
	}
	public void setCmt_cnt(int cmt_cnt) {
		this.cmt_cnt = cmt_cnt;
	}
	public int getPage_cnt() {
		return page_cnt;
	}
	public void setPage_cnt(int page_cnt) {
		this.page_cnt = page_cnt;
	}
	
}
