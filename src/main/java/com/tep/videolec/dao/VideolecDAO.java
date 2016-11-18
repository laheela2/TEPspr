package com.tep.videolec.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository
public class VideolecDAO extends AbstractDAO{
	
	public VideolecDAO(){
		setNameSpace("video.");
	}

	public void insertVideolec(Map<String, Object> map) {
		insert("insertVideolec", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAdminVideolecList() {
		return (List<Map<String, Object>>) selectList("selectAdminVideolecList");
	}

	public void deleteVideolec(int v_no) {
		delete("deleteVideolec", v_no);
	}

}
