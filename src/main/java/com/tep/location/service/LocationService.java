package com.tep.location.service;

import java.util.List;
import java.util.Map;

public interface LocationService {

	List<Map<String, Object>> selectMeetingsLocation(Map<String, Object> map) throws Exception;

}
