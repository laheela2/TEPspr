package com.tep.lendplace.service;

import java.util.List;
import java.util.Map;

public interface LendplaceService {
	
	List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception;

}
