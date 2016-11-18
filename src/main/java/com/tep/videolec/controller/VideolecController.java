package com.tep.videolec.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tep.commons.common.CommandMap;
import com.tep.videolec.service.VideolecService;

@Controller
public class VideolecController {
	
	@Autowired
	private VideolecService videolecService;
	
	@RequestMapping(value="/admin/videolec/write" , method=RequestMethod.GET)
	public String videolecWrite(){
		return "adminVideolecWrite";
	}

	@RequestMapping(value="/admin/videolec/write" , method=RequestMethod.POST)
	public ModelAndView videolecWrite(CommandMap map) throws Exception{
		videolecService.insertVideolec(map.getMap());
		return new ModelAndView("redirect:/admin/videolec/list");
	}
	
	@RequestMapping(value="/admin/videolec/list" , method=RequestMethod.GET)
	public ModelAndView videolecList() throws Exception{
		ModelAndView mv = new ModelAndView("adminVideolecList");
		List<Map<String, Object>> list = videolecService.selectAdminVideolecList();
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping(value="/admin/videolec/delete" , method=RequestMethod.POST)
	public ModelAndView videolecWrite(@RequestParam int v_no) throws Exception{
		videolecService.deleteVideolec(v_no);
		return new ModelAndView("redirect:/admin/videolec/list");
	}
	
}
