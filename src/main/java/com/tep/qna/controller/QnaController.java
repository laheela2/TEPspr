package com.tep.qna.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tep.qna.service.QnaService;
import com.tep.commons.common.CommandMap;
import com.tep.commons.common.TepConstants;
import com.tep.commons.util.PagingCalculator;
import com.tep.commons.util.TepUtils;

@Controller
public class QnaController {
	protected Logger log = Logger.getLogger(this.getClass());

	@Resource
	private QnaService qnaService;

	@RequestMapping(value = { "/qna", "/qna/list" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView qnaList(CommandMap map, HttpServletRequest request) throws Exception {
		TepUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("qnaList");

		List<Map<String, Object>> list = qnaService.selectQnaList(map.getMap());
		PagingCalculator paging = new PagingCalculator("board", map.getCurrentPageNo(), list, 5, 3);
		Map<String, Object> rMap = paging.getPagingList();

		mv.addObject("list", rMap.get("list"));
		mv.addObject("pagingHtml", rMap.get("pagingHtml"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());

		return mv;
	}

	@RequestMapping(value = "/qna/write", method = RequestMethod.GET)
	public String boardWriteForm() {
		return "qnaWrite";
	}

	@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
	public ModelAndView boardWrite(CommandMap map, HttpServletRequest request) throws Exception {
		map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
		qnaService.insertQna(map.getMap());
		return new ModelAndView("redirect:/qna");
	}

	@RequestMapping(value = "/qna/detail", method = RequestMethod.GET)
	public ModelAndView boardDetail(CommandMap map) throws Exception {
		ModelAndView mv = new ModelAndView("qnaDetail");

		Map<String, Object> result = qnaService.selectQnaDetail(map.getMap());

		mv.addObject("data", result.get("detail"));
		mv.addObject("cmtList", result.get("cmtList"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());
		return mv;
	}

	@RequestMapping(value = "/qna/detail", method = RequestMethod.POST)
	public ModelAndView boardDetail(CommandMap map, HttpServletRequest request) throws Exception {
		TepUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("qnaDetail");

		Map<String, Object> result = qnaService.selectQnaDetail(map.getMap());

		mv.addObject("data", result.get("detail"));
		mv.addObject("cmtList", result.get("cmtList"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());
		return mv;
	}
	
	@RequestMapping(value="/qna/modify", method=RequestMethod.GET)
    public ModelAndView qnaModify(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("qnaModify");
    	
    	Map<String, Object> result = qnaService.selectQnaModify(map.getMap());
		mv.addObject("data",result);
    	return mv;
    }
    
    @RequestMapping(value="/qna/modify", method=RequestMethod.POST)
    public ModelAndView qnaModify(CommandMap map, HttpServletRequest request) throws Exception{
    	map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
    	
    	qnaService.updateQna(map.getMap());
    	return new ModelAndView("redirect:/qna/detail?q_no="+map.get("q_no"));
    }
	
    @RequestMapping(value="/qna/delete", method=RequestMethod.POST)
    public ModelAndView qnaDelete(CommandMap map, HttpServletRequest request) throws Exception{
    	map.put("m_no", request.getSession().getAttribute(TepConstants.M_NO));
    	
    	qnaService.deleteQna(map.getMap());
    	return new ModelAndView("redirect:/qna");
    }
}
