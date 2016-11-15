package com.tep.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository
public class BoardDAO extends AbstractDAO{
	
	public BoardDAO(){
		setNameSpace("board.");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("selectBoardList",map);
	}

	public void updateBoardReadCount(Map<String, Object> map) {
		update("updateBoardReadCount", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("selectBoardDetail",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCmtList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("selectCmtList",map);
	}

	public void insertComments(Map<String, Object> map) {
		insert("insertCmt", map);
	}

	public void deleteComments(Map<String, Object> map) {
		delete("deleteCmt", map);
	}

	public void insertBoard(Map<String, Object> map) {
		insert("insertBoard", map);
	}

	public void updateBoard(Map<String, Object> map) {
		update("updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) {
		delete("deleteBoard", map);
	}

}
