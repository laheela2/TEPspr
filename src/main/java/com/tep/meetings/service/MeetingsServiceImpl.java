package com.tep.meetings.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tep.meetings.dao.MeetingsDAO;

@Service
public class MeetingsServiceImpl implements MeetingsService {
	protected Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MeetingsDAO dao;

	@Override
	public List<Map<String, Object>> selectMeetingsList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> resultList = (List<Map<String, Object>>)dao.selectMeetingsList(map);
		for (int i = 0; i < resultList.size(); i++) {
			int o_no = Integer.parseInt(resultList.get(i).get("O_NO").toString());
			resultList.get(i).put("O_LIKEIT", dao.selectLikeitCount(o_no));
		}
		return resultList;
	}

}
