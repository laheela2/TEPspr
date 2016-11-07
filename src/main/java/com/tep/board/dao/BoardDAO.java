package com.tep.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("board.selectBoardList",map);
	}

	public void updateBoardReadCount(Map<String, Object> map) {
		update("board.updateBoardReadCount", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("board.selectBoardDetail",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCmtList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("board.selectCmtList",map);
	}

	public void insertComments(Map<String, Object> map) {
		insert("board.insertCmt", map);
	}

	public void deleteComments(Map<String, Object> map) {
		delete("board.deleteCmt", map);
	}

}
