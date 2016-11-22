package com.tep.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tep.commons.common.TepConstants;

public class AdminPageInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		try {
			if(request.getSession().getAttribute(TepConstants.M_EMAIL) != null){
				String email = request.getSession().getAttribute(TepConstants.M_EMAIL).toString();
				if (!"admin@tep.com".equals(email)) {
					response.sendRedirect("/tepspr/main");
					return false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
}
