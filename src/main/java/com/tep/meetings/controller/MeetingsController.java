package com.tep.meetings.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MeetingsController {

    @RequestMapping(value={"/meetings","/meetings/list"})
    public ModelAndView openMeetingsList(Map<String,Object> map) throws Exception{
        ModelAndView mv = new ModelAndView("meetingsList");

        
        return mv;
    }
}
