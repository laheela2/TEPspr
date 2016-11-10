package com.tep.meetings.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository
public class MeetingsDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMeetingsList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("meetings.selectList",map);
	}

	public int selectLikeitCount(int o_no){
		return (int) selectOne("meetings.selectLikeitCount", o_no);
	}
}
