package com.tep.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tep.commons.common.TepConstants;
import com.tep.login.service.LoginService;
import com.tep.members.model.MembersModel;

@Controller
public class LoginController {

	@Resource(name = "loginService")
	private LoginService loginService;

	@RequestMapping(value = { "/login", "/login/loginForm" }, method = RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}

	@RequestMapping(value = { "/login", "/login/loginForm" }, method = RequestMethod.POST)
	public ModelAndView loginCheck(HttpServletRequest request, MembersModel mem) throws Exception {

		ModelAndView mav = new ModelAndView();

		MembersModel result = loginService.loginCheck(mem);

		if (result != null) {
			HttpSession session = request.getSession();

			session.setAttribute(TepConstants.M_EMAIL, result.getM_email());
			session.setAttribute(TepConstants.M_NAME, result.getM_name());
			session.setAttribute(TepConstants.M_NO, result.getM_no());

			mav.setViewName("loginSuccess");
			return mav;
		}

		mav.setViewName("login/loginError");
		return mav;
	}

	@RequestMapping("/logout")
	public ModelAndView Logout(HttpServletRequest request, MembersModel mem) {

		HttpSession session = request.getSession();

		if (session.getAttribute(TepConstants.M_EMAIL) != null) {

			session.removeAttribute(TepConstants.M_EMAIL);
			session.removeAttribute(TepConstants.M_NAME);
			session.removeAttribute(TepConstants.M_NO);

			if (session.getAttribute(TepConstants.SAVEURI) != null) {
				session.removeAttribute(TepConstants.SAVEURI);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/logout");
		return mav;
	}

	// Id 찾기

	@RequestMapping("/findId")
	public ModelAndView findIdForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/findId");
		return mav;
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public ModelAndView findId(@ModelAttribute("findId") MembersModel mem, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		MembersModel m = loginService.findId(mem);
		
		if(m == null){
			mav.setViewName("login/findIdError");
			return mav;
		}else {
			mav.addObject("findId", m);
			mav.setViewName("findIdResult");
			return mav;
		}
		
		
		
		


	}
}
		
		



