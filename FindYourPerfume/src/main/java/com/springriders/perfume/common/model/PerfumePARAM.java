package com.springriders.perfume.common.model;

public class PerfumePARAM extends PerfumeVO {
	private int nt_d_c;
	private int nt_m_c;
	private String b_nm_initial;
	private int i_user;	


	public int getNt_m_c() {
		return nt_m_c;
	}

	public void setNt_m_c(int nt_m_c) {
		this.nt_m_c = nt_m_c;
	}

	public String getB_nm_initial() {
		return b_nm_initial;
	}

	public void setB_nm_initial(String b_nm_initial) {
		this.b_nm_initial = b_nm_initial;
	}

	public int getNt_d_c() {
		return nt_d_c;
	}

	public void setNt_d_c(int nt_d_c) {
		this.nt_d_c = nt_d_c;
	}

	public int getI_user() {
		return i_user;
	}

	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	
}
