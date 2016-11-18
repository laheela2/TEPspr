package com.tep.qna.service;

import java.util.List;
import java.util.Map;

public interface QnaService {

	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;

	void insertQna(Map<String, Object> map) throws Exception;

	Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception;

	Map<String, Object> selectQnaModify(Map<String, Object> map) throws Exception;

	void updateQna(Map<String, Object> map) throws Exception;

	void deleteQna(Map<String, Object> map) throws Exception;

}
