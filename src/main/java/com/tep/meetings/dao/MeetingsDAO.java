package com.tep.meetings.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository
public class MeetingsDAO extends AbstractDAO{

	public MeetingsDAO() {
		setNameSpace("meetings.");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMeetingsList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("selectList",map);
	}

	public int selectLikeitCount(int mt_no){
		return (int) selectOne("selectLikeitCount", mt_no);
	}

	public void insertMeetings(Map<String, Object> map) {
		insert("insertMeetings", map);
	}

	public void insertLikeit(Map<String, Object> map) {
		insert("insertLikeit", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLikeit(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("selectLikeitExist",map);
	}

	public void deleteLikeit(Map<String, Object> map) {
		delete("deleteLikeit", map);
	}

	public void updateMeetingsReadCount(Map<String, Object> map) {
		update("updateMeetingsReadCount", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMeetingsDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("selectMeetingsDetail",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCmtList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("selectCmtList",map);
	}

	public void insertComments(Map<String, Object> map) {
		insert("insertCmt", map);
	}

	public void deleteComments(Map<String, Object> map) {
		delete("deleteCmt", map);
	}

	public void updateMeetings(Map<String, Object> map) {
		update("updateMeetings",map);
	}

	public void deleteMeetings(Map<String, Object> map) {
		delete("deleteMeetings",map);
	}

	public void insertMeetingsApplyfor(Map<String, Object> map) {
		insert("insertMeetingsApplyfor", map);
	}

	public void updateMeetingsApplyforNum(Map<String, Object> map) {
		update("updateMeetingsApplyforNum", map);
	}
}
