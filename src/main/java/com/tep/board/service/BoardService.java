package com.tep.board.service;

import java.util.List;
import java.util.Map;

import com.tep.commons.service.CommentsService;

public interface BoardService extends CommentsService{
	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map, boolean readCount) throws Exception;
	
	Map<String, Object> selectBoardModify(Map<String, Object> map) throws Exception;
	
	void insertBoard(Map<String, Object> map) throws Exception;

	void updateBoard(Map<String, Object> map) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;
}
