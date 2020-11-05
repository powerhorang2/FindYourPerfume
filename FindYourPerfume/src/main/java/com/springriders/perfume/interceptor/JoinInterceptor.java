package com.springriders.perfume.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.springriders.perfume.Const;
import com.springriders.perfume.SecurityUtils;
import com.springriders.perfume.user.model.UserVO;

public class JoinInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        
        UserVO vo = SecurityUtils.getLoginUser(request);
		
        if(vo != null) {
			response.sendRedirect("/common/main");
			return false;
		}
        
		return true;
	}


}
