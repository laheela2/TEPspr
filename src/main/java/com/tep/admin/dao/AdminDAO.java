package com.tep.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository
public class AdminDAO extends AbstractDAO{
	protected Logger log = Logger.getLogger(this.getClass());
	
	public AdminDAO(){
		setNameSpace("admin.");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("selectMemberList");
	}

	public void insertLendplace(Map<String, Object> map) {
		insert("insertLendplace", map);
	}

}
