package com.tep.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tep.board.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;

	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
