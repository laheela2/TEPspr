package com.tep.qna.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tep.qna.dao.QnaDAO;


@Service("QnaService")
public class QnaServiceImpl implements QnaService{
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaDAO")
	private QnaDAO qnaDAO;

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		return qnaDAO.selectQnaList(map);
	}

	@Override
	public void insertQna(Map<String, Object> map) throws Exception {
		qnaDAO.insertQna(map);
	}

	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> detail = qnaDAO.selectQnaDetail(map);
		resultMap.put("detail", detail);
		
		return resultMap;
	}

	@Override
	public Map<String, Object> selectQnaModify(Map<String, Object> map) throws Exception {
		return qnaDAO.selectQnaDetail(map);
	}

	@Override
	public void updateQna(Map<String, Object> map) throws Exception {
		qnaDAO.updateQna(map);
	}

	@Override
	public void deleteQna(Map<String, Object> map) throws Exception {
		qnaDAO.deleteQna(map);
	}
	
	
}
