package com.tep.meetings.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;
import com.tep.meetings.model.MeetingsModel;

@Repository
public class MeetingsDAO extends AbstractDAO{

	public MeetingsDAO() {
		setNameSpace("meetings.");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMeetingsList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("selectList",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> meetingsRecommend() {
		return (List<Map<String, Object>>) selectList("meetingsRecommend");
	}

	public int selectLikeitCount(int mt_no){
		return (int) selectOne("selectLikeitCount", mt_no);
	}

	public void insertMeetings(MeetingsModel meet) {
		insert("insertMeetings", meet);
	}

	public void insertLikeit(Map<String, Object> map) {
		insert("insertLikeit", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLikeitExist(Map<String, Object> map) {
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

	public void updateMeetings(MeetingsModel meet) {
		update("updateMeetings",meet);
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
