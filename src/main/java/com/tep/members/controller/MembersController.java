package com.tep.members.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tep.members.service.MembersService;

@Controller
@RequestMapping("/members")
public class MembersController {

	@Resource(name = "membersService")
	private MembersService membersService;

	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	public String loginForm() {
		return "members/loginForm";
	}

}
