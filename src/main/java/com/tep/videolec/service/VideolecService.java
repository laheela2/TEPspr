package com.tep.videolec.service;

import java.util.List;
import java.util.Map;

public interface VideolecService {

	void insertVideolec(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectAdminVideolecList() throws Exception;

	void deleteVideolec(int v_no) throws Exception;

}
