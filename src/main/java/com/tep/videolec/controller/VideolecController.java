package com.tep.videolec.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tep.commons.common.CommandMap;
import com.tep.commons.common.TepConstants;
import com.tep.commons.util.PagingCalculator;
import com.tep.commons.util.TepUtils;
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

    @RequestMapping(value={"/videolec","/videolec/list"}, method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView videolecList(CommandMap map, HttpServletRequest request) throws Exception{
    	TepUtils.savePageURI(request);
        ModelAndView mv = new ModelAndView("videolecList");
        List<Map<String,Object>> list = videolecService.selectVideolecList(map.getMap());
        PagingCalculator paging = new PagingCalculator("videolec", map.getCurrentPageNo(), list, 9, 3);
        Map<String, Object> result = paging.getPagingList();
        mv.addObject("list", result.get("list"));
        mv.addObject("pagingHtml",result.get("pagingHtml"));
        mv.addObject("currentPageNo", map.getCurrentPageNo());
        return mv;
    }

    @RequestMapping(value="/videolec/detail", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView videolecDetail(CommandMap map, HttpServletRequest request) throws Exception{
    	TepUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("videolecDetail");
		Map<String, Object> result = videolecService.selectVideolecDetail(map.getMap(),request.getMethod().equals("POST"));
		mv.addObject("data",result.get("detail"));
		mv.addObject("cmtList", result.get("cmtList"));
		mv.addObject("recList", result.get("recList"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());
		return mv;
    }

    @RequestMapping(value="/videolec/insertcmt", method=RequestMethod.POST)
    public ModelAndView insertCmt(CommandMap map, HttpServletRequest request) throws Exception{
    	map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
    	videolecService.insertComments(map.getMap());
    	return new ModelAndView("redirect:/videolec/detail?v_no="+map.get("v_no"));
    }

    @RequestMapping(value="/videolec/deletecmt", method=RequestMethod.POST)
    public ModelAndView deleteCmt(CommandMap map, HttpServletRequest request) throws Exception{
    	map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
    	videolecService.deleteComments(map.getMap());
    	return new ModelAndView("redirect:/videolec/detail?v_no="+map.get("v_no"));
    }
}
