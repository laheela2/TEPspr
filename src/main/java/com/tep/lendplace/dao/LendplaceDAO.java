package com.tep.lendplace.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository("lendplaceDAO")
public class LendplaceDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("lendplace.selectLendplaceList",map);
	}
	
}
