package com.tep.videolec.service;

import java.util.List;
import java.util.Map;

import com.tep.commons.service.CommentsService;

public interface VideolecService extends CommentsService{

	void insertVideolec(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectAdminVideolecList() throws Exception;

	void deleteVideolec(int v_no) throws Exception;

	List<Map<String, Object>> selectVideolecList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectVideolecDetail(Map<String, Object> map, boolean readcount) throws Exception;
}
