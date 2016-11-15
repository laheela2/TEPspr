package com.tep.commons.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	private String NAMESPACE = "";

	@Autowired
	private SqlSessionTemplate sqlSession;

	protected void setNameSpace(final String namespace){
		this.NAMESPACE = namespace;
	}
	
	protected void printQueryId(String queryId) {
		if (log.isDebugEnabled()) {
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}

	public Object insert(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.insert(NAMESPACE+queryId, params);
	}

	public Object update(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.update(NAMESPACE+queryId, params);
	}

	public Object delete(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.delete(NAMESPACE+queryId, params);
	}

	public Object selectOne(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectOne(NAMESPACE+queryId);
	}

	public Object selectOne(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectOne(NAMESPACE+queryId, params);
	}

	public Object selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(NAMESPACE+queryId);
	}

	public Object selectList(String queryId, Object params) {
		printQueryId(queryId);
		return sqlSession.selectList(NAMESPACE+queryId, params);
	}
	
}
