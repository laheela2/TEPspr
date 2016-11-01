package com.tep.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tep.board.service.BoardService;
import com.tep.commons.common.PagingCalculator;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());

	private static final int SEARCHKEY_SUBEJCT = 0;
	private static final int SEARCHKEY_SUBJECT_CONTENT = 1;
	private static final int SEARCHKEY_NAME = 2;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 3;
	private String pagingHtml;
	private PagingCalculator page;
	
	private int searchKey = -1;
	private String searchWord = "";	
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
    @RequestMapping(value="/board")
    public ModelAndView openBoardList(Map<String,Object> map) throws Exception{
        ModelAndView mv = new ModelAndView("board");

        List<Map<String,Object>> list = boardService.selectBoardList(map);
        totalCount = list.size();
		page = new PagingCalculator("board", currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount){
			lastCount = page.getEndCount()+1;
		}
		
		list = list.subList(page.getStartCount(), lastCount);
        
        
        
        mv.addObject("list", list);
        mv.addObject("pagingHtml",pagingHtml);
        
        return mv;
    }
    
    
}
