package com.tep.location.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository
public class LocationDAO extends AbstractDAO{

	public LocationDAO(){
		setNameSpace("location.");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMeetingsLocation(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("selectMeetingsLocation",map);
	}

}
