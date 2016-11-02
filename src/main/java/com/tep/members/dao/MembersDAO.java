package com.tep.members.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;
import com.tep.members.model.MembersModel;

@Repository("membersDAO")
public class MembersDAO extends AbstractDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public MembersModel membersLogin(MembersModel mem) {
		return sqlSessionTemplate.selectOne("members.loginCheck", mem);
	}

}
