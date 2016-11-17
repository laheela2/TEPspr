package com.tep.qna.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("qna.selectQnaList", map);
	}

	public void insertQna(Map<String, Object> map) {
		insert("qna.insertQna", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("qna.selectQnaDetail",map);
	}

	public void updateQna(Map<String, Object> map) {
		update("qna.updateQna", map);
	}

	public void deleteQna(Map<String, Object> map) {
		delete("qna.deleteQna", map);
	}

}
