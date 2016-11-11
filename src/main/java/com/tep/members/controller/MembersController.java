package com.tep.members.controller;

import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tep.commons.common.TepConstants;
import com.tep.members.model.MembersModel;
import com.tep.members.service.MembersService;

@Controller
public class MembersController {
	protected Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "membersService")
	private MembersService membersService;

	@RequestMapping(value = { "/agreement", "/agreement/form" })
	public String agreementForm() {
		return "agreementForm";
	}

	@RequestMapping(value = { "/members", "/members/form" }, method = RequestMethod.POST)
	public String membersForm() {
		return "membersForm";
	}

	@RequestMapping(value = "/members/insert", method = RequestMethod.POST)
	public ModelAndView insertMembers(MembersModel mem, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if ((session != null && session.getAttribute(TepConstants.DUPLICATION_CHECK) == null) || (session != null && session.getAttribute(TepConstants.DUPLICATION_CHECK).equals("reject"))) {
			mav.setViewName("error/errorEmailDuplication");
			return mav;
		}

		MembersModel m = membersService.insertMembers(mem);

		if (m != null) {
			session.setAttribute(TepConstants.M_EMAIL, m.getM_email());
			session.setAttribute(TepConstants.M_NAME, m.getM_name());
			session.setAttribute(TepConstants.M_NO, m.getM_no());
		}

		if (session.getAttribute(TepConstants.DUPLICATION_CHECK) != null) {
			session.removeAttribute(TepConstants.DUPLICATION_CHECK);
		}

		mav.setViewName("membersSuccess");
		return mav;
	}

	@RequestMapping(value = { "/members/duplication" }, method = RequestMethod.GET)
	public ModelAndView selectEmailCheck(@RequestParam(value="m_email") String m_email, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("members/membersEmailCheck");
		MembersModel m = membersService.selectMEmailMembers(m_email);

		int chk = -1;
		HttpSession session = request.getSession();
		if (m == null) {
			chk = 0;
			session.setAttribute(TepConstants.DUPLICATION_CHECK, "allow");
			mav.addObject("CheckNum", chk);
			mav.addObject("m_email", m_email);
		} else {
			chk = 1;
			session.setAttribute(TepConstants.DUPLICATION_CHECK, "reject");
			mav.addObject("CheckNum", chk);
			mav.addObject("m_email", m_email);
		}
		return mav;
	}

	@RequestMapping(value = "/members/find/email", method = RequestMethod.GET)
	public ModelAndView findEmailForm() {
		return new ModelAndView("members/membersFindEmailForm");
	}

	@RequestMapping(value = "/members/find/email", method = RequestMethod.POST)
	public ModelAndView selectFindEmail(MembersModel mem, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();

		MembersModel m = membersService.selectFindEmail(mem);

		if (StringUtils.isEmpty(m.getM_email())) {
			mav.setViewName("error/errorMemberFindEmail");
			return mav;
		} else {
			mav.addObject("email", m.getM_email());
			mav.setViewName("members/membersFindEmailResult");
			return mav;
		}
	}

	@RequestMapping(value = "/members/find/password", method = RequestMethod.GET)
	public ModelAndView findPasswordForm() {
		return new ModelAndView("members/membersFindPasswordForm");
	}

	@RequestMapping(value = "/members/find/password", method = RequestMethod.POST)
	public ModelAndView selectFindPassword(MembersModel mem, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		MembersModel m = membersService.selectFindPassword(mem);

		if (StringUtils.isEmpty(m.getM_password())) {
			mav.setViewName("error/errorMemberFindPassword");
			return mav;
		} else {
			mav.addObject("password", m.getM_password());
			mav.setViewName("members/membersFindPasswordResult");
			return mav;
		}

	}

	@RequestMapping(value = { "/login", "/login/form" }, method = RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}

	@RequestMapping(value = { "/login", "/login/form" }, method = RequestMethod.POST)
	public ModelAndView login(MembersModel mem, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		MembersModel result = membersService.selectMembersLogin(mem);
		if (result == null) {
			mav.setViewName("error/errorLoginPassword");
			return mav;
		}

		HttpSession session = request.getSession();
		session.setAttribute(TepConstants.M_EMAIL, result.getM_email());
		session.setAttribute(TepConstants.M_NAME, result.getM_name());
		session.setAttribute(TepConstants.M_NO, result.getM_no());

		mav.setViewName("loginSuccess");
		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(MembersModel mem, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Enumeration<?> valueNames = session.getAttributeNames();
		while (valueNames.hasMoreElements()) {
			String sessionKey = (String) valueNames.nextElement();
			log.debug("remove sessionKey : " + sessionKey);
			session.removeAttribute(sessionKey);
		}

		session.invalidate();
		return new ModelAndView("redirect:/meetings");
	}
}
