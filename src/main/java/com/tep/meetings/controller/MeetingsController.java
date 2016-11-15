package com.tep.meetings.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tep.commons.common.CommandMap;
import com.tep.commons.common.TepConstants;
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

    @RequestMapping("/meetings/write")
    public String meetingsWriteForm(){
    	return "meetingsWrite";
    }
    
    @RequestMapping(value="/meetings/write", method=RequestMethod.POST)
    public ModelAndView meetingsWrite(CommandMap map, MultipartHttpServletRequest request) throws Exception{
    	meetingsService.insertMeetings(map.getMap(), request);
    	return new ModelAndView("redirect:/meetings");
    }

    @RequestMapping(value="/meetings/likeit", method=RequestMethod.POST)
    public ModelAndView meetingsLikeit(CommandMap map, HttpServletRequest request) throws Exception{
    	meetingsService.insertLikeit(map.getMap(),request);
    	return new ModelAndView("redirect:/meetings?mt_no="+map.get("mt_no"));
    }
    
    @RequestMapping(value="/meetings/detail", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView meetngsDetail(CommandMap map, HttpServletRequest request) throws Exception{
		TepUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("meetingsDetail");
		Map<String, Object> result = meetingsService.selectMeetingsDetail(map.getMap(),request.getMethod().equals("POST"));
		mv.addObject("data",result.get("detail"));
		mv.addObject("cmtList", result.get("cmtList"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());
		return mv;
    }
    
    @RequestMapping(value="/meetings/modify", method=RequestMethod.GET)
    public ModelAndView meetingsModify(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("meetingsModify");
    	Map<String, Object> result = meetingsService.selectMeetingsModify(map.getMap());
		mv.addObject("data",result);
    	return mv;
    }

    @RequestMapping(value="/meetings/modify", method=RequestMethod.POST)
    public ModelAndView meetingsModify(CommandMap map, MultipartHttpServletRequest request) throws Exception{
    	meetingsService.updateMeetings(map.getMap(), request);
    	return new ModelAndView("redirect:/meetings/detail?mt_no="+map.get("mt_no"));
    }
    
    @RequestMapping(value="/meetings/delete", method=RequestMethod.POST)
    public ModelAndView meetingsDelete(CommandMap map, HttpServletRequest request) throws Exception{
    	map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
    	meetingsService.deleteMeetings(map.getMap());
    	return new ModelAndView("redirect:/meetings");
    }
    
    @RequestMapping(value="/meetings/insertcmt", method=RequestMethod.POST)
    public ModelAndView insertCmt(CommandMap map, HttpServletRequest request) throws Exception{
    	map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
    	meetingsService.insertComments(map.getMap());
    	return new ModelAndView("redirect:/meetings/detail?mt_no="+map.get("mt_no"));
    }
    
    @RequestMapping(value="/meetings/deletecmt", method=RequestMethod.POST)
    public ModelAndView deleteCmt(CommandMap map, HttpServletRequest request) throws Exception{
    	map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
    	meetingsService.deleteComments(map.getMap());
    	return new ModelAndView("redirect:/meetings/detail?mt_no="+map.get("mt_no"));
    }
    
    @RequestMapping(value="/meetings/applyform", method=RequestMethod.POST)
    public ModelAndView meetingsApplyForm(CommandMap map, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("meetingsApplyfor");
    	Map<String, Object> result = meetingsService.selectMeetingsApplyfor(map.getMap(), request);
    	mv.addObject("applyData",result);
    	return mv;
    }
    
    @RequestMapping(value="/meetings/applyfor", method=RequestMethod.POST)
    public ModelAndView meetingsApplyfor(CommandMap map, HttpServletRequest request) throws Exception{
    	map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
    	meetingsService.insertMeetingsApplyfor(map.getMap());
    	return new ModelAndView("redirect:/meetings/detail?mt_no="+map.get("mt_no"));
    }
    
}
