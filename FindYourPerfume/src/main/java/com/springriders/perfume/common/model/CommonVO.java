package com.springriders.perfume.common.model;

import com.springriders.perfume.user.model.UserPARAM;

public class CommonVO extends UserPARAM {
	
	private String loginMsg;

	public String getLoginMsg() {
		return loginMsg;
	}

	public void setLoginMsg(String loginMsg) {
		this.loginMsg = loginMsg;
	}
}
