package com.tep.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tep.board.service.BoardService;
import com.tep.commons.common.CommandMap;
import com.tep.commons.common.TepConstants;
import com.tep.commons.util.PagingCalculator;
import com.tep.commons.util.TepUtils;
import com.tep.members.model.MembersModel;

@Controller
public class BoardController {
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
    @RequestMapping(value={"/board","/board/list"}, method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardList(CommandMap map, HttpServletRequest request) throws Exception{
    	TepUtils.savePageURI(request);
    	
        ModelAndView mv = new ModelAndView("boardList");
        
        List<Map<String,Object>> list = boardService.selectBoardList(map.getMap());
        PagingCalculator paging = new PagingCalculator("board", map.get("currentPage") == null ? 1:Integer.parseInt(map.get("currentPage").toString()), list, 5, 3);
        
        Map<String, Object> rMap = paging.getPagingList();
        
        mv.addObject("list", rMap.get("list"));
        mv.addObject("pagingHtml",rMap.get("pagingHtml"));
        
        return mv;
    }
    
    @RequestMapping(value="/board/detail", method=RequestMethod.GET)
    public ModelAndView boardDetail(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("boardDetail");
    	
    	Map<String, Object> result = boardService.selectBoardDetail(map.getMap(),false);
    	
    	mv.addObject("data",result.get("detail"));
    	mv.addObject("cmtList", result.get("cmtList"));
    	
    	return mv;
    }
    
    @RequestMapping(value="/board/detail", method=RequestMethod.POST)
    public ModelAndView boardDetail(CommandMap map, HttpServletRequest request) throws Exception{
		TepUtils.savePageURI(request);
		
		ModelAndView mv = new ModelAndView("boardDetail");
		
		Map<String, Object> result = boardService.selectBoardDetail(map.getMap(),true);
		
		mv.addObject("data",result.get("detail"));
		mv.addObject("cmtList", result.get("cmtList"));
		
		return mv;
    }
    
    @RequestMapping(value="/board/write", method=RequestMethod.GET)
    public String boardWriteForm(){
    	return "boardWrite";
    }
    
    @RequestMapping(value="/board/write", method=RequestMethod.POST)
    public ModelAndView boardWrite(CommandMap map, HttpServletRequest request) throws Exception{
    	HttpSession session = request.getSession();
    	MembersModel mm = (MembersModel) session.getAttribute(TepConstants.M_OBJECT);
    	
    	map.put("B_NAME", mm.getM_name());
    	map.put("B_EMAIL", mm.getM_email());
    	map.put("B_COMPANY", mm.getM_company());
    	map.put("M_NO", mm.getM_no());
    	
    	boardService.insertBoard(map.getMap());
    	
    	return new ModelAndView("redirect:/board");
    }
    
    @RequestMapping(value="/board/modify", method=RequestMethod.GET)
    public ModelAndView boardModify(CommandMap map) throws Exception{
    	ModelAndView mv = new ModelAndView("boardModify");
    	
    	Map<String, Object> result = boardService.selectBoardModify(map.getMap());
		
		mv.addObject("data",result);
    	
    	return mv;
    }
    
    @RequestMapping(value="/board/modify", method=RequestMethod.POST)
    public ModelAndView boardModify(CommandMap map, HttpServletRequest request) throws Exception{
    	map.put("M_NO", request.getSession().getAttribute(TepConstants.M_NO));
    	boardService.updateBoard(map.getMap());
    	return new ModelAndView("redirect:/board/detail?B_NO="+map.get("B_NO"));
    }
    
    @RequestMapping(value="/board/delete", method=RequestMethod.POST)
    public ModelAndView boardDelete(CommandMap map, HttpServletRequest request) throws Exception{
    	map.put("M_NO", request.getSession().getAttribute(TepConstants.M_NO));
    	boardService.deleteBoard(map.getMap());
    	return new ModelAndView("redirect:/board");
    }
    
    @RequestMapping(value="/board/insertcmt", method=RequestMethod.POST)
    public ModelAndView insertCmt(CommandMap map, HttpServletRequest request) throws Exception{
    	HttpSession session = request.getSession();
    	
    	map.put("C_NAME", session.getAttribute(TepConstants.M_NAME));
    	map.put("M_NO", session.getAttribute(TepConstants.M_NO));
    	
    	boardService.insertComments(map.getMap());
    	
    	return new ModelAndView("redirect:/board/detail?B_NO="+map.get("B_NO"));
    }
    
    @RequestMapping(value="/board/deletecmt", method=RequestMethod.POST)
    public ModelAndView deleteCmt(CommandMap map, HttpServletRequest request) throws Exception{
    	HttpSession session = request.getSession();
    	map.put("M_NO", session.getAttribute(TepConstants.M_NO));
    	
    	boardService.deleteComments(map.getMap());
    	
    	return new ModelAndView("redirect:/board/detail?B_NO="+map.get("B_NO"));
    }
}
