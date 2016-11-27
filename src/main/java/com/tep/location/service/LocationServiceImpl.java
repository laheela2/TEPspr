package com.tep.location.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tep.location.dao.LocationDAO;

@Service
public class LocationServiceImpl implements LocationService{

	@Autowired
	private LocationDAO locationDAO;

	@Override
	public List<Map<String, Object>> selectMeetingsLocation(Map<String, Object> map) throws Exception {
		return locationDAO.selectMeetingsLocation(map);
	}

}
