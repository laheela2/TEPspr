package com.tep.meetings.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tep.commons.service.CommentsService;

public interface MeetingsService extends CommentsService{

	List<Map<String, Object>> selectMeetingsList(Map<String, Object> map) throws Exception;

	void insertMeetings(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;

	void insertLikeit(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectMeetingsDetail(Map<String, Object> map, boolean readcount) throws Exception;

	Map<String, Object> selectMeetingsModify(Map<String, Object> map) throws Exception;

	void updateMeetings(Map<String, Object> map, MultipartHttpServletRequest request) throws Exception;

	void deleteMeetings(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMeetingsApplyfor(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void insertMeetingsApplyfor(Map<String, Object> map) throws Exception;

}
