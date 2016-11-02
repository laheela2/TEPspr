/*package com.tep.members.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;

@Repository("membersDAO")
public class MembersMapDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> loginCheck(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("members.loginCheck",map);
	}

}
*/