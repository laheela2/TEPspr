package com.tep.members.controller;

import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tep.commons.common.TepConstants;
import com.tep.members.model.MembersModel;
import com.tep.members.service.MembersService;
import com.tep.members.validator.FindEmailValidator;
import com.tep.members.validator.FindPasswordValidator;
import com.tep.members.validator.LoginValidator;
import com.tep.members.validator.RegisterValidator;

@Controller
public class MembersController {
	protected Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "membersService")
	private MembersService membersService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String accountForm() {
		return "accountForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("login") MembersModel mem, BindingResult bindingResult, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		MembersModel result = membersService.selectMembersLogin(mem);
		new LoginValidator().validate(mem, bindingResult);
		if(bindingResult.hasErrors()){
			mv.setViewName("accountForm");
			return mv;
		} else if (membersService.selectMEmailMembers(mem.getM_email()) == null) {
			mem.setMessage("이메일이 맞지 않거나, 존재하지 않습니다.");
			mv.setViewName("accountForm");
			return mv;
		} else if(result == null){
			mem.setMessage("비밀번호가 맞지 않습니다.");
			mem.setM_password("");
			mv.setViewName("accountForm");
			return mv;
		}

		session.setAttribute(TepConstants.M_EMAIL, result.getM_email());
		session.setAttribute(TepConstants.M_NAME, result.getM_name());
		session.setAttribute(TepConstants.M_PHONE, result.getM_phone());
		session.setAttribute(TepConstants.M_NO, result.getM_no());

		if(result.getM_email().equalsIgnoreCase("admin@tep.com")){
			mv.setViewName("redirect:/admin");
			return mv;
		}

		mv.setViewName("loginSuccess");
		return mv;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(MembersModel mem, HttpSession session) throws Exception {
		Enumeration<?> valueNames = session.getAttributeNames();
		while (valueNames.hasMoreElements()) {
			String sessionKey = (String) valueNames.nextElement();
			log.debug("remove sessionKey : " + sessionKey);
			session.removeAttribute(sessionKey);
		}

		session.invalidate();
		return new ModelAndView("redirect:/main");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView insertMembers(@ModelAttribute("mem") MembersModel mem, BindingResult bindingResult, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		new RegisterValidator().validate(mem, bindingResult);
		if (membersService.selectMEmailMembers(mem.getM_email()) != null) {
			bindingResult.rejectValue("m_email", "reg.email.duplication");
		} else if(membersService.selectFindEmail(mem) != null){
			bindingResult.reject("");
			mem.setMessage("이름과 전화번호가 동일한 사용자가 이미 가입되어 있습니다.<br/> 관리자에게 문의 부탁드립니다.");
		}

		if(bindingResult.hasErrors()){
			mv.setViewName("accountForm");
			return mv;
		}

		MembersModel m = membersService.insertMembers(mem);
		if (m != null) {
			session.setAttribute(TepConstants.M_EMAIL, m.getM_email());
			session.setAttribute(TepConstants.M_NAME, m.getM_name());
			session.setAttribute(TepConstants.M_NO, m.getM_no());
		}

		mv.setViewName("registerSuccess");
		return mv;
	}

	@RequestMapping(value = "/find/account", method = RequestMethod.GET)
	public String findAccount() {
		return "findAccount";
	}

	@RequestMapping(value = "/find/account/email", method = RequestMethod.POST)
	public ModelAndView findAccountEmail(@ModelAttribute("email") MembersModel mem, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView("findAccount");

		new FindEmailValidator().validate(mem, bindingResult);
		if(bindingResult.hasErrors()){
			return mv;
		} else {
			MembersModel m = membersService.selectFindEmail(mem);
			if (m == null || StringUtils.isBlank(m.getM_email())) {
				mem.setMessage("입력한 정보와 일치하는 이메일이 없습니다.");
				return mv;
			} else {
				mem.setMessage("찾은 이메일 : <b>"+m.getM_email()+"</b>");
				return mv;
			}
		}
	}

	@RequestMapping(value = "/find/account/pw", method = RequestMethod.POST)
	public ModelAndView findAccountPassword(@ModelAttribute("pw") MembersModel mem, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView("findAccount");

		new FindPasswordValidator().validate(mem, bindingResult);
		if(bindingResult.hasErrors()){
			return mv;
		} else {
			MembersModel m = membersService.selectFindPassword(mem);
			if (m == null || StringUtils.isBlank(m.getM_password())) {
				mem.setMessage("입력한 정보와 일치하는 비번이 없습니다.");
				return mv;
			} else {
				mem.setMessage("찾은 비밀번호 : <b>"+m.getM_password()+"</b>");
				return mv;
			}
		}
	}

}
