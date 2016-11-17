package com.tep.lendplace.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tep.commons.common.CommandMap;
import com.tep.commons.util.PagingCalculator;
import com.tep.commons.util.TepUtils;
import com.tep.lendplace.service.LendplaceService;

@Controller
public class LendplaceController {
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "lendplaceService")
	private LendplaceService lendplaceService;
	
    @RequestMapping(value={"/lendplace","/lendplace/list"}, method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView lendplaceList(CommandMap map, HttpServletRequest request) throws Exception{
    	TepUtils.savePageURI(request);
        ModelAndView mv = new ModelAndView("lendplaceList");
        
        List<Map<String,Object>> list = lendplaceService.selectLendplaceList(map.getMap());
        PagingCalculator paging = new PagingCalculator("lendplace", map.getCurrentPageNo(), list, 6, 3);
        Map<String, Object> rMap = paging.getPagingList();
        
        mv.addObject("list", rMap.get("list"));
        mv.addObject("pagingHtml",rMap.get("pagingHtml"));
        mv.addObject("currentPageNo", map.getCurrentPageNo());
        
        return mv;
    }
    
    @RequestMapping(value="/lendplace/detail", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView lendplaceDetail(CommandMap map, HttpServletRequest request) throws Exception{
    	TepUtils.savePageURI(request);
    	ModelAndView mv = new ModelAndView("lendplaceDetail");
    	
    	Map<String, Object> result = lendplaceService.selectLendplaceDetail(map.getMap());
    	
    	mv.addObject("data",result.get("detail"));
    	mv.addObject("currentPageNo", map.getCurrentPageNo());
    	return mv;
    }
	
    @RequestMapping("/lendplace/write")
    public String lendplaceWriteForm(){
    	return "lendplaceWrite";
    }
    
    @RequestMapping(value="/lendplace/write", method=RequestMethod.POST)
    public ModelAndView lendplaceWrite(CommandMap map, MultipartHttpServletRequest request) throws Exception{
    	lendplaceService.insertLendplace(map.getMap(), request);
    	return new ModelAndView("redirect:/lendplace");
    }

}
