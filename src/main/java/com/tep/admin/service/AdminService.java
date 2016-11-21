package com.tep.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tep.commons.common.CommandMap;

public interface AdminService {

	List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception;

	void insertLendplace(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;

	Map<String, Object> selectMemberModifyForm(Map<String, Object> map) throws Exception;

	void adminMemberModify(Map<String, Object> params) throws Exception;

	void deleteMember(Map<String, Object> params) throws Exception;

	List<Map<String, Object>> selectBoardList() throws Exception;

	List<Map<String, Object>> selectMeetingsList() throws Exception;

	List<Map<String, Object>> selectLendplaceList() throws Exception;

	List<Map<String, Object>> selectQnaList() throws Exception;

	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;

	Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception;

	void adminDeleteMeetings(int mt_no) throws Exception;

	void adminAnswer(Map<String, Object> map) throws Exception;

}
