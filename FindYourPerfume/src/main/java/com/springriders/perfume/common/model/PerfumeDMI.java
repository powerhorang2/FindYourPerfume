package com.springriders.perfume.common.model;

public class PerfumeDMI extends PerfumeVO {
	private String b_nm_eng;
	private String b_nm_kor;
	private String b_nm_initial;
	private int i_user;

	
	public String getB_nm_eng() {
		return b_nm_eng;
	}
	public void setB_nm_eng(String b_nm_eng) {
		this.b_nm_eng = b_nm_eng;
	}
	public String getB_nm_kor() {
		return b_nm_kor;
	}
	public void setB_nm_kor(String b_nm_kor) {
		this.b_nm_kor = b_nm_kor;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getB_nm_initial() {
		return b_nm_initial;
	}
	public void setB_nm_initial(String b_nm_initial) {
		this.b_nm_initial = b_nm_initial;
	}
	
}
