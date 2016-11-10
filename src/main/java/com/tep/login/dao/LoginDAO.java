package com.tep.login.dao;

import org.springframework.stereotype.Repository;

import com.tep.commons.dao.AbstractDAO;
import com.tep.members.model.MembersModel;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{

	public MembersModel selectMember(MembersModel mem) {
		return (MembersModel) selectOne("login.selectMember",mem);
	}

	public MembersModel findId(MembersModel mem) {
		return (MembersModel) selectOne("login.findId", mem);
	}

	public MembersModel findPassword(MembersModel mem) {
		return (MembersModel) selectOne("login.findPassword", mem);
	}

}
