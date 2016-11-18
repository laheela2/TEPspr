package com.tep.mypage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.tep.mypage.dao.MypageDAO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Resource(name="mypageDAO")
	private MypageDAO mypageDAO;

	@Override
	public void mypageModify(Map<String, Object> map, HttpServletRequest request) throws Exception{
		mypageDAO.mypageModify(map);
	}


	@Override
	public List<Map<String, Object>> writeHistoryBoard(Map<String, Object> map) throws Exception {
		return mypageDAO.writeHistoryBoard(map);
	}

	@Override
	public List<Map<String, Object>> qnaHistory(Map<String, Object> map) throws Exception {
		return mypageDAO.qnaHistory(map);
	}

	@Override
	public List<Map<String, Object>> cmtHistory(Map<String, Object> map) throws Exception {
		return mypageDAO.cmtHistory(map);
	}

	@Override
	public List<Map<String, Object>> writeHistoryOmeet(Map<String, Object> map) throws Exception {
		return mypageDAO.writeHistoryOmeet(map);
	}

	@Override
	public List<Map<String, Object>> subscribeHistory(Object attribute) throws Exception {
		return mypageDAO.subscribeHistory(attribute);
	}

	@Override
	public Map<String, Object> meetHistory(Object object) throws Exception {
		return mypageDAO.meetHistory(object);
	}


	@Override
	public Map<String, Object> selectOneMember(Object attribute) throws Exception {
		return mypageDAO.selectOneMember(attribute);
	}


	@Override
	public void memberUpdate(Map<String, Object> params) throws Exception {
		mypageDAO.memberUpdate(params);
	}


	@Override
	public void memDeleteMembers(Object object) throws Exception {
		mypageDAO.memDeleteMembers(object);
	}


	@Override
	public void memDeleteOpenmeet(Object object) throws Exception {
		mypageDAO.memDeleteOpenmeet(object);
	}


	@Override
	public void memDeleteSubscribe(Object object) throws Exception {
		mypageDAO.memDeleteSubscribe(object);
	}


	@Override
	public void memDeleteBoard(Object object) throws Exception {
		mypageDAO.memDeleteBoard(object);
	}


	@Override
	public void memDeleteBoardHelp(Object object) throws Exception {
		mypageDAO.memDeleteBoardHelp(object);
	}


	@Override
	public void memDeleteComments(Object object) throws Exception {
		mypageDAO.memDeleteComments(object);
	}


	@Override
	public void memDeleteLendplaceBook(Object object) throws Exception {
		mypageDAO.memDeleteLendplaceBook(object);
	}




}
