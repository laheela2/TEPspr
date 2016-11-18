package com.tep.main.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	protected Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("/main")
	public ModelAndView main(){
		ModelAndView mv = new ModelAndView("main");
		
		return mv;
	}
}
