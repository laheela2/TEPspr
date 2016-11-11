package com.tep.login.controller;

import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tep.commons.common.TepConstants;
import com.tep.login.service.LoginService;
import com.tep.members.model.MembersModel;

@Controller
public class LoginController {
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "loginService")
	private LoginService loginService;

	@RequestMapping(value = { "/login", "/login/form" }, method = RequestMethod.GET)
	public String form() {
		return "loginForm";
	}

	@RequestMapping(value = { "/login", "/login/form" }, method = RequestMethod.POST)
	public ModelAndView login(MembersModel mem, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		MembersModel result = loginService.selectMember(mem);
		if(result == null){
			mav.setViewName("login/loginError");
			return mav;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute(TepConstants.M_EMAIL, result.getM_email());
		session.setAttribute(TepConstants.M_NAME, result.getM_name());
		session.setAttribute(TepConstants.M_NO, result.getM_no());

		mav.setViewName("loginSuccess");
		return mav;
	}

	@RequestMapping(value="/logout")
	public ModelAndView logout(MembersModel mem, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Enumeration<?> valueNames = session.getAttributeNames();
		while(valueNames.hasMoreElements()){
			String sessionKey = (String) valueNames.nextElement();
			log.debug("remove sessionKey : "+sessionKey);
			session.removeAttribute(sessionKey);
		}
		
		session.invalidate();
		return new ModelAndView("redirect:/meetings");
	}

	
	// Id 찾기
	@RequestMapping("/findId")
	public ModelAndView findIdForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/findId");
		return mav;
	}

	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public ModelAndView findId(MembersModel mem, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		MembersModel m = loginService.findId(mem);
		
		if(m == null){
			mav.setViewName("login/findIdError");
			return mav;
		}else {
			mav.addObject("findId", m);
			mav.setViewName("login/findIdResult");
			return mav;
		}
	}
	
	// 비밀번호 찾기
	@RequestMapping("/findPassword")
	public ModelAndView findPasswordForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/findPassword");
		return mav;
		}
	
	@RequestMapping(value = "/findPassword", method =  RequestMethod.POST )
	public ModelAndView findPassword(MembersModel mem, HttpServletRequest request ) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		MembersModel m = loginService.findPassword(mem);
		
		if(m == null){
			mav.setViewName("login/findPasswordError");
			return mav;
		}else{
			mav.addObject("findPassword", m);
			mav.setViewName("login/findPasswordResult");
			return mav;
		}

	}
	
}
		
		



