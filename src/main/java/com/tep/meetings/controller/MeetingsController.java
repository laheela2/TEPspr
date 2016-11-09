package com.tep.meetings.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tep.commons.common.CommandMap;
import com.tep.commons.util.PagingCalculator;
import com.tep.commons.util.TepUtils;
import com.tep.meetings.service.MeetingsService;

@Controller
public class MeetingsController {
	protected Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private MeetingsService meetingsService;
	
    @RequestMapping(value={"/meetings","/meetings/list"}, method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView meetingsList(CommandMap map, HttpServletRequest request) throws Exception{
    	TepUtils.savePageURI(request);
        ModelAndView mv = new ModelAndView("meetingsList");
        
        List<Map<String,Object>> list = meetingsService.selectMeetingsList(map.getMap());
        PagingCalculator paging = new PagingCalculator("meetings", map.getCurrentPageNo(), list, 6, 3);
        Map<String, Object> result = paging.getPagingList();
        
        mv.addObject("list", result.get("list"));
        mv.addObject("pagingHtml",result.get("pagingHtml"));
        mv.addObject("currentPageNo", map.getCurrentPageNo());
        
        return mv;
    }
}
