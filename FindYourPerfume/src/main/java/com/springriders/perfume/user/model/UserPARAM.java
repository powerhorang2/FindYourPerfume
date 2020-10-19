package com.springriders.perfume.user.model;

public class UserPARAM extends UserVO {
	private String msg;
	private String loginMsg;

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
