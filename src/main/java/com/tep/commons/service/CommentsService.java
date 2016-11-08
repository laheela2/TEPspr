package com.tep.commons.service;

import java.util.Map;

public interface CommentsService {
	void insertComments(Map<String, Object> map) throws Exception;
	void deleteComments(Map<String,Object> map) throws Exception;
}
