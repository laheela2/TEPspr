package com.tep.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tep.board.service.BoardService;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardService")
	private BoardService boardService;
	
    @RequestMapping(value="/board")
    public ModelAndView openBoardList(Map<String,Object> map) throws Exception{
        ModelAndView mv = new ModelAndView("board");

        List<Map<String,Object>> list = boardService.selectBoardList(map);
        mv.addObject("list", list);
        
        return mv;
    }
}
