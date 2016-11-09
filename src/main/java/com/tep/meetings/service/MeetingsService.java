package com.tep.meetings.service;

import java.util.List;
import java.util.Map;

public interface MeetingsService {

	List<Map<String, Object>> selectMeetingsList(Map<String, Object> map) throws Exception;

}
