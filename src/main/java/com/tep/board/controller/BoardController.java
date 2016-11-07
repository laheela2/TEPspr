package com.tep.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tep.board.service.BoardService;
import com.tep.commons.common.CommandMap;
import com.tep.commons.util.PagingCalculator;
import com.tep.commons.util.TepUtils;

@Controller
public class BoardController {
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
    @RequestMapping(value="/board", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardList(CommandMap map, HttpServletRequest request) throws Exception{
    	TepUtils.savePageURI(request);
    	
        ModelAndView mv = new ModelAndView("board");
        
        List<Map<String,Object>> list = boardService.selectBoardList(map.getMap());
        PagingCalculator paging = new PagingCalculator("board", map.get("currentPage") == null ? 1:Integer.parseInt(map.get("currentPage").toString()), list, 5, 3);
        
        Map<String, Object> rMap = paging.getPagingList();
        
        mv.addObject("list", rMap.get("list"));
        mv.addObject("pagingHtml",rMap.get("pagingHtml"));
        
        return mv;
    }
}
