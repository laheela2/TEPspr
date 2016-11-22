package com.tep.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository
public class MainDAO extends AbstractDAO{

	public MainDAO(){
		setNameSpace("main.");
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> videoRecommend() {
		return (Map<String, Object>) selectOne("videoRecommend");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> meetingsRecommend(){
		return (List<Map<String, Object>>) selectList("meetingsRecommend");
	}
}
