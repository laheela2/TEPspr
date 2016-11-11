package com.tep.mypage.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tep.mypage.service.MypageService;
import com.tep.board.service.BoardService;
import com.tep.commons.common.CommandMap;
import com.tep.commons.util.PagingCalculator;
import com.tep.commons.util.TepUtils;
@Controller
public class MypageController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MypageService mypageService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	//회원정보수정 패스워드 체크
	@RequestMapping(value="/modifyPwChk")
	public String modifyPwChk(){
		return "modifyPwChk";
	}
	
	//마이페이지 홈
	@RequestMapping(value="/mypageView")
	public ModelAndView mypageHome(HttpSession session) throws Exception{
		if(session.getAttribute("session_m_no") == null){
			return new ModelAndView("redirect:/login");
		}
		ModelAndView mv = new ModelAndView("mypageHome");
		
		Map<String,Object> map = mypageService.selectOneMember(session.getAttribute("session_m_no"));
		System.out.println(map.get("M_PHONE"));
		mv.addObject("mData", map);
		
		return mv;
	}
	
	//회원정보수정 폼
	@RequestMapping(value="/mypageModifyForm")
	public ModelAndView mypageModifyForm(@RequestParam Map<String, String> param, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("mypageModifyForm");
		
		Map<String,Object> map = mypageService.selectOneMember(session.getAttribute("session_m_no"));
		if(param.get("m_password").equals(map.get("M_PASSWORD"))){
			mv.addObject("mData", map);
			
			return mv;
		}
		
		return new ModelAndView("mypagePasswordError");
	}
	
	//회원정보수정 결과
	@RequestMapping(value="/mypageModifyResult")
	public ModelAndView mypageModifyResult(@RequestParam Map<String, Object> params, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("mypageModifyResult");
		
		params.put("m_email", session.getAttribute("session_m_email"));
		mypageService.memberUpdate(params);
		
		return mv;
	}
	
	//게시판 글쓴 내역
	@RequestMapping(value="/writeHistoryBoard")
	public ModelAndView writeHistoryBoard(CommandMap map,HttpSession session, HttpServletRequest request) throws Exception{
		TepUtils.savePageURI(request);
		
		ModelAndView mv = new ModelAndView("mypageWriteHistoryBoardView");
		//검색
			map.put("m_no", session.getAttribute("session_m_no"));
			List<Map<String,Object>> list = mypageService.writeHistoryBoard(map.getMap());
			PagingCalculator paging = new PagingCalculator("mypage", map.get("currentPage") == null ? 1:Integer.parseInt(map.get("currentPage").toString()), list, 5, 3);
					
			Map<String, Object> rMap = paging.getPagingList();
			
			mv.addObject("list", rMap.get("list"));
			mv.addObject("pagingHtml",rMap.get("pagingHtml"));
		
		return mv;
	}
	
	 @RequestMapping(value="/mypageBoardDetail")
	    public ModelAndView boardDetail(CommandMap map, HttpServletRequest request) throws Exception{
			TepUtils.savePageURI(request);
			
			ModelAndView mv = new ModelAndView("mypageBoardDetail");
			
			Map<String, Object> result = boardService.selectBoardDetail(map.getMap(),true);
			
			mv.addObject("data",result.get("detail"));
			mv.addObject("cmtList", result.get("cmtList"));
			
			return mv;
	    }	
	//문의내역
	@RequestMapping(value="/qnaHistory")
	public ModelAndView qnaHistory(CommandMap map, HttpSession session, HttpServletRequest request) throws Exception{
		TepUtils.savePageURI(request);
		
		ModelAndView mv = new ModelAndView("mypageQnaHistoryView");
		
		map.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String,Object>> list = mypageService.qnaHistory(map.getMap());
		PagingCalculator paging = new PagingCalculator("mypage", map.get("currentPage") == null ? 1:Integer.parseInt(map.get("currentPage").toString()), list, 5, 3);
		
		Map<String, Object> rMap = paging.getPagingList();
		
		mv.addObject("list", rMap.get("list"));
		mv.addObject("pagingHtml",rMap.get("pagingHtml"));
		
		return mv;
	}
	
	//답글내역
	@RequestMapping(value="/cmtHistory")
	public ModelAndView cmtHistory(CommandMap map,HttpSession session, HttpServletRequest request) throws Exception{
		TepUtils.savePageURI(request);
		
		ModelAndView mv = new ModelAndView("mypageCmtHistoryView");
		
		map.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String,Object>> list = mypageService.cmtHistory(map.getMap());
		PagingCalculator paging = new PagingCalculator("mypage", map.get("currentPage") == null ? 1:Integer.parseInt(map.get("currentPage").toString()), list, 5, 3);
		
		Map<String, Object> rMap = paging.getPagingList();
		
		mv.addObject("list", rMap.get("list"));
		mv.addObject("pagingHtml",rMap.get("pagingHtml"));
		
		return mv;
	}
	
	//모임개설내역
	@RequestMapping(value="/writeHistoryOmeet")
	public ModelAndView writeHistoryOmeet(CommandMap map,HttpSession session, HttpServletRequest request) throws Exception{
		TepUtils.savePageURI(request);
		
		ModelAndView mv = new ModelAndView("mypageWriteHistoryOmeetView");
		
		map.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String,Object>> list = mypageService.writeHistoryOmeet(map.getMap());
		PagingCalculator paging = new PagingCalculator("mypage", map.get("currentPage") == null ? 1:Integer.parseInt(map.get("currentPage").toString()), list, 5, 3);
		
		Map<String, Object> rMap = paging.getPagingList();
		
		mv.addObject("list", rMap.get("list"));
		mv.addObject("pagingHtml",rMap.get("pagingHtml"));
		
		return mv;
	}
	 @RequestMapping(value="/mypageOmeetDetail")
	    public ModelAndView mypageOmeetDetail(CommandMap map, HttpServletRequest request) throws Exception{
			TepUtils.savePageURI(request);
			
			ModelAndView mv = new ModelAndView("mypageOmeetDetail");
			
			Map<String, Object> result = boardService.selectBoardDetail(map.getMap(),true);
			
			mv.addObject("data",result.get("detail"));
			mv.addObject("cmtList", result.get("cmtList"));
			
			return mv;
	    }	
	
	//모임참여내역
	@RequestMapping(value="/meetHistory")
	public ModelAndView meetHistory(CommandMap map,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("mypageMeetHistoryView");
		List<Map<String,Object>> list = new ArrayList<>();
		List<Map<String,Object>> sublist = mypageService.subscribeHistory(session.getAttribute("session_m_no"));
		
		for(Map<String, Object> data : sublist){
			list.add( (Map<String, Object>) mypageService.meetHistory(data.get("O_NO")));
		}
		
		PagingCalculator paging = new PagingCalculator("mypage", map.get("currentPage") == null ? 1:Integer.parseInt(map.get("currentPage").toString()), list, 5, 3);
		
		Map<String, Object> rMap = paging.getPagingList();
		
		mv.addObject("list", rMap.get("list"));
		mv.addObject("pagingHtml",rMap.get("pagingHtml")); 
		
		return mv;
	}

	//회원탈퇴 폼 이동
	@RequestMapping(value="/mypageDeleteForm")
	public String mypageDeleteForm(){
		return "mypageDeleteForm";
	}
	
	//회원탈퇴
	@RequestMapping(value="/mypageDeleteResult")
	public ModelAndView mypageDeleteResult(@RequestParam Map<String, String> param, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("mypageDeleteResult");
		ModelAndView mv2 = new ModelAndView("mypagePasswordError");
		
			if(session.getAttribute("session_m_email")==null){
				return new ModelAndView("sessionError");
			}
			
			Map<String,Object> map = mypageService.selectOneMember(session.getAttribute("session_m_no"));
			
			if(param.get("m_password").equals(map.get("M_PASSWORD"))){
			
				mypageService.memDeleteMembers(map.get("M_NO"));
				
				session.removeAttribute("session_m_email");
				session.removeAttribute("session_m_name");
				session.removeAttribute("session_m_no");
				
				return mv;
			}else{
				return mv2;
			}
	}
	
}
