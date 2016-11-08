package com.tep.members.controller;

import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tep.members.model.MembersModel;
import com.tep.members.service.MembersService;

import com.tep.commons.common.TepConstants;

@Controller
public class MembersController {

	@Resource(name = "membersService")
	private MembersService membersService;
	
	@RequestMapping(value = {"/agreementForm"})
	public String agreementForm(){
		return "agreementForm";
	}
	

	@RequestMapping(value = { "/membersForm" }, method = RequestMethod.POST)
	public String membersForm() {
		return "membersForm";
	}

	@RequestMapping(value = { "/insertMembers" }, method = RequestMethod.POST)
	public ModelAndView insertMembers(HttpServletRequest request, MembersModel mem) throws Exception {

		HttpSession session = request.getSession();

		ModelAndView mav = new ModelAndView();

		try {

/*			if (session != null && session.getAttribute(TepConstants.REG_ID_CHECK) == null) {
				mav.setViewName("reject");
				return mav;
			} else {
				if (session.getAttribute(TepConstants.REG_ID_CHECK).equals("reject")) {
					mav.setViewName("reject");
					return mav;
				}
			}
*/			
			
			mem.setM_date(Calendar.getInstance().getTime());
			MembersModel result = membersService.insertMembers(mem);

			MembersModel m = membersService.selectOneMember(mem);

			if (m != null) {
				session.setAttribute(TepConstants.M_EMAIL, m.getM_email());
				session.setAttribute(TepConstants.M_NAME, m.getM_name());
				session.setAttribute(TepConstants.M_NO, m.getM_no());
			}

			if (session.getAttribute(TepConstants.REG_ID_CHECK) != null) {
				session.removeAttribute(TepConstants.REG_ID_CHECK);
			}

		} catch (Exception e) {
			System.out.println("member insert error : " + e.getMessage());
		}

		mav.setViewName("membersSuccess");
		return mav;
	}
}
