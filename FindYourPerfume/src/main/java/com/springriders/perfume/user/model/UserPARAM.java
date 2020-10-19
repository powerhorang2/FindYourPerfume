package com.springriders.perfume.user.model;

public class UserPARAM extends UserVO {
	private String msg;
	private String loginMsg;
	private int nt_m_c;

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
}
