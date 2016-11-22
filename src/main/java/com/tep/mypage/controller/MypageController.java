package com.tep.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.tep.qna.service.QnaService;
import com.tep.board.service.BoardService;
import com.tep.commons.common.CommandMap;
import com.tep.commons.util.PagingCalculator;
import com.tep.commons.util.TepUtils;
import com.tep.meetings.service.MeetingsService;

@Controller
public class MypageController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource
	private MypageService mypageService;

	@Resource
	private BoardService boardService;

	@Resource
	private QnaService qnaService;

	@Resource
	private MeetingsService meetingsService;

	@RequestMapping(value = "/mypage/modifyPwChk")
	public String modifyPwChk() {
		return "modifyPwChk";
	}

	@RequestMapping(value = "/mypage/View")
	public ModelAndView mypageHome(HttpSession session) throws Exception {
		if (session.getAttribute("session_m_no") == null) {
			return new ModelAndView("redirect:/login");
		}
		ModelAndView mv = new ModelAndView("mypageHome");

		Map<String, Object> map = mypageService.selectOneMember(session.getAttribute("session_m_no"));
		mv.addObject("mData", map);

		return mv;
	}

	@RequestMapping(value = "/mypage/ModifyForm")
	public ModelAndView mypageModifyForm(@RequestParam Map<String, String> param, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("mypageModifyForm");

		Map<String, Object> map = mypageService.selectOneMember(session.getAttribute("session_m_no"));
		if (param.get("m_password").equals(map.get("M_PASSWORD"))) {
			mv.addObject("mData", map);

			return mv;
		}

		return new ModelAndView("mypagePasswordError");
	}

	@RequestMapping(value = "/mypage/ModifyResult")
	public ModelAndView mypageModifyResult(@RequestParam Map<String, Object> params, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("mypageModifyResult");

		params.put("m_email", session.getAttribute("session_m_email"));
		mypageService.memberUpdate(params);

		return mv;
	}

	@RequestMapping(value = "/mypage/writeHistoryBoard")
	public ModelAndView writeHistoryBoard(CommandMap map, HttpSession session, HttpServletRequest request) throws Exception {
		TepUtils.savePageURI(request);

		ModelAndView mv = new ModelAndView("mypageWriteHistoryBoardView");
		//
		map.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String, Object>> list = mypageService.writeHistoryBoard(map.getMap());
		//PagingCalculator paging = new PagingCalculator("writeHistoryBoard", map.get("currentPage") == null ? 1 : Integer.parseInt(map.get("currentPage").toString()), list, 5, 3);
		PagingCalculator paging = new PagingCalculator("mypage/writeHistoryBoard", map.getCurrentPageNo(), list, 5, 3);
		Map<String, Object> rMap = paging.getPagingList();

		mv.addObject("list", rMap.get("list"));
		mv.addObject("pagingHtml", rMap.get("pagingHtml"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());
		
		return mv;
	}

	@RequestMapping(value = "/mypage/BoardDetail")
	public ModelAndView boardDetail(CommandMap map, HttpServletRequest request) throws Exception {
		TepUtils.savePageURI(request);

		ModelAndView mv = new ModelAndView("mypageBoardDetail");

		Map<String, Object> result = boardService.selectBoardDetail(map.getMap(), false);

		mv.addObject("data", result.get("detail"));
		mv.addObject("cmtList", result.get("cmtList"));

		return mv;
	}

	@RequestMapping(value = "/mypage/qnaHistory")
	public ModelAndView qnaHistory(CommandMap map, HttpSession session, HttpServletRequest request) throws Exception {
		TepUtils.savePageURI(request);

		ModelAndView mv = new ModelAndView("mypageQnaHistoryView");
		map.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String, Object>> list = mypageService.qnaHistory(map.getMap());
		
		PagingCalculator paging = new PagingCalculator("mypage/qnaHistory", map.get("currentPage") == null ? 1 : Integer.parseInt(map.get("currentPage").toString()), list, 5, 3);

		Map<String, Object> rMap = paging.getPagingList();
		mv.addObject("list", rMap.get("list"));
		mv.addObject("pagingHtml", rMap.get("pagingHtml"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());

		return mv;
	}
	
	@RequestMapping(value = "/mypage/QnaDetail")
	public ModelAndView qnaDetail(CommandMap map, HttpServletRequest request) throws Exception {
		TepUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("mypageQnaDetail");
		Map<String, Object> result = qnaService.selectQnaDetail(map.getMap());

		mv.addObject("data", result.get("detail"));
		mv.addObject("answer", result.get("answer"));
		return mv;
	}

	@RequestMapping(value = "/mypage/cmtHistory")
	public ModelAndView cmtHistory(CommandMap map, HttpSession session, HttpServletRequest request) throws Exception {
		TepUtils.savePageURI(request);

		ModelAndView mv = new ModelAndView("mypageCmtHistoryView");

		map.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String, Object>> list = mypageService.cmtHistory(map.getMap());
		PagingCalculator paging = new PagingCalculator("mypage/cmtHistory", map.getCurrentPageNo(), list, 5, 3);

		Map<String, Object> rMap = paging.getPagingList();

		mv.addObject("list", rMap.get("list"));
		mv.addObject("pagingHtml", rMap.get("pagingHtml"));

		return mv;
	}

	@RequestMapping(value = "/mypage/writeHistoryOmeet")
	public ModelAndView writeHistoryOmeet(CommandMap map, HttpSession session, HttpServletRequest request) throws Exception {
		TepUtils.savePageURI(request);

		ModelAndView mv = new ModelAndView("mypageWriteHistoryOmeetView");

		map.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String, Object>> list = mypageService.writeHistoryOmeet(map.getMap());
		PagingCalculator paging = new PagingCalculator("mypage/writeHistoryOmeet", map.getCurrentPageNo(), list, 5, 3);

		Map<String, Object> rMap = paging.getPagingList();

		mv.addObject("list", rMap.get("list"));
		mv.addObject("pagingHtml", rMap.get("pagingHtml"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());

		return mv;
	}

	@RequestMapping(value = "/mypage/OmeetDetail")
	public ModelAndView mypageOmeetDetail(CommandMap map, HttpServletRequest request) throws Exception {
		TepUtils.savePageURI(request);

		ModelAndView mv = new ModelAndView("mypageOmeetDetail");
		Map<String, Object> result = meetingsService.selectMeetingsDetail(map.getMap(), request.getMethod().equals("POST"));
		mv.addObject("data", result.get("detail"));
		mv.addObject("cmtList", result.get("cmtList"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());

		return mv;
	}

	@RequestMapping(value = "/mypage/meetHistory")
	public ModelAndView meetHistory(CommandMap map, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("mypageMeetHistoryView");
		List<Map<String, Object>> list = new ArrayList<>();
		List<Map<String, Object>> sublist = mypageService.subscribeHistory(session.getAttribute("session_m_no"));

		for (Map<String, Object> data : sublist) {
			list.add((Map<String, Object>) mypageService.meetHistory(data.get("MT_NO")));
		}

		PagingCalculator paging = new PagingCalculator("mypage/meetHistory", map.getCurrentPageNo(), list, 5, 3);

		Map<String, Object> rMap = paging.getPagingList();

		mv.addObject("list", rMap.get("list"));
		mv.addObject("pagingHtml", rMap.get("pagingHtml"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());

		return mv;
	}

	@RequestMapping(value = "/mypage/deleteForm")
	public String mypageDeleteForm() {
		return "mypageDeleteForm";
	}

	@RequestMapping(value = "/mypage/DeleteResult")
	public ModelAndView mypageDeleteResult(@RequestParam Map<String, String> param, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("mypageDeleteResult");
		ModelAndView mv2 = new ModelAndView("mypagePasswordError");

		if (session.getAttribute("session_m_email") == null) {
			return new ModelAndView("sessionError");
		}

		Map<String, Object> map = mypageService.selectOneMember(session.getAttribute("session_m_no"));

		if (param.get("m_password").equals(map.get("M_PASSWORD"))) {

			mypageService.memDeleteMembers(map.get("M_NO"));

			session.removeAttribute("session_m_email");
			session.removeAttribute("session_m_name");
			session.removeAttribute("session_m_no");

			return mv;
		} else {
			return mv2;
		}
	}

}
