package com.tep.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.tep.admin.service.AdminService;
import com.tep.commons.common.CommandMap;
import com.tep.commons.common.TepConstants;
import com.tep.commons.util.PagingCalculator2;

@Controller
public class AdminController {
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value={"/admin","/admin/dashboard"})
	public ModelAndView dashboardView() throws Exception{
		ModelAndView mv = new ModelAndView("adminDashboard");
		List<Map<String, Object>> result1 = adminService.selectBoardList();
		List<Map<String, Object>> result2 = adminService.selectMeetingsList();
		List<Map<String, Object>> result3 = adminService.selectLendplaceList();
		List<Map<String, Object>> result4 = adminService.selectQnaList();
		
		mv.addObject("data1", result1);
		mv.addObject("data2", result2);
		mv.addObject("data3", result3);
		mv.addObject("data4", result4);
		
		return mv;
	}
	
    @RequestMapping(value="/admin/members/list", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView memberList(CommandMap map, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("adminMemberList");
        
        List<Map<String,Object>> list = adminService.selectMemberList(map.getMap());
        PagingCalculator2 paging = new PagingCalculator2("admin/members/list", map.getCurrentPageNo(), list, 5, 3);
        Map<String, Object> rMap = paging.getPagingList();
        
        mv.addObject("list", rMap.get("list"));
        mv.addObject("pagingHtml",rMap.get("pagingHtml"));
        mv.addObject("currentPageNo", map.getCurrentPageNo());
        
        return mv;
    }
   
    @RequestMapping(value="/admin/members/modifyForm")
    public ModelAndView memberModifyForm(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("adminMemberModifyForm");
    	
    	Map<String, Object> result = adminService.selectMemberModifyForm(map.getMap());
    	mv.addObject("data", result);
    	
    	return mv;
    }
    
    @RequestMapping(value="/admin/members/modify")
    public ModelAndView memberModify(@RequestParam Map<String, Object> params) throws Exception{
    	System.out.println(params.get("m_phone"));
    	System.out.println(params.get("m_name"));
    	System.out.println(params.get("m_password"));
    	System.out.println(params.get("m_email"));
    	adminService.adminMemberModify(params);
    	
    	return new ModelAndView("redirect:/admin/members/list");
    }
    
    @RequestMapping(value="/admin/members/delete")
    public ModelAndView memeberDelete(@RequestParam Map<String, Object> params) throws Exception{
    	
    	adminService.deleteMember(params);
    	
    	return new ModelAndView("redirect:/admin/members/list");
    }
    
    @RequestMapping(value="/admin/lendplace/form", method=RequestMethod.GET)
    public String lendplaceForm(){
    	return "adminLendplaceWrite";
    }
    
    @RequestMapping(value="/admin/lendplace/write", method=RequestMethod.POST)
    public ModelAndView lendplaceWrite(CommandMap map, MultipartHttpServletRequest request) throws Exception{
    	adminService.insertLendplace(map.getMap(),request);
    	return new ModelAndView("redirect:/admin/lendplace/list");
    }
    
    @RequestMapping(value="/admin/lendplace/list", method=RequestMethod.GET)
    public ModelAndView lendplaceList(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("adminLendplaceList");
    	
    	List<Map<String,Object>> list = adminService.selectLendplaceList();
    	PagingCalculator2 paging = new PagingCalculator2("admin/lendplace/list", map.getCurrentPageNo(), list, 5, 3);
        Map<String, Object> rMap = paging.getPagingList();
        
        mv.addObject("list", rMap.get("list"));
        mv.addObject("pagingHtml",rMap.get("pagingHtml"));
        mv.addObject("currentPageNo", map.getCurrentPageNo());
        
    	return mv;
    }
    
    @RequestMapping(value="/admin/qna/list", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView qnaList(CommandMap map, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("adminQnaList");
        
        List<Map<String,Object>> list = adminService.selectQnaList(map.getMap());
        PagingCalculator2 paging = new PagingCalculator2("admin/qna/list", map.getCurrentPageNo(), list, 5, 3);
        Map<String, Object> rMap = paging.getPagingList();
        
        mv.addObject("list", rMap.get("list"));
        mv.addObject("pagingHtml",rMap.get("pagingHtml"));
        mv.addObject("currentPageNo", map.getCurrentPageNo());
        
        return mv;
    }
    
    @RequestMapping(value="/admin/qna/detail")
    public ModelAndView adminQnaDetail(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("adminQnaDetail");
    	Map<String, Object> result = adminService.adminQnaDetail(map.getMap());
    	mv.addObject("data",result);
    	return mv;
    }
    
    @RequestMapping(value="/admin/board/list")
    public ModelAndView adminBoardList(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("adminBoardList");
    	
    	List<Map<String, Object>> list = adminService.selectBoardList();
    	PagingCalculator2 paging = new PagingCalculator2("admin/board/list", map.getCurrentPageNo(), list, 5, 3);
        Map<String, Object> rMap = paging.getPagingList();
        
        mv.addObject("list", rMap.get("list"));
        mv.addObject("pagingHtml",rMap.get("pagingHtml"));
        mv.addObject("currentPageNo", map.getCurrentPageNo());
    	
    	return mv;
    }
    
    @RequestMapping(value="/admin/board/delete" , method=RequestMethod.POST)
	public ModelAndView adminBoardDelete(@RequestParam int b_no) throws Exception{
		adminService.adminBoardDelete(b_no);
		return new ModelAndView("redirect:/admin/board/list");
	}
    
    
    @RequestMapping(value="/admin/lendplace/delete" , method=RequestMethod.POST)
	public ModelAndView adminLendplaceDelete(@RequestParam int l_no) throws Exception{
		adminService.adminLendplaceDelete(l_no);
		return new ModelAndView("redirect:/admin/lendplace/list");
	}
    
    @RequestMapping(value="/admin/meetings/list")
    public ModelAndView adminMeetingsList(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("adminMeetingsList");
    	
    	List<Map<String, Object>> list = adminService.selectMeetingsList();
    	PagingCalculator2 paging = new PagingCalculator2("admin/meetings/list", map.getCurrentPageNo(), list, 5, 3);
        Map<String, Object> rMap = paging.getPagingList();
        
        mv.addObject("list", rMap.get("list"));
        mv.addObject("pagingHtml",rMap.get("pagingHtml"));
        mv.addObject("currentPageNo", map.getCurrentPageNo());
    	
    	return mv;
    }
    
    @RequestMapping(value="/admin/meetings/delete" , method=RequestMethod.POST)
	public ModelAndView videolecWrite(@RequestParam int mt_no) throws Exception{
		adminService.adminDeleteMeetings(mt_no);
		return new ModelAndView("redirect:/admin/meetings/list");
	}
    
    @RequestMapping(value="/admin/answer")
	public ModelAndView adminAnswer(CommandMap map, HttpServletRequest request) throws Exception{
		adminService.adminAnswer(map.getMap());
		return new ModelAndView("redirect:/admin/qna/list");
	}
}
