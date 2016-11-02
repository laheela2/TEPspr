package com.tep.login.dao;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;
import com.tep.members.model.MembersModel;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{

	public MembersModel loginCheck(MembersModel mem) {
		return (MembersModel) selectOne("login.loginCheck",mem);
	}

}
