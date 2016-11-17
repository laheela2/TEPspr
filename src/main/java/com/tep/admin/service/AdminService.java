package com.tep.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface AdminService {

	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectDashboard() throws Exception;

	void insertLendplace(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;

}
