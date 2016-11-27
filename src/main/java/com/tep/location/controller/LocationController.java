package com.tep.location.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tep.commons.common.CommandMap;
import com.tep.location.service.LocationService;

@Controller
public class LocationController {

	@Autowired
	private LocationService locationService;

	@RequestMapping("/location")
	public ModelAndView locationMain(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();

		List<Map<String,Object>> result = locationService.selectMeetingsLocation(map.getMap());
		mv.addObject("list",result);

		return mv;
	}


}
