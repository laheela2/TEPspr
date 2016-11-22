package com.tep.mypage.service;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MypageService {
	
	void mypageModify(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	List<Map<String, Object>> writeHistoryBoard(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> qnaHistory(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> cmtHistory(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> writeHistoryOmeet(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> subscribeHistory(Object attribute) throws Exception;

	Map<String, Object> meetHistory(Object object) throws Exception;

	Map<String, Object> selectOneMember(Object attribute) throws Exception;

	void memberUpdate(Map<String, Object> params) throws Exception;

	void memDeleteMembers(Object object) throws Exception;

	void memDeleteOpenmeet(Object object) throws Exception;

	void memDeleteSubscribe(Object object) throws Exception;

	void memDeleteBoard(Object object) throws Exception;

	void memDeleteBoardHelp(Object object) throws Exception;

	void memDeleteComments(Object object) throws Exception;

	void memDeleteLendplaceBook(Object object) throws Exception;

	List<Map<String, Object>> qnaAnswerCk(Object object) throws Exception;




}
