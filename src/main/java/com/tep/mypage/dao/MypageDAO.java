package com.tep.mypage.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;
import com.tep.members.model.MembersModel;

@Repository("mypageDAO")
public class MypageDAO extends AbstractDAO{

	public void mypageModify(Map<String, Object> map) throws Exception{
		update("mypage.mypageModify", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> writeHistoryBoard(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("mypage.writeHistoryBoard", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaHistory(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("mypage.qnaHistory", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cmtHistory(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("mypage.cmtHistory", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> writeHistoryOmeet(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("mypage.writeHistoryOmeet", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> subscribeHistory(Object attribute) {
		return (List<Map<String, Object>>) selectList("mypage.subscribeHistory", attribute);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> meetHistory(Object object) {
		return (Map<String,Object>) selectOne("mypage.meetHistory", object);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneMember(Object attribute) {
		return (Map<String,Object>) selectOne("mypage.selectOneMember", attribute);
	}

	public void memberUpdate(Map<String, Object> params) {
		update("mypage.memberUpdate", params);
	}

	public void memDeleteMembers(Object object) {
		delete("mypage.memDeleteMembers", object);
	}

	public void memDeleteOpenmeet(Object object) {
		delete("mypage.memDeleteOpenmeet", object);
	}

	public void memDeleteSubscribe(Object object) {
		delete("mypage.memDeleteSubscribe", object);
	}

	public void memDeleteBoard(Object object) {
		delete("mypage.memDeleteBoard", object);
	}

	public void memDeleteBoardHelp(Object object) {
		delete("mypage.memDeleteBoardHelp", object);
	}

	public void memDeleteComments(Object object) {
		delete("mypage.memDeleteComments", object);
	}

	public void memDeleteLendplaceBook(Object object) {
		delete("mypage.memDeleteLendplaceBook", object);
	}




}
