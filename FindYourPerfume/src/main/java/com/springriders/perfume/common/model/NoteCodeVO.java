package com.springriders.perfume.common.model;

public class NoteCodeVO extends PerfumeVO {

	private int nt_d_c;
	private int nt_m_c;
	private String nt_d_nm;
	private String nt_d_nm_kor;
	private String nt_m_nm;
	private String nt_m_nm_kor;
	private String b_nm_eng;
	private int sliders_per_view;
	private int sort_type;
	
	
	public int getSort_type() {
		return sort_type;
	}
	public void setSort_type(int sort_type) {
		this.sort_type = sort_type;
	}
	public int getNt_d_c() {
		return nt_d_c;
	}
	public void setNt_d_c(int nt_d_c) {
		this.nt_d_c = nt_d_c;
	}
	public int getNt_m_c() {
		return nt_m_c;
	}
	public void setNt_m_c(int nt_m_c) {
		this.nt_m_c = nt_m_c;
	}
	public String getNt_d_nm() {
		return nt_d_nm;
	}
	public void setNt_d_nm(String nt_d_nm) {
		this.nt_d_nm = nt_d_nm;
	}
	public String getNt_d_nm_kor() {
		return nt_d_nm_kor;
	}
	public void setNt_d_nm_kor(String nt_d_nm_kor) {
		this.nt_d_nm_kor = nt_d_nm_kor;
	}
	public String getNt_m_nm() {
		return nt_m_nm;
	}
	public void setNt_m_nm(String nt_m_nm) {
		this.nt_m_nm = nt_m_nm;
	}
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
	public int getSliders_per_view() {
		return sliders_per_view;
	}
	public void setSliders_per_view(int sliders_per_view) {
		this.sliders_per_view = sliders_per_view;
	}

}