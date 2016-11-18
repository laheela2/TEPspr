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

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectVideolecList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("selectVideolecList",map);
	}

	public void updateVideolecReadCount(Map<String, Object> map) {
		update("updateVideolecReadCount", map);		
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectVideolecDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("selectVideolecDetail",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCmtList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("selectCmtList",map);
	}

	public void insertComments(Map<String, Object> map) {
		insert("insertCmt", map);
	}

	public void deleteComments(Map<String, Object> map) {
		delete("deleteCmt", map);
	}

}
