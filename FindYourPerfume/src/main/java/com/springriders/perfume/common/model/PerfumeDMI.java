package com.springriders.perfume.common.model;

public class PerfumeDMI extends PerfumePARAM {
	private String b_nm_eng;
	private String b_nm_kor;
	private String nt_m_nm_kor;
	private int favorite_cnt;
	
	public String getNt_m_nm_kor() {
		return nt_m_nm_kor;
	}
	public void setNt_m_nm_kor(String nt_m_nm_kor) {
		this.nt_m_nm_kor = nt_m_nm_kor;
	}
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
	public int getFavorite_cnt() {
		return favorite_cnt;
	}
	public void setFavorite_cnt(int favorite_cnt) {
		this.favorite_cnt = favorite_cnt;
	}

}
