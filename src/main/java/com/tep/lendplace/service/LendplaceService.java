package com.tep.lendplace.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface LendplaceService {
	
	List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectLendplaceDetail(Map<String, Object> map) throws Exception;
	
	void insertLendplace(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;
}
