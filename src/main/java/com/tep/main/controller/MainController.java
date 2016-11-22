package com.tep.main.controller;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tep.main.service.MainService;

@Controller
public class MainController {
	protected Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private MainService mainService;

	@RequestMapping("/main")
	public ModelAndView main() throws Exception{
		ModelAndView mv = new ModelAndView("main");
		Map<String, Object> result = mainService.selectMainInfo();
		mv.addObject("data",result.get("videoRecommend"));
		mv.addObject("list",result.get("meetingsRecommend"));
		return mv;
	}
}
