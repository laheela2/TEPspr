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
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLendplaceDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("lendplace.selectLendplaceDetail",map);
	}
	
	public void insertLendplace(Map<String, Object> map) {
		insert("lendplace.insertLendplace", map);
	}
	
	public void insertLendplaceApplyfor(Map<String, Object> map) {
		insert("insertLendplaceApplyfor", map);
	}	
	
}
