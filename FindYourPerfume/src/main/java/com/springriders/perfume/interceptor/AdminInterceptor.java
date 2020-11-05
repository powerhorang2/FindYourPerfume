package com.springriders.perfume.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.springriders.perfume.Const;
import com.springriders.perfume.SecurityUtils;
import com.springriders.perfume.user.model.UserVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        
        UserVO vo = SecurityUtils.getLoginUser(request);
		if(vo == null) {
			response.sendRedirect("/user/login");
			return false;
		}
		int user_type = vo.getUser_type();
		if(user_type != Const.ADMIN) {
			SecurityUtils.isLogout(request);
			response.sendRedirect("/user/login");
			return false;
		}
		return true;
	}


}
