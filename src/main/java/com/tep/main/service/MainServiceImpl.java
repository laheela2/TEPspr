package com.tep.main.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tep.main.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public Map<String, Object> selectMainInfo() throws Exception {
		Map<String,Object> result = new HashMap<>();
		result.put("videoRecommend", mainDAO.videoRecommend());
		result.put("meetingsRecommend", mainDAO.meetingsRecommend());
		return result;
	}

}
