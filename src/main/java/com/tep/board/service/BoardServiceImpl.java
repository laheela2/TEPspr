package com.tep.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tep.board.dao.BoardDAO;
import com.tep.commons.service.CommentsService;

@Service("boardService")
public class BoardServiceImpl implements BoardService, CommentsService{
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardList(map);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map, boolean readCount) throws Exception {
		if(readCount){
			boardDAO.updateBoardReadCount(map);
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> detail = boardDAO.selectBoardDetail(map);
		List<Map<String, Object>> cmtList = boardDAO.selectCmtList(map);
		
		resultMap.put("detail", detail);
		resultMap.put("cmtList", cmtList);
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectBoardModify(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardDetail(map);
	}
	
	@Override
	public void insertComments(Map<String, Object> map) throws Exception {
		boardDAO.insertComments(map);
	}

	@Override
	public void deleteComments(Map<String, Object> map) throws Exception {
		boardDAO.deleteComments(map);
	}
	
	@Override
	public void insertBoard(Map<String, Object> map) {
		boardDAO.insertBoard(map);
	}

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception {
		boardDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		boardDAO.deleteBoard(map);
	}

}
